Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6098840FA94
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 16:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhIQOoR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 10:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbhIQOoP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 10:44:15 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087F4C061764;
        Fri, 17 Sep 2021 07:42:52 -0700 (PDT)
Date:   Fri, 17 Sep 2021 16:42:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1631889769; bh=UnfkOUCn9nZ1Kxnm3JIIp2ffcVCWQuInPlmtWOwQf1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4l20a0f1KFCBHsiYnmCPh5CAs6tX2Y1vySCAbSIkF0LqDdHrZHwfoAH1+WTyiMy6
         MgQIdqBeVezCcLqfyRhuXxBjdnxoIZgANYR0UBUAagxfbWI2j7mD/oXMlvP/0Xew9i
         1jQ1LH+4ufH5bgxinBa6M8/uuGFEod6aoXQk/oAE=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Support for side buttons of Xiaomi Mi Dual Mode
 Wireless Mouse Silent Edition
Message-ID: <b80cf0f0-2211-4159-9add-eb4961ce462c@t-8ch.de>
References: <YUOninNA2UMADRVt@ilya-330s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUOninNA2UMADRVt@ilya-330s>
Jabber-ID: thomas@t-8ch.de
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2021-09-16T23:22+0300, Ilya Skriblovsky wrote:
> This patch enables side-buttons of Xiaomi Bluetooth mouse (specifically
> Xiaomi Mi Dual Mode Wireless Mouse Silent Edition).
> 
> The mouse sends invalid button count in its HID Report Descriptor and
> this patch just replaces its descriptor with corrected one. With this
> driver side buttons work as expected acting like Back/Forward buttons.
> 
> Signed-off-by: Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
> ---
> Changes since v1:
>  - Fixed syntax of Kconfig
> ---
>  drivers/hid/Kconfig      |   7 +++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-xiaomi.c | 103 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 drivers/hid/hid-xiaomi.c
> 
> [..]
> diff --git a/drivers/hid/hid-xiaomi.c b/drivers/hid/hid-xiaomi.c
> new file mode 100644
> index 000000000000..56e8edd3d62f
> --- /dev/null
> +++ b/drivers/hid/hid-xiaomi.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * HID driver for Xiaomi Mi Dual Mode Wireless Mouse Silent Edition
> + *
> + * Copyright (c) 2021 Ilya Skriblovsky
> + */
> +
> +/*
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the Free
> + * Software Foundation; either version 2 of the License, or (at your option)
> + * any later version.
> + */

This license blurb is unnecessary.
FYI the SPDX-License-Identifier says GPL-2.0 (only!) but the blurb specifies "or
later".

> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>

linux/kernel.h should not be necessary.

> +#include <linux/hid.h>
> +
> +#define USB_VENDOR_ID_XIAOMI    0x2717
> +#define USB_DEVICE_ID_MI_SILENT_MOUSE   0x5014

These should go into drivers/hid/hid-ids.h.

> +
> +/* Fixed Mi Silent Mouse report descriptor */
> +/* Button's Usage Maximum changed from 3 to 5 to make side buttons work */
> +#define MI_SILENT_MOUSE_ORIG_RDESC_LENGTH   87
> +static __u8 mi_silent_mouse_rdesc_fixed[] = {
> +	0x05, 0x01,         /*  Usage Page (Desktop),               */
> +	0x09, 0x02,         /*  Usage (Mouse),                      */
> +	0xA1, 0x01,         /*  Collection (Application),           */
> +	0x85, 0x03,         /*      Report ID (3),                  */
> +	0x09, 0x01,         /*      Usage (Pointer),                */
> +	0xA1, 0x00,         /*      Collection (Physical),          */
> +	0x05, 0x09,         /*          Usage Page (Button),        */
> +	0x19, 0x01,         /*          Usage Minimum (01h),        */
> +	0x29, 0x05, /* X */ /*          Usage Maximum (05h),        */
> +	0x15, 0x00,         /*          Logical Minimum (0),        */
> +	0x25, 0x01,         /*          Logical Maximum (1),        */
> +	0x75, 0x01,         /*          Report Size (1),            */
> +	0x95, 0x05,         /*          Report Count (5),           */
> +	0x81, 0x02,         /*          Input (Variable),           */
> +	0x75, 0x03,         /*          Report Size (3),            */
> +	0x95, 0x01,         /*          Report Count (1),           */
> +	0x81, 0x01,         /*          Input (Constant),           */
> +	0x05, 0x01,         /*          Usage Page (Desktop),       */
> +	0x09, 0x30,         /*          Usage (X),                  */
> +	0x09, 0x31,         /*          Usage (Y),                  */
> +	0x15, 0x81,         /*          Logical Minimum (-127),     */
> +	0x25, 0x7F,         /*          Logical Maximum (127),      */
> +	0x75, 0x08,         /*          Report Size (8),            */
> +	0x95, 0x02,         /*          Report Count (2),           */
> +	0x81, 0x06,         /*          Input (Variable, Relative), */
> +	0x09, 0x38,         /*          Usage (Wheel),              */
> +	0x15, 0x81,         /*          Logical Minimum (-127),     */
> +	0x25, 0x7F,         /*          Logical Maximum (127),      */
> +	0x75, 0x08,         /*          Report Size (8),            */
> +	0x95, 0x01,         /*          Report Count (1),           */
> +	0x81, 0x06,         /*          Input (Variable, Relative), */
> +	0xC0,               /*      End Collection,                 */
> +	0xC0,               /*  End Collection,                     */
> +	0x06, 0x01, 0xFF,   /*  Usage Page (FF01h),                 */
> +	0x09, 0x01,         /*  Usage (01h),                        */
> +	0xA1, 0x01,         /*  Collection (Application),           */
> +	0x85, 0x05,         /*      Report ID (5),                  */
> +	0x09, 0x05,         /*      Usage (05h),                    */
> +	0x15, 0x00,         /*      Logical Minimum (0),            */
> +	0x26, 0xFF, 0x00,   /*      Logical Maximum (255),          */
> +	0x75, 0x08,         /*      Report Size (8),                */
> +	0x95, 0x04,         /*      Report Count (4),               */
> +	0xB1, 0x02,         /*      Feature (Variable),             */
> +	0xC0                /*  End Collection                      */
> +};
> +
> +static __u8 *xiaomi_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +				 unsigned int *rsize)
> +{
> +	switch (hdev->product) {
> +	case USB_DEVICE_ID_MI_SILENT_MOUSE:
> +		if (*rsize == MI_SILENT_MOUSE_ORIG_RDESC_LENGTH) {
> +			hid_info(hdev, "fixing up Mi Silent Mouse report descriptor\n");
> +			rdesc = mi_silent_mouse_rdesc_fixed;
> +			*rsize = sizeof(mi_silent_mouse_rdesc_fixed);
> +		}
> +		break;
> +	}
> +	return rdesc;
> +}
> +
> +static const struct hid_device_id xiaomi_devices[] = {
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_XIAOMI, USB_DEVICE_ID_MI_SILENT_MOUSE) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, xiaomi_devices);
> +
> +static struct hid_driver xiaomi_driver = {
> +	.name = "xiaomi",
> +	.id_table = xiaomi_devices,
> +	.report_fixup = xiaomi_report_fixup,
> +};
> +module_hid_driver(xiaomi_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Ilya Skriblovsky <IlyaSkriblovsky@gmail.com>");
> +MODULE_DESCRIPTION("Fixing side buttons of Xiaomi Mi Silent Mouse");
> -- 
> 2.30.2
> 
