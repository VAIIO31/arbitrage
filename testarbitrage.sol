// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

// Import library dan interface yang diperlukan
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IWETH.sol";
import "@sushiswap/core/contracts/uniswapv2/interfaces/IUniswapV2Pair.sol";
import "@sushiswap/core/contracts/uniswapv2/interfaces/IUniswapV2Router02.sol";

contract FlashArbitrage {
    // Deklarasi variabel dan konstanta
    address public constant WETH_ADDRESS = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // WETH address on Ethereum mainnet
    IUniswapV2Router02 public uniswapRouter;
    IUniswapV2Router02 public sushiswapRouter;

    // Konstruktor
    constructor(address _uniswapRouter, address _sushiswapRouter) {
        uniswapRouter = IUniswapV2Router02(_uniswapRouter);
        sushiswapRouter = IUniswapV2Router02(_sushiswapRouter);
    }

    // Fungsi untuk melakukan arbitrase Uniswap ke SushiSwap atau sebaliknya
    function flashArbitrage(
        address[] calldata path,
        uint amountIn,
        uint amountOutMin,
        uint deadline
    ) external {
        // Mencatat saldo WETH sebelum eksekusi arbitrase
        uint balanceBefore = IWETH(WETH_ADDRESS).balanceOf(address(this));

        // Melakukan swap token menggunakan Uniswap dengan path yang diberikan
        uniswapRouter.swapExactETHForTokens{value: amountIn}(
            amountOutMin,
            path,
            address(this),
            deadline
        );

        // Menghitung saldo WETH setelah eksekusi arbitrase
        uint balanceAfter = IWETH(WETH_ADDRESS).balanceOf(address(this));
        
        // Mengambil profit (selisih antara saldo setelah dan sebelum arbitrase)
        require(balanceAfter > balanceBefore, "Arbitrage failed: no profit");

        // Menghitung jumlah profit
        uint profit = balanceAfter - balanceBefore;

        // Melakukan swap token kembali ke ETH menggunakan SushiSwap
        IWETH(WETH_ADDRESS).approve(address(sushiswapRouter), profit);
        sushiswapRouter.swapExactTokensForETH(
            profit,
            0,
            path,
            msg.sender,
            deadline
        );
    }

    // Fallback function untuk menerima ETH
    receive() external payable {}
}
