class Opencollada < Formula
  desc "Stream based reader and writer library for COLLADA files"
  homepage "http://www.opencollada.org"
  url "https://github.com/KhronosGroup/OpenCOLLADA/archive/v1.6.43.tar.gz"
  sha256 "b677c7195ef1948b0cd4e70b27fbe33656935e2ff3136cc22db874cb94e4d4bd"

  bottle do
    cellar :any_skip_relocation
    sha256 "cb4c22b978a051c241267962db0b22403bb8b5249c601d0b0f4258fe5c6c57c8" => :sierra
    sha256 "872e6494bb893d0f65399e533e9bf6b6f9e8d0e91d7c6b659c7d01d532b3d982" => :el_capitan
    sha256 "704c4dceb39d20e4cc8b6db5706a378430f23c447481763ecef18552fde010a0" => :yosemite
  end

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
      prefix.install "bin"
      Dir.glob("#{bin}/*.xsd") { |p| rm p }
    end
  end

  test do
    system "#{bin}/OpenCOLLADAValidator"
  end
end
