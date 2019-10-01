Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0FDC3730
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfJAO1B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:27:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbfJAO1B (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:27:01 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C69A921924;
        Tue,  1 Oct 2019 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569940019;
        bh=0BeOrwEFibuHwTZT+CLGlRuk7Gqhqp2yD9xw+tx0O8Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=CbkMWattwz6iwfU4DrJaqbRSutiXsRe5WUaQvzSUhSQzHtJLaF2Ml8Fqj0lJjojKq
         pJXcDCg8mZkGEX6wsLo7EA6xvQef9TCkE9draPuZ6grXym8sPjEe01+g1t+n4keUIa
         4vl7V30RosfWARbbciF3fLuPZ/r2VP1VAv373fI8=
Date:   Tue, 1 Oct 2019 16:26:33 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jelle van der Waa <jelle@vdwaa.nl>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add support for Razer Blackwidow keyboards
In-Reply-To: <20190705221605.28293-1-jelle@vdwaa.nl>
Message-ID: <nycvar.YFH.7.76.1910011625000.13160@cbobk.fhfr.pm>
References: <20190705221605.28293-1-jelle@vdwaa.nl>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 6 Jul 2019, Jelle van der Waa wrote:

> Add support for the macro keys on the Razor Blackwidow keyboards. By

So I guess it should say 'Razer' here?

> default the macro keys do not work and have to be enabled via a feature
> report. After being enabled they report as XF86Tools, XF86Launch5-8.
> 
> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
> ---
>  drivers/hid/Kconfig     |  7 ++++
>  drivers/hid/Makefile    |  1 +
>  drivers/hid/hid-ids.h   |  3 ++
>  drivers/hid/hid-razer.c | 78 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 89 insertions(+)
>  create mode 100644 drivers/hid/hid-razer.c
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 3872e03d9a59..0b4bc464fc11 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1135,6 +1135,13 @@ config HID_ALPS
>  	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
>  	and want support for its special functionalities.
>  
> +config HID_RAZER
> +	tristate "Razer Blackwidow keyboard support"
> +	depends on HID
> +	---help---
> +	Say Y here if you want the Razer Blackwidow keyboards to enable macro
> +	keys.
> +
>  endmenu
>  
>  endif # HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cc5d827c9164..417168a88193 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -121,6 +121,7 @@ obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
>  obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
>  obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
>  obj-$(CONFIG_HID_VIEWSONIC)	+= hid-viewsonic.o
> +obj-$(CONFIG_HID_RAZER)		+= hid-razer.o

Please keep the list sorted, as it was before.

>  wacom-objs			:= wacom_wac.o wacom_sys.o
>  obj-$(CONFIG_HID_WACOM)		+= wacom.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index b032d3899fa3..8f6ce553b52c 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -955,6 +955,9 @@
>  
>  #define USB_VENDOR_ID_RAZER            0x1532
>  #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW 0x010e
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE 0x011a
> +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_2013 0x011b
>  
>  #define USB_VENDOR_ID_REALTEK		0x0bda
>  #define USB_DEVICE_ID_REALTEK_READER	0x0152
> diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
> new file mode 100644
> index 000000000000..d958fd9f9311
> --- /dev/null
> +++ b/drivers/hid/hid-razer.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * HID driver to enable macro keys on Razer keyboards
> + *
> + * Copyright (c) 2019 Jelle van der Waa <jelle@vdwaa.nl>
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include "hid-ids.h"
> +
> +#define RAZER_BLACKWIDOW_FEATURE_REPORT 0x00
> +#define BUF_SIZE 91
> +
> +static const u8 data[BUF_SIZE] = {0, 0, 0, 0, 0, 0, 2, 0, 4, 2, 0, 0, 0, 0, 0,
> +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +	0, 0, 4, 0};
> +
> +static const struct hid_device_id razer_devices[] = {
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_2013) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE) },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(hid, razer_devices);
> +
> +static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct hid_report_enum *rep_enum;
> +	struct hid_report *rep;
> +	unsigned char *dmabuf;
> +	bool has_ff000002 = false;
> +	int ret = 0;
> +
> +	dmabuf = kmemdup(data, BUF_SIZE, GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
> +
> +	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	rep_enum = &hdev->report_enum[HID_FEATURE_REPORT];
> +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> +		if (rep->maxfield && rep->field[0]->maxusage)
> +			if (rep->field[0]->usage[0].hid == 0xff000002)
> +				has_ff000002 = true;
> +	}
> +
> +	if (has_ff000002) {
> +		ret = hid_hw_raw_request(hdev, RAZER_BLACKWIDOW_FEATURE_REPORT,
> +				dmabuf, BUF_SIZE, HID_FEATURE_REPORT,
> +				HID_REQ_SET_REPORT);
> +		if (ret != BUF_SIZE)
> +			hid_err(hdev, "Razer failed to enable macro keys\n");
> +	}
> +
> +	kfree(dmabuf);
> +
> +	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);

Can't this all be done in userspace via udev script through hidraw?

Thanks,

-- 
Jiri Kosina
SUSE Labs

