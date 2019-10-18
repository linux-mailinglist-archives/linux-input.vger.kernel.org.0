Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C51E2DD131
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 23:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440490AbfJRV3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 17:29:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40276 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390812AbfJRV3C (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 17:29:02 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 31B87882F5
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 21:29:02 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v7so1353222wrf.4
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 14:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DAEt5og3w/x3538i25IRPJZ73lMCZsPZ9AJL7F+YPYw=;
        b=gwHFmkRuLoc+t/g6D+c1DazxvL2RYW2YRg7E/zExEuSuwpdr1+5xJPAnvce4CWC1Ui
         g7CQtDJgwTLAj6KnMIyNf7TCzJihCA+r1jjyR6oxCoW2eEN3DfJTWPhmX5pCs73WOqhw
         qIMCGZY30fTwwN3QzN4fy5blkdgtn9fkaJbsnG/pyHyh/8+KQuEFp+r25BYnuovqWxmR
         2e3pUa+hU+0hrQ9HxzxkXScn0Qpg1paPeZt5L8o22uy5vMH1JhiEBvMqTlPpmsueFKXr
         weUgwcGIJNxhl2hh7uiBT9cSHhRaaccCebXCrnXbCqJNDjPNJQfOnGtTLiO/USlDSWZl
         7cEQ==
X-Gm-Message-State: APjAAAX5vkLK0GR+PhjlAxTTUBVSy3vzzKc88bGztNotLk6ujYPcAnqS
        3cH1AL7PAgo5DsMwxurd65NfY3jTyjVjemTF2y4uTaf6c5tBEhFiYNTzC0LjR3Pjs+NqhCSA8Ya
        MZp2/4z/uQetc4O3aNoKEVJw=
X-Received: by 2002:a05:600c:2319:: with SMTP id 25mr4944137wmo.3.1571434140792;
        Fri, 18 Oct 2019 14:29:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxg+y9O8NQx2z3pd+vnryj/CBQ2UV+Uor26HtnW8vJvIDyxu427UdU8tXOOrCmmLYchezNidA==
X-Received: by 2002:a05:600c:2319:: with SMTP id 25mr4944104wmo.3.1571434140420;
        Fri, 18 Oct 2019 14:29:00 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id e9sm16039069wme.3.2019.10.18.14.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 14:28:59 -0700 (PDT)
Subject: Re: [PATCH v2] HID: i2c-hid: Remove runtime power management
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     vicamo.yang@canonical.com, mika.westerberg@linux.intel.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191016151224.1316-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0814b328-bc3e-6836-4c78-0bcd9252e916@redhat.com>
Date:   Fri, 18 Oct 2019 23:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016151224.1316-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 16-10-2019 17:12, Kai-Heng Feng wrote:
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
> - Most importantly, my power meter reports little to none energy saving
> when i2c-hid is runtime suspended.
> 
> So let's remove runtime power management since there is no actual
> benefit.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

I was just debugging an issue with an i2c accelerometer which did not
work. It turns out that it is using the same gpio for its enable pin
as the i2c-hid touchscreen; and that gpio is only set by the touchscreen's
_PS0 and _PS3 method.

So I thought that this patch might help and it does, disabling runtime pm
for i2c-hid as a side-effect fixes the accelerometer not working on this device.

Before disabling runtime-pm I believe the following would happen:

1) initrd loads i2c-hid
2) i2c-hid runtime suspends, disabling the shared enable GPIO
3) post switch-root accel driver loads, fails to communicate with -EREMOTEIO
4) gdm starts runtime resuming i2c-hid, but too late

With runtime pm disabled instead this happens:

1) initrd loads i2c-hid, which enables the shared enable GPIO
2) post switch-root accel driver loads, communicates successfully, success.

Note for this to work i2c-hid must load before the accel driver,
we are lucky that i2c-hid is in the initrd here, guaranteeing the
load order we want.

This is not really relevant to this whole discussion but IMHO this
does show that Windows likely also does not runtime-suspend things.

Regards,

Hans













> ---
> v2:
> - Remove unused label and wording change.
> 
>   drivers/hid/i2c-hid/i2c-hid-core.c | 118 ++---------------------------
>   1 file changed, 7 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2a7c6e33bb1c..d9c55e30f986 100644
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
> @@ -1114,16 +1060,16 @@ static int i2c_hid_probe(struct i2c_client *client,
>   	if (ret < 0) {
>   		dev_dbg(&client->dev, "nothing at this address: %d\n", ret);
>   		ret = -ENXIO;
> -		goto err_pm;
> +		goto err_regulator;
>   	}
>   
>   	ret = i2c_hid_fetch_hid_descriptor(ihid);
>   	if (ret < 0)
> -		goto err_pm;
> +		goto err_regulator;
>   
>   	ret = i2c_hid_init_irq(client);
>   	if (ret < 0)
> -		goto err_pm;
> +		goto err_regulator;
>   
>   	hid = hid_allocate_device();
>   	if (IS_ERR(hid)) {
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
> @@ -1165,10 +1108,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>   err_irq:
>   	free_irq(client->irq, ihid);
>   
> -err_pm:
> -	pm_runtime_put_noidle(&client->dev);
> -	pm_runtime_disable(&client->dev);
> -
>   err_regulator:
>   	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
>   			       ihid->pdata.supplies);
> @@ -1181,12 +1120,6 @@ static int i2c_hid_remove(struct i2c_client *client)
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
> @@ -1219,25 +1152,15 @@ static int i2c_hid_suspend(struct device *dev)
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
> @@ -1279,11 +1202,6 @@ static int i2c_hid_resume(struct device *dev)
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
> @@ -1304,30 +1222,8 @@ static int i2c_hid_resume(struct device *dev)
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
