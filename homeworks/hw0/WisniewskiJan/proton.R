
install.packages("proton")
library(proton)
proton()

# Pietraszko uses a password which is very difficult to guess.
# At first, try to hack an account of a person which is not as cautious as Pietraszko.
# 
# But who is the weakest point? Initial investigation suggests that John Insecure doesn't care about security and has an account on the Proton server. He may use a password which is easy to crack.
# Let's attack his account first!
#   
#   Problem 1: Find the login of John Insecure.
# 
# Bit has scrapped 'employees' data (names and logins) from the www web page of Technical University of Warsaw. The data is in the data.frame `employees`. 
# Now, your task is to find John Insecure's login.
# When you finally find out what John's login is, use `proton(action = "login", login="XYZ")` command, where XYZ is Insecure's login.
head(employees)
employees[employees$name == 'John' & employees$surname=="Insecure", "login"]
proton(action = "login", login="johnins")

# It is highly likely that he uses some typical password.
# Bit downloaded from the Internet a database with 1000 most commonly used passwords.
# You can find this database in the `top1000passwords` vector.
# 
# Problem 2: Find John Insecure's password.
head(top1000passwords)
head(employees)
print('---')
for (x in top1000passwords) {
  proton(action = "login", login="johnins", password=x)
}


# Well done! This is the right password!
#   Bit used John Insecure's account in order to log into the Proton server.
# It turns out that John has access to server logs.
# Now, Bit wants to check from which workstation Pietraszko is frequently logging into the Proton server. Bit hopes that there will be some useful data.  
# 
# Logs are in the `logs` dataset. 
# Consecutive columns contain information such as: who, when and from which computer logged into Proton.
# 
# Problem 3: Check from which server Pietraszko logs into the Proton server most often.
# 
# Use `proton(action = "server", host="XYZ")` command in order to learn more  about what can be found on the XYZ server.
# The biggest chance to find something interesting is to find a server from which Pietraszko logs in the most often.
employees[employees$surname=="Pietraszko", ]
#slap
head(logs)
x = logs[logs$login == "slap", ]
head(x)
as.data.frame(table(x$host))
proton(action = "server", host="194.29.178.16")
