require "bundler/gem_tasks"
require "fileutils"
require "minitest/test_task"
require "open-uri"
require_relative "lib/rustywind/ruby"
require_relative "lib/rustywind/ruby/upstream/zip"
require_relative "lib/rustywind/ruby/upstream/tar_gz"

Minitest::TestTask.create

PLATFORMS = {
  "darwin" => %w[arm64 x86_64],
  "linux" => %w[x86_64 aarch64],
  "windows" => %w[x86_64]
}.freeze

task :download_binaries do
  tmp_dir = File.expand_path("../tmp", __FILE__)
  FileUtils.mkdir_p(tmp_dir)

  PLATFORMS.each do |platform, architectures|
    architectures.each do |arch|
      url = Rustywind::Ruby::Upstream.binary_url(platform, arch)
      puts "Downloading #{url}..."

      tmp_file = File.join(tmp_dir, "rustywind-#{platform}-#{arch}")
      exe_dir = File.join("exe", platform, arch)
      FileUtils.mkdir_p(exe_dir)

      File.binwrite(tmp_file, URI.parse(url).open.read)

      if url.end_with?(".zip")
        Rustywind::Ruby::Upstream::Zip.extract(tmp_file, exe_dir)
      else
        Rustywind::Ruby::Upstream::TarGz.extract(tmp_file, exe_dir)
      end

      binary_path = File.join(exe_dir, (platform == "windows") ? "rustywind.exe" : "rustywind")
      FileUtils.chmod(0o755, binary_path) unless Gem.win_platform?

      FileUtils.rm(tmp_file)
    rescue => e
      puts "Error downloading binary for #{platform} #{arch}: #{e.message}"
    end
  end
ensure
  FileUtils.rm_rf(tmp_dir) if Dir.exist?(tmp_dir)
end

desc "Remove downloaded rustywind binaries"
task :clobber do
  exe_dir = File.expand_path("../exe", __FILE__)

  removed = false
  PLATFORMS.keys.each do |platform|
    platform_dir = File.join(exe_dir, platform)
    next unless Dir.exist?(platform_dir)

    puts "Removing binaries in exe/#{platform}/..."
    FileUtils.rm_rf(platform_dir)
    removed = true
  end

  puts removed ? "Done!" : "No rustywind binaries found to remove."
end

task default: :test
