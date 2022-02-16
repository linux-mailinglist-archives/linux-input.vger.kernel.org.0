Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765CA4B8D8C
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 17:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbiBPQNJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 11:13:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbiBPQNJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 11:13:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714E9EA74D
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 08:12:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C385B81F6F
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 16:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BDFC004E1;
        Wed, 16 Feb 2022 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645027973;
        bh=B20TMh+LVGa1fsMPZqDR9I6IL92JdRx11nxAtD55gZI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=q+ZTHKrfWBJqlQbbM/DBAKThtFFSUKlHf2aqfnZECc3qS+XfYUbMhxkUzePDvffVy
         UWsg5vxjg9YpU52aRjyBJlf9OALjLm/rv7AibVDDwrGlijCgooqqYieOd4ULKplWga
         FvZDIheqORgspj9VxOYlmUmUtMOMaFzdQywOqTfqO3/tc2hvmYnwwAmv7qNtcwAa1c
         7e94HhMAuVXLOsiv0MoIlUWKIGALhy+U+/AZ8ZDDG+YriyPeKCR1TJwX/n9wxlPAuy
         8SQCxBr2y80/HTH3YTFIMT7MyNh81w5Ks5Svwu7iozzQVnJO6jVw7durrPQpC6oIRx
         hMUcPLyPHKxMw==
Date:   Wed, 16 Feb 2022 17:12:50 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jelle van der Waa <jelle@vdwaa.nl>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jelle van der Waa <jvanderwaa@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: Add driver for Razer Blackwidow keyboards
In-Reply-To: <20220116153425.441642-1-jvanderwaa@redhat.com>
Message-ID: <nycvar.YFH.7.76.2202161712340.11721@cbobk.fhfr.pm>
References: <20211231112500.8350-1-jvanderwaa@redhat.com> <20220116153425.441642-1-jvanderwaa@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 16 Jan 2022, Jelle van der Waa wrote:

> From: Jelle van der Waa <jvanderwaa@redhat.com>
> 
> Add a driver to enable the macro keys (M1 - M5) by default, these are
> mapped to XF86Tools and XF86Launch5 - XF86Launch8. The driver remaps
> them by default to macro keys with an option to retain the old mapping
> which users most likely already use as there are many scripts to enable
> the macro keys available on Github and other websites.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> 
> ---
> 
> * Rename to hid-razer
> * Rename RAZOR to RAZER
> ---
>  drivers/hid/Kconfig     |   7 +++
>  drivers/hid/Makefile    |   1 +
>  drivers/hid/hid-ids.h   |   3 +
>  drivers/hid/hid-razer.c | 122 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 drivers/hid/hid-razer.c
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index f5544157576c..66a5200ce83a 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -929,6 +929,13 @@ config PLAYSTATION_FF
>  	  Say Y here if you would like to enable force feedback support for
>  	  PlayStation game controllers.
>  
> +config HID_RAZER
> +	tristate "Razer non-fully HID-compliant devices"
> +	depends on HID
> +	help
> +	Support for Razer devices that are not fully compliant with the
> +	HID standard.
> +
>  config HID_PRIMAX
>  	tristate "Primax non-fully HID-compliant devices"
>  	depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 6d3e630e81af..501731380f1f 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -99,6 +99,7 @@ hid-picolcd-$(CONFIG_DEBUG_FS)		+= hid-picolcd_debugfs.o
>  obj-$(CONFIG_HID_PLANTRONICS)	+= hid-plantronics.o
>  obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
>  obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
> +obj-$(CONFIG_HID_RAZER)	+= hid-razer.o
>  obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
>  obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
>  obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 26cee452ec44..f5b013d99428 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1029,6 +1029,9 @@
>  #define I2C_PRODUCT_ID_RAYDIUM_3118	0x3118
>  
>  #define USB_VENDOR_ID_RAZER            0x1532
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE   0x010D
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW            0x010e
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_CLASSIC    0x011b
>  #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
>  
>  #define USB_VENDOR_ID_REALTEK		0x0bda
> diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
> new file mode 100644
> index 000000000000..381b80b479c6
> --- /dev/null
> +++ b/drivers/hid/hid-razer.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  HID driver for gaming keys on Razer Blackwidow gaming keyboards
> + *  Macro Key Keycodes: M1 = 191, M2 = 192, M3 = 193, M4 = 194, M5 = 195
> + *
> + *  Copyright (c) 2021 Jelle van der Waa <jvanderwaa@redhat.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include <linux/random.h>
> +#include <linux/sched.h>
> +#include <linux/usb.h>
> +#include <linux/wait.h>
> +
> +#include "hid-ids.h"
> +
> +#define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
> +
> +#define RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE	91
> +
> +static bool macro_key_remapping = 1;
> +module_param(macro_key_remapping, bool, 0644);
> +MODULE_PARM_DESC(macro_key_remapping, " on (Y) off (N)");
> +
> +
> +static unsigned char blackwidow_init[RAZER_BLACKWIDOW_TRANSFER_BUF_SIZE] = {
> +	0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04,
> +	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x04, 0x00
> +};
> +
> +static int razer_input_mapping(struct hid_device *hdev,
> +		struct hid_input *hi, struct hid_field *field,
> +		struct hid_usage *usage, unsigned long **bit, int *max)
> +{
> +
> +	if (!macro_key_remapping)
> +		return 0;
> +
> +	if ((usage->hid & HID_UP_KEYBOARD) != HID_UP_KEYBOARD)
> +		return 0;
> +
> +	switch (usage->hid & ~HID_UP_KEYBOARD) {
> +	case 0x68:
> +		map_key_clear(KEY_MACRO1);
> +		return 1;
> +	case 0x69:
> +		map_key_clear(KEY_MACRO2);
> +		return 1;
> +	case 0x6a:
> +		map_key_clear(KEY_MACRO3);
> +		return 1;
> +	case 0x6b:
> +		map_key_clear(KEY_MACRO4);
> +		return 1;
> +	case 0x6c:
> +		map_key_clear(KEY_MACRO5);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	char *buf;
> +	int ret = 0;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	// Only send the enable macro keys command for the third device identified as mouse input.

I've turned this into kernel-style comment, and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

