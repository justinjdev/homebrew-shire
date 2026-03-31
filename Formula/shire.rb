class Shire < Formula
  desc "Monorepo package indexer and MCP server"
  homepage "https://github.com/justinjdev/shire"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-aarch64-apple-darwin.tar.gz"
      sha256 "91a12856d6b71d9707b14250402082f4f7d29469d8d68bc9ab6d9c46f536f7b7"
    elsif Hardware::CPU.intel?
      url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-apple-darwin.tar.gz"
      sha256 "4b459a1d36d861db7970441586d2978759378a4411199b0f6b4f6a4abcce9310"
    end
  end

  on_linux do
    url "https://github.com/justinjdev/shire/releases/download/v#{version}/shire-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a7fc9697f53d5a6ac9945933cf35fb98af4fd30106ab5bcab2247ff6b06f21d3"
  end

  def install
    bin.install "shire"
  end

  test do
    system "#{bin}/shire", "build", "--help"
  end
end
