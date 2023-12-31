#!/bin/bash
# https://fearlessrevolution.com/viewtopic.php?p=232011#p232011
FILE_NAME=translating.ct

# Translate Cheat Engine description function
translate() {
    echo "正在翻译原描述 $1 至 $2"
    {
        sed -i "s/<Description>\"$1\"<\/Description>/<Description>\"$2\"<\/Description>/g" $FILE_NAME
    } || {
        exit 1
    }
}

# Use sed to replace text.
fullReplace() {
    {
        sed -i "s/$1/$2/g" $FILE_NAME
    } || {
        exit 2
    }
}

# Use item id to get item's chinese translate
getItemTranslate() {
    local decimalID
    local org
    local ret
    decimalID=$(printf "%04d" "$((16#$1))")

    org=$(jq -r --arg id "$decimalID" '.entries[] | select(.name == "I_\($id)_Name").content[1]' mhrice.itemname.json)
    ret=$(jq -r --arg id "$decimalID" '.entries[] | select(.name == "I_\($id)_Name").content[13]' mhrice.itemname.json)
    if [[ -z "$org" || -z "$ret" ]]; then
        org=$(jq -r --arg id "$decimalID" '.entries[] | select(.name == "I_\($id)_Name").content[1]' mhrice.itemnamemr.json)
        ret=$(jq -r --arg id "$decimalID" '.entries[] | select(.name == "I_\($id)_Name").content[13]' mhrice.itemnamemr.json)
    fi

    # if [[ "${org,,}" == "${2,,}" ]]; then
    #     echo "$ret"
    # fi

    if ! echo "$ret" | grep -q "#Rejected#"; then
        echo "$ret"
    fi
}

# Translate descriptions
translate 'Team: Tuuup! \&amp; Insterluda (click for auto attach to game) 14.0.0.0' '制作团队：Tuuup! \&amp; Insterluda 汉化团队：凉先森 \&amp; SummonHIM（单击此处自动关联游戏进程） 14.0.0.0'
translate 'Player scripts' '玩家脚本'
translate 'Zenni and Kamura (go menu to update pointers)' '金币与炎火点数（需打开菜单栏来刷新数值）'
translate 'Zenni' '金币'
translate 'Kamura points' '炎火点数'
translate 'Inf Stamina  v5? (fix 15.0.0.0)' '无限耐力  v5? （修复 15.0.0.0）'
translate 'God mode \/ no knockback v3 (update 15.0.0.0.0)' '上帝模式 \/ 无击退模式 v3 （更新 15.0.0.0.0）'
translate '1 hit kill \/ damage multiplier shows in stats v2' '一拳超人 \/ 修改伤害倍率 v2'
translate '\&lt;-- For multiplier and to disable OHK' '\&lt;-- 多人联机时禁用一拳超人'
translate 'Damage multiplier (default 2x)' '伤害倍率（默认两倍）'
translate '100% Affinity\/crit change in battle' '战斗中调整会心率\/暴击率为 100%'
translate 'inf Wirebug v2 (v14.0.0.0)' '无限翔虫 v2 (v14.0.0.0)'
translate 'Unl monster loot\/carving' '无限次剥取怪物素材'
translate 'No item loss\/ ammo,healt potions, etc... v4' '无限次使用背包物品 \/ 弹药、回复药等… v4'
translate 'Craft when you don'\''t have the materials. Use with no item loss script! (fix 11.0.1.0)' '没有材料时也能制作。调用无限次使用背包物品的脚本 （修复 11.0.1.0）'
translate 'Item box (chest). Selected item amount changer.' '道具箱中选择物品来修改数量'
translate 'Amount of item' '物品数量'
translate 'Player Hunter XP multiplier' '玩家猎人经验倍率'
translate 'Player Master XP multiplier' '玩家大师经验倍率'
translate 'Buddy XP multiplier' '随从经验倍率'
translate 'Anomaly xp multiplier' '怪异研究经验倍率'
translate 'multiplier' '倍率'
translate 'Multiplier' '倍率'
translate 'some Player pointers (fix 13.0.0.0)' '更多玩家数据（修复 13.0.0.0）'
translate 'Base ID \[Ignore\]' 'Base ID \[忽略\]'
translate 'wirebug' '翔虫'
translate 'wirebug max' '最大翔虫'
translate 'Max hp' '最大生命值'
translate 'red bar' '红色临时生命值'
translate 'Stamina' '耐力'
translate 'Max stamina' '最大耐力'
translate 'Hunger' '饥饿'
translate 'Attack' '攻击'
translate 'Defence' '防御'
translate 'Affinity' '会心率'
translate 'Wyvern heart heavybow' '机关龙弹重弩'
translate 'Wyvern snipe heavybow' '狙击龙弹重弩'
translate 'player hunter\/master and anomaly rank and XP (go stats menu)' '玩家猎人\/大师和怪异研究等级及经验（需打开状态来刷新数值）'
translate 'Hunter rank' '猎人等级'
translate 'Hunter XP' '猎人经验'
translate 'Master rank' '大师等级'
translate 'Master XP' '大师经验'
translate 'Anomaly research' '怪异研究'
translate 'Anomaly research XP' '怪异研究经验'
translate 'Player invisible\/ monsters don'\''t react' '玩家隐身\/怪物不做反应'
translate 'You can'\''t hurt them. Pure for making photos' '无法伤害怪物。纯当拍照使用。'
translate 'No voucher lost? (back-up your save!!)' '无限造型券？（记得备份存档！！）'
translate 'Monster scripts' '怪物脚本'
translate 'Inf Monster special bar' '无限怪物特殊栏'
translate 'Reset Monster Ultimate gauge Bar' '重置怪物大招计量表'
translate 'Inf Wyvern Riding (fix 11.0.1.0?)' '无限御龙 （修复 11.0.1.0?）'
translate 'Monster frezze 2.0 (hard, whole mape frozen for ever)' '怪物冻结 2.0 （硬冻结，永久冻结全图）'
translate 'Monster frezze (soft)' '怪物冻结（软冻结）'
translate 'Inf debuff duration for Monsters' '无限怪物 Debuff'
translate 'Traps, lightning bombs, element debuffs' '陷阱、闪光弹和属性 Debuffs'
translate 'Size monster(hit monster to get values?)' '怪物大小（攻击来刷新数值？）'
translate 'size mp 3 (count for largest\/smallest size)??' 'mp 3 大小（计算最大\/最小尺寸）??'
translate 'Rampage Quests ' '百龙夜行'
translate 'Max Level (fix 11.0.1.0)' '最大等级（修复 11.0.1.0）'
translate 'Inf prep. time (fix)' '无限准备时间（修复）'
translate 'Gate HP pointer (fix 13.0.0.0)' '大门数据修改'
translate 'current gate HP' '当前大门血量'
translate 'Max gate HP' '最大大门血量'
translate 'Group 10' '第 10 组'
translate 'prep timer' '准备计时器'
translate 'mis timer' '任务计时器'
translate 'gate hp' '大门血量'
translate 'points' '点数'
translate 'lvl' '等级'
translate 'Inf placements of constructions' '无限放置狩猎设备'
translate 'Inf Points after receive' '无限回收点数'
translate 'Sidequest_finish v1' '完成支线任务 v1'
translate 'Sidequest_finish v3' '完成支线任务 v3'
translate 'Rampage_Sidequests v2' '百龙夜行支线任务 v2'
translate 'Quest scripts' '任务脚本'
translate 'Inf clear time  (fix 11.0.1.0)' '无限剩余时间（修复 11.0.1.0）'
translate 'Skip quest Clear timer fix' '跳过任务剩余时间 修复'
translate 'Quest timer\/ challenge timer pointers' '任务计时器数据修改'
translate 'current Time' '当前时间'
translate 'Max time' '最大时间'
translate '? time past ?' '？已过时间？'
translate 'Instant Quest clear \[Any quest -except rampage\] v2' '马上完成任务 \[除百龙夜行外\] v2'
translate 'Instant Quest \&amp; Return(turn off after) v2 (fix 11.0.1.0)' '马上完成任务并返回（单次） v2 （修复 11.0.1.0）'
translate 'Pouch in quest. Selected item amount changer. v2' '任务中道具袋选择物品来修改数量 v2'
translate 'Amount' '数量'
translate 'Easy sub-camp unlock(slaying Izuchi, Zamite. Kill 1)' '简易辅助营地解锁（会杀掉镰鼬龙或幼齿鲨）'
translate 'Weapon stuff ' '武器'
translate 'No reload bow guns v2' '弩炮无需换弹 v2'
translate 'No ammo loss from inventory only. (tested only with light bow gun) v2' '物品栏弹药无限使用（仅测试过轻弩） v2'
translate 'unl. Heavy gun wyvern heart special (fix 14.0.0.0)' '无限重弩机关龙弹 （修复 14.0.0.0）'
translate 'unl. Heavy gun wyvern snipe special (fix 13.0.0.0)' '无限重弩狙击龙弹 （修复 13.0.0.0）'
translate 'Max shapness + max level sharpness (fix 14.0.0.0)' '最大锋利度 + 最大锋利度等级 （修复 14.0.0.0）'
translate 'unl. Gunlance ammo (fix 13.0.0.0)' '铳枪无限子弹 （修复 13.0.0.0）'
translate 'Light bow gun 5 wyvern shots (fix 14.0.0.0)' '轻弩连续发射5只起爆龙弹 （修复 14.0.0.0）'
translate 'old\/not working' '旧功能\/不一定能用'
translate 'Max demon gauge (dual blades) (fix 13.0.0.0)' '最大鬼人槽值（双剑）（修复 13.0.0.0）'
translate 'unl. Heavy gun wyvern snipe special (fix 13.0.0.0)' '无限重弩狙击龙弹 （修复 13.0.0.0）'
translate 'Long sword spirit gauge full (fix 13.0.0.0)' '拉满太刀练气槽'
translate 'Insect glaive full extracts (fix 13.0.0.0)' '拉满操虫棍强化精华槽强化精华'
translate 'Charge blade 5 phials full (fix 13.0.0.0)' '拉满盾斧5瓶充能槽'
translate 'Single Scripts Do Not Use Them With Combo Scripts' '独立脚本，不要与其他脚本混用'
translate 'P. Max Life' 'P. 最大生命值'
translate 'P. Recovery Life' 'P. 恢复生命值'
translate 'P. Max Stamania' 'P. 最大耐力'
translate 'P. Max Regen Stamania' 'P. 最大恢复耐力'

# Translate item names
while IFS=: read -r hexCode itemName; do
    if [[ -n "$hexCode" ]]; then
        newItemName=$(getItemTranslate "$hexCode" "$itemName")
        if [[ -n "$newItemName" ]]; then
            echo "正在根据名称数据库翻译物品ID $hexCode:$itemName 至 $hexCode:$newItemName"
            fullReplace "$hexCode:$itemName" "$hexCode:$newItemName"
        else
            echo "警告： 物品ID $hexCode:$itemName 无法翻译。原因是未在名称数据库中找到相对应的字符串。或原名称与数据库中英文名称不匹配。"
        fi
    fi
done < <(sed -n -e '/<DropDownList/{:a' -e 'N;/<\/DropDownList>/!ba' -e 's/ *<DropDownList[^>]*>\(.*\)<\/DropDownList>/\1/p}' $FILE_NAME)
