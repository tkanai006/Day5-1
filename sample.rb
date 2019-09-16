class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理の
    # メソッドの処理をこの中に作成する
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    me_pon = gets.to_i
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    ene_pon = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に
    # 出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる

    # 相手のじゃんけんの和名定義
    enemy_array = ["グー","チョキ","パー"]

    # 無効な数字入力時とあいこ時の再帰用にインスタンス定義
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new

    # じゃんけん処理実施制御用
    one_more_game = false

    if (player_hand < 0 || player_hand > 2)
      puts "0〜2の数字を入力してください。"
      puts "-------------------------"
      # 再度じゃんけん実行
      janken.pon(player.hand, enemy.hand)
      # 無効な数字入力時、再帰戻り時に後続処理をしないようにじゃんけん判定入らないようにする
      one_more_game = true
    end

    # じゃんけん処理実施制御用
    if one_more_game != true
      # 相手のじゃんけん和名変換
      enemy_hand_ja = enemy_array[enemy_hand]

      # じゃんけん判定
      judge = (player_hand - enemy_hand + 3) % 3
      case judge
      when 2
        puts "相手の手は#{enemy_hand_ja}です。あなたの勝ちです。"
        puts "-------------------------"
      when 1
        puts "相手の手は#{enemy_hand_ja}です。あなたの負けです。"
        puts "-------------------------"
      else
        puts "相手の手は#{enemy_hand_ja}です。あいこでした。再挑戦。"
        puts "-------------------------"
        # 再度じゃんけん実行
        janken.pon(player.hand, enemy.hand)
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、
# 書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。
# 課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
