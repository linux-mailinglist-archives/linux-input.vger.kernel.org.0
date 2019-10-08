Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBEAD0215
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 22:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730576AbfJHU0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 16:26:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58584 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbfJHU0B (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 8 Oct 2019 16:26:01 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 62E3D69066
        for <linux-input@vger.kernel.org>; Tue,  8 Oct 2019 20:26:00 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id s3so11966839edr.15
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 13:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6vT1nQy6baeyjaLifLV0yhPzXEaySDZtE1QSxDrBneg=;
        b=Nadw+EdeCmKuFEGgMNEOUIj6P5/Yed8WKYLpSomkLa39zseNeii+oOzIS5IU0LjLAP
         1R2t+lQx7W2zHGrOQranA7HctVbr5/fKFl17mY+3wdzpkqFTqEhcVR+a3aVsKepN5idw
         M7TfCJvKoWtGuE989wqMerUsX/pFgke837qKs7BeOMXwh847i4CiQaCQg9L1aGrDoOWq
         OEFTwHxcb1+ve1wN9Z4SWbl8djbAcPHblnPE3GbWrNuVhdb4biJ373mRYkstQaCHRPxq
         Xjiz/KOWnYRorphOqRHVOwtixecUS7Hf+NyxVvg5aoifv0IP/oKy1Ju1SRYa7E2daeR/
         7ySA==
X-Gm-Message-State: APjAAAV3u9gR24ftWhzVsoK7qlSyCrYV1da7ZlzIxYCf1YJIzwX91oN1
        QBlyp21SflKJBhYs8GSrCGHdDwQHBfR8eI48mUleHu9h1qOyMnC8/4EWZmhKt690ur7Bukkavqf
        gDYpEFOt8hOkKYUMu7O0CHcM=
X-Received: by 2002:a05:6402:1a4c:: with SMTP id bf12mr36184869edb.277.1570566359063;
        Tue, 08 Oct 2019 13:25:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylCRWlWdb2VGHNAEs+TSOc/3kfnHEYstdSy5WG3CuBru+/Zi4s37ocFW10hX1Hs/9ByC4MHQ==
X-Received: by 2002:a05:6402:1a4c:: with SMTP id bf12mr36184852edb.277.1570566358814;
        Tue, 08 Oct 2019 13:25:58 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id f6sm3526edr.12.2019.10.08.13.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 13:25:57 -0700 (PDT)
Subject: Re: [PATCH] HID: i2c-hid: Remove runtime power management
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     vicamo.yang@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191008153829.24766-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d096582b-c96b-69a2-bcc5-cba2984705e7@redhat.com>
Date:   Tue, 8 Oct 2019 22:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191008153829.24766-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 08-10-2019 17:38, Kai-Heng Feng wrote:
> Runtime power management in i2c-hid brings lots of issues, such as:
> - When transitioning from display manager to desktop session, i2c-hid
> was closed and opened, so the device was set to SLEEP and ON in a short
> period. Vendors confirmed that their devices can't handle fast ON/SLEEP
> command because Windows doesn't have this behavior.
> 
> - When rebooting, i2c-hid was closed, and the driver core put the device
> back to full power before shutdown. This behavior also triggers a quick
> SLEEP and ON commands that some devices can't handle, renders an
> unusable touchpad after reboot.
> 
> - Runtime power management is only useful when i2c-hid isn't opened,
> i.e. a laptop without desktop session, which isn't that common.
> 
> - Most importantly, my power meter reports little to none energy saving
> when i2c-hid is runtime suspended.
> 
> So let's remove runtime power management since there is no actual
> benefit.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Given all the problems we've been seeing related to runtime pm I agree
that this is probably the best approach:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/hid/i2c-hid/i2c-hid-core.c | 111 ++---------------------------
>   1 file changed, 4 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2a7c6e33bb1c..5ab4982b3a7b 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -26,7 +26,6 @@
>   #include <linux/delay.h>
>   #include <linux/slab.h>
>   #include <linux/pm.h>
> -#include <linux/pm_runtime.h>
>   #include <linux/device.h>
>   #include <linux/wait.h>
>   #include <linux/err.h>
> @@ -48,8 +47,6 @@
>   /* quirks to control the device */
>   #define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV	BIT(0)
>   #define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(1)
> -#define I2C_HID_QUIRK_NO_RUNTIME_PM		BIT(2)
> -#define I2C_HID_QUIRK_DELAY_AFTER_SLEEP		BIT(3)
>   #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
>   
>   /* flags */
> @@ -172,14 +169,7 @@ static const struct i2c_hid_quirks {
>   	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
>   		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
>   	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
> -		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET |
> -		I2C_HID_QUIRK_NO_RUNTIME_PM },
> -	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_4B33,
> -		I2C_HID_QUIRK_DELAY_AFTER_SLEEP },
> -	{ USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_8001,
> -		I2C_HID_QUIRK_NO_RUNTIME_PM },
> -	{ I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_01F0,
> -		I2C_HID_QUIRK_NO_RUNTIME_PM },
> +		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
>   	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
>   		 I2C_HID_QUIRK_BOGUS_IRQ },
>   	{ 0, 0 }
> @@ -397,7 +387,6 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>   {
>   	struct i2c_hid *ihid = i2c_get_clientdata(client);
>   	int ret;
> -	unsigned long now, delay;
>   
>   	i2c_hid_dbg(ihid, "%s\n", __func__);
>   
> @@ -415,22 +404,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>   			goto set_pwr_exit;
>   	}
>   
> -	if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> -	    power_state == I2C_HID_PWR_ON) {
> -		now = jiffies;
> -		if (time_after(ihid->sleep_delay, now)) {
> -			delay = jiffies_to_usecs(ihid->sleep_delay - now);
> -			usleep_range(delay, delay + 1);
> -		}
> -	}
> -
>   	ret = __i2c_hid_command(client, &hid_set_power_cmd, power_state,
>   		0, NULL, 0, NULL, 0);
>   
> -	if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> -	    power_state == I2C_HID_PWR_SLEEP)
> -		ihid->sleep_delay = jiffies + msecs_to_jiffies(20);
> -
>   	if (ret)
>   		dev_err(&client->dev, "failed to change power setting.\n");
>   
> @@ -791,11 +767,6 @@ static int i2c_hid_open(struct hid_device *hid)
>   {
>   	struct i2c_client *client = hid->driver_data;
>   	struct i2c_hid *ihid = i2c_get_clientdata(client);
> -	int ret = 0;
> -
> -	ret = pm_runtime_get_sync(&client->dev);
> -	if (ret < 0)
> -		return ret;
>   
>   	set_bit(I2C_HID_STARTED, &ihid->flags);
>   	return 0;
> @@ -807,27 +778,6 @@ static void i2c_hid_close(struct hid_device *hid)
>   	struct i2c_hid *ihid = i2c_get_clientdata(client);
>   
>   	clear_bit(I2C_HID_STARTED, &ihid->flags);
> -
> -	/* Save some power */
> -	pm_runtime_put(&client->dev);
> -}
> -
> -static int i2c_hid_power(struct hid_device *hid, int lvl)
> -{
> -	struct i2c_client *client = hid->driver_data;
> -	struct i2c_hid *ihid = i2c_get_clientdata(client);
> -
> -	i2c_hid_dbg(ihid, "%s lvl:%d\n", __func__, lvl);
> -
> -	switch (lvl) {
> -	case PM_HINT_FULLON:
> -		pm_runtime_get_sync(&client->dev);
> -		break;
> -	case PM_HINT_NORMAL:
> -		pm_runtime_put(&client->dev);
> -		break;
> -	}
> -	return 0;
>   }
>   
>   struct hid_ll_driver i2c_hid_ll_driver = {
> @@ -836,7 +786,6 @@ struct hid_ll_driver i2c_hid_ll_driver = {
>   	.stop = i2c_hid_stop,
>   	.open = i2c_hid_open,
>   	.close = i2c_hid_close,
> -	.power = i2c_hid_power,
>   	.output_report = i2c_hid_output_report,
>   	.raw_request = i2c_hid_raw_request,
>   };
> @@ -1104,9 +1053,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>   
>   	i2c_hid_acpi_fix_up_power(&client->dev);
>   
> -	pm_runtime_get_noresume(&client->dev);
> -	pm_runtime_set_active(&client->dev);
> -	pm_runtime_enable(&client->dev);
>   	device_enable_async_suspend(&client->dev);
>   
>   	/* Make sure there is something at this address */
> @@ -1154,9 +1100,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>   		goto err_mem_free;
>   	}
>   
> -	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -		pm_runtime_put(&client->dev);
> -
>   	return 0;
>   
>   err_mem_free:
> @@ -1166,9 +1109,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>   	free_irq(client->irq, ihid);
>   
>   err_pm:
> -	pm_runtime_put_noidle(&client->dev);
> -	pm_runtime_disable(&client->dev);
> -
>   err_regulator:
>   	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
>   			       ihid->pdata.supplies);
> @@ -1181,12 +1121,6 @@ static int i2c_hid_remove(struct i2c_client *client)
>   	struct i2c_hid *ihid = i2c_get_clientdata(client);
>   	struct hid_device *hid;
>   
> -	if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -		pm_runtime_get_sync(&client->dev);
> -	pm_runtime_disable(&client->dev);
> -	pm_runtime_set_suspended(&client->dev);
> -	pm_runtime_put_noidle(&client->dev);
> -
>   	hid = ihid->hid;
>   	hid_destroy_device(hid);
>   
> @@ -1219,25 +1153,15 @@ static int i2c_hid_suspend(struct device *dev)
>   	int wake_status;
>   
>   	if (hid->driver && hid->driver->suspend) {
> -		/*
> -		 * Wake up the device so that IO issues in
> -		 * HID driver's suspend code can succeed.
> -		 */
> -		ret = pm_runtime_resume(dev);
> -		if (ret < 0)
> -			return ret;
> -
>   		ret = hid->driver->suspend(hid, PMSG_SUSPEND);
>   		if (ret < 0)
>   			return ret;
>   	}
>   
> -	if (!pm_runtime_suspended(dev)) {
> -		/* Save some power */
> -		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> +	/* Save some power */
> +	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>   
> -		disable_irq(client->irq);
> -	}
> +	disable_irq(client->irq);
>   
>   	if (device_may_wakeup(&client->dev)) {
>   		wake_status = enable_irq_wake(client->irq);
> @@ -1279,11 +1203,6 @@ static int i2c_hid_resume(struct device *dev)
>   				wake_status);
>   	}
>   
> -	/* We'll resume to full power */
> -	pm_runtime_disable(dev);
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -
>   	enable_irq(client->irq);
>   
>   	/* Instead of resetting device, simply powers the device on. This
> @@ -1304,30 +1223,8 @@ static int i2c_hid_resume(struct device *dev)
>   }
>   #endif
>   
> -#ifdef CONFIG_PM
> -static int i2c_hid_runtime_suspend(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -
> -	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> -	disable_irq(client->irq);
> -	return 0;
> -}
> -
> -static int i2c_hid_runtime_resume(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -
> -	enable_irq(client->irq);
> -	i2c_hid_set_power(client, I2C_HID_PWR_ON);
> -	return 0;
> -}
> -#endif
> -
>   static const struct dev_pm_ops i2c_hid_pm = {
>   	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
> -	SET_RUNTIME_PM_OPS(i2c_hid_runtime_suspend, i2c_hid_runtime_resume,
> -			   NULL)
>   };
>   
>   static const struct i2c_device_id i2c_hid_id_table[] = {
> 
