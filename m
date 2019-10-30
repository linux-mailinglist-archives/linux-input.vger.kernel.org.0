Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EA6EA2B0
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 18:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfJ3RkE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 30 Oct 2019 13:40:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54870 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfJ3RkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 13:40:04 -0400
Received: from mail-pf1-f199.google.com ([209.85.210.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iPrww-0000LM-5z
        for linux-input@vger.kernel.org; Wed, 30 Oct 2019 17:40:02 +0000
Received: by mail-pf1-f199.google.com with SMTP id i187so2243290pfc.10
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 10:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kl/xR+DiddojNrGwV2LURLGkGcAJLRZ0EJrpDlHjvYs=;
        b=jToxvdDxio+k4qMErDXcPsYYeVCSx/lrPdrQ0wZ1WBpCYZz+N0w8YO7XrawhV6YJiH
         TKHE3saSeNyeqwqR5kkTvGeRX/v9uEY/3I/JP+p7gPMjP5Awmmp7//iy+4ts1va5xUTz
         PkKgGYopq+Lp1Y4l2D6aAYwj6xgcs4cJyVBCDoRehkoz7IvFn/Sd9wfgJLWDkG/DQapu
         fn1V5nf9ngzkgnOIhfuWWOuGMtFyJWUbHtEQhVk1EC5hIVcjbhEY6IYmJ828g0nBGNQZ
         /LtBNEj+nXUygaN5u+TdumMGYY4Bmq/c8LnRKfy/uhXFmwoQX/Fu5hFi9gVyIdnCW6Hu
         4Mig==
X-Gm-Message-State: APjAAAXBI/U9DaxyUZW5u3hU9/ZuSoDTRVdUAzciTLAHkU+RefjaJqFG
        x82oMIReNh/4qEBkJdwmKviCtXdHOVfA7HUPfWS5KGZ0D/BuhABpLqOdCcNZjGUK7o+3jYnef42
        BpuStSlwo6FWqZddkXqFlLbGn1yu7OPMO//M8kyTM
X-Received: by 2002:a17:902:9a01:: with SMTP id v1mr1332313plp.132.1572457200783;
        Wed, 30 Oct 2019 10:40:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjL9GZrBmcVazFISIPw47yowyNJvhntydr0rcJ/L8d6yZm8tGmUQATgQ8if2SRJb+DDn1yTw==
X-Received: by 2002:a17:902:9a01:: with SMTP id v1mr1332271plp.132.1572457200207;
        Wed, 30 Oct 2019 10:40:00 -0700 (PDT)
Received: from 2001-b011-380f-3c42-9cc2-25d4-b659-d92e.dynamic-ip6.hinet.net (2001-b011-380f-3c42-9cc2-25d4-b659-d92e.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:9cc2:25d4:b659:d92e])
        by smtp.gmail.com with ESMTPSA id y24sm605276pfr.116.2019.10.30.10.39.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 10:39:59 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
Subject: Re: [PATCH] HID: i2c-hid: Send power-on command after reset
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <8918d314-5539-fefb-8e4a-84ba554eec4a@redhat.com>
Date:   Thu, 31 Oct 2019 01:39:56 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <67ABE7E6-C9CF-4A37-96E9-C9D76ECC9DE1@canonical.com>
References: <20191020214718.150906-1-hdegoede@redhat.com>
 <097221D1-9115-41C6-8208-6A69FA0EA0CA@canonical.com>
 <8918d314-5539-fefb-8e4a-84ba554eec4a@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3601)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

> On Oct 30, 2019, at 23:11, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Hi,
> 
> On 21-10-2019 09:17, Kai Heng Feng wrote:
>> Hi Hans,
>>> On Oct 21, 2019, at 5:47 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>> 
>>> Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
>>> management"), any i2c-hid touchscreens would typically be runtime-suspended
>>> between the driver loading and Xorg or a Wayland compositor opening it,
>>> causing it to be resumed again. This means that before this change,
>>> we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
>>> graphical session would start listening to the touchscreen.
>>> 
>>> It turns out that at least some SIS touchscreens, such as the one found
>>> on the Asus T100HA, need a power-on command after reset, otherwise they
>>> will not send any events.
>> As You-Sheng pointed out before, device may need a 60ms delay between ON and RESET command.
>> Does adding the delay help?
> 
> I just tried increasing the existing usleep between ON and RESET to:
> 
>        usleep_range(60000, 70000);
> 
> And this does not help. Note that before we had quirks for devices with a SIS
> screen needed, where we avoided the reset on resume and instead did just an
> i2c_hid_set_power(client, I2C_HID_PWR_ON) for these.
> 
> Which likely was to work around the same problem, these devices simply need a
> i2c_hid_set_power(client, I2C_HID_PWR_ON) after rest to function.
> 
> Assuming other devices do come up in the "ON" state after reset then this
> will be a no-op for them and this should thus not impact their operation.
> 
> Also I just noticed that 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
> has been added to 5.4-rc# as a fix, so we really need to get this in place
> to to not avoid regressing devices with a SIS touchscreen actually quite a
> few devices including some quite popular ones uses a SIS touchscreen, here
> is the list of devices I know about:

I agree we should use this workaround since increasing delay doesn't work.

Kai-Heng

> 
> Asus T100HA
> Asus T200TA
> Peaq 10.1" C1010 2-in-1
> Toshiba Click Mini L9W-B
> 
> Regards,
> 
> Hans
> 
> 
> 
>>> Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
>>> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>> 
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> index d9c55e30f986..04c088131e04 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> @@ -447,8 +447,12 @@ static int i2c_hid_hwreset(struct i2c_client *client)
>>> 	if (ret) {
>>> 		dev_err(&client->dev, "failed to reset device.\n");
>>> 		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>>> +		goto out_unlock;
>>> 	}
>>> 
>>> +	/* At least some SIS devices need this after reset */
>>> +	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
>>> +
>>> out_unlock:
>>> 	mutex_unlock(&ihid->reset_lock);
>>> 	return ret;
>>> -- 
>>> 2.23.0

