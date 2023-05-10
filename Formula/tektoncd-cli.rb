# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TektoncdCli < Formula
  desc "Tekton CLI - The command line interface for interacting with Tekton"
  homepage "https://github.com/tektoncd/cli"
  version "0.31.0"

  on_macos do
    url "https://github.com/tektoncd/cli/releases/download/v0.31.0/tkn_0.31.0_Darwin_all.tar.gz"
    sha256 "852b7253319a2caac197e4a908b12be0ad63b0a4d96d4385d67f86c546a30c15"

    def install
      bin.install_symlink "tkn" => "kubectl-tkn"
      bin.install "tkn" => "tkn"
      output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
      (bash_completion/"tkn").write output
      output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
      (zsh_completion/"_tkn").write output
      prefix.install_metafiles
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tektoncd/cli/releases/download/v0.31.0/tkn_0.31.0_Linux_x86_64.tar.gz"
      sha256 "fcd1469da94bd2a93e858e4802a396c335715653f26a8cb2f31d2b62ef52f8f4"

      def install
        bin.install_symlink "tkn" => "kubectl-tkn"
        bin.install "tkn" => "tkn"
        output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
        (bash_completion/"tkn").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
        (zsh_completion/"_tkn").write output
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tektoncd/cli/releases/download/v0.31.0/tkn_0.31.0_Linux_aarch64.tar.gz"
      sha256 "0480d5dc51cdc8cc899827b6ee693688fc620cab6d8f658c7eeb5929950a0b12"

      def install
        bin.install_symlink "tkn" => "kubectl-tkn"
        bin.install "tkn" => "tkn"
        output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
        (bash_completion/"tkn").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
        (zsh_completion/"_tkn").write output
        prefix.install_metafiles
      end
    end
  end

  test do
    system "#{bin}/tkn", "version"
  end
end
