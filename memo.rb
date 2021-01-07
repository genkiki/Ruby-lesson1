require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

loop {
    ope = gets().chomp
    
    if ope == "1"
        puts "拡張子を除いたファイル名を入力してください"
        file_name = gets().chomp

        p "メモしたい内容を入力してください"
        p "終わったらCtrl + Dを入力してください"

            CSV.open(file_name + '.csv', 'w') do |csv|
                loop {
                    if ARGF.eof? #Ctrl+Dで終了
                        break
                    end
                    text = gets().chomp
                    csv << [text]
                }
            end
        break
    elsif ope == "2"
        puts "拡張子を除いたファイル名を入力してください"
        file_name = gets().chomp

        p "メモしたい内容を入力してください"
        p "終わったらCtrl + Dを入力してください"

        CSV.open(file_name + '.csv', 'a') do |csv|
            loop {
                if ARGF.eof? #Ctrl+Dで終了
                    break
                end
                text = gets().chomp
                csv << [text]
            }
        end
        break
    else
        puts "1か2を入力してください"
    end
}
