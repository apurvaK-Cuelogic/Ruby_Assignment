require 'json'

file = File.read('package.json')
data_hash = JSON.parse(file)

#Update the value

=begin
data_hash[0]["key_a"] ="Anand"
JSON.dump(data_hash)

#Print the local array

  data_hash.each do |key,value|
      puts key
  end


#Update in the JSON file

data_from_json = JSON[File.read('package.json')]
data_from_json = [data_from_json] if data_from_json.class != Array

File.open("package.json","w") do |f|
  f.write(JSON.pretty_generate(data_hash))
end

=end

#Display the content of file

file = File.read('package.json')
data_hash = JSON.parse(file)

=begin
for i in 0..data_hash.length

  #data_hash[i]["key_a"] == "Anand"
    puts data_hash[i]["name"]
end
=end

puts "The is\n",data_hash.length

=begin
for i in 0..data_hash.length
  data_hash[i].each_with_index {|v, i|  puts data_hash[i] = v
  }
end
=end

#DISPLAY Hash Array
=begin
data_hash.each do |sub|
  sub.each do |key,value|
    if(sub["name"] == "Anand" )
      puts "#{key} : #{value}"
    end
  end
puts "\n"
end
=end

data_hash.each do |sub|
  puts "username ",sub["username"]
  puts "password ",sub["password"]
end


#For isAccountExist
acc_no ="acc_no"
a="111"
flag = false
data_hash.each do |sub|
  sub.each do |key,value|
   if(sub[acc_no] == a)
     flag = "true"
   end
  end
end
if(flag == "true")
  puts "Account Exists"
else
  puts "Account Not Exists"
end

=begin
tempHash = {
        "acc_no" => @acc_no,
        "name" => @name,
        "username" => @username,
        "password" =>@password,
        "balance" => "0"
    }

=end

#Write in file
=begin

@acc_no="12"
@name="ANand"
@username="sanand@gmail.com"
@password = "123Aband"

tempHash = {
    "acc_no" => @acc_no,
    "name" => @name,
    "username" => @username,
    "password" =>@password,
    "balance" => "0"
}

data_from_json = JSON[File.read('package.json')]
data_from_json = [data_from_json] if data_from_json.class != Array

  File.open("package.json","w") do |f|
    f.write(JSON.pretty_generate(data_from_json << tempHash))
  end

=end

=begin
name = "apurva"
age = 22
pass ="qw12"
cust_data = {name: name, age: age, pass: pass}

=end