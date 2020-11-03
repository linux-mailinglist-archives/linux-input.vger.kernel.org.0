Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135D12A3A03
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 02:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgKCBqr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 20:46:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgKCBqr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Nov 2020 20:46:47 -0500
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1471F2225E;
        Tue,  3 Nov 2020 01:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604368006;
        bh=lFAmU5IXg1kHYasHCHzUpOggTZlRW+fdNCnl96GoreI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bgHBPpOSrIR8Way5hq4iemLrDf0Z69MedsvnQgedXMg2vtcw+iAox1yZUTrQLWTvU
         MYN++J3X3Ab6gb9NQL0dL4W4VRysUtEaSrfgzNakmR9SKUK1uIZ/fO20JpQfTLtrXM
         d9rrlnuHz+Lwv5F03R+K1VZ0aVi1YPMmpgbqj3BU=
Received: by mail-oi1-f172.google.com with SMTP id u127so16782481oib.6;
        Mon, 02 Nov 2020 17:46:46 -0800 (PST)
X-Gm-Message-State: AOAM5332xzfECIkBemzElGnd2wjOG3kvP3jt/87o6lHOOGsks8AmfPeX
        Mv+mudC0PD/Aq7NC4syhUHLhQBMacFcMmTWjmw==
X-Google-Smtp-Source: ABdhPJyuuhfG4BUIglFfou4JvfnMmDJB6Z+jQKN1DEpS4OaBSIxmQ6MaDzJKE/RYnCgc7Trr7qW0EybPcH9huZVoC74=
X-Received: by 2002:a54:4588:: with SMTP id z8mr622587oib.147.1604368005136;
 Mon, 02 Nov 2020 17:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
 <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
In-Reply-To: <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 2 Nov 2020 19:46:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com>
Message-ID: <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] HID: i2c-hid: Allow subclasses of i2c-hid for
 power sequencing
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        andrea@borgia.bo.it, Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 2, 2020 at 6:13 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This exports some things from i2c-hid so that we can have a driver
> that's effectively a subclass of it and that can do its own power
> sequencing.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Rework to use subclassing.
>
> Changes in v2:
> - Use a separate compatible string for this new touchscreen.
> - Get timings based on the compatible string.
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 78 +++++++++++++++++----------
>  include/linux/input/i2c-hid-core.h    | 19 +++++++
>  include/linux/platform_data/i2c-hid.h |  9 ++++
>  3 files changed, 79 insertions(+), 27 deletions(-)
>  create mode 100644 include/linux/input/i2c-hid-core.h
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 786e3e9af1c9..910e9089fcf8 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -22,6 +22,7 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/input.h>
> +#include <linux/input/i2c-hid-core.h>
>  #include <linux/irq.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> @@ -1007,8 +1008,33 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
>                 pdata->post_power_delay_ms = val;
>  }
>
> -static int i2c_hid_probe(struct i2c_client *client,
> -                        const struct i2c_device_id *dev_id)
> +static int i2c_hid_power_up_device(struct i2c_hid_platform_data *pdata)
> +{
> +       struct i2c_hid *ihid = container_of(pdata, struct i2c_hid, pdata);
> +       struct hid_device *hid = ihid->hid;
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(pdata->supplies),
> +                                   pdata->supplies);
> +       if (ret) {
> +               if (hid)
> +                       hid_warn(hid, "Failed to enable supplies: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (pdata->post_power_delay_ms)
> +               msleep(pdata->post_power_delay_ms);
> +
> +       return 0;
> +}
> +
> +static void i2c_hid_power_down_device(struct i2c_hid_platform_data *pdata)
> +{
> +       regulator_bulk_disable(ARRAY_SIZE(pdata->supplies), pdata->supplies);
> +}
> +
> +int i2c_hid_probe(struct i2c_client *client,
> +                 const struct i2c_device_id *dev_id)
>  {
>         int ret;
>         struct i2c_hid *ihid;
> @@ -1035,6 +1061,9 @@ static int i2c_hid_probe(struct i2c_client *client,
>         if (!ihid)
>                 return -ENOMEM;
>
> +       if (platform_data)
> +               ihid->pdata = *platform_data;
> +
>         if (client->dev.of_node) {
>                 ret = i2c_hid_of_probe(client, &ihid->pdata);
>                 if (ret)
> @@ -1043,13 +1072,16 @@ static int i2c_hid_probe(struct i2c_client *client,
>                 ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
>                 if (ret)
>                         return ret;
> -       } else {
> -               ihid->pdata = *platform_data;
>         }
>
>         /* Parse platform agnostic common properties from ACPI / device tree */
>         i2c_hid_fwnode_probe(client, &ihid->pdata);
>
> +       if (!ihid->pdata.power_up_device)
> +               ihid->pdata.power_up_device = i2c_hid_power_up_device;
> +       if (!ihid->pdata.power_down_device)
> +               ihid->pdata.power_down_device = i2c_hid_power_down_device;
> +
>         ihid->pdata.supplies[0].supply = "vdd";
>         ihid->pdata.supplies[1].supply = "vddl";
>
> @@ -1059,14 +1091,10 @@ static int i2c_hid_probe(struct i2c_client *client,
>         if (ret)
>                 return ret;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
> -                                   ihid->pdata.supplies);
> -       if (ret < 0)
> +       ret = ihid->pdata.power_up_device(&ihid->pdata);
> +       if (ret)

This is an odd driver structure IMO. I guess platform data is already
there, but that's not what we'd use for any new driver.

Why not export i2c_hid_probe, i2c_hid_remove, etc. and then just call
them from the goodix driver and possibly make it handle all DT
platforms?

Who else needs regulators besides DT platforms? I thought with ACPI
it's all wonderfully abstracted away?

Rob
