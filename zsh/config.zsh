#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
#################################  OTHERS  #################################

setopt no_flow_control        # disable ctrl+s, ctrl+q   
setopt auto_param_slash       # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu              # 補完キー連打で順に補完候補を自動で補完
setopt interactive_comments   # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst      # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word       # 語の途中でもカーソル位置で補完
setopt print_eight_bit        # 日本語ファイル名等8ビットを通す
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt share_history          # 他のターミナルとヒストリーを共有
setopt histignorealldups      # ヒストリーに重複を表示しない
setopt hist_save_no_dups      # 重複するコマンドが保存されるとき、古い方を削除する。
setopt extended_history       # $HISTFILEに時間も記録
setopt print_eight_bit        # 日本語ファイル名を表示可能にする
setopt hist_ignore_all_dups   # 同じコマンドをヒストリに残さない
setopt auto_cd                # ディレクトリ名だけでcdする
setopt no_beep                # ビープ音を消す

# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# enhancd
#source ~/.enhancd/init.sh

#環境変数の設定
export PATH=$HOME/.cargo/bin:$PATH