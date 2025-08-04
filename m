Return-Path: <linux-input+bounces-13790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D998B19CB0
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 09:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3537B1897166
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 07:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4AF22259D;
	Mon,  4 Aug 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3mnAMPU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1929A2;
	Mon,  4 Aug 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754292710; cv=none; b=uVwPVfqpS2zewqk+gFPZqhy14zcXHyaiOnVd+ywrknwThgrva6dKrbLaX8+28t7ydiG+a2EcDP71IwvN1Kj5Dyi3btoBAblsUHtTcIiVOEoAwI4Gq1sB8TZGIFu9/koHulttjyVbusLP5xOGtx+ujwNSii+M2DSrhHHhE7kDDQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754292710; c=relaxed/simple;
	bh=bXLZe9XlORDB8Up75VZHWWmgBWBoYkuub6VQZHD29b0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FFrWANQtrtjbTdoOekZYpKW6N/vprtOsy1NSEpykhyJwtrzMz8JxiFrUtimBu9BhtcWOuDHj1CQj8EC2ZcgnhYL6vHvqwGJ1Xd0uxOZfun9mQM+Yxb3WKPY3Md8zbD3I65u7/BShUwB5ndWWmVgbhOZq9fsuGaxTXP8LWr7joHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3mnAMPU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754292708; x=1785828708;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bXLZe9XlORDB8Up75VZHWWmgBWBoYkuub6VQZHD29b0=;
  b=a3mnAMPUQ5AS33vz4Zd+8CvCrqLpYtC3Y+NJ6rs/y8GAIYWakvjzt4/G
   imrps+Adp4NsIFN3snczvc3Wmjzy9F8j46FunVXhQYwKo3xTCBDVZ1C/i
   0uPLjYc4NYbE6maE7HMgjWWcBQhW5j9v1EJdzddRF2Wra05/tjeYEx/eZ
   m43biMxIr1hTbrfCylFsSr1eRn9Mdmx8HffU8eBSLRkdyXyaziR6M40Tt
   lWgfuHSABhyxLLeQQ0ZJ1D0Sb024g6pW4q75RLhTHnIx0W25mu2PJru3z
   ylu5QhEyXF9cpCkoFRamIkq914cXrrg96wqeyJ9s4oD6PhUnrtcX3u4W1
   g==;
X-CSE-ConnectionGUID: +HXLMkOsRh6l2UQe8uBlgg==
X-CSE-MsgGUID: 13sFtQ2UQKSq4WpFRfQscQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="44134516"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44134516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:31:47 -0700
X-CSE-ConnectionGUID: 39oXN+ZqQzGHmLlsmF72kQ==
X-CSE-MsgGUID: aiANH4pqS4ij8iQ9H1SV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164540951"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:31:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Aug 2025 10:31:41 +0300 (EEST)
To: Gladyshev Ilya <foxido@foxido.dev>
cc: w_armin@gmx.de, linux-input@vger.kernel.org, 
    nikita.nikita.krasnov@gmail.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: Add WMI driver for Redmibook
 keyboard.
In-Reply-To: <20250730185619.8725-1-foxido@foxido.dev>
Message-ID: <c98adc65-f756-1f4b-aaab-85f7633dd0cc@linux.intel.com>
References: <20250730185619.8725-1-foxido@foxido.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Jul 2025, Gladyshev Ilya wrote:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.
> 
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>

Thank you for the patch. Small correction requests below.

> ---
> Changes since v2:
> - Fix Kconfig dependencies
> - Accept WMI buffers that are bigger than expected
> 
> Link to v2: https://lore.kernel.org/platform-driver-x86/20250729190528.8446-1-foxido@foxido.dev/
> ---
>  MAINTAINERS                      |   6 ++
>  drivers/platform/x86/Kconfig     |  12 +++
>  drivers/platform/x86/Makefile    |   1 +
>  drivers/platform/x86/redmi-wmi.c | 129 +++++++++++++++++++++++++++++++
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0b444e5fd5a..eb25fb10e751 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20965,6 +20965,12 @@ S:	Maintained
>  T:	git https://github.com/pkshih/rtw.git
>  F:	drivers/net/wireless/realtek/rtw89/
>  
> +REDMIBOOK WMI DRIVERS
> +M:	Gladyshev Ilya <foxido@foxido.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/redmi-wmi.c
> +
>  REDPINE WIRELESS DRIVER
>  L:	linux-wireless@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e5cbd58a99f3..9f98a7042e43 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -109,6 +109,18 @@ config XIAOMI_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called xiaomi-wmi.
>  
> +config REDMI_WMI
> +	tristate "Redmibook WMI key driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y here if you want support for WMI-based hotkey events on
> +	  Xiaomi Redmibook devices.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called redmi-wmi.
> +
>  config GIGABYTE_WMI
>  	tristate "Gigabyte WMI temperature driver"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index bea87a85ae75..406dd0807ba7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
>  obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>  obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
> +obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  
>  # Acer
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
> new file mode 100644
> index 000000000000..3dbf4a40a4ff
> --- /dev/null
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* WMI driver for Xiaomi Redmibooks */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#include <uapi/linux/input-event-codes.h>
> +
> +#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"
> +
> +#define AI_KEY_VALUE_MASK 0x00000100
> +
> +static const struct key_entry redmi_wmi_keymap[] = {
> +	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
> +	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
> +	{KE_KEY, 0x00001b01,	{KEY_SETUP}},
> +
> +	/* AI button has code for each position */
> +	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
> +	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
> +
> +	/* Keyboard backlight */
> +	{KE_IGNORE, 0x00000501, {}},
> +	{KE_IGNORE, 0x00800501, {}},
> +	{KE_IGNORE, 0x00050501, {}},
> +	{KE_IGNORE, 0x000a0501, {}},
> +
> +	{KE_END}
> +};
> +
> +struct redmi_wmi {
> +	struct input_dev *input_dev;
> +	/* Protects the key event sequence */
> +	struct mutex key_lock;
> +};
> +
> +static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct redmi_wmi *data;
> +	int err;
> +
> +	/* Init dev */
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	err = devm_mutex_init(&wdev->dev, &data->key_lock);
> +	if (err)
> +		return err;
> +
> +	/* Setup input device */

I'd drop this comment as it doesn't really add much value.

> +	data->input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;
> +	data->input_dev->name = "Redmibook WMI keys";
> +	data->input_dev->phys = "wmi/input0";
> +
> +	err = sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
> +	if (err)
> +		return err;
> +
> +	return input_register_device(data->input_dev);
> +}
> +
> +static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
> +	bool autorelease = true;
> +	int value = 1;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);

To me it feels like these prints from the notify handlers should be 
ratelimited just in case, but then I notice the other drivers don't 
ratelimit them either so perhaps it has never caused an issue.

> +		return;
> +	}
> +
> +	if (obj->buffer.length < 32) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> +		return;
> +	}
> +
> +	/* For linearizability */

This comment doesn't really tell anything we don't know already from 
seeing the mutex being taken.

> +	guard(mutex)(&data->key_lock);
> +
> +	u32 payload = get_unaligned_le32(obj->buffer.pointer);

Please always declare variables at the beginning of a function or a block, 
not in the middle of it. The only allowed exception to this rule is 
cleanup.h related variables as there the cleanup order really matters.

> +	struct key_entry *entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
> +
> +	if (!entry) {
> +		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
> +		return;
> +	}
> +
> +	/* AI key quirk */
> +	if (entry->keycode == KEY_ASSISTANT) {
> +		value = !(payload & AI_KEY_VALUE_MASK);
> +		autorelease = false;
> +	}
> +
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
> +}
> +
> +static const struct wmi_device_id redmi_wmi_id_table[] = {
> +	{ .guid_string = WMI_REDMIBOOK_KEYBOARD_EVENT_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver redmi_wmi_driver = {
> +	.driver = {
> +		.name = "redmi-wmi",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS

Please put a comma on any non-terminating entries so that a future 
diff won't have to add it on that (unrelated) line.

> +	},
> +	.id_table = redmi_wmi_id_table,
> +	.probe = redmi_wmi_probe,
> +	.notify = redmi_wmi_notify,
> +	.no_singleton = true,
> +};
> +module_wmi_driver(redmi_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
> +MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
> +MODULE_DESCRIPTION("Redmibook WMI driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.


