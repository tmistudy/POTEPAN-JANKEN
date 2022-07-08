winner = false
# じゃんけんとあっち向いてホイの勝敗がつくまで繰り返し
until winner do
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  chose = gets.to_i  # 0〜3を入力
  program = rand(3)  # 0〜3をランダムで取得
  win = false  # じゃんけんの勝利フラグ
  draw = false  # じゃんけんの引き分けフラグ

  # じゃんけんの勝敗がつくまで繰り返し
  until draw do
    # あいこでない場合
    if chose != program
      case chose
      # グーの場合
      when 0 then
        puts "ホイ！"
        puts "-------------------"
        puts "あなた :グーを出しました"
        if program == 1
          puts "相手 :チョキを出しました"
          win = true
        elsif program == 2 
          puts "相手 :パーを出しました"
        end
      # チョキの場合
      when 1 then
        puts "ホイ！"
        puts "-------------------"
        puts "あなた :チョキを出しました"
        if program == 0
          puts "相手 :グーを出しました"
        elsif program == 2 
          puts "相手 :パーを出しました"
          win = true
        end
      # パーの場合
      when 2 then
        puts "ホイ！"
        puts "-------------------"
        puts "あなた :パーを出しました"
        if program == 0
          puts "相手 :グーを出しました"
          win = true
        elsif program == 1 
          puts "相手 :チョキを出しました"
        end
      # 戦わないを選んだ場合
      when 3 then
        puts "終了"
        return
      # 0~3以外を選んだ場合
      else
        puts "0〜3を入力してください"
        return
      end
      puts "-------------------"
      draw = true
    # あいこの場合
    else
      puts "ホイ！"
      puts "-------------------"
      case chose
      when 0 then
        puts "あなた :グーを出しました"
        puts "相手 :グーを出しました"
      when 1 then
        puts "あなた :チョキを出しました"
        puts "相手 :チョキを出しました"
      when 2 then
        puts "あなた :パーを出しました"
        puts "相手 :パーを出しました"
      end
      puts "-------------------"
      puts "あいこで..."
      puts "0(グー)1(チョキ)2(パー)3(戦わない)"
      chose = gets.to_i
      program = rand(3)
    end
  end

  attimuite = false  # あっち向いてホイの正常フラグ
  # 0〜3までが入力されるまで繰り返し
  until attimuite do
    puts "あっち向いて〜"
    puts "0(上)1(下)2(左)3(右)"
    chose = gets.to_i
    program = rand(4)
    if chose == 0 || chose == 1 || chose == 2 || chose == 3
      attimuite = true
    else
      puts "0〜3を入力してください"
    end
  end
  puts "ホイ！"
  puts "-------------------"
  
  # 相手の方向を表示
  def display(program)
    if program == 0
      puts "相手 :上"
    elsif program == 1
      puts "相手 :下"
    elsif program == 2
      puts "相手 :左"
    elsif program == 3
      puts "相手 :右"
    end
  end

  # 方向を表示
  def direction(chose, program)
    case chose
    # 0(上)を選んだ場合
    when 0 then
      puts "あなた :上"
      display(program)
    # 1(下)を選んだ場合
    when 1 then
      puts "あなた :下"
      display(program)
    # 2(左)を選んだ場合
    when 2 then
      puts "あなた :左"
      display(program)
    # 3(右)を選んだ場合
    when 3 then
      puts "あなた :右"
      display(program)
    end
    puts "-------------------"
  end

  # あっち向いてホイの決着がついた場合
  if chose == program
    direction(chose, program)
    # じゃんけんで勝っていた場合
    if win
      puts "Winner!ヽ(^0^)/"
    # じゃんけんで負けていた場合
    else
      puts "Lose...(T_T)"
    end
    puts "-------------------"
    winner = true
  # あっち向いてホイの決着がつかなかった場合
  else
    direction(chose, program)
  end
end