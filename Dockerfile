FROM codercom/code-server:latest

USER root

# 必要なディレクトリを作成して権限を設定
RUN mkdir -p /home/coder/.local/share/code-server/User \
    /home/coder/.local/share/code-server/Machine \
    /home/coder/.local/share/code-server/extensions \
    /home/coder/.local/share/code-server/logs \
    /home/coder/.local/share/code-server/User/globalStorage \
    /home/coder/.local/share/code-server/User/History \
    /home/coder/.local/share/code-server/coder-logs && \
    chown -R coder:coder /home/coder/.local

# Node.jsのインストール
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Pythonのインストール
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# 特定の拡張機能をプリインストールする場合はコメントを外して設定
# USER coder
# RUN code-server --install-extension ms-python.python

# デフォルトユーザーに戻す
USER coder
