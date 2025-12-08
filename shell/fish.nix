{ pkgs, ... }:

{
  programs = {
    fish = {
      # ~/.config/fish/config.fish
      # ~/.config/fish/conf.d/
      # ~/Projects/home-manager/modules/programs/fish.nix
      enable = true;

      shellInit = '''';
      loginShellInit = '''';

      # Themes:
      #   fish_config theme show
      # fish_config theme choose "fish default"
      interactiveShellInit = ''
        set fish_color_keyword "purple"
        set fish_color_option "brpurple"
      '';

      shellAliases = {
        # ls aliases
        ls = "eza";
        l = "eza --group-directories-first";
        ll = "eza --long --group-directories-first";
        la = "eza --all --group-directories-first";
        lla = "eza --long --all --group-directories-first";
      }; # ..programs.fish.shellAliases

      shellAbbrs = {
        cat = "bat -p";
        f = "fd --follow";

        # rsync
        rs = ''
          rsync \\
            --archive \\
            --recursive \\
            --compress \\
            --progress \\
            --verbose \\
        '';
        rss = ''
          rsync \\
            --archive \\
            --recursive \\
            --compress \\
            --progress \\
            --verbose \\
            --exclude=.swp \\
            --exclude=.direnv \\
            --exclude=.direnv \\
            --exclude=target \\
            --exclude=result \\
        '';

        o = "xdg-open";

        m = "ncmpcpp";

        "λ" = "ghci";
        py = "python";
        ipy = "ipython";

        # Editors
        # -------
        e = "emacsclient -c -nw";
        ec = "emacsclient";
        ee = "emacsclient -c";
        em = "emacs";

        # Git
        # ---
        g = "git";

        gs = "git status";
        gst = "git stash";

        gh = "git h";
        gls = "git ls";
        gll = "git ll";
        glla = "git lla";
        gllA = "git llA";

        ge = "git exec";

        gd = "git diff";
        gdw = "git diff --ignore-all-space";
        gdc = "git diff --cached";
        gds = "git diff --stat";
        gdcs = "git diff --cached --stat";

        gbl = "git blame";

        gcl = "git clone --recursive";
        gCL = "git clone";

        ga = "git add";
        grm = "git rm --cached";
        gc = "git commit";
        gca = "git commit --amend --no-edit";
        gcA = "git commit --amend";

        gco = "git checkout";

        gr = "git rebase --interactive";
        grc = "git rebase --continue";
        gra = "git rebase --abort";

        gb = "git branch";

        grv = "git remote -v";

        gf = "git fetch";
        gfa = "git fetch --all";
        gp = "git pull";

        gpp = "git push";
        gppu = "git push --set-upstream";
        gPP = "git push --force-with-lease";

        gcp = "git cherry-pick";

        gm = "git merge";

        # systemd
        # -------
        sc = "systemctl";
        ssc = "sudo systemctl";
        scu = "systemctl  --user";
        sj = "journalctl";

        sja = "sudo journalctl --no-hostname --boot '0' --since '20 minutes ago'";
        sjs = "sudo journalctl --no-hostname --boot '0' --since '20 minutes ago' --unit";
        sju = "journalctl --no-hostname --boot '0' --since '20 minutes ago' --user-unit";

        # Programs
        ncdu = "dua interactive";
      }; # ..programs.fish.shellAbbrs

      functions = {
        "_dns_list" =
          "nmcli --terse --mode 'multiline' --get-values IP4.DNS device show $argv | gawk '-F:' '{print $2}'";
        "gitignore" = "curl -sL https://www.gitignore.io/api/$argv";
        "nx" = {
          body = ''
            set -l package_root "legacyPackages.x86_64-linux."
            set -l packages (nix search \
                                --offline \
                                --json \
                                nixpkgs \
                                $argv \
                              | jq \
                                  --raw-output \
                                  'to_entries | map("\(.key | sub("'$package_root'"; "")): \(.value.description) \(.value.version)")[]' \
                              | sk \
                                --multi \
                              | cut -d ":" -f 1)

            if test -n "$packages"
              echo "Loading package '$packages'"
              nix-shell \
                --packages $packages \
                --command "fish" \
                && return 0
              echo "Failed to load nix-shell --packages '$packages'."
              return 1
            else
              echo "Cancelled."
              return 100
            end
          '';
        };

        "hgrep" = {
          body = ''
            gawk 'NR==1 || /$argv[1]/' $argv[2..]
          '';
        };
        "frg" = {
          # function frg --description "rg tui built with sk and bat"
          body = ''
            rg \
              --ignore-case \
              --color 'always' \
              --line-number \
              --no-heading "$argv" \
                | \
              sk \
                --ansi \
                --color 'hl:-1:underline,hl+:-1:underline:reverse' \
                --delimiter ':' \
                --preview "bat --color=always {1} --highlight-line {2}" \
                --preview-window 'up,60%,border-right,+{2}+3/3,~3' \
                --bind "enter:become($EDITOR +{2} {1})"
          '';
        };
        "fish_greeting" = {
          body = ''
            set_color $fish_color_autosuggestion
            uname -nmsr
            command -q -s uptime && command uptime
            set_color normal
          '';
        };

        ",tmpdir" = {
          body = ''
            cd (mktemp -d /tmp/aoeu-XXXX)
          '';
        };
        ",list_projects" = {
          body = ''
            fd --unrestricted --type 'd' '^\.git$' | sed 's!\.git\/!!'
          '';
        };
        ",gen_sshkey" = {
          body = ''
            set -l name $argv[1]

            echo "Creating new key at ~/.secrets/ssh/$name"
            ssh-keygen \
              -a 128 \
              -t 'ed25519' \
              -C "$USER@$(hostname)" \
              -f ~/.secrets/ssh/$name

            echo "Key fingerprint:"
            cat ~/.secrets/ssh/$name.pub
          '';
        };

        ",f" = {
          body = ''
            sk \
              --ansi \
              --interactive \
              --cmd 'rg --color=always --line-number "{}"' --preview 'bat --color=always $(echo {} | gawk -F: "{print \$1}") --highlight-line $(echo {} | gawk -F: "{print \$2}")' \
            | gawk \
                -F: \
                '{print $1}'
          '';
        };
        ",inspect_jsonl" = {
          body = ''
            cat $argv | sk --preview 'echo {} | jq --color-output .'
          '';
        };
        ",last_dir" = {
          body = ''
            find $argv -maxdepth 1 -type d | sort -u | tail -n 1
          '';
        };
        ",copy_project" = {
          body = ''
            rsync \
              --archive \
              --recursive \
              --compress \
              --progress \
              --verbose \
              --exclude='.direnv' \
              --exclude='.devenv' \
              --exclude='target' \
              $argv
          '';
        };
        ",fix_apostrophes" = {
          body = ''
            # # ’ve
            # sed -i "s!'ve\b!’ve!g" $argv
            # # ’s
            # sed -i "s!'s\b!’s!g" $argv
            # # ’d
            # sed -i "s!'d\b!’d!g" $argv
            # # ’t
            # sed -i "s!'t\b!’t!g" $argv
            # # ’m
            # sed -i "s!'m\b!’m!g" $argv
            # # ’n
            # sed -i "s!'n\b!’n!g" $argv

            # Emacs says ' (U0027) is an apostrophe.
            # 've
            sed -i "s!’ve\b!'ve!g" $argv
            # 's
            sed -i "s!’s\b!'s!g" $argv
            # 'd
            sed -i "s!’d\b!'d!g" $argv
            # 't
            sed -i "s!’t\b!'t!g" $argv
            # 'm
            sed -i "s!’m\b!'m!g" $argv
            # 'n
            sed -i "s!’n\b!'n!g" $argv
          '';
        };
      }; # ..programs.fish.functions
      plugins = [
        # You can get the fingerprint with
        #  nix-prefetch-url --unpack https://github.com/$owner/$repo/archive/$rev.tar.gz

        # https://github.com/oh-my-fish/plugin-config
        # nix-prefetch-url --unpack https://github.com/oh-my-fish/plugin-config/archive/13c424efb73b153d9b8ad92916cf51159d44099d.tar.gz
        # (Dependency for many plugins)
        {
          name = "plugin-config";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-config";
            rev = "13c424efb73b153d9b8ad92916cf51159d44099d"; # master on 2021-02-09. Updated on 2016-03-18
            sha256 = "0x1rs89pmj5i8md2ihaw7dq62rz0qgkfky9vply5nx3immd66y6v";
          };
        }

        # https://github.com/gazorby/fish-abbreviation-tips

        {
          name = "fish-abbreviation-tips";
          src = pkgs.fetchFromGitHub {
            owner = "gazorby";
            repo = "fish-abbreviation-tips";
            rev = "8ed76a62bb044ba4ad8e3e6832640178880df485"; # master on 2023-01-23. Updated on 2024-10-30
            sha256 = "05b5qp7yly7mwsqykjlb79gl24bs6mbqzaj5b3xfn3v2b7apqnqp";
          };
        }

        # https://github.com/franciscolourenco/done
        #
        # Requires:
        #   * https://github.com/fishpkg/fish-humanize-duration
        #     * It's a single file & function
        #     * The plugin magic won't install it correctly.
        {
          name = "done";
          src = pkgs.fetchFromGitHub {
            owner = "franciscolourenco";
            repo = "done";
            rev = "d6abb267bb3fb7e987a9352bc43dcdb67bac9f06"; # master on 2022-06-30. Updated on 2021-10-10
            sha256 = "6oeyN9ngXWvps1c5QAUjlyPDQwRWAoxBiVTNmZ4sG8E=";
          };
        }

        # https://github.com/laughedelic/pisces
        {
          name = "pisces";
          src = pkgs.fetchFromGitHub {
            owner = "laughedelic";
            repo = "pisces";
            rev = "e45e0869855d089ba1e628b6248434b2dfa709c4"; # master on 2022-06-30. Updated on 2020-11-30
            sha256 = "073wb83qcn0hfkywjcly64k6pf0d7z5nxxwls5sa80jdwchvd2rs";
          };
        }

        # https://github.com/b4b4r07/enhancd
        # NOTE: enhancd needs non-fish files from  lib/ and src/ too
        # {
        #   name = "enhancd";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "b4b4r07";
        #     repo = "enhancd";
        #     rev = "f0f894029d12eecdc36c212fa3ad14f55468d1b7";
        #     sha256 = "1qk2fa33jn4j3xxaljmm11d6rbng6d5gglrhwavb72jib4vmkwyb";
        #   };
        # }
      ]; # ..programs.fish.plugins
    }; # ..programs.fish
  }; # ..programs

  systemd = {
    user = {
      services = {
        shell_warmup = {
          Unit = {
            Description = "Shell warmup";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStart = "${pkgs.time}/bin/time ${pkgs.fish}/bin/fish --profile-startup=/tmp/fish-startup_prof.tsv --command 'exit'";
            Type = "oneshot";
            RemainAfterExit = "yes";
          };
        };
      };
    };
  };
}
