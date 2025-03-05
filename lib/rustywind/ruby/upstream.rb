# frozen_string_literal: true

module Rustywind::Ruby::Upstream
  VERSION = "0.24.0"

  BINARY_URLS = {
    %w[darwin arm64] => "rustywind-v#{VERSION}-aarch64-apple-darwin.tar.gz",
    %w[darwin aarch64] => "rustywind-v#{VERSION}-aarch64-apple-darwin.tar.gz",
    %w[darwin x86_64] => "rustywind-v#{VERSION}-x86_64-apple-darwin.tar.gz",
    %w[linux x86_64] => "rustywind-v#{VERSION}-x86_64-unknown-linux-musl.tar.gz",
    %w[linux aarch64] => "rustywind-v#{VERSION}-aarch64-unknown-linux-musl.tar.gz",
    %w[linux arm64] => "rustywind-v#{VERSION}-aarch64-unknown-linux-musl.tar.gz",
    %w[windows x86_64] => "rustywind-v#{VERSION}-x86_64-pc-windows-msvc.zip"
  }.freeze

  def self.binary_url(platform, arch)
    filename = BINARY_URLS[[platform, arch]]
    raise Error, "Unsupported platform: #{platform} #{arch}" unless filename

    "https://github.com/avencera/rustywind/releases/download/v#{VERSION}/#{filename}"
  end
end
