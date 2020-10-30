Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E54F2A038E
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 12:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgJ3LBZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 07:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46130 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726276AbgJ3LBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 07:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604055680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S5QGM5P6b9ARkEdABLTK/zb8A9b8E1Yedm8BuogwyYA=;
        b=KyX2m6PTwrwYPhBbuQ/4ffYT3XeUjzjKxX5EqqPGmcllVBlLYiB4MIqunJyEXZF0qjfUXb
        9U7FxQ6BiBTznlPIZOQWg5NoJAwSbOCU9jMHSJN61aMp1qN4NKOF0UNub9KpWaXbiPR2dj
        sHNMKfvwYF1dksqxI1x9d1rJxcOgzqM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-wQ-vh07VMfKI4VVrc1Jb5g-1; Fri, 30 Oct 2020 07:01:16 -0400
X-MC-Unique: wQ-vh07VMfKI4VVrc1Jb5g-1
Received: by mail-pl1-f200.google.com with SMTP id q4so4218886plr.11
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 04:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5QGM5P6b9ARkEdABLTK/zb8A9b8E1Yedm8BuogwyYA=;
        b=OcpLDQ4pu08SeL/hDhsgFRqWymnWSL2jWVgNH+Xm1rWoxY2zbJNdq4VBIQ9rBasWb5
         cHofFouoXLwCuKTPmy8XmWcnFxBI/vOwbj+a/V8KZGYReh+84lfPZaGqPO8hgu8r5j6o
         goyNCyE3KnIBYJbj0eTXRX/9HNqx3IoovfOtr80ipEXDascuBIhWsUbjYRBb9mjMGPbE
         nHCT0NDQiTxItTH3R7DJ35mLkGcV4BihSGFxEDj5veSrl9s2Uua47ihtFc8rQvm8MkHp
         rrwMhy5jNgKCVEWnkXtf6JlxqvkbrWbo9PvQUf/uE3+YLTNcdGADOBD1Mt2XEZ3Kk3eT
         7e6A==
X-Gm-Message-State: AOAM533U7/bAaoO1AcN0GB/Rv89625r4qyasMmqoufxFYc2w5h94AHXy
        ndTniA6xY2cDalGAN9kIwIih+kvjBtgFlbVUjgijGbkQrK/sLErD3pgJSBGup2UIXhzLjYJZb5L
        aRbydkA8T+iJ/igUtKKGqNHK10nh8P9QaIm7MwGI=
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr2165816pjc.234.1604055675462;
        Fri, 30 Oct 2020 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCoz4UgkfUvLFKuUDZUK1pZfx793wwOva7KOR4Dsj6XiL9iruQJKlXna7TJNdtO560pzRNC5AF0RMIkMfqIak=
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr2165755pjc.234.1604055675036;
 Fri, 30 Oct 2020 04:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <20201023162220.v2.3.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
In-Reply-To: <20201023162220.v2.3.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 30 Oct 2020 12:01:04 +0100
Message-ID: <CAO-hwJ+TovXt6aTqcNeXY5nmSk7WHHb_mh+uKkM_zQjFqXWqng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: i2c-hid: Support the Goodix GT7375P touchscreen
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andrea@borgia.bo.it, Kai Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hans De Goede <hdegoede@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Doug,

On Sat, Oct 24, 2020 at 1:23 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> The Goodix GT7375P touchscreen uses i2c-hid so we can support it with
> just a few changes to the i2c-hid driver.  Specifically this
> touchscreen needs to control a reset GPIO during its power sequencing.
>
> The Goodix timing diagram shows this:
>
>          +----------------------------------
>          |
> AVDD ----+
>                +------------------------------
>          | (a) |
> RESET ---------+
>                      +-------------
>                | (b) |
> I2C comm OK ---------+
>
> Where (a) is 10 ms and (b) is 120 ms.

These timing issues always bother me. Is there any hint that this
particular touchscreen model is "certified" for a Windows usage?
Because if so, then we might as well mimic the timings the Windows
driver is doing instead of adding parameters for every single device.

>
> While we could just add some properties and specify this generically
> in the device tree, the guidance from the device tree maintainer is
> that it's better to list the specific model and infer everything from
> there.  Thus that's what this patch implements.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Use a separate compatible string for this new touchscreen.
> - Get timings based on the compatible string.
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 50 ++++++++++++++++++++++++++-
>  include/linux/platform_data/i2c-hid.h |  5 +++
>  2 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 786e3e9af1c9..0b2cd78b05e1 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -71,6 +71,12 @@ do {                                                                   \
>                 dev_printk(KERN_DEBUG, &(ihid)->client->dev, fmt, ##arg); \
>  } while (0)
>
> +struct i2c_hid_match_data {
> +       u16 hid_descriptor_address;
> +       int post_power_delay_ms;
> +       int post_gpio_reset_delay_ms;
> +};
> +
>  struct i2c_hid_desc {
>         __le16 wHIDDescLength;
>         __le16 bcdVersion;
> @@ -962,6 +968,21 @@ static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>  #endif
>
>  #ifdef CONFIG_OF
> +static bool i2c_hid_init_from_of_match(struct device *dev,
> +                                      struct i2c_hid_platform_data *pdata)
> +{
> +       const struct i2c_hid_match_data *match_data = device_get_match_data(dev);
> +
> +       if (!match_data)
> +               return false;
> +
> +       pdata->hid_descriptor_address = match_data->hid_descriptor_address;
> +       pdata->post_power_delay_ms = match_data->post_power_delay_ms;
> +       pdata->post_gpio_reset_delay_ms = match_data->post_gpio_reset_delay_ms;
> +
> +       return true;
> +}
> +
>  static int i2c_hid_of_probe(struct i2c_client *client,
>                 struct i2c_hid_platform_data *pdata)
>  {
> @@ -969,6 +990,11 @@ static int i2c_hid_of_probe(struct i2c_client *client,
>         u32 val;
>         int ret;
>
> +       /* Try getting everything based on the compatible string first */
> +       if (i2c_hid_init_from_of_match(&client->dev, pdata))
> +               return 0;
> +
> +       /* Fallback to getting hid-descr-addr from a property */
>         ret = of_property_read_u32(dev->of_node, "hid-descr-addr", &val);
>         if (ret) {
>                 dev_err(&client->dev, "HID register address not provided\n");
> @@ -984,8 +1010,15 @@ static int i2c_hid_of_probe(struct i2c_client *client,
>         return 0;
>  }
>
> +static const struct i2c_hid_match_data goodix_gt7375p_match_data = {
> +       .hid_descriptor_address = 0x0001,

Nah, please don't. See 1/3 of this series.

> +       .post_power_delay_ms = 10,
> +       .post_gpio_reset_delay_ms = 120,
> +};
> +
>  static const struct of_device_id i2c_hid_of_match[] = {
> -       { .compatible = "hid-over-i2c" },
> +       { .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_match_data },
> +       { .compatible = "hid-over-i2c" }, /* Deprecated */
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
> @@ -1053,6 +1086,12 @@ static int i2c_hid_probe(struct i2c_client *client,
>         ihid->pdata.supplies[0].supply = "vdd";
>         ihid->pdata.supplies[1].supply = "vddl";
>
> +       /* Start out with reset asserted */
> +       ihid->pdata.reset_gpio =
> +               devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ihid->pdata.reset_gpio))
> +               return PTR_ERR(ihid->pdata.reset_gpio);
> +

That gpio change should go into its own commit. The commit briefly
mentioned this, but we could get more information on it, because this
is modifying the common probe path.


[... re-reading, thinking later ...]

Well, the whole point of this patch is for that specific GPIO. And I
am really not happy having that merged here:
what if suddenly we have another device that has a reset line that
requires a different "protocol" (i.e. low instead of high, or need to
switch it 3 times from high to low before the sleep)?
ACPI integrated devices don't need that reset line. Or if they do, it
is integrated at the ACPI level. So can we have something similar
here? Either force Goodix not to use a reset line, either have a
platform driver (well, platform might not be the correct place) that
would handle those compatible strings and reset lines before i2c-hid?

The more I think of it, the more I think we should have another piece
in front of i2c-hid, to emulate somehow what ACPI is capable of doing
behind our back. That might require a little bit of work in i2c-hid,
but if in the end we can remove the regulator specifics, reset
specifics and any DT specifics that were added in the past and have
i2c-hid being just the spec it follows, that will surely help us
moving forward.

Cheers,
Benjamin

>         ret = devm_regulator_bulk_get(&client->dev,
>                                       ARRAY_SIZE(ihid->pdata.supplies),
>                                       ihid->pdata.supplies);
> @@ -1067,6 +1106,10 @@ static int i2c_hid_probe(struct i2c_client *client,
>         if (ihid->pdata.post_power_delay_ms)
>                 msleep(ihid->pdata.post_power_delay_ms);
>
> +       gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 0);
> +       if (ihid->pdata.post_gpio_reset_delay_ms)
> +               msleep(ihid->pdata.post_gpio_reset_delay_ms);
> +
>         i2c_set_clientdata(client, ihid);
>
>         ihid->client = client;
> @@ -1163,6 +1206,7 @@ static int i2c_hid_remove(struct i2c_client *client)
>         if (ihid->bufsize)
>                 i2c_hid_free_buffers(ihid);
>
> +       gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 1);
>         regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
>                                ihid->pdata.supplies);
>
> @@ -1228,6 +1272,10 @@ static int i2c_hid_resume(struct device *dev)
>
>                 if (ihid->pdata.post_power_delay_ms)
>                         msleep(ihid->pdata.post_power_delay_ms);
> +
> +               gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 0);
> +               if (ihid->pdata.post_gpio_reset_delay_ms)
> +                       msleep(ihid->pdata.post_gpio_reset_delay_ms);
>         } else if (ihid->irq_wake_enabled) {
>                 wake_status = disable_irq_wake(client->irq);
>                 if (!wake_status)
> diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
> index c628bb5e1061..b2150223ffa6 100644
> --- a/include/linux/platform_data/i2c-hid.h
> +++ b/include/linux/platform_data/i2c-hid.h
> @@ -12,6 +12,7 @@
>  #ifndef __LINUX_I2C_HID_H
>  #define __LINUX_I2C_HID_H
>
> +#include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/types.h>
>
> @@ -20,6 +21,8 @@
>   * @hid_descriptor_address: i2c register where the HID descriptor is stored.
>   * @supplies: regulators for powering on the device.
>   * @post_power_delay_ms: delay after powering on before device is usable.
> + * @post_gpio_reset_delay_ms: delay after reset via GPIO.
> + * @reset_gpio: optional gpio to de-assert after post_power_delay_ms.
>   *
>   * Note that it is the responsibility of the platform driver (or the acpi 5.0
>   * driver, or the flattened device tree) to setup the irq related to the gpio in
> @@ -36,6 +39,8 @@ struct i2c_hid_platform_data {
>         u16 hid_descriptor_address;
>         struct regulator_bulk_data supplies[2];
>         int post_power_delay_ms;
> +       int post_gpio_reset_delay_ms;
> +       struct gpio_desc *reset_gpio;
>  };
>
>  #endif /* __LINUX_I2C_HID_H */
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>

