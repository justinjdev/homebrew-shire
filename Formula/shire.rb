class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "98c594ff734181ac1ea107e6b2f489facd95dd101a4417cff8b3c51012d7656a"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "d78eec3bfe09a871b8b72aa7f7bb4305fb103c7141870a9ea6b371f395f4e094"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6182ac9b6eae9ebe8acb68490057abb85afa8326edbc54c6d5c91cbd0066c15f"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bc660ca4d66408cd2038c830c3f8152d9e280f6d6114e8daaeb6fdfbcf3cbe5"
    end
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
