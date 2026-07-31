class Rcm < Formula
  desc "Composable AI pipelines with .rcm files"
  homepage "https://github.com/EricSanchezok/RCM"
  version "0.2.5"
  license "MIT"

  livecheck do
    url "https://github.com/EricSanchezok/rcm-dist/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)}i)
    strategy :page_match
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-darwin.tar.gz"
      sha256 "cc3049c926044ae8ea18a39d8bdb26012f8f5eeff094783f5a8f4eddc46472d6"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-darwin.tar.gz"
      sha256 "cd8f3ae42b3fa9682b7315490f0e6093eaf4806790695fca42a08b92e18f8804"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-linux.tar.gz"
      sha256 "c71287724d65a92640bf6eafae5ecd915269abaded3943d166a211f6dee35039"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-linux.tar.gz"
      sha256 "c3f30ddf4be7f4ebe4472cd0b1c142f89d7567c08e8be1c654635c2d70162dea"
    end
  end

  def install
    bin.install "accelerate"
  end

  test do
    system "#{bin}/accelerate", "--version"
  end
end
