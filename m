Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D86DD3C41
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 11:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfJKJ1Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 05:27:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49842 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727741AbfJKJ1Y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 05:27:24 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3E78285538
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 09:27:23 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id s3so8342151qkd.6
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 02:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOWcG/5wLeDSwPj+sdOH7rXd/c1n+Bp+NcIyyhHNJUM=;
        b=pGiyNKBYLPv0DNC2nBLCZBgMhyFXpE8L1GYlDYC8JAF77QYCwzqHGPhSXOjTaEd7eW
         a/uX2Q+cYA/VJ/owfccsOFsiPYXqq9vhj3yebHk25Bdqdh58fHQL7O0Sot+A61z2TWlK
         7GUhospBSiwBMqkHE0nswYGn1QqkcHtSehwmVvST5EK7THXFZ6/GM23TIrtQrGvRBR8X
         KbHsRbLRgtwPuYN2JtNaw9ccjxsufgP6S2XJJHRNYBTHe7eGY1AifZ7PhJ21m9/YxhTT
         YsqNKKgJqlH9RnB2/wFhv+ux9anrZn9Y8pW+KtyD9qQ/xuJWbhW5UoS0XKBk3Bu9AU3M
         qjfA==
X-Gm-Message-State: APjAAAVobICSZoWvdIcnOTyAAtfQjch1kDDAkKSeUXZ4CzcpMaDHD8Mb
        p6n8r04c5vMK3nQeB4NwFs4z72c2ZZLSC+K05GYQ7mJYU8vr4jblDzshIPMi6yCTpdMM863XsxX
        +zEaF0oahvQflbyS62HKuDVEv1KRhHiUaPp2Fq/8=
X-Received: by 2002:a37:648d:: with SMTP id y135mr14008829qkb.459.1570786042211;
        Fri, 11 Oct 2019 02:27:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2Rp4nvJ5EKKTDCN1nfeeYFU9L6Dz070FOFLmksRPZQIHDDtqBlHfzHvgdBQnYJuBggH0e8SqUc7CPL1frxHg=
X-Received: by 2002:a37:648d:: with SMTP id y135mr14008803qkb.459.1570786041789;
 Fri, 11 Oct 2019 02:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191008153829.24766-1-kai.heng.feng@canonical.com> <d096582b-c96b-69a2-bcc5-cba2984705e7@redhat.com>
In-Reply-To: <d096582b-c96b-69a2-bcc5-cba2984705e7@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 11:27:10 +0200
Message-ID: <CAO-hwJJoy3=a_m9V6ZseisGgWp=jJpYr3ub85SaLiQFiioZ7ew@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Remove runtime power management
To:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

[Adding Mika, who introduced runpm in i2c-hid]

few questions, remarks:

On Tue, Oct 8, 2019 at 10:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 08-10-2019 17:38, Kai-Heng Feng wrote:
> > Runtime power management in i2c-hid brings lots of issues, such as:
> > - When transitioning from display manager to desktop session, i2c-hid
> > was closed and opened, so the device was set to SLEEP and ON in a short
> > period. Vendors confirmed that their devices can't handle fast ON/SLEEP
> > command because Windows doesn't have this behavior.
> >
> > - When rebooting, i2c-hid was closed, and the driver core put the device
> > back to full power before shutdown. This behavior also triggers a quick
> > SLEEP and ON commands that some devices can't handle, renders an
> > unusable touchpad after reboot.
> >
> > - Runtime power management is only useful when i2c-hid isn't opened,
> > i.e. a laptop without desktop session, which isn't that common.

There is also one GPM-like driver that uses libinput (can't remember
from the top of my head), but you can have the i2c-hid device opened
on a vt too (with 2 finger gestures for scrolling and what not) :)

And there is also the use case of a 2-in-1 when the laptop is in
tablet mode. In some cases, the compositor will close the inputs to
ignore the touchpad events.

Anyway, Mika, is there any drawbacks of not having runpm on i2c-hid
devices? Maybe at the IRQ level?

> >
> > - Most importantly, my power meter reports little to none energy saving
> > when i2c-hid is runtime suspended.

Heh, that was the whole point of HID over I2C: the bus doesn't drain
power when not in used, so we can have always on devices with little
to no consumption of energy.

Do you have any numbers, or is it in the noise range?

> >
> > So let's remove runtime power management since there is no actual
> > benefit.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks for the patch (one nitpick down below though).

>
> Given all the problems we've been seeing related to runtime pm I agree
> that this is probably the best approach:
>
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks Hans.

You-Sheng, does this solve your issue with your touchpad? Do I have
your acked-by or tested-by?

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
> > ---
> >   drivers/hid/i2c-hid/i2c-hid-core.c | 111 ++---------------------------
> >   1 file changed, 4 insertions(+), 107 deletions(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index 2a7c6e33bb1c..5ab4982b3a7b 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -26,7 +26,6 @@
> >   #include <linux/delay.h>
> >   #include <linux/slab.h>
> >   #include <linux/pm.h>
> > -#include <linux/pm_runtime.h>
> >   #include <linux/device.h>
> >   #include <linux/wait.h>
> >   #include <linux/err.h>
> > @@ -48,8 +47,6 @@
> >   /* quirks to control the device */
> >   #define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV    BIT(0)
> >   #define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET    BIT(1)
> > -#define I2C_HID_QUIRK_NO_RUNTIME_PM          BIT(2)
> > -#define I2C_HID_QUIRK_DELAY_AFTER_SLEEP              BIT(3)
> >   #define I2C_HID_QUIRK_BOGUS_IRQ                     BIT(4)
> >
> >   /* flags */
> > @@ -172,14 +169,7 @@ static const struct i2c_hid_quirks {
> >       { USB_VENDOR_ID_WEIDA, HID_ANY_ID,
> >               I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
> >       { I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
> > -             I2C_HID_QUIRK_NO_IRQ_AFTER_RESET |
> > -             I2C_HID_QUIRK_NO_RUNTIME_PM },
> > -     { I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_4B33,
> > -             I2C_HID_QUIRK_DELAY_AFTER_SLEEP },
> > -     { USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_8001,
> > -             I2C_HID_QUIRK_NO_RUNTIME_PM },
> > -     { I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_01F0,
> > -             I2C_HID_QUIRK_NO_RUNTIME_PM },
> > +             I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
> >       { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> >                I2C_HID_QUIRK_BOGUS_IRQ },
> >       { 0, 0 }
> > @@ -397,7 +387,6 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
> >   {
> >       struct i2c_hid *ihid = i2c_get_clientdata(client);
> >       int ret;
> > -     unsigned long now, delay;
> >
> >       i2c_hid_dbg(ihid, "%s\n", __func__);
> >
> > @@ -415,22 +404,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
> >                       goto set_pwr_exit;
> >       }
> >
> > -     if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> > -         power_state == I2C_HID_PWR_ON) {
> > -             now = jiffies;
> > -             if (time_after(ihid->sleep_delay, now)) {
> > -                     delay = jiffies_to_usecs(ihid->sleep_delay - now);
> > -                     usleep_range(delay, delay + 1);
> > -             }
> > -     }
> > -
> >       ret = __i2c_hid_command(client, &hid_set_power_cmd, power_state,
> >               0, NULL, 0, NULL, 0);
> >
> > -     if (ihid->quirks & I2C_HID_QUIRK_DELAY_AFTER_SLEEP &&
> > -         power_state == I2C_HID_PWR_SLEEP)
> > -             ihid->sleep_delay = jiffies + msecs_to_jiffies(20);
> > -
> >       if (ret)
> >               dev_err(&client->dev, "failed to change power setting.\n");
> >
> > @@ -791,11 +767,6 @@ static int i2c_hid_open(struct hid_device *hid)
> >   {
> >       struct i2c_client *client = hid->driver_data;
> >       struct i2c_hid *ihid = i2c_get_clientdata(client);
> > -     int ret = 0;
> > -
> > -     ret = pm_runtime_get_sync(&client->dev);
> > -     if (ret < 0)
> > -             return ret;
> >
> >       set_bit(I2C_HID_STARTED, &ihid->flags);
> >       return 0;
> > @@ -807,27 +778,6 @@ static void i2c_hid_close(struct hid_device *hid)
> >       struct i2c_hid *ihid = i2c_get_clientdata(client);
> >
> >       clear_bit(I2C_HID_STARTED, &ihid->flags);
> > -
> > -     /* Save some power */
> > -     pm_runtime_put(&client->dev);
> > -}
> > -
> > -static int i2c_hid_power(struct hid_device *hid, int lvl)
> > -{
> > -     struct i2c_client *client = hid->driver_data;
> > -     struct i2c_hid *ihid = i2c_get_clientdata(client);
> > -
> > -     i2c_hid_dbg(ihid, "%s lvl:%d\n", __func__, lvl);
> > -
> > -     switch (lvl) {
> > -     case PM_HINT_FULLON:
> > -             pm_runtime_get_sync(&client->dev);
> > -             break;
> > -     case PM_HINT_NORMAL:
> > -             pm_runtime_put(&client->dev);
> > -             break;
> > -     }
> > -     return 0;
> >   }
> >
> >   struct hid_ll_driver i2c_hid_ll_driver = {
> > @@ -836,7 +786,6 @@ struct hid_ll_driver i2c_hid_ll_driver = {
> >       .stop = i2c_hid_stop,
> >       .open = i2c_hid_open,
> >       .close = i2c_hid_close,
> > -     .power = i2c_hid_power,
> >       .output_report = i2c_hid_output_report,
> >       .raw_request = i2c_hid_raw_request,
> >   };
> > @@ -1104,9 +1053,6 @@ static int i2c_hid_probe(struct i2c_client *client,
> >
> >       i2c_hid_acpi_fix_up_power(&client->dev);
> >
> > -     pm_runtime_get_noresume(&client->dev);
> > -     pm_runtime_set_active(&client->dev);
> > -     pm_runtime_enable(&client->dev);
> >       device_enable_async_suspend(&client->dev);
> >
> >       /* Make sure there is something at this address */
> > @@ -1154,9 +1100,6 @@ static int i2c_hid_probe(struct i2c_client *client,
> >               goto err_mem_free;
> >       }
> >
> > -     if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> > -             pm_runtime_put(&client->dev);
> > -
> >       return 0;
> >
> >   err_mem_free:
> > @@ -1166,9 +1109,6 @@ static int i2c_hid_probe(struct i2c_client *client,
> >       free_irq(client->irq, ihid);
> >
> >   err_pm:

shouldn't this label go away?

> > -     pm_runtime_put_noidle(&client->dev);
> > -     pm_runtime_disable(&client->dev);
> > -
> >   err_regulator:
> >       regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
> >                              ihid->pdata.supplies);
> > @@ -1181,12 +1121,6 @@ static int i2c_hid_remove(struct i2c_client *client)
> >       struct i2c_hid *ihid = i2c_get_clientdata(client);
> >       struct hid_device *hid;
> >
> > -     if (!(ihid->quirks & I2C_HID_QUIRK_NO_RUNTIME_PM))
> > -             pm_runtime_get_sync(&client->dev);
> > -     pm_runtime_disable(&client->dev);
> > -     pm_runtime_set_suspended(&client->dev);
> > -     pm_runtime_put_noidle(&client->dev);
> > -
> >       hid = ihid->hid;
> >       hid_destroy_device(hid);
> >
> > @@ -1219,25 +1153,15 @@ static int i2c_hid_suspend(struct device *dev)
> >       int wake_status;
> >
> >       if (hid->driver && hid->driver->suspend) {
> > -             /*
> > -              * Wake up the device so that IO issues in
> > -              * HID driver's suspend code can succeed.
> > -              */
> > -             ret = pm_runtime_resume(dev);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> >               ret = hid->driver->suspend(hid, PMSG_SUSPEND);
> >               if (ret < 0)
> >                       return ret;
> >       }
> >
> > -     if (!pm_runtime_suspended(dev)) {
> > -             /* Save some power */
> > -             i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> > +     /* Save some power */
> > +     i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> >
> > -             disable_irq(client->irq);
> > -     }
> > +     disable_irq(client->irq);
> >
> >       if (device_may_wakeup(&client->dev)) {
> >               wake_status = enable_irq_wake(client->irq);
> > @@ -1279,11 +1203,6 @@ static int i2c_hid_resume(struct device *dev)
> >                               wake_status);
> >       }
> >
> > -     /* We'll resume to full power */
> > -     pm_runtime_disable(dev);
> > -     pm_runtime_set_active(dev);
> > -     pm_runtime_enable(dev);
> > -
> >       enable_irq(client->irq);
> >
> >       /* Instead of resetting device, simply powers the device on. This
> > @@ -1304,30 +1223,8 @@ static int i2c_hid_resume(struct device *dev)
> >   }
> >   #endif
> >
> > -#ifdef CONFIG_PM
> > -static int i2c_hid_runtime_suspend(struct device *dev)
> > -{
> > -     struct i2c_client *client = to_i2c_client(dev);
> > -
> > -     i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
> > -     disable_irq(client->irq);
> > -     return 0;
> > -}
> > -
> > -static int i2c_hid_runtime_resume(struct device *dev)
> > -{
> > -     struct i2c_client *client = to_i2c_client(dev);
> > -
> > -     enable_irq(client->irq);
> > -     i2c_hid_set_power(client, I2C_HID_PWR_ON);
> > -     return 0;
> > -}
> > -#endif
> > -
> >   static const struct dev_pm_ops i2c_hid_pm = {
> >       SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
> > -     SET_RUNTIME_PM_OPS(i2c_hid_runtime_suspend, i2c_hid_runtime_resume,
> > -                        NULL)
> >   };
> >
> >   static const struct i2c_device_id i2c_hid_id_table[] = {
> >
