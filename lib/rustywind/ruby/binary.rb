# frozen_string_literal: true

class Rustywind::Ruby::Binary
  def self.path
    platform = case Gem::Platform.local.os
    when /darwin/i then "darwin"
    when /linux/i then "linux"
    when /mswin|mingw/i then "windows"
    else raise Rustywind::Ruby::Error, "Unsupported platform: #{Gem::Platform.local.os}"
    end

    arch = case Gem::Platform.local.cpu
    when /amd64|x86_64/i then "x86_64"
    when /aarch64|arm64/i then "arm64"
    else raise Rustywind::Ruby::Error, "Unsupported architecture: #{Gem::Platform.local.cpu}"
    end

    executable = (platform == "windows") ? "rustywind.exe" : "rustywind"
    File.expand_path("../../../../exe/#{platform}/#{arch}/#{executable}", __FILE__)
  end
end
