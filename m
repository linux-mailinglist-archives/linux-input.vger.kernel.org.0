Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E155BE730
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbiITNfc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 09:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiITNfS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 09:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040904B0DC
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663680898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vsayBf+vjxANIOwIkgB0cyuQ2jLCowoT3OPiCISHDcU=;
        b=HArjEd++/XY3GP78xoAXLwqDQtWCuCpPwrKTpNkhkMEk0PgM0OHvboRLQO4aWdMGiEzNsS
        Ca08CB7uBN4EEc6iUrykXIfq4cIRkofsj3ZQV+6CJulAbNvmdpgnyRnaSC8l1rGXMqvcXD
        P7j6IbTywl3nG7TFrkDt5cIjAwbam4Y=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-xsXQrn2iNhe4G5congYVIA-1; Tue, 20 Sep 2022 09:34:49 -0400
X-MC-Unique: xsXQrn2iNhe4G5congYVIA-1
Received: by mail-pg1-f199.google.com with SMTP id s15-20020a63524f000000b0043891d55a30so1624303pgl.16
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vsayBf+vjxANIOwIkgB0cyuQ2jLCowoT3OPiCISHDcU=;
        b=GJp4qsusa76RA4p2PyjK4NCRvtq3S8HhSeYdrF5gKgDtqc5T56jCSWQwXKswH5IG+a
         kjDYCN+yzTIxuAuQCi12jGVHilDmPL3c6QmqLY06qRSCdh6YcZuzRCiZT7tOUIsZSUU3
         DHzdqcGuUth8vSv5ZvUYAXAIBc+p858JKp+dt5o61ZfW9FF6u2JILTyvhYDz4H1WYnEZ
         bY86r6p0qL0z1ILkQhLVKPLju14hxxxWlfZ4ArHSbRe7VCJvyaOuD73JcP5PwlFwT7eF
         IvIfa2GoY8cXLl/RtyLUUulfCNb3jpSL18nJITUe135AzMFPMlMVhkSu8oB79zwSOR1n
         5vyg==
X-Gm-Message-State: ACrzQf0J1ZeqWc2t3v+8+sJ7nOpyqgej7dIYgpmOv18vy1mvNWAhGgz4
        rSmST2HEs+GEXFOkkYoDTx6yoLgZ6rwWenGteFqbyW531/2SKpIFT9kI4hF8dUToPE4ZP9TUlOR
        vQ97xwxebk1rN76xbAo4SU2/Jacgr8D0wfiVZZ4w=
X-Received: by 2002:a63:f445:0:b0:43a:2d54:f28d with SMTP id p5-20020a63f445000000b0043a2d54f28dmr8463885pgk.491.1663680888263;
        Tue, 20 Sep 2022 06:34:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dxblwd639ceHSE2X+X0xHDM9fCQ21GWsJSllZguRePHIG18Xv78ifM+HdVKbbqtmh+TrI1YdeGNcAxmYBKvs=
X-Received: by 2002:a63:f445:0:b0:43a:2d54:f28d with SMTP id
 p5-20020a63f445000000b0043a2d54f28dmr8463842pgk.491.1663680887590; Tue, 20
 Sep 2022 06:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220914184345.270456-1-marcus.folkesson@gmail.com>
In-Reply-To: <20220914184345.270456-1-marcus.folkesson@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Sep 2022 15:34:36 +0200
Message-ID: <CAO-hwJJCrf0_V=w8_z1uD=zQKS+9yPBnt8KfnYEahYxe=hc4oQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Add driver for PhoenixRC Flight Controller
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 14, 2022 at 8:38 PM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> The PhoenixRC is a controller with 8 channels for use in flight
> simulators.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Applied to for-6.1/rc-controllers in hid.git

Cheers,
Benjamin

>  MAINTAINERS            |   6 +++
>  drivers/hid/Kconfig    |   9 ++++
>  drivers/hid/Makefile   |   1 +
>  drivers/hid/hid-ids.h  |   1 +
>  drivers/hid/hid-pxrc.c | 112 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 129 insertions(+)
>  create mode 100644 drivers/hid/hid-pxrc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64379c699903..2f70b7d2b4b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8907,6 +8907,12 @@ L:       linux-input@vger.kernel.org
>  S:     Supported
>  F:     drivers/hid/hid-playstation.c
>
> +HID PHOENIX RC FLIGHT CONTROLLER
> +M:     Marcus Folkesson <marcus.folkesson@gmail.com>
> +L:     linux-input@vger.kernel.org
> +S:     Maintained
> +F:     drivers/hid/hid-pxrc.c
> +
>  HID SENSOR HUB DRIVERS
>  M:     Jiri Kosina <jikos@kernel.org>
>  M:     Jonathan Cameron <jic23@kernel.org>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 70da5931082f..8ca58141d5be 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -950,6 +950,15 @@ config PLAYSTATION_FF
>           Say Y here if you would like to enable force feedback support for
>           PlayStation game controllers.
>
> +config HID_PXRC
> +       tristate "PhoenixRC HID Flight Controller"
> +       depends on HID
> +       help
> +       Support for PhoenixRC HID Flight Controller, a 8-axis flight controller.
> +
> +       To compile this driver as a module, choose M here: the
> +       module will be called hid-pxrc.
> +
>  config HID_RAZER
>         tristate "Razer non-fully HID-compliant devices"
>         depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cac2cbe26d11..b3748b97d5b5 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -101,6 +101,7 @@ hid-picolcd-$(CONFIG_DEBUG_FS)              += hid-picolcd_debugfs.o
>  obj-$(CONFIG_HID_PLANTRONICS)  += hid-plantronics.o
>  obj-$(CONFIG_HID_PLAYSTATION)  += hid-playstation.o
>  obj-$(CONFIG_HID_PRIMAX)       += hid-primax.o
> +obj-$(CONFIG_HID_PXRC)         += hid-pxrc.o
>  obj-$(CONFIG_HID_RAZER)        += hid-razer.o
>  obj-$(CONFIG_HID_REDRAGON)     += hid-redragon.o
>  obj-$(CONFIG_HID_RETRODE)      += hid-retrode.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index d9eb676abe96..30ac56cb238b 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1381,6 +1381,7 @@
>
>  #define USB_VENDOR_ID_MULTIPLE_1781    0x1781
>  #define USB_DEVICE_ID_RAPHNET_4NES4SNES_OLD    0x0a9d
> +#define USB_DEVICE_ID_PHOENIXRC        0x0898
>
>  #define USB_VENDOR_ID_DRACAL_RAPHNET   0x289b
>  #define USB_DEVICE_ID_RAPHNET_2NES2SNES        0x0002
> diff --git a/drivers/hid/hid-pxrc.c b/drivers/hid/hid-pxrc.c
> new file mode 100644
> index 000000000000..b0e517f9cde7
> --- /dev/null
> +++ b/drivers/hid/hid-pxrc.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * HID driver for PhoenixRC 8-axis flight controller
> + *
> + * Copyright (C) 2022 Marcus Folkesson <marcus.folkesson@gmail.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +
> +#include "hid-ids.h"
> +
> +struct pxrc_priv {
> +       u8 slider;
> +       u8 dial;
> +       bool alternate;
> +};
> +
> +static __u8 pxrc_rdesc_fixed[] = {
> +       0x05, 0x01,        // Usage Page (Generic Desktop Ctrls)
> +       0x09, 0x04,        // Usage (Joystick)
> +       0xA1, 0x01,        // Collection (Application)
> +       0x09, 0x01,        //   Usage (Pointer)
> +       0xA1, 0x00,        //   Collection (Physical)
> +       0x09, 0x30,        //     Usage (X)
> +       0x09, 0x36,        //     Usage (Slider)
> +       0x09, 0x31,        //     Usage (Y)
> +       0x09, 0x32,        //     Usage (Z)
> +       0x09, 0x33,        //     Usage (Rx)
> +       0x09, 0x34,        //     Usage (Ry)
> +       0x09, 0x35,        //     Usage (Rz)
> +       0x09, 0x37,        //     Usage (Dial)
> +       0x15, 0x00,        //     Logical Minimum (0)
> +       0x26, 0xFF, 0x00,  //     Logical Maximum (255)
> +       0x35, 0x00,        //     Physical Minimum (0)
> +       0x46, 0xFF, 0x00,  //     Physical Maximum (255)
> +       0x75, 0x08,        //     Report Size (8)
> +       0x95, 0x08,        //     Report Count (8)
> +       0x81, 0x02,        //     Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)
> +       0xC0,              //   End Collection
> +       0xC0,              // End Collection
> +};
> +
> +static __u8 *pxrc_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +                               unsigned int *rsize)
> +{
> +       hid_info(hdev, "fixing up PXRC report descriptor\n");
> +       *rsize = sizeof(pxrc_rdesc_fixed);
> +       return pxrc_rdesc_fixed;
> +}
> +
> +static int pxrc_raw_event(struct hid_device *hdev, struct hid_report *report,
> +        u8 *data, int size)
> +{
> +       struct pxrc_priv *priv = hid_get_drvdata(hdev);
> +
> +       if (priv->alternate)
> +               priv->slider = data[7];
> +       else
> +               priv->dial = data[7];
> +
> +       data[1] = priv->slider;
> +       data[7] = priv->dial;
> +
> +       priv->alternate = !priv->alternate;
> +       return 0;
> +}
> +
> +static int pxrc_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +       int ret;
> +       struct pxrc_priv *priv;
> +
> +       priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       hid_set_drvdata(hdev, priv);
> +
> +       ret = hid_parse(hdev);
> +       if (ret) {
> +               hid_err(hdev, "parse failed\n");
> +               return ret;
> +       }
> +
> +       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +       if (ret) {
> +               hid_err(hdev, "hw start failed\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct hid_device_id pxrc_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_MULTIPLE_1781, USB_DEVICE_ID_PHOENIXRC) },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(hid, pxrc_devices);
> +
> +static struct hid_driver pxrc_driver = {
> +       .name = "hid-pxrc",
> +       .id_table = pxrc_devices,
> +       .report_fixup = pxrc_report_fixup,
> +       .probe = pxrc_probe,
> +       .raw_event = pxrc_raw_event,
> +};
> +module_hid_driver(pxrc_driver);
> +
> +MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
> +MODULE_DESCRIPTION("HID driver for PXRC 8-axis flight controller");
> +MODULE_LICENSE("GPL");
> --
> 2.37.1
>

