class NeovimDotApp < Formula
  homepage "https://github.com/rogual/neovim-dot-app"
  head "https://github.com/rogual/neovim-dot-app.git"

  depends_on "scons"     => :build
  depends_on "pkgconfig" => :build

  depends_on "msgpack"
  depends_on "neovim"

  # scons requires python 2
  depends_on "python" => :recommended
  depends_on :xcode
  depends_on :arch => :x86_64

  def install
    ENV.prepend_path "PATH", Formula["python"].opt_bin
    system "make", "NVIM=#{Formula["neovim"].opt_bin}/nvim"
    prefix.install "build/Neovim.app"
    bin.install "gnvim"
  end

  test do
    system "build/test"
  end
end
