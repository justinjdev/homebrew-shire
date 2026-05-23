class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "28a336942139eeff5367a5621b2bba23f40b2903b89615d4960658ff308f148f"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "6ce4e65c34f62d2750c625a6e06f47a256dc1a0cd45fbc7b6c7a21188a12c7d6"
    end
  end

  on_linux do
    url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61eb13f13da4f0b1c947a1837b52714977f776300e0ad320e153da18a422d6bb"
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
