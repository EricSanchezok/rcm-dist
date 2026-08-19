class Rcm < Formula
  desc "Composable AI pipelines with .rcm files"
  homepage "https://github.com/EricSanchezok/RCM"
  version "0.2.17"
  license "MIT"

  livecheck do
    url "https://github.com/EricSanchezok/rcm-dist/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)}i)
    strategy :page_match
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-darwin.tar.gz"
      sha256 "104ff3f6fd9df04191f0920e4b222e1207c34df5b7c77d253e5e03bab730890d"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-darwin.tar.gz"
      sha256 "379633c5e756dd012f1643f5f78d26debe68d5d237487c7a25e1218c8f5cf177"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-linux.tar.gz"
      sha256 "c3e4e7ada9f3937364f07ff68010d8f8b6983f9da4ee769e941752a886c58f7c"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-linux.tar.gz"
      sha256 "415108bfe189d8be81bf91378b65a735d3d953a16c1c69d06dff422fe05e8dc7"
    end
  end

  def install
    bin.install "accelerate"
  end

  test do
    system "#{bin}/accelerate", "--version"
  end
end
