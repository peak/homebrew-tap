# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class S5cmd < Formula
  desc "Parallel S3 and local filesystem execution tool"
  homepage "https://github.com/peak/s5cmd"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_macOS-arm64.tar.gz"
      sha256 "fa3ae7e093fd6ac8a5236a000d5373779eb403c57ee955fc7da9549668644e38"
    end
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_macOS-64bit.tar.gz"
      sha256 "5503a3308e239f081e5238e0af57958ae618e0de8b9c71142fe80f38be77e1c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_Linux-64bit.tar.gz"
      sha256 "a15f83d2a6dc091e43b2a120f29f8f6c86d146c381766c0197ec75d7985af2b6"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_Linux-armv6.tar.gz"
      sha256 "2fa1b474d449ee1b3d005297c60eb1eda2e036fca0b975e2c4f4d1e447e32def"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_Linux-arm64.tar.gz"
      sha256 "eabf18082398c332d33c692d383a889be204b1e7716f820e014bf11474ad345b"
    end
  end

  def install
    bin.install "s5cmd"

    generate_completions_from_executable(bin/"s5cmd", "--install-completion",
      shell_parameter_format: :none, shells: [:bash, :zsh])

    # FIXME: zsh completion updates:
    inreplace zsh_completion/"_s5cmd" do |s|
      s.gsub!(/^# To enable autocompletion.*$/, "#compdef s5cmd")
      s.gsub!(/^autoload/, "# autoload")
      s.gsub!(/^compinit/, "# compinit")
    end
  end

  test do
    system "#{bin}/s5cmd", "version"
  end
end
