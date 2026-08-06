class Rcm < Formula
  desc "Composable AI pipelines with .rcm files"
  homepage "https://github.com/EricSanchezok/RCM"
  version "0.2.10"
  license "MIT"

  livecheck do
    url "https://github.com/EricSanchezok/rcm-dist/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)}i)
    strategy :page_match
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-darwin.tar.gz"
      sha256 "40ce03c03976d0ecb4ea2280a73207e967c6788a2f9ba85ecde2f0b5a0087f40"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-darwin.tar.gz"
      sha256 "0852c4750cc154011a4fd9804b4fbeb3e495791f78474040ab3dc59124645559"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-aarch64-linux.tar.gz"
      sha256 "a753459804bf395e97d5ce4054b0ebf27e9ef3cb89f67e6617149abb1f01dd64"
    else
      url "https://github.com/EricSanchezok/rcm-dist/releases/download/v#{version}/accelerate-x86_64-linux.tar.gz"
      sha256 "331f4f166bd0f435242a4f636d7e7fac5f17c49feda268702218a7fba8838164"
    end
  end

  def install
    bin.install "accelerate"
  end

  test do
    system "#{bin}/accelerate", "--version"
  end
end
