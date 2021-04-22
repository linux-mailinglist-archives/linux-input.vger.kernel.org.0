Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC16368484
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 18:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235977AbhDVQN5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 12:13:57 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:55415 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhDVQN4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 12:13:56 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13MGD7e3035656;
        Fri, 23 Apr 2021 01:13:07 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Fri, 23 Apr 2021 01:13:07 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13MGD7ND035619
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 23 Apr 2021 01:13:07 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] unexpected kernel reboot (4)
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Andrey Konovalov <andreyknvl@gmail.com>,
        syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
References: <000000000000301a4d05bfe14b8f@google.com>
 <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
 <b8162e95-fb2e-51f6-9d9b-a4d64873876e@i-love.sakura.ne.jp>
 <abcb019f-a78a-3c6d-e199-719176a394d6@i-love.sakura.ne.jp>
 <CACT4Y+ZvidVY5R4XqqW=b_j1Lbe2DnoKM2bPLgB4mS-CW10g1w@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <d829f5a8-95ba-1a17-c36a-21e23d382875@i-love.sakura.ne.jp>
Date:   Fri, 23 Apr 2021 01:13:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZvidVY5R4XqqW=b_j1Lbe2DnoKM2bPLgB4mS-CW10g1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021/04/22 23:20, Dmitry Vyukov wrote:
> I've prepared this syzkaller change:
> https://github.com/google/syzkaller/pull/2550/files

OK. Please merge and let's see whether syzkaller can find different ways.

In my environment, this problem behaves very puzzling. While the reproducer
I use is single threaded, changing timing via CONFIG_DEBUG_KOBJECT=y or
even https://syzkaller.appspot.com/x/patch.diff?x=13d69ffed00000 avoids
this problem. I can't narrow down what is happening.

> 
> Re hibernation/suspend configs, you said disabling them is not
> helping, right? Does it still make sense to disable them?
> If these configs are enabled, we can at least find some bugs in the
> preparation for suspend code. However, as you noted, it will
> immediately lead to "lost connection".
> Ideally we somehow tweak hibernation/suspend to get to the
> hibernation/suspend point and then immediately and automatically
> resume.

That will be one of disable-specific-functionality changes.

>         This way we could test both suspend and unsuspend code, which
> I assume can lead to bugs, and don't cause "lost connection" at the
> same time. I guess such a mode does not exist today... and I am not
> sure what happens with TCP connections after this.

I don't know whether ssh sessions can survive 10 seconds of
hibernation/suspend. But maybe disabling hibernation/suspend configs
until disable-specific-functionality changes are accepted makes sense.
