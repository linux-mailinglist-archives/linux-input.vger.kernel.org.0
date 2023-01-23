Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B96775E5
	for <lists+linux-input@lfdr.de>; Mon, 23 Jan 2023 08:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjAWH6l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Jan 2023 02:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjAWH6l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Jan 2023 02:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1746311EAD
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674460673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IV8ZFMMB4mH+ho+gOPdoLhJW3vI1K5Tfot07hE5PSj8=;
        b=Gy3LxfKitC3zSimwCsTLZ8nARTsjfH+ce1xkucFNr6SYJk6oCokL4JrmCYtMi17aulPsUk
        F5hjGTT5qNvevDW6fpO9Sh+CbtG8K2fz4IUx2zYEdDLCH+ycXeoNxsIUhzq+OkGDSUsL7n
        dUJTURpIxbWKKJVaOMm+qsElSgRKv3o=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326--jJxekvYNYyimCNtOZa_jw-1; Mon, 23 Jan 2023 02:57:52 -0500
X-MC-Unique: -jJxekvYNYyimCNtOZa_jw-1
Received: by mail-yb1-f198.google.com with SMTP id w70-20020a25df49000000b00803e799d7b1so6553172ybg.10
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 23:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IV8ZFMMB4mH+ho+gOPdoLhJW3vI1K5Tfot07hE5PSj8=;
        b=LMR5SwPqKLm/OkSt84X6ukVj/xLzBL/UTuedz1MM3/9gH9s1uU4OWdBMdFqB3wc0XR
         3sGMm8cAbaQn7lbdjQxDyIpU3GoE70Ys9IvKkZaQA5GTou2DgNDD1lv9AazjKBeqBzHi
         3echkw4+URMS2UR639Y2bq/6+H3krNr6qgU6r9BI0gFXqsCXMUU6OiWZFqo7cilhcJnA
         xVw8DH9/3xcobxh2i9i0mq4tikwOh4j6BMaPiraJCfUTb8P2CtWtjW2xtY85uoCnBbN9
         CsnOMa8+ayLa4eqFL4KvVUVfHEkAbiNDTehhnPyt27vYPCVgHXT5iolbM7kEUmFwLuq4
         Q/og==
X-Gm-Message-State: AFqh2kon2Js1vYEKKr76o8mYSx2SWLWNzvAfIUa1glnpbjr/a6bRyRbe
        UWX5D9OZry2sO9OvV4UKzJlbR/mJ5jsgmyCCuyuEk+gYM9TKZZTtY9/27QKr862N7n6mrftR3My
        SwRAWQWhmWTNUuH1xsAaOzxol4jtvCauPfsHurGg=
X-Received: by 2002:a25:3c87:0:b0:735:ea17:94d9 with SMTP id j129-20020a253c87000000b00735ea1794d9mr2715284yba.378.1674460671514;
        Sun, 22 Jan 2023 23:57:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvztifYU4nljeyBMcDJnvFCZ/MH1s8aB2hNpQ8aHb2o7X/ABYNbvP+oq3Wf6XRcniHaWdGAq/0A1Qp49brCIas=
X-Received: by 2002:a25:3c87:0:b0:735:ea17:94d9 with SMTP id
 j129-20020a253c87000000b00735ea1794d9mr2715278yba.378.1674460671284; Sun, 22
 Jan 2023 23:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20221224121814.11709-1-lephilousophe@gmail.com>
In-Reply-To: <20221224121814.11709-1-lephilousophe@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 23 Jan 2023 08:57:39 +0100
Message-ID: <CAO-hwJJwUQJueutZ5z_4qwBb1Y4+-9h3ta0Xran=s6pJ_e3itQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] HID: evision: Add preliminary support for EVision keyboards
To:     Philippe Valembois <lephilousophe@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 24, 2022 at 1:23 PM Philippe Valembois
<lephilousophe@gmail.com> wrote:
>
> From: Philippe Valembois <lephilousophe@users.noreply.github.com>

Jiri, I have a doubt. Do we accept emails from users.noreply.github.com?

>
> For now only supports one model and only filters out bogus reports sent
> when the keyboard has been configured through hidraw.
> Without this, as events are not released, soft repeat floods userspace
> with unknown key events.
>
> Signed-off-by: Philippe Valembois <lephilousophe@users.noreply.github.com>
> ---
>  drivers/hid/Kconfig       |  7 ++++
>  drivers/hid/Makefile      |  1 +
>  drivers/hid/hid-evision.c | 79 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 drivers/hid/hid-evision.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index e2a5d30c8..1320ea75c 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -329,6 +329,13 @@ config HID_ELO
>         Support for the ELO USB 4000/4500 touchscreens. Note that this is for
>         different devices than those handled by CONFIG_TOUCHSCREEN_USB_ELO.
>
> +config HID_EVISION
> +       tristate "EVision Keyboards Support"
> +       depends on USB_HID

AFAICT, the driver only uses pure HID API, so you should be able to
depend on HID, not just USB_HID.

> +       help
> +       Support for some EVision keyboards. Note that this is needed only when
> +       applying customization using userspace programs.
> +
>  config HID_EZKEY
>         tristate "Ezkey BTC 8193 keyboard"
>         default !EXPERT
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index e8014c1a2..bd01571dd 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_HID_EMS_FF)      += hid-emsff.o
>  obj-$(CONFIG_HID_ELAN)         += hid-elan.o
>  obj-$(CONFIG_HID_ELECOM)       += hid-elecom.o
>  obj-$(CONFIG_HID_ELO)          += hid-elo.o
> +obj-$(CONFIG_HID_EVISION)      += hid-evision.o
>  obj-$(CONFIG_HID_EZKEY)                += hid-ezkey.o
>  obj-$(CONFIG_HID_FT260)                += hid-ft260.o
>  obj-$(CONFIG_HID_GEMBIRD)      += hid-gembird.o
> diff --git a/drivers/hid/hid-evision.c b/drivers/hid/hid-evision.c
> new file mode 100644
> index 000000000..6ea331575
> --- /dev/null
> +++ b/drivers/hid/hid-evision.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID driver for EVision devices
> + *  For now, only ignore bogus consumer reports
> + *  sent after the keyboard has been configured
> + *
> + *  Copyright (c) 2022 Philippe Valembois
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/usb.h>

Outside of hid_is_usb(), you are not using anything USB related, so
this can be dropped

> +
> +
> +#define USB_VENDOR_ID_EVISION       0x320f
> +#define USB_DEVICE_ID_EVISION_ICL01 0x5041

We tend to add those variables in drivers/hid/hid-ids.h

> +
> +static int evision_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> +               struct hid_field *field, struct hid_usage *usage,
> +               unsigned long **bit, int *max)
> +{
> +       if ((usage->hid & HID_USAGE_PAGE) != HID_UP_CONSUMER)
> +               return 0;
> +
> +       // Ignore key down event

No C++ comments style please, use /* */ instead

> +       if ((usage->hid & HID_USAGE) >> 8 == 0x05)
> +               return -1;
> +       // Ignore key up event

Same (and for any other // below).

> +       if ((usage->hid & HID_USAGE) >> 8 == 0x06)
> +               return -1;
> +
> +       switch (usage->hid & HID_USAGE) {
> +       // Ignore configuration saved event
> +       case 0x0401: return -1;
> +       // Ignore reset event
> +       case 0x0402: return -1;
> +       }
> +       return 0;
> +}
> +
> +static int evision_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +       int ret;
> +
> +       if (!hid_is_usb(hdev))
> +               return -EINVAL;

This can be dropped...

> +
> +       ret = hid_parse(hdev);
> +       if (ret) {
> +               hid_err(hdev, "EVision hid parse failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +       if (ret) {
> +               hid_err(hdev, "EVision hw start failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;

... which means the probe is the default one, meaning it can also be
dropped from the patch :)

> +}
> +
> +static const struct hid_device_id evision_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_EVISION, USB_DEVICE_ID_EVISION_ICL01) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(hid, evision_devices);
> +
> +static struct hid_driver evision_driver = {
> +       .name = "evision",
> +       .id_table = evision_devices,
> +       .input_mapping = evision_input_mapping,
> +       .probe = evision_probe,

Just for completeness, remove that .probe line and your driver will
behave the same and be smaller :)

> +};
> +module_hid_driver(evision_driver);
> +
> +MODULE_LICENSE("GPL");
> --
> 2.38.2
>

Cheers,
Benjamin

