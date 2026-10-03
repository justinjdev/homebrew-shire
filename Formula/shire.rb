class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "d701295b39ff941a90d8af7045ade6a01db2a8766acafce4ca0980ff6894d994"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "6800b6206099bcf7a6bb4f78e9ec6517c24604ef79d249f13772c1871871783f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b4cc3890993f276163d1d3079ea5ab2cbbc83ce714bc2f494982c1c1c7fd87d"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640ac0bdc80cc98b5b81be65ecf5330d5da5608bda6719978404c59a9614c1c9"
    end
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
