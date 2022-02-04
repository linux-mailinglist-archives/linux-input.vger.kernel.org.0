Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8D04A9DCE
	for <lists+linux-input@lfdr.de>; Fri,  4 Feb 2022 18:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376940AbiBDRjz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Feb 2022 12:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242179AbiBDRjz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Feb 2022 12:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643996394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RwdlLaI9hrL3aoBPofjWPEzosZqB3Rl5UgTRRI9h+2k=;
        b=hYdMuCF5bOL/PhoR9dW5/8zh3OAwBm5Wn1/z54eVDFVL0vKjf4gxXGdTib46kPtpfrKod0
        Jj2L0nHzeRc59wUyC4xpixrr2bPQVr41UsewH1E9tniZ97yLNSEF7iRxGf8iqC6rAZ5ieL
        QTrJ2vltZuFa9XTbNhyGafZ2MOmd74U=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-MQUfhIsSOOmTj26RSZZIdg-1; Fri, 04 Feb 2022 12:39:53 -0500
X-MC-Unique: MQUfhIsSOOmTj26RSZZIdg-1
Received: by mail-pj1-f69.google.com with SMTP id y14-20020a17090ad70e00b001b4fc2943b3so9076257pju.8
        for <linux-input@vger.kernel.org>; Fri, 04 Feb 2022 09:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RwdlLaI9hrL3aoBPofjWPEzosZqB3Rl5UgTRRI9h+2k=;
        b=TQpsAERVRrBmS8g5CpHlf3zzDSoKBVmk65xvvx74o9MpNF5otlMbPh24moNIfm8mCc
         aDpQ91BTmY5tB/Q3zY1Jug5KOX1MJ90nyhZK/lNDp+vei4MHJTFF7RhZK8wK12VYouD+
         +PlPQ+cAGgqsPaaBgNmiFM5/ZJ0GMzemqMRXVehTAX4ALjPmVyRnBmufV/2wnsGfZ7Y5
         U8v5J0Y2c/Txh0Ann0ff9RjvAWMcEMny+GjwyPvZH6+hr1rsHwRXcPcrIMCbRrQe3cwF
         MyzK92e4rme54WkHdxNr4mUZFmAplJ7S/G3i1IvORXNvrZaVx3gLkigt2dYpSTK7OiT4
         Ur/Q==
X-Gm-Message-State: AOAM530P+3ewnPpmZBU59fsqTKSAQrq0JCTMNM+B4a0EdXSdVwY7JRj7
        dKVQAc9IbxQTU4D4yewuTm7Lo9PBXNnKAlCfbCYjxN7hL5HIZ8vRTc8Wf0MuN6f9tePpCsceK9N
        W+XQ+M85ocvjpz/MRsJKJW02V/E/BRBL3u2RrtL4=
X-Received: by 2002:a63:e84f:: with SMTP id a15mr66520pgk.191.1643996392133;
        Fri, 04 Feb 2022 09:39:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydOlFPrtJ/KJ9iJkO5qRi/aNsHQgT5KgAkBYsEISuEh4KZOhObQkWNCKuDo38mudAyxgehndeKd7BrobueX6Q=
X-Received: by 2002:a63:e84f:: with SMTP id a15mr66497pgk.191.1643996391763;
 Fri, 04 Feb 2022 09:39:51 -0800 (PST)
MIME-Version: 1.0
References: <s5hleyqwowl.wl-tiwai@suse.de>
In-Reply-To: <s5hleyqwowl.wl-tiwai@suse.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Feb 2022 18:39:40 +0100
Message-ID: <CAO-hwJK-7migm7VWkwvTPHwxgTZEbNX0XYpk0A1pr6N2jkYrxw@mail.gmail.com>
Subject: Re: Wrongly bound Elantech touchpad on Lenovo Yoga Slim 7
To:     Takashi Iwai <tiwai@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans De Goede <hdegoede@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

[adding Dmitry, the maintainer of the input tree and Hans, a colleague of mine]

On Fri, Feb 4, 2022 at 5:57 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> Hi,
>
> we've got a bug report on openSUSE Bugzilla about the broken touchpad
> on Lenovo Yoga Slim 7:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1193064
>
> The touchpad is an Elantech one, connected over i2c, and there are two
> drivers supporting it.  Unfortunately, the default one the system
> binds, elan-i2c input driver, doesn't seem working properly, while
> i2c-hid driver works.

Hans, we do have a similar bug on RHEL at
https://bugzilla.redhat.com/show_bug.cgi?id=2029078 (sorry, private
bug).

IIRC you worked on the discrimination between i2c-hid and elan_i2c (I
might be completely wrong though).
Would this patch be OK with you?

Cheers,
Benjamin

>
> I'm not sure what's the best fix for this, but below a quick
> workaround using a deny list with DMI matching.
> If this is OK, I can resubmit the patch for merging.
>
> Any comments appreciated.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] Input: elan_i2c: Add deny list for Lenovo Yoga Slim 7
>
> The touchpad on Lenovo Yoga Slim 7 doesn't work well with elan-i2c but
> rather better with i2c-hid.  Add a deny list for avoiding to bind with
> elan-i2c.
>
> BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1193064
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 47af62c12267..fd08481f7aea 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -18,6 +18,7 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> @@ -1222,6 +1223,20 @@ static void elan_disable_regulator(void *_data)
>         regulator_disable(data->vcc);
>  }
>
> +static const struct dmi_system_id elan_i2c_denylist[] __initconst = {
> +#if IS_ENABLED(CONFIG_I2C_HID_ACPI)
> +       {
> +               /* Lenovo Yoga Slim 7 is better supported by i2c-hid */
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "82A3"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga Slim 7 14ITL05"),
> +               },
> +       },
> +#endif
> +       { }
> +};
> +
>  static int elan_probe(struct i2c_client *client,
>                       const struct i2c_device_id *dev_id)
>  {
> @@ -1233,6 +1248,10 @@ static int elan_probe(struct i2c_client *client,
>
>         if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_I2C) &&
>             i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +               if (dmi_check_system(elan_i2c_denylist)) {
> +                       dev_info(dev, "Hits deny list, skipping\n");
> +                       return -ENODEV;
> +               }
>                 transport_ops = &elan_i2c_ops;
>         } else if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_SMBUS) &&
>                    i2c_check_functionality(client->adapter,
> --
> 2.31.1
>
>
>
>
>
>
>

