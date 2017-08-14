# nginx-config-api
HTTPリクエストによってNginxの設定を動的に変更するAPI

## 実行方法
dockerを用意し、以下コマンドを実行する。

```
$ docker-compose build
$ docker-compose up
```

以上の操作により、`4567`番ポートでアプリケーションが起動する。

## Gemの追加
`Gemfile`にGemを追加し、以下のコマンドを実行する。

```
$ docker-compose exec app bundle install
```

