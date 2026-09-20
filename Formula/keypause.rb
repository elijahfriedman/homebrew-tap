class Keypause < Formula
  desc "Lock your keyboard and trackpad until you press an activator combo"
  homepage "https://github.com/elijahfriedman/keypause"
  url "https://github.com/elijahfriedman/keypause/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "583dccf522947edcfa445c67de87aa6077236cf9fa1b40618fe5265ad0d58d0e"
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
