# Kitura を使ったサンプル

[Kitura Web Framework](https://developer.ibm.com/swift/products/kitura/) を使った簡単なサンプル。
JSONを返すだけなのでViewはありませんが、ModelとControllerを分けて作っています。

## 利用ライブラリ

以下のライブラリを使っています。

- [Kitura-router](https://github.com/IBM-Swift/Kitura-router.git)
- [LithiumLogger](https://github.com/d-abe/LithiumLogger.git) （[HeliumLogger](https://github.com/IBM-Swift/HeliumLogger)をログレベル設定できるようにしました）
- [Fluent (forked)](https://github.com/d-abe/fluent.git) （[Fluent](https://github.com/qutheory/fluent)をPostgreSQLに対応させるようforkしました）
- [Fluent PostgreSQL Driver (forked)](https://github.com/d-abe/fluent-postgresql.git) （上に合わせてこちらもfork）


```Swift:Package.swift
import PackageDescription

let package = Package(
    name: "KituraSample",
    dependencies: [
            .Package(url: "https://github.com/IBM-Swift/Kitura-router.git", majorVersion: 0),
            .Package(url: "https://github.com/d-abe/LithiumLogger.git", majorVersion: 0),
            .Package(url: "https://github.com/d-abe/fluent.git", majorVersion: 0),
            .Package(url: "https://github.com/d-abe/fluent-postgresql.git", majorVersion: 0),
    ]
)
```

## 動作環境

- Docker ([dabe/kitura-ubuntu](https://hub.docker.com/r/dabe/kitura-ubuntu/) のイメージを使用)
- PostgreSQL 9.5
- Linux or Mac

## 試し方

### Macの場合

1. まず、Swiftの[Latest Development Snapshots](https://swift.org/download/)からダウンロード＆インストールしておきます。
2. Swiftのインストール先をPATHに追加します（例：PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH）
3. [Homebrew](http://brew.sh/)で依存ライブラリをインストールします。

 `brew install http-parser pcre2 curl hiredis`

4. Githubのリポジトリからcloneします。

 `git clone https://github.com/d-abe/kitura_sample`

5. ビルドします。

 `make`

6. 実行します。

 `.build/debug/KituraSample`

### Dockerの場合

1) Docker, Docker Compose (必要ならDocker Machineも）をインストール＆設定しておきます（ここでは詳細は触れません）。

2) docker-compose.yamlを作成します。

```YAML:docker-compose.yaml
# postgres
postgresql:
  image: postgres:9.5
  ports:
    - "5432:5432"
  environment:
    POSTGRES_USER: docker
    POSTGRES_PASSWORD: docker
    POSTGRES_DB: docker

# kitura
kitura:
  image: dabe/kitura-ubuntu:latest
  volumes:
    - "{$ROOT_DIR}/src:/src"
  links:
    - postgresql:db
  ports:
    - "8090:8090"
  working_dir: /src
  environment:
    PROJECT_NAME: kitura
    WORKING_DIR: /src
```

※パスなどは自分の環境に合わせます

3) Docker Composeでコンテナを立ち上げます。

```
$ docker-compose up -d
```

4) PostgreSQLにテーブル作成SQLを投入（お好きなクライアントでDatabase/sample.sqlを流す）

※もしくは、docker execでコンテナに対して /bin/bash を実行し、psqlを実行してもいいです

5) これで動いているはず、なので動作確認。

```
$ curl -H "Content-Type: application/json" -d "{\"comment\": \"test\"}" http://192.168.171.150:8090
{
  "created_at": "2016-03-01 03:33:00"
  "comment": "test"
}
$ curl http://192.168.171.150:8090
[
  {
    "comment": "test",
    "created_at": "2016-03-01 03:33:00"
  }
]
```

