# frozen_string_literal: true

require "rubygems/package"
require "zlib"

module Rustywind::Ruby::Upstream::TarGz
  def self.extract(tar_file, destination)
    Gem::Package::TarReader.new(Zlib::GzipReader.open(tar_file)) do |tar|
      tar.each do |entry|
        next unless entry.file?
        File.write(File.join(destination, File.basename(entry.full_name)), entry.read)
      end
    end
  end
end
