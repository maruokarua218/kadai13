#テーブルスキーマ

## Userモデル
| カラム | データ型 |
| ----- | ----- |
| name | string |
| email | string |
| password_digest | string |
| image | text |

## Taskモデル
| カラム名 | データ型 |
| ----- | ----- |
| title | string |
| deadline | datetime |
| priority | string |
| content | string |

## Labelモデル
| カラム名 | データ型 |
| ----- | ----- |
| name | string |

## Intモデル
| カラム名 | データ型 |
| ----- | ----- |
| task_id | bigint |
| label_id | bigint |

#デプロイの手順
* Herokuに新しいアプリケーションを作成する
* Heroku buildpackを追加する
* bundle lock --add-platform x86_64-linux
* git add .とgit commit -m "~"
* $ git push heroku step2:master
* $ heroku run rails db:migrate  
* $ heroku open        
