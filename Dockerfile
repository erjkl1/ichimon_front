# ベースイメージを指定
FROM node:20.4-alpine

# アプリケーションディレクトリを設定
WORKDIR /app

# package.json と yarn.lock をコピー
COPY package.json yarn.lock ./

# 依存関係のインストール
RUN yarn install

# アプリケーションのソースコードをコピー
COPY . .

# プロダクションビルドの作成
RUN yarn build

# アプリケーションが使用するポートを指定
EXPOSE 3000

# プロダクションサーバーを起動
CMD ["yarn", "start"]
