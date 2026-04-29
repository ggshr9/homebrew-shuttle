# Formula/shuttled.rb
#
# Auto-updated by mislav/bump-homebrew-formula-action on `v*` tags
# pushed to https://github.com/ggshr9/shuttle. See the comment in
# Formula/shuttle.rb for context.

class Shuttled < Formula
  desc "Multi-transport network toolkit (server)"
  homepage "https://github.com/ggshr9/shuttle"
  version "1.0.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/ggshr9/shuttle/releases/download/v1.0.0/shuttle-darwin-arm64.tar.gz"
      sha256 "f79babe37e5a023ee22d9e0e117f3d945f25aea31090ed4075d72d07eddbc78c"
    end
    on_intel do
      url "https://github.com/ggshr9/shuttle/releases/download/v1.0.0/shuttle-darwin-amd64.tar.gz"
      sha256 "021c2d24e074bc5724fe90633d9c505ed6c5e8a7b72673e5c09390df16ffabff"
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
