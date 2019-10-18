Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF74FDC7D6
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 16:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732002AbfJROxw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 10:53:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37402 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393887AbfJROxw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 10:53:52 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B390369EE1
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 14:53:51 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id c4so1183456qkg.22
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 07:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47ABkVsGom2aarBQQ+w5tE8GZdiYDVzYc399jGZ28iY=;
        b=gh/6JbLlowLz0BqDphxxcVfn/rP+l+Uz85anntaG2MAF+txMYIfbWf3MugDnOkpp4W
         g3CmQv9l6aJVTGDLsR38QCv5pKumA7ybfDYBf4kQd2GXWpsx7DboxGj0Dl+SfupJcGvQ
         OOwRlSOZIpH8fqv0AtBLMqCQ7hHfiUSW3Zu/svM5ud70AtZx5nQXq50coPngBTG77Pdx
         mmOHKkeJbyzsf70AxAxH2L6JucI2J0cRyGg5fzK0pe1T9f/B04vvF4NfGRKy3XhQ6Tyx
         siNOtT/UiEaHp4yNBsNg1l1bn0gBi3MnkQ1m7L9925L0+6xg+qolNt3rtH3CWgkW3nt+
         4+cA==
X-Gm-Message-State: APjAAAX9GIc+JrbFnub3TT2iTew4s78UmnvfcEd93zi53OWlKHFLdFh2
        nsgpAuhlS/ZjcuphxdBYhWW3NIm/ek2KRN2IYnda2Xh+KHwrSGsrijYyl5ddiv9EuGmhHa3iw85
        BfJ56n5uyQ3EZdrCIE4GgvbT6SzdzyaSifL3l17E=
X-Received: by 2002:a0c:abcc:: with SMTP id k12mr10298035qvb.101.1571410430871;
        Fri, 18 Oct 2019 07:53:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMoCBaLAdSrZL+Vfk5sNQJeuqHCjC0OuL63S752/GUeGFKNQZeHSTJfwHD8mXHFGMSOZh7KuH4AGBPotaYsR8=
X-Received: by 2002:a0c:abcc:: with SMTP id k12mr10298000qvb.101.1571410430465;
 Fri, 18 Oct 2019 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191016151224.1316-1-kai.heng.feng@canonical.com>
In-Reply-To: <20191016151224.1316-1-kai.heng.feng@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 18 Oct 2019 16:53:39 +0200
Message-ID: <CAO-hwJK2uOhSmCoTwCZ85Cn=v-uUGNFC=dsDwTNzjvuxA_Vd1w@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Remove runtime power management
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 16, 2019 at 5:12 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
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
> ---
> v2:
> - Remove unused label and wording change.

Thanks!

v2 now applied to for-5.4/upstream-fixes
(with Hans' acked-by from the v1 kept)

Cheers,
Benjamin

>
>  drivers/hid/i2c-hid/i2c-hid-core.c | 118 ++---------------------------
>  1 file changed, 7 insertions(+), 111 deletions(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2a7c6e33bb1c..d9c55e30f986 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -26,7 +26,6 @@
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/pm.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/device.h>
>  #include <linux/wait.h>
>  #include <linux/err.h>
> @@ -48,8 +47,6 @@
>  /* quirks to control the device */
>  #define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV       BIT(0)
>  #define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET       BIT(1)
> -#define I2C_HID_QUIRK_NO_RUNTIME_PM            BIT(2)
> -#define I2C_HID_QUIRK_DELAY_AFTER_SLEEP                BIT(3)
>  #define I2C_HID_QUIRK_BOGUS_IRQ                        BIT(4)
>
>  /* flags */
> @@ -172,14 +169,7 @@ static const struct i2c_hid_quirks {
>         { USB_VENDOR_ID_WEIDA, HID_ANY_ID,
>                 I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
>         { I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
> -               I2C_HID_QUIRK_NO_IRQ_AFTER_RESET |
> -               I2C_HID_QUIRK_NO_RUNTIME_PM },
> -       { I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_4B33,
> -               I2C_HID_QUIRK_DELAY_AFTER_SLEEP },
> -       { USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_8001,
> -               I2C_HID_QUIRK_NO_RUNTIME_PM },
> -       { I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_01F0,
> -               I2C_HID_QUIRK_NO_RUNTIME_PM },
> +               I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
>         { USB_VENDOR_ID_ELAN, HID_ANY_ID,
>                  I2C_HID_QUIRK_BOGUS_IRQ },
>         { 0, 0 }
> @@ -397,7 +387,6 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>  {
>         struct i2c_hid *ihid = i2c_get_clientdata(client);
>         int ret;
> -       unsigned long now, delay;
>
>         i2c_hid_dbg(ihid, "%s\n", __func__);
>
> @@ -415,22 +404,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>                         goto set_pwr_exit;
>         }
>
> -       if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> -           power_state == I2C_HID_PWR_ON) {
> -               now = jiffies;
> -               if (time_after(ihid->sleep_delay, now)) {
> -                       delay = jiffies_to_usecs(ihid->sleep_delay - now);
> -                       usleep_range(delay, delay + 1);
> -               }
> -       }
> -
>         ret = __i2c_hid_command(client, &hid_set_power_cmd, power_state,
>                 0, NULL, 0, NULL, 0);
>
> -       if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> -           power_state == I2C_HID_PWR_SLEEP)
> -               ihid->sleep_delay = jiffies + msecs_to_jiffies(20);
> -
>         if (ret)
>                 dev_err(&client->dev, "failed to change power setting.\n");
>
> @@ -791,11 +767,6 @@ static int i2c_hid_open(struct hid_device *hid)
>  {
>         struct i2c_client *client = hid->driver_data;
>         struct i2c_hid *ihid = i2c_get_clientdata(client);
> -       int ret = 0;
> -
> -       ret = pm_runtime_get_sync(&client->dev);
> -       if (ret < 0)
> -               return ret;
>
>         set_bit(I2C_HID_STARTED, &ihid->flags);
>         return 0;
> @@ -807,27 +778,6 @@ static void i2c_hid_close(struct hid_device *hid)
>         struct i2c_hid *ihid = i2c_get_clientdata(client);
>
>         clear_bit(I2C_HID_STARTED, &ihid->flags);
> -
> -       /* Save some power */
> -       pm_runtime_put(&client->dev);
> -}
> -
> -static int i2c_hid_power(struct hid_device *hid, int lvl)
> -{
> -       struct i2c_client *client = hid->driver_data;
> -       struct i2c_hid *ihid = i2c_get_clientdata(client);
> -
> -       i2c_hid_dbg(ihid, "%s lvl:%d\n", __func__, lvl);
> -
> -       switch (lvl) {
> -       case PM_HINT_FULLON:
> -               pm_runtime_get_sync(&client->dev);
> -               break;
> -       case PM_HINT_NORMAL:
> -               pm_runtime_put(&client->dev);
> -               break;
> -       }
> -       return 0;
>  }
>
>  struct hid_ll_driver i2c_hid_ll_driver = {
> @@ -836,7 +786,6 @@ struct hid_ll_driver i2c_hid_ll_driver = {
>         .stop = i2c_hid_stop,
>         .open = i2c_hid_open,
>         .close = i2c_hid_close,
> -       .power = i2c_hid_power,
>         .output_report = i2c_hid_output_report,
>         .raw_request = i2c_hid_raw_request,
>  };
> @@ -1104,9 +1053,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>
>         i2c_hid_acpi_fix_up_power(&client->dev);
>
> -       pm_runtime_get_noresume(&client->dev);
> -       pm_runtime_set_active(&client->dev);
> -       pm_runtime_enable(&client->dev);
>         device_enable_async_suspend(&client->dev);
>
>         /* Make sure there is something at this address */
> @@ -1114,16 +1060,16 @@ static int i2c_hid_probe(struct i2c_client *client,
>         if (ret < 0) {
>                 dev_dbg(&client->dev, "nothing at this address: %d\n", ret);
>                 ret = -ENXIO;
> -               goto err_pm;
> +               goto err_regulator;
>         }
>
>         ret = i2c_hid_fetch_hid_descriptor(ihid);
>         if (ret < 0)
> -               goto err_pm;
> +               goto err_regulator;
>
>         ret = i2c_hid_init_irq(client);
>         if (ret < 0)
> -               goto err_pm;
> +               goto err_regulator;
>
>         hid = hid_allocate_device();
>         if (IS_ERR(hid)) {
> @@ -1154,9 +1100,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>                 goto err_mem_free;
>         }
>
> -       if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -               pm_runtime_put(&client->dev);
> -
>         return 0;
>
>  err_mem_free:
> @@ -1165,10 +1108,6 @@ static int i2c_hid_probe(struct i2c_client *client,
>  err_irq:
>         free_irq(client->irq, ihid);
>
> -err_pm:
> -       pm_runtime_put_noidle(&client->dev);
> -       pm_runtime_disable(&client->dev);
> -
>  err_regulator:
>         regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
>                                ihid->pdata.supplies);
> @@ -1181,12 +1120,6 @@ static int i2c_hid_remove(struct i2c_client *client)
>         struct i2c_hid *ihid = i2c_get_clientdata(client);
>         struct hid_device *hid;
>
> -       if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> -               pm_runtime_get_sync(&client->dev);
> -       pm_runtime_disable(&client->dev);
> -       pm_runtime_set_suspended(&client->dev);
> -       pm_runtime_put_noidle(&client->dev);
> -
>         hid = ihid->hid;
>         hid_destroy_device(hid);
>
> @@ -1219,25 +1152,15 @@ static int i2c_hid_suspend(struct device *dev)
>         int wake_status;
>
>         if (hid->driver && hid->driver->suspend) {
> -               /*
> -                * Wake up the device so that IO issues in
> -                * HID driver's suspend code can succeed.
> -                */
> -               ret = pm_runtime_resume(dev);
> -               if (ret < 0)
> -                       return ret;
> -
>                 ret = hid->driver->suspend(hid, PMSG_SUSPEND);
>                 if (ret < 0)
>                         return ret;
>         }
>
> -       if (!pm_runtime_suspended(dev)) {
> -               /* Save some power */
> -               i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> +       /* Save some power */
> +       i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>
> -               disable_irq(client->irq);
> -       }
> +       disable_irq(client->irq);
>
>         if (device_may_wakeup(&client->dev)) {
>                 wake_status = enable_irq_wake(client->irq);
> @@ -1279,11 +1202,6 @@ static int i2c_hid_resume(struct device *dev)
>                                 wake_status);
>         }
>
> -       /* We'll resume to full power */
> -       pm_runtime_disable(dev);
> -       pm_runtime_set_active(dev);
> -       pm_runtime_enable(dev);
> -
>         enable_irq(client->irq);
>
>         /* Instead of resetting device, simply powers the device on. This
> @@ -1304,30 +1222,8 @@ static int i2c_hid_resume(struct device *dev)
>  }
>  #endif
>
> -#ifdef CONFIG_PM
> -static int i2c_hid_runtime_suspend(struct device *dev)
> -{
> -       struct i2c_client *client = to_i2c_client(dev);
> -
> -       i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> -       disable_irq(client->irq);
> -       return 0;
> -}
> -
> -static int i2c_hid_runtime_resume(struct device *dev)
> -{
> -       struct i2c_client *client = to_i2c_client(dev);
> -
> -       enable_irq(client->irq);
> -       i2c_hid_set_power(client, I2C_HID_PWR_ON);
> -       return 0;
> -}
> -#endif
> -
>  static const struct dev_pm_ops i2c_hid_pm = {
>         SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
> -       SET_RUNTIME_PM_OPS(i2c_hid_runtime_suspend, i2c_hid_runtime_resume,
> -                          NULL)
>  };
>
>  static const struct i2c_device_id i2c_hid_id_table[] = {
> --
> 2.17.1
>
