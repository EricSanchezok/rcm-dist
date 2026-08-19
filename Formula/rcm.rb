class Rcm < Formula
  desc "Composable AI pipelines with .rcm files"
  homepage "https://github.com/EricSanchezok/RCM"
  version "0.2.16"
  license "MIT"

  livecheck do
    url "https://github.com/EricSanchezok/rcm-dist/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)}i)
    strategy :page_match
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-darwin.tar.gz"
      sha256 "064124ccb36486a69bfbd3d731a1dcf54d8dcbb5e146ce65bf4fb31c9548d696"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-darwin.tar.gz"
      sha256 "c5b6be268b32c383668a9ce70997b95077f12148425bb49227bb644bbb861e4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-linux.tar.gz"
      sha256 "545738cd9c2ebe0049221a0bc2cf3aeec4789aac13c19b6b8cc598d5c20ad9a0"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-linux.tar.gz"
      sha256 "cea74a709cab99450fe0ffff82045930acfda594d9fa9fec822731e628a353dc"
    end
  end

  def install
    bin.install "accelerate"
  end

  test do
    system "#{bin}/accelerate", "--version"
  end
end
