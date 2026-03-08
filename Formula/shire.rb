class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.1.11-beta"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "e32b5eaedce76503860b3f86cf48a99204dcf201850ba6299ebfef960d4808c0"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "336d2c39c9fefe3e599fc3b12e4b9b10705af8acc1440219054771962d876d83"
    end
  end

  on_linux do
    url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "07d3e25e6cecf085379a6c681feef6a09f038fd0f0a269c4755cb9f536f9a661"
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
