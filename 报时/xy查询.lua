// 新聊天信息触发器
// 聊天信息内容：(content)
// 发言人：(name)
// 如需更多信息，可以到论坛触发器版块发帖。
// 关键字：xy
[if] (EnableXy) == true
    ($d) = (:hour)*60*60+(:minute)*60+(:second)-(TimeXyEndHour)*3600-(TimeXyEndMinute)*60-(TimeXyEndSecond)
    @js ($d0) = parseInt((d)/3600)
    @js ($d1) = parseInt(((d)%3600)/60)
    ($d2) = (d)%60
    [if] (d0) > 0
        @js WG.Send("chat \n【襄阳】结束于(TimeXyEndHour):(TimeXyEndMinute):(TimeXyEndSecond)，可重新开启。")
    [else]
        [if] (d2) > 0
            ($d1) = 59 - (d1)
            ($d2) = 60 - (d2)
            @js WG.Send("chat \n【襄阳】结束于(TimeXyEndHour):(TimeXyEndMinute):(TimeXyEndSecond)，还有(d1)分(d2)秒冷却。")
        [else]
            ($d1) = 60 - (d1)
            @js WG.Send("chat \n【襄阳】结束于(TimeXyEndHour):(TimeXyEndMinute):(TimeXyEndSecond)，还有(d1)分(d2)秒冷却。")
[if] (EnableXy) == false
    ($d) = (:hour)*60*60+(:minute)*60+(:second)-(TimeXyStartHour)*3600-(TimeXyStartMinute)*60-(TimeXyStartSecond)
    @js ($d0) = parseInt((d)/3600)
    @js ($d1) = parseInt(((d)%3600)/60)
    ($d2) = (d)%60
    @js WG.Send("chat \n【襄阳】开始于(TimeXyStartHour):(TimeXyStartMinute):(TimeXyStartSecond)，已进行(d1)分(d2)秒。")
[if] (EnableXy) == null
    chat 没有记录
