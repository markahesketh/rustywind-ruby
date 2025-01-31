# frozen_string_literal: true

require "zip"

module Rustywind::Ruby::Upstream::Zip
  def self.extract(zip_file, destination)
    ::Zip::File.open(zip_file) do |zip|
      zip.each do |entry|
        entry.extract(File.join(destination, File.basename(entry.name)))
      end
    end
  end
end
