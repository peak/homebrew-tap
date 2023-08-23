# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class S5cmd < Formula
  desc "Parallel S3 and local filesystem execution tool"
  homepage "https://github.com/peak/s5cmd"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.1/s5cmd_2.2.1_macOS-64bit.tar.gz"
      sha256 "929b3098b5ebeca5130aba806b0fda31ec64876f84147df3b9d547ea5b28b4f6"

      def install
        bin.install "s5cmd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.1/s5cmd_2.2.1_macOS-arm64.tar.gz"
      sha256 "34345cd00faefa8c33023e71b82277cb0ecbb7f6a4238b9ae9bf2b579ed58469"

      def install
        bin.install "s5cmd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.1/s5cmd_2.2.1_Linux-64bit.tar.gz"
      sha256 "e7daaa48536b686a4f1316f581b60ccdb890184e1820d41cdb9df3fedeb9633e"

      def install
        bin.install "s5cmd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.1/s5cmd_2.2.1_Linux-arm64.tar.gz"
      sha256 "3b8b12cabb8d1d5ff9e7274c3e16050b3e8cda7e39fa208c8cfe163edea4320a"

      def install
        bin.install "s5cmd"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.1/s5cmd_2.2.1_Linux-armv6.tar.gz"
      sha256 "400bd560c80e08227704f36c2f9a17d139f4a3239fba7de8be18b9b3c87abde4"

      def install
        bin.install "s5cmd"
      end
    end
  end

  test do
    system "#{bin}/s5cmd version"
  end
end
