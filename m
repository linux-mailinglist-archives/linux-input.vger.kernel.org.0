Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F893E9E88
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 16:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfJ3PLq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 11:11:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40140 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbfJ3PLp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 11:11:45 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BA1EC8535D
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 15:11:44 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id e14so1485229wrm.21
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 08:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NZLRPmD7MljcC9H8HIiblrqtefNAEa7Re4gixDYWf0s=;
        b=Ja61sB2jcNc8oA5YMwHyddvQCTg7aWQRwd+qSlNHFZ5lnl3jr3Xaw3E+MduzoWz91G
         zkd1s1+5DXy7PRkrHkpKImk+Pz7VmerWb1gUsESpSznMVDI77P0NdoMC39F+nwFrFopP
         yFQcyOqeAfrWEHzYutMTcB4qSLYfn4jyt9DzEqOuM+7aTrwqniL6gPNY167JDmm1nU+B
         WjiPM42WHlGTu1gWOyGhIG9SD/xcbFbxX2M5TDOdi3PzGyO3PW6qXfdJDR6EeMrgIDFk
         LMurIyC6ESrT+JHifM3MerzBljri5QXeB7SzIBCPXZ3fCEFWk8Pi84k84QYp3xxpvkpA
         do7g==
X-Gm-Message-State: APjAAAXavX24PXUzM72HAWEnKEXwc+2V7heYnrx9RfKj/EIP3AZPyVZ+
        HAtfY0P0wMzgmZlafgsQ4Vyq3/3WIXN66JDn7UtqnkAgzLEhDVT28bTnKyU/YAWiuWcnC+XcMxs
        xwEU6ui4GORdiyyIn+769Cuk=
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr9528254wmh.76.1572448303196;
        Wed, 30 Oct 2019 08:11:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwETwxejN74LYIxLl4YGhoHZsBuVIwyPnxlnuBYhafMyufA+/IoeVirYJt8z1cnplgd714m9Q==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr9528236wmh.76.1572448302985;
        Wed, 30 Oct 2019 08:11:42 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id d202sm239429wmd.47.2019.10.30.08.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:11:42 -0700 (PDT)
Subject: Re: [PATCH] HID: i2c-hid: Send power-on command after reset
To:     Kai Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20191020214718.150906-1-hdegoede@redhat.com>
 <097221D1-9115-41C6-8208-6A69FA0EA0CA@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8918d314-5539-fefb-8e4a-84ba554eec4a@redhat.com>
Date:   Wed, 30 Oct 2019 16:11:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <097221D1-9115-41C6-8208-6A69FA0EA0CA@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 21-10-2019 09:17, Kai Heng Feng wrote:
> Hi Hans,
> 
>> On Oct 21, 2019, at 5:47 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
>> management"), any i2c-hid touchscreens would typically be runtime-suspended
>> between the driver loading and Xorg or a Wayland compositor opening it,
>> causing it to be resumed again. This means that before this change,
>> we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
>> graphical session would start listening to the touchscreen.
>>
>> It turns out that at least some SIS touchscreens, such as the one found
>> on the Asus T100HA, need a power-on command after reset, otherwise they
>> will not send any events.
> 
> As You-Sheng pointed out before, device may need a 60ms delay between ON and RESET command.
> Does adding the delay help?

I just tried increasing the existing usleep between ON and RESET to:

         usleep_range(60000, 70000);

And this does not help. Note that before we had quirks for devices with a SIS
screen needed, where we avoided the reset on resume and instead did just an
i2c_hid_set_power(client, I2C_HID_PWR_ON) for these.

Which likely was to work around the same problem, these devices simply need a
i2c_hid_set_power(client, I2C_HID_PWR_ON) after rest to function.

Assuming other devices do come up in the "ON" state after reset then this
will be a no-op for them and this should thus not impact their operation.

Also I just noticed that 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
has been added to 5.4-rc# as a fix, so we really need to get this in place
to to not avoid regressing devices with a SIS touchscreen actually quite a
few devices including some quite popular ones uses a SIS touchscreen, here
is the list of devices I know about:

Asus T100HA
Asus T200TA
Peaq 10.1" C1010 2-in-1
Toshiba Click Mini L9W-B

Regards,

Hans



>> Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
>> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index d9c55e30f986..04c088131e04 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -447,8 +447,12 @@ static int i2c_hid_hwreset(struct i2c_client *client)
>> 	if (ret) {
>> 		dev_err(&client->dev, "failed to reset device.\n");
>> 		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>> +		goto out_unlock;
>> 	}
>>
>> +	/* At least some SIS devices need this after reset */
>> +	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
>> +
>> out_unlock:
>> 	mutex_unlock(&ihid->reset_lock);
>> 	return ret;
>> -- 
>> 2.23.0
>>
> 
