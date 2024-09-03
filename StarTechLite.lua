local Handle = io.popen("sudo dmidecode -s system-manufacturer")
local Manufacturer = Handle:read("*a"):gsub("%s+$","") --gsub to remove gap of return/break or enter
Handle:close()
local Handle2 = io.popen("sudo dmidecode -s system-product-name")
local Model = Handle2:read("*a"):gsub("%s+$","")
Handle2:close()
os.execute("clear")

function Introduction()
	print("╔═══[✦✦✦✦]═══════════════════════════════════╗")
	print("Project StarTech: Lite")
	print("【v.0.1 | 03 Septempber 2024】")
	print("Created By: 【✿FictionCyber✿】")
	print("Powered with: Lua")
	print("╚════════════════════════════════════════════╝")
	--down is for command list
	print("【1】Read System Of Yours. \n【2】None \n【3】None \n【4】None \n【5】None \n【6】None")
	--##
	os.execute("sleep 0.5")
	print("\n")
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
	--Reading down there for command
	io.write("\nEnter Code: ")
	local Choice = io.read("*n")
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
	if Choice == 1 then
		Print_DeviceInfo()
	else
		AskingCommandAgain_Wrong()
		
	end
end
function AskingCommandAgain_Wrong()
	print("╔═══[!!!!]═══════════════════════════════════╗")
	print("  Error: Command Not Exist!")
	print("  Date:"..os.date("%Y-%m-%d").." : ".."【"..os.date("%H:%M:%S").."】")
	print("╚════════════════════════════════════════════╝")
	--down is for command list
	print("【1】Read System Of Yours. \n【2】None \n【3】None \n【4】None \n【5】None \n【6】None")
	print("[Press: CTRL+C To Quit.]")
	--##
	print("\n")
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
	--Reading down there for command
	io.write("\nEnter Code: ")
	local Choice = io.read("*n")
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
	if Choice == 1 then
		Print_DeviceInfo()
	else
		AskingCommandAgain_Wrong()
	end
end
--lua StarTechLite.lua

function AskingCommandAgain_Fine()
	print("╔═══[****]═══════════════════════════════════╗")
	print("  Enter your command!")
	print("╚════════════════════════════════════════════╝")
	--down is for command list
	print("【1】Read System Of Yours. \n【2】None \n【3】None \n【4】None \n【5】None \n【6】None")
	print("[Press: CTRL+C To Quit.]")
	--##
	print("\n")
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
	--Reading down there for command
	io.write("\nEnter Code: ")
	local Choice = io.read("*n")
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
	if Choice == 1 then
		Print_DeviceInfo()
	else
		AskingCommandAgain_Wrong()
	end
	--##
end

function Print_DeviceInfo()
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n")
	print("  Manufacturer: "..Manufacturer.."\n  Model: "..Model)
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
	os.execute("sleep 0.5")
	AskingCommandAgain_Fine()
end

Introduction()
