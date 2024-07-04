require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_s #ターミナルから入力するためのgetsメソッド。
#getsメソッドを使う場合は全て文字列になる
#to_i :数値に変換 　to_sは文字列に変換　←もともと文字列なのに必要なのか

input_number = memo_type.chomp 
#chompはStringクラスのメソッドのため文字列か文字列を格納した変数に使用される
#”\r”, “\r\n”, “\n” のすべてを改行コードとして取り除く
#chomp!は改行コードがなかった場合にnilを返す。


# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

#1が入力されたら
if input_number == "1"
    puts "新規メモを作成します。拡張子を除いたファイル名を入力してください。" 
    file_name = gets.chomp #ファイル名の後の改行は除きます。

    puts "メモしたい内容を記入して下さい。Ctrl+Dで保存して終了します。"
    input_memo = $stdin.read #入力された文を全てまとめて読み取るための.read
    memo = input_memo.chomp  #改行は除く
    CSV.open("#{file_name}.csv","a") do |csv|  #CSVを開く 　#文字列の中に式を入れるとき　"#{}"
    csv.puts ["#{memo}"] #書き込みを行う
    end

elsif input_number == "2"
    puts "既存のメモを編集します。拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp #ファイル名の後の改行は除きます。

    puts "メモしたい内容を記入して下さい。Ctrl+Dで保存して終了します。" 
    p CSV.read("#{file_name}.csv") #内容を読み込んで編集する場合は？
    input_memo = $stdin.read 
    memo = input_memo.chomp

    CSV.open("#{file_name}.csv","a") do |csv|  #CSVを開く 　#文字列の中に式を入れるとき　"#{}"
    csv.puts ["#{memo}"] #書き込みを行う
    end

else
    puts "1か2の数字を入力して下さい。"
end
