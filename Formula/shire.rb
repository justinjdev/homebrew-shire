class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "2882424780aeed29b2685476f746242eb816bfa5f38a9428dcbbc44b26a18ab9"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "148c960e9a45cf01210377e0e3a29fe5e0a79a1cf1f352300b4dbff4bbaab774"
    end
  end

  on_linux do
    url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4efd7dfb0c8d0ff828243183df3f4aade3637edd3f652aa17772cdbf6cff646e"
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
