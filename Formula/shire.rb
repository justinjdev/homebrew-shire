class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "d4ec4d36234d7db7ab0262636691b256f1bde1334786f4d7350b2a0101dd8120"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "3f47ddd18148c2074bfb44bb0095a03aa89bea8ebb84bf78edb09fa0c6a28cf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e51bd5b3755417b6868cd16dad648130c561ab6c0bff1da8204b224e5cc7544"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5826e3ed42ebe001896feced0becb9c4ee1b707c1e8857588b04631259ebe6e9"
    end
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
