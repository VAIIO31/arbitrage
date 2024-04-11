# Arbitrage Bot on Uniswap and Sushiswap

This is a smart contract that allows for arbitrage trading between Uniswap and Sushiswap decentralized exchanges. The contract buys a token on Uniswap with ETH, and then sells the token on Sushiswap for a profit. 

## Getting Started

To get started with this contract, you will need the following:

- An Ethereum wallet with some ETH and the token you want to trade
- Knowledge of how to interact with smart contracts on the Ethereum network
- Access to the Uniswap and Sushiswap exchanges

## Installation

There is no installation required for this contract. Simply deploy it on the Ethereum network using Remix or another Ethereum IDE. 

## Usage

To use this contract, follow these steps:

1. Send the token you want to trade to the contract address
2. Call the `swap` function on the contract, passing in the address of the token you want to trade and the amount of the token you want to trade.
3. The contract will buy the token on Uniswap with ETH, and then sell the token on Sushiswap for a profit.
4. The profit will be sent to your wallet.

## Contract Details

The contract uses the following interfaces:

- `IUniswapV2Router`: This is the interface for the Uniswap router contract, which allows for trading on Uniswap.
- `ISushiSwapRouter`: This is the interface for the Sushiswap router contract, which allows for trading on Sushiswap.
- `IWETH9`: This is the interface for the Wrapped ETH token, which is used for trading on Uniswap and Sushiswap.

The contract also uses the following constants:

- `WETH_ADDRESS`: This is the address of the Wrapped ETH token contract.
- `UNISWAP_ROUTER_ADDRESS`: This is the address of the Uniswap router contract.
- `SUSHISWAP_ROUTER_ADDRESS`: This is the address of the Sushiswap router contract.

The `swap` function takes in two parameters: `_address` and `_amountIn`. `_address` is the address of the token you want to trade, and `_amountIn` is the amount of the token you want to trade.

The function does the following:

1. Transfers the token from the sender to the contract.
2. Approves the Uniswap router to spend the token.
3. Buys the token on Uniswap with ETH.
4. Approves the Sushiswap router to spend the token.
5. Sells the token on Sushiswap for ETH.
6. Sends the profit to the sender.

## Examples

<img width="768" alt="Ekran Resmi 2023-03-03 00 52 30" src="https://user-images.githubusercontent.com/120671243/222950196-9132da8a-1f89-4926-be26-8b8cf3d35f42.png">


<img width="797" alt="Ekran Resmi 2023-02-23 01 18 04" src="https://user-images.githubusercontent.com/120671243/222950201-ecb9ddcc-9ba3-41b8-aa54-082039837281.png">

Untuk menggunakan kontrak di Remix, berikut adalah langkah-langkahnya:

Buka Remix: Buka Remix IDE di browser Anda. Anda dapat mengunjungi https://remix.ethereum.org/ untuk membuka Remix.

Buat Kontrak Baru: Pilih tab "Solidity" di Remix dan buat kontrak baru. Anda bisa menyalin dan menempelkan kode kontrak FlashArbitrage di sana.

Compile Kontrak: Klik pada tombol "Compile" di bagian kiri atas untuk mengompilasi kontrak. Pastikan tidak ada kesalahan kompilasi.

Deploy Kontrak: Pilih tab "Deploy & Run Transactions". Pastikan Anda terhubung ke jaringan yang sesuai (misalnya, Ethereum Mainnet). Kemudian, buat instance kontrak dan kontrak akan terdaftar di bawah "Deployed Contracts".

Mengisi Parameter: Di bawah instance kontrak, Anda akan melihat fungsi flashArbitrage. Isi parameter yang diperlukan, seperti path (dalam bentuk array alamat token), amountIn, amountOutMin, dan deadline.

Klik Tombol "Transact": Klik tombol "Transact" untuk menjalankan fungsi flashArbitrage dan memulai proses arbitrase.

Konfirmasi Transaksi: Setelah mengklik "Transact", Remix akan menampilkan popup untuk mengkonfirmasi transaksi. Pastikan untuk memeriksa kembali parameter dan jumlah yang dimasukkan, lalu konfirmasi transaksi.

Monitor Transaksi: Anda dapat menggunakan eksplorer blok atau alat lainnya untuk memonitor status transaksi dan hasil arbitrase.

## License

This code is licensed under the MIT license.
