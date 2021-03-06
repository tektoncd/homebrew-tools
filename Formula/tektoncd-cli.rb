# This file was generated by GoReleaser. DO NOT EDIT.
class TektoncdCli < Formula
  desc "Tekton CLI - The command line interface for interacting with Tekton"
  homepage "https://github.com/tektoncd/cli"
  version "0.20.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/tektoncd/cli/releases/download/v0.20.0/tkn_0.20.0_Darwin_x86_64.tar.gz"
    sha256 "207ace5ee1cc60ffde5eb6c8c1ce55486088fb4df628f960d392510daff7242f"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tektoncd/cli/releases/download/v0.20.0/tkn_0.20.0_Linux_x86_64.tar.gz"
      sha256 "8c95e6913cedbae537b80b47f909938b1b45645d2d02425a593469258315d338"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tektoncd/cli/releases/download/v0.20.0/tkn_0.20.0_Linux_arm64.tar.gz"
        sha256 "4d1d4ac0e57d324efb87300af15f828e781486d8cfb4b68079a989aa53427e4d"
      else
      end
    end
  end

  def install
    bin.install_symlink "tkn" => "kubectl-tkn"
    bin.install "tkn" => "tkn"
    output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
    (bash_completion/"tkn").write output
    output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
    (zsh_completion/"_tkn").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/tkn", "version"
  end
end
