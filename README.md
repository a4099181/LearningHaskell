# LearningHaskell
Self-learning Haskell.
Simple and pretty stupid, extremely not useful, software for fun and learn.

## Content

* [Goals](#goals)
* [Project](#project)
  * [Application model](#proj-uml)
  * [Documentation](#proj-doc) 
* [Development environment (made from scratch)](#dev-env)
  * [Operationg system](#dev-env-os)
  * [Haskell platform](#dev-env-hs)
  * [Third-party tools](#dev-env-tools)
  * [Editor](#dev-env-editor)
  * [First need commands](#dev-cmds)
* [Test environment](#test-env)
  * [First need commands](#test-cmds)
* [Runtime environment (soon)](#run-env)
* [Haskell code quality](#code-quality)
* [Knowledge sources](#knowledge)

### <a id=goals></a> Goals

 | Goals ||[emoji]|
--- | --- | --- | :-: |
main | **self-learning Haskell** |||
 | monads | as much as possible ||
secondary|well designed software|UML charts||
 | maximally self-documented code |||
 | [documentation][project site] | [haddock] |:white_check_mark:|
 | testable code |[Hspec]|:white_check_mark:|
 | design-patterns everywhere | state |:white_check_mark:|
 |  | event sourcing ||
 |  | CQRS (maybe) ||
 |  | circuit breakers ||
 | event-driven application |||
 | localizable application |||
 | multiple front-ends | console |:white_check_mark:|
 |  | standalone UI ||
 |  | WebUI/html5 ||
 | "single-click" deploy |||
 | browser-in animations with html5/canvas |||
 | self-learning TypeScript | probably ||
 | self-learning Markdown ||:white_check_mark:|
 | and maybe many more but later...|||

### <a id=project></a>Project

#### <a id=proj-uml></a>Application model

  * This projects tries to be modelled using  [UML charts] powered by [draw.io].

#### <a id=proj-doc></a>Documentation

  * [haddock] documentation for this project is available as [project site].

### Development environment (made from scratch) <a id=dev-env ></a>

#### <a id=dev-env-os />Operating system:

  * Host OS: Microsoft Windows 10
  * Hypervisor: Microsft Hyper-V
  * Guest OS: [FreeBSD] 10.2-RELEASE (deployed into VM from i386-bootonly.iso)

  ```shell
  $ uname -a
  FreeBSD hyaena 10.2-RELEASE FreeBSD 10.2-RELEASE #0 r286666: Wed Aug 12 19:31:38 UTC 2015     root@releng1.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC  i386
  ```

#### <a id=dev-env-hs />Haskell platform:

  * **[ghc]** (It is also available as port `lang/ghc` but installation fails. That's why it is installed from packages.)
  
    ```shell
    $ pkg install ghc
    $ ghc --version
    The Glorious Glasgow Haskell Compilation System, version 7.10.2
    ```

  * **[cabal]** 

    ```shell
    $ cd /usr/ports/devel/hs-cabal-install && make install clean
    $ cabal --version
    cabal-install version 1.22.6.0
    using version 1.22.4.0 of the Cabal library 
    $ cabal update # It is required to initialize packages list.
    Downloading the latest package list from hackage.haskell.org
    ```

    > Why not **[stack]**?
    
    > Officially [stack] is not yet available nor in [FreeBSD] ports tree nor in binary packages.
    
    > For more information, please see http://docs.haskellstack.org/en/stable/install_and_upgrade/#freebsd
  
#### <a id=dev-env-tools />Third-party tools installed extra

  - **[curl]**

    ```shell
    $ cd /usr/ports/ftp/curl && make install clean
    $ curl --version
    curl 7.47.0 (i386-portbld-freebsd10.2) libcurl/7.47.0 OpenSSL/1.0.1p zlib/1.2.8
    Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
    Features: AsynchDNS Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP UnixSockets 
    ```

  - **[git]**

    ```shell
    $ cd /usr/ports/devel/git && make install clean
    $ git --version
    git version 2.7.0
    ```

  - **[inotifywait]**

    ```shell
    $ cd /usr/ports/sysutils/inotify-tools && make install clean
    $ inotifywait --help | head -1 
    inotifywait 3.13 
    ```

  - **[tmux]**

    ```shell
    $ cd /usr/ports/sysutils/tmux && make install clean
    $ tmux -V
    tmux 2.1
    ```

    No doubt it is one of the must-have tool for the console.
    Screen may be divided into many panes as shown below.

 | | Left pane | Right pane |
--: | :-: | :-: |
**top** | [vim] editor | [Hspec] results on-the-fly | 
**bottom** | REPL with ghci | *Learn you a haskell* website with lynx | 
  
    ![Development environment over SSH session][ssh-development]

    But that's not all. Many switchable screens are possible also.
    - screen[0] as main screen for development.
    - screen[1] for manuals.
    - screen[n] for antything else wanted like lynx in attached screen above.

#### <a id=dev-env-editor />Editor (inspired by [PRACTICAL HASKELL - EDITOR SETUP WITH STACK](http://seanhess.github.io/2015/08/05/practical-haskell-editors.html))

  * **[vim]**

    ```shell
    $ cd /usr/ports/editors/vim && make install clean
    $ vim --version
    VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 20 2016 17:13:39)
    Included patches: 1-1229
    Compiled by sebi@hyaena
    Big version without GUI.  Features included (+) or not (-):
    +acl             +farsi           +mouse_sgr       +tag_old_static
    +arabic          +file_in_path    +mouse_sysmouse  -tag_any_white
    +autocmd         +find_in_path    +mouse_urxvt     -tcl
    -balloon_eval    +float           +mouse_xterm     +terminfo
    -browse          +folding         +multi_byte      +termresponse
    ++builtin_terms  -footer          +multi_lang      +textobjects
    ++builtin_terms  -footer          +multi_lang      +textobjects
    +byte_offset     +fork()          -mzscheme        +title
    +channel         -gettext         +netbeans_intg   -toolbar
    +cindent         -hangul_input    +path_extra      +user_commands
    -clientserver    +iconv           -perl            +vertsplit
    -clipboard       +insert_expand   +persistent_undo +virtualedit
    +cmdline_compl   +jumplist        +postscript      +visual
    +cmdline_hist    +keymap          +printer         +visualextra
    +cmdline_info    +langmap         -profile         +viminfo
    +comments        +libcall         -python          +vreplace
    +conceal         +linebreak       -python3         +wildignore
    +cryptv          +lispindent      +quickfix        +wildmenu
    +cscope          +listcmds        +reltime         +windows
    +cursorbind      +localmap        +rightleft       +writebackup
    +cursorshape     -lua             -ruby            -X11
    +dialog_con      +menu            +scrollbind      -xfontset
    +diff            +mksession       +signs           -xim
    +digraphs        +modify_fname    +smartindent     -xsmp
    -dnd             +mouse           -sniff           -xterm_clipboard
    -ebcdic          -mouseshape      +startuptime     -xterm_save
    +emacs_tags      +mouse_dec       +statusline      -xpm
    +eval            -mouse_gpm       -sun_workshop    
    +ex_extra        -mouse_jsbterm   +syntax          
    +extra_search    +mouse_netterm   +tag_binary      
       system vimrc file: "/usr/local/etc/vim/vimrc"
         user vimrc file: "$HOME/.vimrc"
     2nd user vimrc file: "~/.vim/vimrc"
          user exrc file: "$HOME/.exrc"
      fall-back for $VIM: "/usr/local/etc/vim"
     f-b for $VIMRUNTIME: "/usr/local/share/vim/vim74"
    Compilation: cc -c -I. -Iproto -DHAVE_CONFIG_H   -I/usr/local/include  -O2 -pipe  -fstack-protector -fno-strict-aliasing   -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
    Linking: cc   -Wl,-rpath=/usr/lib:/usr/local/lib -fstack-protector -L/usr/local/lib -Wl,--as-needed -o vim               -lm -lelf  -ltermlib                     
    ```
  
    - **[hdevtools]**

      ```shell
      $ cabal install hdevtools
      $ hdevtools --version # probably PATH must be updated. Maybe $HOME/.cabal/bin should be added.
      hdevtools: version 0.1.2.2 (ghc-7.10.2-i386-freebsd, cabal-1.22.4.0)
      ```

    - **[pathogen.vim]** (~/.vimrc must be updated, see [pathogen.vim])

      ```shell
      $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
      ```

    - **[syntastic]** (~/.vimrc must be updated, see [syntastic])

      ```shell
      $ cd ~/.vim/bundle && \
        git clone https://github.com/scrooloose/syntastic.git
      ```

    - **[vim-hdevtools]** (~/.vimrc must be updated, see [vim-hdevtools])

      ```shell
      $ cd ~/.vim/bundle && \
        git clone https://github.com/bitc/vim-hdevtools.git
      ```

    - **[ctrlp.vim]**

      ```shell
      $ cd ~/.vim/bundle && \
        git clone https://github.com/ctrlpvim/ctrlp.vim/
      ```

    - **[tabular]**

      ```shell
      $ cd ~/.vim/bundle && \
        git clone https://github.com/godlygeek/tabular
      ```

#### <a id=dev-cmds />First need commands

  ```shell
  $ cabal init                            # It initializes empty project structure.
  $ cabal install --only-dependencies     # It installs all expected requirements.
  $ cabal build                           # It builds project to folder `dist` as output folder
  $ cabal run                             # Easy way to run the code. It builds project and runs the result
  $ while inotifywait -e modify -r src; \
  > do \
  >   runhaskell -isrc -itest test/Spec.hs; \
  > done;                                 # If any file is changed in src folder, then run specs. It runs until abort.
  ```

### Test environment <a id=test-env></a>

  * Testing framework
    * **[Hspec]** 

      Recommended source-code tree supported nicely by [Hspec] can be found [here: hspec-discover](http://hspec.github.io/hspec-discover.html). The link describes very useful solution to automagically discover specs with only one-time edited `Spec.hs` file.

#### <a id=test-cmds />First need commands

  ```shell
  $ cabal configure --enable-tests       # It's self-explanatory.
  $ cabal test                           # It runs all tests but output is a little too much rich.
  $ runhaskell -isrc -itest test/Spec.hs # Long command but it gives very nice output.
  ```

### <a id=code-quality />Haskell code quality

  * [Structure of a Haskell project]
  * Haskell [Programming guidelines]
  * Code quality is important, so it must be stylish. Follow the [good style rules].
  * **[scan]** checks the format of your haskell source code regarding: comments, white spaces and line breaks.

    ```shell
    $ cabal install scan
    $ scan --version
    scan-0.1.0.9 http://projects.haskell.org/style-scanner/
    ```

  * **[hindent]** Haskell code formatter.

    ```shell
    $ cabal install hindent
    $ hindent --version
    hindent 4.6.1
    ```

### <a id=knowledge></a> Knowledge sources

| [Haskell language](https://www.haskell.org)
| [Cabal User Guide](https://www.haskell.org/cabal/users-guide/)
| [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)
| [Practical Haskell](http://seanhess.github.io/2015/08/04/practical-haskell-getting-started.html)
| [State monad](https://wiki.haskell.org/State_Monad)
| [Hspec](http://hspec.github.io)
| [UML at sourcemaking.com](https://sourcemaking.com/uml)
| [UML diagrams](http://www.uml-diagrams.org)
|

[cabal]: https://www.haskell.org/cabal/
[ctrlp.vim]: https://github.com/kien/ctrlp.vim
[curl]: https://curl.haxx.se
[FreeBSD]: https://www.freebsd.org
[ghc]: https://www.haskell.org/ghc/
[git]: http://git-scm.com
[good style rules]: https://wiki.haskell.org/Category:Style
[Structure of a Haskell project]: https://wiki.haskell.org/Structure_of_a_Haskell_project
[Programming guidelines]: https://wiki.haskell.org/Programming_guidelines
[haddock]: https://www.haskell.org/haddock/
[hdevtools]: https://github.com/bitc/hdevtools
[hindent]: https://github.com/chrisdone/hindent
[Hspec]: http://hspec.github.io
[inotifywait]: https://github.com/rvoicilas/inotify-tools/wiki
[pathogen.vim]: http://github.com/tpope/vim-pathogen/
[project site]: http://a4099181.github.io/LearningHaskell/
[scan]: http://hackage.haskell.org/package/scan
[stack]: http://www.haskellstack.org/
[syntastic]: http://github.com/scrooloose/syntastic/
[tabular]: https://github.com/godlygeek/tabular
[UML charts]: https://onedrive.live.com/redir?resid=FA1A560880C11689!689&authkey=!AGdgg1Uj5X-RvjY&ithint=folder%2cpng
[tmux]: https://tmux.github.io
[vim]: http://www.vim.org/
[vim-hdevtools]: http://github.com/bitc/vim-hdevtools/

[ssh-development]:https://ietcew.bn1302.livefilestore.com/y3m9OoRBn1jY2-YiKV0ppqIUbkkmbM7CqqDqTgJsHxH7wm4Fp3m4RNrDV07H_K0COh_G3XhVPuxTs9FgBam2lXdsHT6A9MDC5rwDkxUX0OjHwzGJkgOG6kZRTDPRwNCxLHIXhHFmPkCG8ncyDTTJrvWDpawflmHZ3huB8BEkkyPA00

[draw.io]: http://www.draw.io/ "Drawings are made on-line with draw.io."
[emoji]: http://www.emoji-cheat-sheet.com "Emoji (emoticons/pictograph) supported by Github."
