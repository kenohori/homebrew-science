class Libcitygml < Formula
  desc "C++ Library for CityGML Parsing and Visualization"
  homepage "https://github.com/jklimke/libcitygml"
  url "https://github.com/jklimke/libcitygml/archive/v1.4.0.tar.gz"
  sha256 "3b4c3bb06c49876fb2e8758adc6eeeffe25ba59f98c72e8ff2a8e44b4085c116"

  depends_on "cmake" => :build
  depends_on "xerces-c"
  depends_on "gdal"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    prefix.install "bin"
  end

  test do
    system "#{bin}/citygmltest"
  end
end