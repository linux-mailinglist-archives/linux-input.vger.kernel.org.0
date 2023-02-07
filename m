Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0083368E346
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 23:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjBGWLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 17:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBGWLg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 17:11:36 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399E17A94
        for <linux-input@vger.kernel.org>; Tue,  7 Feb 2023 14:11:35 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id b5so17201113plz.5
        for <linux-input@vger.kernel.org>; Tue, 07 Feb 2023 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i593f184Hmr8abWf/XruS/2XPihlJHd7nufXR7hHK0U=;
        b=jEtiVqC6llTtARjXT3H0GDBGkn1em1He6HefcR5Z+ZApS8fx8hTP8A3emqMTvRx1e8
         llI3vPq4cKRhmoWl02+JysYv3C4mtKCI/tVgyPUVviVMkBRj0SDZ3Y4DvqclQdLdSB9C
         vTLgKcVx1gXgmesDpEeaPTYQvBvdWnn+cyIuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i593f184Hmr8abWf/XruS/2XPihlJHd7nufXR7hHK0U=;
        b=LtNtXWm7xLbppfjlkjYHqK/xFge2eFRzaj61opY+nOwZY4QqDvPu2SsI/yyGP9AtGF
         joQZNWSBm2Y7rNWp7519SpGCup2UqPpwVLgcqIeG5h4RazsrhlH7oOw+DjgjKhgv5aYR
         C7HghO006tOJjrqSIBD/NJ4QZV4AE+GO1V/bQBgBPi4+D/vbU1jTCUo9UkU2mu/+AMIj
         7G/fMTpzlHB6KCI9iYytyJ2I3G/OEPVHZPD+Wk0NUz0f/CKsYScvd35X2OXgJ3+xizie
         XbiHk79c0Nbs3BkZgJ+6WREro/iWuRf3nqSugouldPU44JhF1xZAFWp34VyKBGnv4rED
         uheQ==
X-Gm-Message-State: AO0yUKVJ0BnQXRPtXnC8cIqQhB85cfTb1trHwfr5M1Pj/XfJK7L1wT/n
        uIe4hgaO6daI6Klf5/hcmrvpdNAqWRGQhpt/rYSXUArl1XD0cQ==
X-Google-Smtp-Source: AK7set/lhHQNMXIISr9N9la2CTvYuDcvZ+/dXpfrOcx/S4HboLBegd9C2OFyGu1PSyIT0qtMJOGDTqIKiYshuksVQIo=
X-Received: by 2002:a17:902:ce86:b0:198:f9e4:5d1a with SMTP id
 f6-20020a170902ce8600b00198f9e45d1amr1258924plg.13.1675807894714; Tue, 07 Feb
 2023 14:11:34 -0800 (PST)
MIME-Version: 1.0
References: <Y+K/i4kj0WER1Hl0@google.com>
In-Reply-To: <Y+K/i4kj0WER1Hl0@google.com>
From:   Allen Ballway <ballway@chromium.org>
Date:   Tue, 7 Feb 2023 14:11:24 -0800
Message-ID: <CAEs41JAFTGs8LErq1e7esANbHGnfyyP=xZzeax7KfPwoazVK8Q@mail.gmail.com>
Subject: Re: [PATCH] HID: retain initial quirks set up when creating HID devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Guenter Roeck <groeck@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 7, 2023 at 1:16 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In certain circumstances, such as when creating I2C-connected HID
> devices, we want to pass and retain some querks (axis inversion, etc).
> The source of such quirks may be device tree, or DMI data, or something
> else not readily available to the HID core itself and therefore cannot
> be reconstructed easily. To allow this introduce "initial_quirks" field
> in hid_device structure and use it when determining the final set of
> quirks.
>
> This fixes problem with i2c-hid setting up device-tree sourced quirks
> too late and losing them on device rebind, and also allows to sever the
> tie between hid-code and i2c-hid when applying DMI-based quirks.
>
> Fixes: b60d3c803d76 ("HID: i2c-hid-of: Expose the touchscreen-inverted properties")
> Fixes: a2f416bf062a ("HID: multitouch: Add quirks for flipped axes")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Compiled only, not tested on hardware.
>

Tested on Dynabook K50 with Elan9034 touchscreen and confirmed quirks are
applied as expected.

>  drivers/hid/hid-quirks.c                 | 8 +-------
>  drivers/hid/i2c-hid/i2c-hid-core.c       | 6 ++++--
>  drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 1 -
>  include/linux/hid.h                      | 1 +
>  4 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 30e35f79def4..66e64350f138 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -19,7 +19,6 @@
>  #include <linux/input/elan-i2c-ids.h>
>
>  #include "hid-ids.h"
> -#include "i2c-hid/i2c-hid.h"
>
>  /*
>   * Alphabetically sorted by vendor then product.
> @@ -1238,7 +1237,7 @@ EXPORT_SYMBOL_GPL(hid_quirks_exit);
>  static unsigned long hid_gets_squirk(const struct hid_device *hdev)
>  {
>         const struct hid_device_id *bl_entry;
> -       unsigned long quirks = 0;
> +       unsigned long quirks = hdev->initial_quirks;
>
>         if (hid_match_id(hdev, hid_ignore_list))
>                 quirks |= HID_QUIRK_IGNORE;
> @@ -1299,11 +1298,6 @@ unsigned long hid_lookup_quirk(const struct hid_device *hdev)
>                 quirks = hid_gets_squirk(hdev);
>         mutex_unlock(&dquirks_lock);
>
> -       /* Get quirks specific to I2C devices */
> -       if (IS_ENABLED(CONFIG_I2C_DMI_CORE) && IS_ENABLED(CONFIG_DMI) &&
> -           hdev->bus == BUS_I2C)
> -               quirks |= i2c_hid_get_dmi_quirks(hdev->vendor, hdev->product);
> -
>         return quirks;
>  }
>  EXPORT_SYMBOL_GPL(hid_lookup_quirk);
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 0ab8f47a84e9..efbba0465eef 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1025,6 +1025,10 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>         hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
>         hid->product = le16_to_cpu(ihid->hdesc.wProductID);
>
> +       hid->initial_quirks = quirks;
> +       hid->initial_quirks |= i2c_hid_get_dmi_quirks(hid->vendor,
> +                                                     hid->product);
> +
>         snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
>                  client->name, (u16)hid->vendor, (u16)hid->product);
>         strscpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
> @@ -1038,8 +1042,6 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>                 goto err_mem_free;
>         }
>
> -       hid->quirks |= quirks;
> -
>         return 0;
>
>  err_mem_free:
> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> index 554a7dc28536..210f17c3a0be 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
> @@ -492,4 +492,3 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product)
>
>         return quirks;
>  }
> -EXPORT_SYMBOL_GPL(i2c_hid_get_dmi_quirks);
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index daaac4d7f370..56dac09c99d9 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -622,6 +622,7 @@ struct hid_device {                                                 /* device report descriptor */
>         unsigned long status;                                           /* see STAT flags above */
>         unsigned claimed;                                               /* Claimed by hidinput, hiddev? */
>         unsigned quirks;                                                /* Various quirks the device can pull on us */
> +       unsigned initial_quirks;                                        /* Initial set of quirks supplied when creating device */
>         bool io_started;                                                /* If IO has started */
>
>         struct list_head inputs;                                        /* The list of inputs */
> --
> 2.39.1.519.gcb327c4b5f-goog
>
>
> --
> Dmitry
