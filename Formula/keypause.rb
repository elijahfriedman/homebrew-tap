class Keypause < Formula
  desc "Lock your keyboard and trackpad until you press an activator combo"
  homepage "https://github.com/elijahfriedman/keypause"
  url "https://github.com/elijahfriedman/keypause/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8f5eda7197e20d654103e49a04bdf3d79b465a193aa2699682cc8a0a48caffc2"
  license "MIT"

  depends_on macos: :big_sur

  def install
    system "xcodebuild",
           "-project", "keypause.xcodeproj",
           "-scheme", "keypause",
           "-configuration", "Release",
           "CODE_SIGNING_ALLOWED=NO",
           "SYMROOT=build",
           "build"
    bin.install "build/Release/keypause"
  end

  test do
    output = shell_output("#{bin}/keypause --check-permissions")
    assert_match "Accessibility permission:", output
  end
end
