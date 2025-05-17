Return-Path: <linux-input+bounces-12402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAABABA761
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 02:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D7DD7A4FA6
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 00:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADF679F2;
	Sat, 17 May 2025 00:43:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FE4C97
	for <linux-input@vger.kernel.org>; Sat, 17 May 2025 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442627; cv=none; b=hN+YEp2ezzyZourstXq9hp6z1JY53sd72aPfSL8enOvSGgmGl3SNwuEBB9AWblIOH1hTWUBBhDYDFUOOncVvBfdNiiJnA4jtgesOCb1iCbsaCcXCuC3KctfJ8eeGxjG3F6B90Ok0s9WIPlANyI0OP0/FDYAx2MFIBq2zQpHA4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442627; c=relaxed/simple;
	bh=LJq9h2bWj7wxnQLpCCVeSfiu7RXCUavrGwMexRdJbfs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QGCAttgRTAYs0pPWSVmK4b1rid/LcxNouv2HTq1hFFwd5yXYge1BnutXjGVnPzzN3UCZY1PuXR9NoaC0KC1eTaM6WYFoVj0jnWp1p3wysULwR+H8nexRSSZQ+q+u1VaFsimHzrZKEXLfE2lpMOx7ZnWpOBmPu9lycaQHXWcqTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id D253F1D5DFCB;
	Fri, 16 May 2025 17:43:38 -0700 (PDT)
Message-ID: <3f964f27-a174-4179-8d96-709814758e7c@cosmicgizmosystems.com>
Date: Fri, 16 May 2025 17:20:40 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH] HID: add support for Rakk Dasig X mouse (248a:8266)
To: keenplify <keenplify@gmail.com>, linux-input@vger.kernel.org
Cc: jikos@kernel.org
References: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
 <20250515190640.15600-1-keenplify@gmail.com>
Content-Language: en-US
In-Reply-To: <20250515190640.15600-1-keenplify@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Keenplify,

You should run checkpatch.pl on your patch and fix all the issues it points out.

On 5/15/25 12:06 PM, keenplify wrote:
> This adds a HID quirk driver for the Rakk Dasig X gaming mouse
> to expose the side buttons properly via evdev. The default report
> descriptor does not expose all inputs, so this driver replaces
> it with a fixed descriptor.
> 
> Reported-by: Keenplify <keenplify@gmail.com>
> Tested-by: Keenplify <keenplify@gmail.com>
> Signed-off-by: Keenplify <keenplify@gmail.com>
> Signed-off-by: keenplify <keenplify@gmail.com>
> ---
>  drivers/hid/Kconfig    |  6 ++++++
>  drivers/hid/Makefile   |  1 +
>  drivers/hid/hid-ids.h  |  3 +++
>  drivers/hid/hid-rakk.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+)
>  create mode 100644 drivers/hid/hid-rakk.c
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index a503252702b7..a2cf200e841b 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1413,6 +1413,12 @@ config HID_KUNIT_TEST
>  
>  	  If in doubt, say "N".
>  
> +config HID_RAKK
> +	tristate "RAKK HID driver"
> +	depends on HID
> +	help
> +		Support for the RAKK HID device.
> +
>  endmenu
>  
>  source "drivers/hid/bpf/Kconfig"
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 10ae5dedbd84..4ece64ebf2ec 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
>  obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
>  obj-$(CONFIG_HID_PXRC)		+= hid-pxrc.o
>  obj-$(CONFIG_HID_RAZER)	+= hid-razer.o
> +obj-$(CONFIG_HID_RAKK)		+= hid-rakk.o
>  obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
>  obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
>  obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 288a2b864cc4..a052a307fdda 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1520,4 +1520,7 @@
>  #define USB_VENDOR_ID_SIGNOTEC			0x2133
>  #define USB_DEVICE_ID_SIGNOTEC_VIEWSONIC_PD1011	0x0018
>  
> +#define USB_VENDOR_ID_RAKK        0x248a
> +#define USB_DEVICE_ID_RAKK_DASIGX 0xfa02

Rakk does not have a USB vendor ID. VID 0x248a belongs to Telink.
And product ID 0xfa02 is for the Telink Wireless Receiver.
You are patching a Telink device, not a Rakk device.
It just so happens that Rakk is using Telink chip sets.
Many other keyboard and mice vendors may also be using Telink chips.
So pretty much everywhere, rakk should be telink.

> +
>  #endif
> diff --git a/drivers/hid/hid-rakk.c b/drivers/hid/hid-rakk.c
> new file mode 100644
> index 000000000000..38abf92e764a
> --- /dev/null
> +++ b/drivers/hid/hid-rakk.c
> @@ -0,0 +1,45 @@
> +#include <linux/module.h>
> +#include <linux/hid.h>
> +
> +#include "hid-ids.h"
> +
> +static const __u8 *rakk_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +                                     unsigned int *rsize)
> +
> +{
> +    static __u8 fixed_rdesc[] = {
> +        0x05, 0x01, 0x09, 0x02, 0xa1, 0x01, 0x85, 0x01,
> +        0x09, 0x01, 0xa1, 0x00, 0x05, 0x09, 0x19, 0x01,
> +        0x29, 0x05,
> +        0x15, 0x00, 0x25, 0x01, 0x75, 0x01, 0x95, 0x05,
> +        0x81, 0x02, 0x75, 0x03, 0x95, 0x01, 0x81, 0x01,
> +        0x05, 0x01, 0x09, 0x30, 0x09, 0x31, 0x16, 0x01,
> +        0x80, 0x26, 0xff, 0x7f, 0x75, 0x10, 0x95, 0x02,
> +        0x81, 0x06, 0x09, 0x38, 0x15, 0x81, 0x25, 0x7f,
> +        0x75, 0x08, 0x95, 0x01, 0x81, 0x06, 0xc0, 0xc0
> +    };

You can't replace the device's report descriptor, which has keyboard and mouse parts,
with a stripped down (and repaired) report descriptor that only has the mouse parts.
Any wireless keyboard that uses the Telink Wireless Receiver will stop working.

> +
> +    if (*rsize >= sizeof(fixed_rdesc)) {
> +        *rsize = sizeof(fixed_rdesc);
> +        return fixed_rdesc;
> +    }

Just verify the report descriptor is an exact match to the one you captured
in size and content. If it matches then fix the one byte that needs fixing in place.

Regards,
Terry

> +
> +    return rdesc;
> +}
> +
> +static const struct hid_device_id rakk_devices[] = {
> +    { HID_USB_DEVICE(USB_VENDOR_ID_RAKK, USB_DEVICE_ID_RAKK_DASIGX) },
> +    { }
> +};
> +MODULE_DEVICE_TABLE(hid, rakk_devices);
> +
> +static struct hid_driver rakk_driver = {
> +    .name = "hid-rakk",
> +    .id_table = rakk_devices,
> +    .report_fixup = rakk_report_fixup,
> +};
> +module_hid_driver(rakk_driver);
> +
> +MODULE_AUTHOR("keenplify");
> +MODULE_DESCRIPTION("Fix for Rakk Dasig X side buttons");
> +MODULE_LICENSE("GPL");
> \ No newline at end of file


