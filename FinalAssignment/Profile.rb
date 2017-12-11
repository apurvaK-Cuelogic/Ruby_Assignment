require_relative 'Login'
require_relative 'Validation'
require_relative 'Login'

class Profile
  include Validation

  def dispOptions
    @user=Login.whoLoggedIn
    puts "********** Profile Page ***********"
    puts "\nWelcome ,"+@user
    puts "1.Deposit\n2.Withdraw\n3.View Balance\n4.Exit\nEnter your choice\n"
    option=gets

    if option.to_i==1
      deposit
    elsif option.to_i==2
      withdraw
    elsif option.to_i==3
      viewBalance
    end
  end
  def deposit
    valid=false
    while(valid==false)
      puts "Enter recievers account number\n"
      rec_acc_no=Integer(gets)
      if Validation.alreadyExists?(rec_acc_no,'acc_no')==false
        puts "Account does not exist.."
        valid=false
        next
      end
      valid=true
    end
    valid=false
    while (valid==false)
      puts "Enter amount\n"
      amount=Integer(gets)
      if Validation.checkBalance(@user,amount)==false
        puts "You dont have sufficient balance\n"
        valid=false
        next
      end
      valid=true
    end

  end #deposit END

  #Deposit
  def deposit
    puts "Enter amount to deposit\n"
    amount = Integer(gets)

      file = File.read('package.json')
      data_hash = JSON.parse(file)

      flag = "false"
      data_hash.each do |sub|
        sub.each do |key,value|

          if sub["username"] == Login.whoLoggedIn
            actual_amount = sub["balance"].to_i;
            actual_amount = actual_amount + amount;
            sub["balance"] = actual_amount
            flag = "true"
            break
          end
        end
      end

      if(flag == "true")
        JSON.dump(data_hash)

        #Update in the JSON file

        data_from_json = JSON[File.read('package.json')]
        data_from_json = [data_from_json] if data_from_json.class != Array

        File.open("package.json","w") do |f|
          f.write(JSON.pretty_generate(data_hash))
        end #Update End

      else
        puts "Invalid user"
      end

  end #deposit End


  #Withdraw
  def withdraw
      puts "Enter amount to withdraw\n"
      amount = Integer(gets)
      if Validation.checkBalance(@user,amount) == false
        puts "You don't have sufficient balance\n"
        dispOptions

      else
        file = File.read('package.json')
        data_hash = JSON.parse(file)

        flag = "false"
        data_hash.each do |sub|
          sub.each do |key,value|

            if sub["username"] == Login.whoLoggedIn
             actual_amount = sub["balance"].to_i;
              actual_amount = actual_amount - amount;
              sub["balance"] = actual_amount
              flag = "true"
              break
            end
          end
        end

        if(flag == "true")
          JSON.dump(data_hash)

          #Update in the JSON file

          data_from_json = JSON[File.read('package.json')]
          data_from_json = [data_from_json] if data_from_json.class != Array

          File.open("package.json","w") do |f|
            f.write(JSON.pretty_generate(data_hash))
          end #Update End

        else
          puts "Invalid user"
        end

      end

  end #withdraw End

  #View Balance
  def viewBalance
    file = File.read('package.json')
    data_hash = JSON.parse(file)

    data_hash.each do |sub|
      if(sub["username"] == Login.whoLoggedIn)
        puts Login.whoLoggedIn," your account balance is"
        puts sub["balance"]
      end
    end

  end #viewBalance End

end #Class Profile End
