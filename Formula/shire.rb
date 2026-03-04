class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.1.7-beta"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "b571f9033ed20d266660c972322c1496ccf120b849d8d2f994e5f36f7d71cc56"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "bced903f4c97df93c54fa498eb3bfcc1064b0218f0a0fc2f9c8c1c8912f75e0c"
    end
  end

  on_linux do
    url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b8050664582dac49f299d09ad6eaed12822c4fcbc38037a3f965664c72e0dd1f"
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
