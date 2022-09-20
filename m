Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05ADA5BE736
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 15:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiITNgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 09:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiITNgU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 09:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67472DC
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663680979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/Gw8dqxf899+aMz+ImrjVvFdg2scrb03Fu/Omi91dys=;
        b=dgkx2FqFJTFKxYT+FKd1txGflZ5wGIQ0FLPAV7NxZ30XGt45hriIHutE9/FL2qycX1sY+D
        njrGs+HLbUYPYIv/Mx/6JECX/pL0WB+rfHusxSEvc8Bq36CPUUgK9tLaOuvmWo1KAnr2r6
        RfMyKDlF8JqcP8BLtMKWhqfmnep8yPU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-ounrbObLNGCZuRh7g2uiUw-1; Tue, 20 Sep 2022 09:36:17 -0400
X-MC-Unique: ounrbObLNGCZuRh7g2uiUw-1
Received: by mail-pf1-f199.google.com with SMTP id a3-20020aa795a3000000b0054b94ce7d12so1741613pfk.17
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/Gw8dqxf899+aMz+ImrjVvFdg2scrb03Fu/Omi91dys=;
        b=HJ6Rgxg3NgsJfNhCLiMsORO/LsDfLPrc49QfsswkiYojyCbpV7IDwK5HYj6VGnPN4r
         DSh+y8WsKXmvHU8oI5lTd5Ntoh5vIxuHF8la9Ja8o7kTsCe5TQea+9V1h/a0D3PPl95e
         t3l06zeXamm8CN+L2g0FA0VtQEG6QmOuYVIsRaa7gIXk1n8A9R/RnNFyY5TNFOVPwWVg
         qnXKgfEl//7rcNPOzhnZ5OwOvjtD0SuUlG7sUvDcNcFlhp/GhtMWH53G5bAJ7upxa0fq
         rO6vknG4iemrrt2b96x+TxzVbPTQDaBifiH6tSdTN1DSUqGJSIWkjUiI6S7HHNwtLUvH
         AzZg==
X-Gm-Message-State: ACrzQf1wivUwERllFs4gJW75ezbu2f4GJ6+cnIqgS1T2/TI+o1YPxxvz
        gMqI1PxJgeCIF39b+9iWpJ43Vl3rZorABzPP6nfyaI81HURk2sQXHxDJMHyNM2w9CfWeY20rXDn
        3hCOzvuc9vWI2OGAMksdPFev80AE6NmzTT3zVA0A=
X-Received: by 2002:a17:90a:f28b:b0:203:627c:7ba1 with SMTP id fs11-20020a17090af28b00b00203627c7ba1mr4028929pjb.191.1663680976698;
        Tue, 20 Sep 2022 06:36:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JJuHHPZTgYP9pt0FACHvwQaUGMW/X6AohqNktnSH2wH5m94AY5w7ge1sqqiI2u/FpVshiDEkmcDXnOGJZkcI=
X-Received: by 2002:a17:90a:f28b:b0:203:627c:7ba1 with SMTP id
 fs11-20020a17090af28b00b00203627c7ba1mr4028903pjb.191.1663680976375; Tue, 20
 Sep 2022 06:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220911003614.297613-1-harry@harrystern.net>
In-Reply-To: <20220911003614.297613-1-harry@harrystern.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Sep 2022 15:36:04 +0200
Message-ID: <CAO-hwJJzMhiBrc_nWm2PAqTeGD1Jm1YShGVyyEbsi5=+NQyxHw@mail.gmail.com>
Subject: Re: [PATCH] hid: topre: Add driver fixing report descriptor
To:     Harry Stern <harry@harrystern.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 11, 2022 at 2:50 AM Harry Stern <harry@harrystern.net> wrote:
>
> The Topre REALFORCE R2 firmware incorrectly reports that interface
> descriptor number 1, input report descriptor 2's events are array events
> rather than variable events. That particular report descriptor is used
> to report keypresses when there are more than 6 keys held at a time.
> This bug prevents events from this interface from being registered
> properly, so only 6 keypresses (from a different interface) can be
> registered at once, rather than full n-key rollover.
>
> This commit fixes the bug by setting the correct value in a report_fixup
> function.
>
> The original bug report can be found here:
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/804
>
> Thanks to Benjamin Tissoires for diagnosing the issue with the report
> descriptor.
>
> Signed-off-by: Harry Stern <harry@harrystern.net>
> ---

Applied to for-6.1/topre in hid.git

Cheers,
Benjamin

>  drivers/hid/Kconfig     |  6 +++++
>  drivers/hid/Makefile    |  1 +
>  drivers/hid/hid-ids.h   |  3 +++
>  drivers/hid/hid-topre.c | 49 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 59 insertions(+)
>  create mode 100644 drivers/hid/hid-topre.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 6ce92830b..c4308d498 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1141,6 +1141,12 @@ config HID_TOPSEED
>         Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
>         CLLRCMCE remote control.
>
> +config HID_TOPRE
> +       tristate "Topre REALFORCE keyboards"
> +       depends on HID
> +       help
> +         Say Y for N-key rollover support on Topre REALFORCE R2 108 key keyboards.
> +
>  config HID_THINGM
>         tristate "ThingM blink(1) USB RGB LED"
>         depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index b0bef8098..bccaec0d7 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_HID_GREENASIA) += hid-gaff.o
>  obj-$(CONFIG_HID_THRUSTMASTER) += hid-tmff.o hid-thrustmaster.o
>  obj-$(CONFIG_HID_TIVO)         += hid-tivo.o
>  obj-$(CONFIG_HID_TOPSEED)      += hid-topseed.o
> +obj-$(CONFIG_HID_TOPRE)        += hid-topre.o
>  obj-$(CONFIG_HID_TWINHAN)      += hid-twinhan.o
>  obj-$(CONFIG_HID_U2FZERO)      += hid-u2fzero.o
>  hid-uclogic-objs               := hid-uclogic-core.o \
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index f80d6193f..50bab12d9 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1231,6 +1231,9 @@
>  #define USB_DEVICE_ID_TIVO_SLIDE       0x1201
>  #define USB_DEVICE_ID_TIVO_SLIDE_PRO   0x1203
>
> +#define USB_VENDOR_ID_TOPRE                    0x0853
> +#define USB_DEVICE_ID_TOPRE_REALFORCE_R2_108                   0x0148
> +
>  #define USB_VENDOR_ID_TOPSEED          0x0766
>  #define USB_DEVICE_ID_TOPSEED_CYBERLINK        0x0204
>
> diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
> new file mode 100644
> index 000000000..88a91cdad
> --- /dev/null
> +++ b/drivers/hid/hid-topre.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  HID driver for Topre REALFORCE Keyboards
> + *
> + *  Copyright (c) 2022 Harry Stern <harry@harrystern.net>
> + *
> + *  Based on the hid-macally driver
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +
> +#include "hid-ids.h"
> +
> +MODULE_AUTHOR("Harry Stern <harry@harrystern.net>");
> +MODULE_DESCRIPTION("REALFORCE R2 Keyboard driver");
> +MODULE_LICENSE("GPL");
> +
> +/*
> + * Fix the REALFORCE R2's non-boot interface's report descriptor to match the
> + * events it's actually sending. It claims to send array events but is instead
> + * sending variable events.
> + */
> +static __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +                                unsigned int *rsize)
> +{
> +       if (*rsize >= 119 && rdesc[69] == 0x29 && rdesc[70] == 0xe7 &&
> +                                                rdesc[71] == 0x81 && rdesc[72] == 0x00) {
> +               hid_info(hdev,
> +                       "fixing up Topre REALFORCE keyboard report descriptor\n");
> +               rdesc[72] = 0x02;
> +       }
> +       return rdesc;
> +}
> +
> +static const struct hid_device_id topre_id_table[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
> +                        USB_DEVICE_ID_TOPRE_REALFORCE_R2_108) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(hid, topre_id_table);
> +
> +static struct hid_driver topre_driver = {
> +       .name                   = "topre",
> +       .id_table               = topre_id_table,
> +       .report_fixup           = topre_report_fixup,
> +};
> +
> +module_hid_driver(topre_driver);
> --
> 2.37.3
>

