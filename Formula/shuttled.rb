# Formula/shuttled.rb
#
# Auto-updated by mislav/bump-homebrew-formula-action on `v*` tags
# pushed to https://github.com/ggshr9/shuttle. See the comment in
# Formula/shuttle.rb for context.

class Shuttled < Formula
  desc "Multi-transport network toolkit (server)"
  homepage "https://github.com/ggshr9/shuttle"
  version "0.0.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/ggshr9/shuttle/releases/download/v#{version}/shuttled-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/ggshr9/shuttle/releases/download/v#{version}/shuttled-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "shuttled"
    (etc/"shuttle").mkpath
    (etc/"shuttle").install "examples/server.example.yaml" => "server.example.yaml" if File.exist?("examples/server.example.yaml")
    bash_completion.install "completions/shuttled.bash" => "shuttled" if File.exist?("completions/shuttled.bash")
    zsh_completion.install  "completions/_shuttled"      if File.exist?("completions/_shuttled")
  end

  service do
    run [opt_bin/"shuttled", "run", "-c", "#{etc}/shuttle/server.yaml"]
    keep_alive true
    log_path     var/"log/shuttled.log"
    error_log_path var/"log/shuttled.err.log"
  end

  test do
    assert_match(/shuttled/i, shell_output("#{bin}/shuttled --version"))
  end
end
