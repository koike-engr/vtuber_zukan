# 概要
**Rails/Docker/AWS** を用いた環境(テストは**RSpec**) で、Vtuberの図鑑を作成しました。

# 使用技術・バージョン
Ruby 2.7.2

Rails 5.2.4.4

Mysql 5.7

Docker 20.10.0

docker-compose 1.27.4

AWS
  - VPC
  - EC2
  - RDS
  - ALB
  - ACM

RSpec ???


# 機能一覧
### 一覧表示
- ソート機能
  - 登録者数順
  - 急上昇順
  - スーパーチャット獲得額順
  - いいね数順
- いいね機能
- 詳細表示機能
- 詳細編集/削除機能
- コメントを付ける機能

### 検索機能
- カテゴリ検索
- 自由テキスト検索

# 使い方

# 環境構築 手順
localでの構築手順になります。
ローカルに本リポジトリをクローンし、

```
docker-compose build
docker-compose up -d
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

とコマンドを打った後、localhost:80 にアクセスするとrootのindexページが表示されます。
