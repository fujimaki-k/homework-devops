# homework-devops
## 使い方
### 開発時
開発時は、次のコマンドでデータベースのみを立ち上げて利用します。

ソースコードはローカルで編集中のものが利用可能です。
IntelliJ IDEA などの IDE から起動すると、デバッグもできるため便利です。

起動したデータベースへは localhost のポート 3306 でアクセスが可能です。

```bash
docker-compose up  mariadb
```

### 動作確認時
動作確認用にアプリケーションを起動する場合は、次のコマンドを実行します。

GitHub からソースコードをダウンロードして、アプリケーションを起動するところまで自動で行われます。

アプリケーションの起動後は、ブラウザを開いて http://localhost:8080/ にアクセスしてください。

```bash
docker-compose up
```

### 停止
サーバーを停止させるには、次のコマンドを実行します。

正しく停止されなかった場合、次回の起動ができなくなることがあるので注意してください。
その際にも docker-compose down を実行してから起動することで、改善すると思います。

```bash
docker-compose down
```
