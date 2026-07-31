class Rcm < Formula
  desc "Composable AI pipelines with .rcm files"
  homepage "https://github.com/EricSanchezok/RCM"
  version "0.2.4"
  license "MIT"

  livecheck do
    url "https://github.com/EricSanchezok/rcm-dist/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)}i)
    strategy :page_match
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-darwin.tar.gz"
      sha256 "4b6543e7004ef0c96e7f1f448d2cb6edf8204e42abf4dd3eacf79434ce51924e"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-darwin.tar.gz"
      sha256 "6a17c9c3712747cc5c2d69325037e22b6a4bc2b37e99e11eb38a5409570321d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-linux.tar.gz"
      sha256 "570b7e03cafe7b1edfa879c762e282ed6971246725b91d3ce3e19542ebb9082b"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-linux.tar.gz"
      sha256 "9f7025f06aba2c2e9fd90fa292ed6a206f0c9938c8a71aef0629a6ba0008836c"
    end
  end

  def install
    bin.install "accelerate"
  end

  test do
    system "#{bin}/accelerate", "--version"
  end
end
