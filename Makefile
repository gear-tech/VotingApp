.PHONY: all prepare

exp:
	@ export CARGO_HOME="/home/gitpod/.cargo"

all:
	cargo +nightly build --target wasm32-unknown-unknown --release
	wasm-proc --path ./target/wasm32-unknown-unknown/release/voting_app.wasm
	ls -la ./target/wasm32-unknown-unknown/release/voting_app*.wasm

prepare:
	rustup toolchain add nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly
	cargo install --locked --git https://github.com/gear-tech/gear wasm-proc