New = true
function MechanicReset()
    RawTable = {
        Type = io.popen("sudo dmidecode -s system-manufacturer"),
        --gsub to remove gap of return/break or enter
        Type2 = io.popen("sudo dmidecode -s system-product-name"),
        Ip_Host = io.popen("ip route show default | awk '/default/ {print $3}'")
    }
    TypeDevice_Table = {
        Type = RawTable.Type:read("*a"):gsub("%s+$",""),
        Type2 = RawTable.Type2:read("*a"):gsub("%s+$","")
    }
    Ip_Table = {
        Ip_Host = RawTable.Ip_Host:read("*a"):gsub("%s+$", "")
    }
    local function IP_Extract(IP)
        local octets = {}
        for octet in IP:gmatch("%d+") do
            table.insert(octets, string.format("%03d", tonumber(octet)))
        end
        return table.concat(octets, ".")
    end
    Ip_Table.Ip_Host = IP_Extract(Ip_Table.Ip_Host)

    for i,v in pairs(RawTable) do
        v:close() --Close the resource, important.
    end
    os.execute("clear")
    if New == true then
        Introduction()
    else
        AskingCommand(true)
    end
end

function CommandListOutput()
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
        MechanicReset()
    end
end

function Introduction()--Appear when program work
    os.execute("clear")
	print("╔═══[✦✦✦✦]═══════════════════════════════════╗")
	print("Project StarTech: Lite")
	print("【v.0.1 | 03 Septempber 2024】")
	print("Created By: 【✿FictionCyber✿】")
	print("Powered with: Lua")
	print("╚════════════════════════════════════════════╝")
	CommandListOutput()
end

---------------------------------------------------
--lua StarTechLite.lua

function AskingCommand(Condition)
    os.execute("clear")
    if Condition == true then
        print("╔═══[****]═══════════════════════════════════╗")
        print("  Enter your command!")
        print("╚════════════════════════════════════════════╝")
    else--Tells that condition of the last command was error.
        print("╔═══[!!!!]═══════════════════════════════════╗")
        print("  Error: Command Not Exist!")
        print("  Date:"..os.date("%Y-%m-%d").." : ".."【"..os.date("%H:%M:%S").."】")
        print("╚════════════════════════════════════════════╝")
    end
	CommandListOutput()
end

------------COMMAND LIST THAT ARE ACTIVE
function Print_DeviceInfo()
    os.execute("clear")
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n")
	print("  Manufacturer: "..TypeDevice_Table.Type.."\n  Model: "..TypeDevice_Table.Type2)
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
    if Return == "" then
        AskingCommand(true)
    end
end

function Print_IP_Host()
    os.execute("clear")
	print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n")
    print(" Connected Wi-Fi IP Address: " .. Ip_Table.Ip_Host)
	print(" ")
	print("\n┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
    local Return = io.read()
    if Return == "" then
        AskingCommand(true)
    end
end

MechanicReset()
