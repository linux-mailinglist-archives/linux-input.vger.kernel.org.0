Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0019EB985
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 23:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJaWFq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 18:05:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfJaWFp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 18:05:45 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D92D04E8AC
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2019 22:05:44 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id e14so4282052wrm.21
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2019 15:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j8MrH1E4ZU9h1kC1ASsJuVdsKJRVan134MxgnbuuaIE=;
        b=aBYR2mf5xaUg+vhM3BnVPGfRT1uADkY2zkQAljzSHdDTo8mq8BeuICO3GV2BvonQO2
         WaGixlgVqUtcq0nyl0zYPdPqXCZBbiZ6bPiDmrVeHW+mOqDcO95TACBtqrKM66JSbTpc
         SBRHAky+cQVuYiXHxN2ADJymL8YpYo8EtpO5WH9Uc5dJzZ4ETWKlIBBSKnGj0rF3a8kv
         yYEzzaw8QmBvkq5TJdnDlZ1F5joP0JgpGWDOzw9k+VEXmSlySuFSE2fMqVZ6IchcadQP
         cq9oGBt+MSobMHD1UwZw8STVzNvhU4quJurhDgHOAWwNWTtt4RyEllDMSNgzK6+EQhcc
         Xfgg==
X-Gm-Message-State: APjAAAUg0MV5KQvLKxiJWBasL2ilPzggsaR12oj+w7tW1CQPZnLEXzht
        L4UzRf/om0Udo2TP23VrRebsQ0fxGYvKl5hYWaEGi5Sj1l6OOVNeWoqkXkh5t2DZPVYPqZsJb+l
        ppcv1uNN1FlxcWU1YpT4iHR8=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr7550213wmb.127.1572559543167;
        Thu, 31 Oct 2019 15:05:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3uQJXuIDQytscbulkowWnJ70d3xu/2WUv+WUCbyOojQHL/oP2G59gQBlou6+Qu1IVr/1Exw==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr7550190wmb.127.1572559542906;
        Thu, 31 Oct 2019 15:05:42 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id l4sm7506581wrf.46.2019.10.31.15.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2019 15:05:41 -0700 (PDT)
Subject: Re: [PATCH] HID: i2c-hid: Send power-on command after reset
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20191020214718.150906-1-hdegoede@redhat.com>
 <097221D1-9115-41C6-8208-6A69FA0EA0CA@canonical.com>
 <8918d314-5539-fefb-8e4a-84ba554eec4a@redhat.com>
 <67ABE7E6-C9CF-4A37-96E9-C9D76ECC9DE1@canonical.com>
 <FE23608B-596F-4494-B62D-2516B150DEF9@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f56e8a16-0099-55e1-bd67-cff4ab8afc90@redhat.com>
Date:   Thu, 31 Oct 2019 23:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <FE23608B-596F-4494-B62D-2516B150DEF9@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 31-10-2019 07:23, Kai-Heng Feng wrote:
> Hi Hans,
> 
>> On Oct 31, 2019, at 01:39, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>
>> Hi Hans,
>>
>>> On Oct 30, 2019, at 23:11, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 21-10-2019 09:17, Kai Heng Feng wrote:
>>>> Hi Hans,
>>>>> On Oct 21, 2019, at 5:47 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
>>>>> management"), any i2c-hid touchscreens would typically be runtime-suspended
>>>>> between the driver loading and Xorg or a Wayland compositor opening it,
>>>>> causing it to be resumed again. This means that before this change,
>>>>> we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
>>>>> graphical session would start listening to the touchscreen.
>>>>>
>>>>> It turns out that at least some SIS touchscreens, such as the one found
>>>>> on the Asus T100HA, need a power-on command after reset, otherwise they
>>>>> will not send any events.
>>>> As You-Sheng pointed out before, device may need a 60ms delay between ON and RESET command.
>>>> Does adding the delay help?
>>>
>>> I just tried increasing the existing usleep between ON and RESET to:
>>>
>>>        usleep_range(60000, 70000);
>>>
>>> And this does not help. Note that before we had quirks for devices with a SIS
>>> screen needed, where we avoided the reset on resume and instead did just an
>>> i2c_hid_set_power(client, I2C_HID_PWR_ON) for these.
>>>
>>> Which likely was to work around the same problem, these devices simply need a
>>> i2c_hid_set_power(client, I2C_HID_PWR_ON) after rest to function.
>>>
>>> Assuming other devices do come up in the "ON" state after reset then this
>>> will be a no-op for them and this should thus not impact their operation.
>>>
>>> Also I just noticed that 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
>>> has been added to 5.4-rc# as a fix, so we really need to get this in place
>>> to to not avoid regressing devices with a SIS touchscreen actually quite a
>>> few devices including some quite popular ones uses a SIS touchscreen, here
>>> is the list of devices I know about:
>>
>> I agree we should use this workaround since increasing delay doesn't work.
> 
> I just checked the spec again, seems like ON before RESET in probe is unnecessary.
> Does removing the ON command in probe help?

I just tried, removing the ON command done before the RESET does not help.

Regards,

Hans

>>>>> Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
>>>>> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++++
>>>>> 1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> index d9c55e30f986..04c088131e04 100644
>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> @@ -447,8 +447,12 @@ static int i2c_hid_hwreset(struct i2c_client *client)
>>>>> 	if (ret) {
>>>>> 		dev_err(&client->dev, "failed to reset device.\n");
>>>>> 		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>>>>> +		goto out_unlock;
>>>>> 	}
>>>>>
>>>>> +	/* At least some SIS devices need this after reset */
>>>>> +	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
>>>>> +
>>>>> out_unlock:
>>>>> 	mutex_unlock(&ihid->reset_lock);
>>>>> 	return ret;
>>>>> -- 
>>>>> 2.23.0
> 
