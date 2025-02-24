{ lib, fetchzip }:

let
  version = "6";
in fetchzip {
  name = "fira-code-${version}";

  url = "https://github.com/tonsky/FiraCode/releases/download/${version}/Fira_Code_v${version}.zip";

  # only extract the variable font because everything else is a duplicate
  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile '*-VF.ttf' -d $out/share/fonts/truetype
  '';

  sha256 = "h2Q63rT26SxXeZ76CRCcFg+NfDAc0IgYaYD2ok09Jh4=";

  meta = with lib; {
    homepage = "https://github.com/tonsky/FiraCode";
    description = "Monospace font with programming ligatures";
    longDescription = ''
      Fira Code is a monospace font extending the Fira Mono font with
      a set of ligatures for common programming multi-character
      combinations.
    '';
    license = licenses.ofl;
    maintainers = [ maintainers.rycee ];
    platforms = platforms.all;
  };
}
