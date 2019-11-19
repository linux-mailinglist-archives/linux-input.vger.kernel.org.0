Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE58310256B
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 14:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfKSNaA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Nov 2019 08:30:00 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37504 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKSNaA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Nov 2019 08:30:00 -0500
Received: by mail-pl1-f196.google.com with SMTP id bb5so11771012plb.4;
        Tue, 19 Nov 2019 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sRIw6rp9Mc/Zdv75hs9vE0HKh/1jxjYXzfWj5KShO4o=;
        b=MrhrrF8VKUR53os//rbTAXNlYR381za1H7vFBS2zlR43gNP9tiyijNaDdSFPm1ylZG
         7BpsZiu0xUbFqrsK+ucimbYqFbLMaa12nDUf4kHzSThkSH6y+PteD6qYuW+oYdiiwSpg
         bN07C1TVSW7/jx1bNm+Bi0XpYBY64QsJbMqykRhmaczEolhgAG7qci5fr/cFvTUThXVt
         3iWjfxVJwDOZLxmacN1ZywbivHp1acfzctqa/aocOPR/NgBsqCLxWmSFXIh1OHnx91z4
         DGpouLhOKrqJtFvGo56iGd5qkMokxcqRHj0TAZqHP58nPcJZJ7Xd0F71eOTtQ3HRZbpi
         56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sRIw6rp9Mc/Zdv75hs9vE0HKh/1jxjYXzfWj5KShO4o=;
        b=Oi3cD9QeyHYAukP8wY/oPriNlVBfZc5NU1mH2+w8uwcSWVk6kMWMvJ1gvjx8ysmny2
         Y5byh3UdogZwG1+71pKdkLNtkY4OPmNp+NUHF4jp1bqzgadHueTD44KBXZJgctROhCZ9
         uFdCJYqKmC1bQQJQKwBX4Q8v8Ollj565+Ef7HAhqD1C8GcUUSp+5HAqKL2LF/6OLSxvg
         9yhPp35EYQwgApMh12NMkx4k/4VErAI0JZVKplFavM2AoBSzA+2gMsKszGSAwnK5pYH3
         TxF88jx+VIAGc70vxJYW4DrxapZFU/xDinVN3LR5K73L1tVa0dbIQ2LoAYE1rhVVoBxe
         +8PA==
X-Gm-Message-State: APjAAAVmvA4ShEWnrGuCcXbV1AxIPlxPgKOmuXfvTHcXq6+cpzsrnMzI
        KF8aPQcvH+FEHuw2T4FMVz0=
X-Google-Smtp-Source: APXvYqwZOxMxDDzJWeLUQjB+1ez46gEs7a1oggH6mczLVLdIFC0C+jm5a6Ir578tmMYcqi/cLuuIXw==
X-Received: by 2002:a17:902:bd82:: with SMTP id q2mr35320894pls.106.1574170197473;
        Tue, 19 Nov 2019 05:29:57 -0800 (PST)
Received: from ?IPv6:2405:4800:58c7:fb0:3103:9cb5:5896:cd6e? ([2405:4800:58c7:fb0:3103:9cb5:5896:cd6e])
        by smtp.gmail.com with ESMTPSA id r15sm26254360pfh.81.2019.11.19.05.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 05:29:56 -0800 (PST)
Cc:     tranmanphong@gmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: hid-lg4ff: Fix uninit-value set_autocenter_default
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20191105141807.27054-1-tranmanphong@gmail.com>
 <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
From:   Phong Tran <tranmanphong@gmail.com>
Message-ID: <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
Date:   Tue, 19 Nov 2019 20:29:49 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/18/19 4:43 PM, Benjamin Tissoires wrote:
> On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrote:
>>
>> syzbot found a problem using of uinit pointer in
>> lg4ff_set_autocenter_default().
>>
>> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>>
>> Tested by syzbot:
>>
>> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ
> 
> This seems weird to me:
> 
> the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
> it, the possibility that hid might not have an initialized value.
> 

In the dashboard [1] shows
BUG: KMSAN: uninit-value in dev_get_drvdata include/linux/device.h:1388 
[inline]
BUG: KMSAN: uninit-value in hid_get_drvdata include/linux/hid.h:628 [inline]
BUG: KMSAN: uninit-value in lg4ff_set_autocenter_default+0x23a/0xa20 
drivers/hid/hid-lg4ff.c:477
base on that I did the initialization the pointer in the patch.

> Here you are changing the initialized values of value, entry and
> drv_data, all 3 are never used before their first assignment.
> 
> I have a feeling this particular syzbot check has already been fixed
> upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
> inputs".
> 

I think the commit d9d4b1 fixed this report [2] by syzbot.

[1] https://syzkaller.appspot.com/bug?extid=1234691fec1b8ceba8b1
[2] https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79

regards,
Phong.
> Cheers,
> Benjamin
> 
>>
>> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>> ---
>>   drivers/hid/hid-lg4ff.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
>> index 5e6a0cef2a06..44dfd08b0c32 100644
>> --- a/drivers/hid/hid-lg4ff.c
>> +++ b/drivers/hid/hid-lg4ff.c
>> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
>>   static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
>>   {
>>          struct hid_device *hid = input_get_drvdata(dev);
>> -       s32 *value;
>> +       s32 *value = NULL;
>>          u32 expand_a, expand_b;
>> -       struct lg4ff_device_entry *entry;
>> -       struct lg_drv_data *drv_data;
>> +       struct lg4ff_device_entry *entry = NULL;
>> +       struct lg_drv_data *drv_data = NULL;
>>          unsigned long flags;
>>
>>          drv_data = hid_get_drvdata(hid);
>> --
>> 2.20.1
>>
> 
