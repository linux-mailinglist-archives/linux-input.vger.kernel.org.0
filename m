Return-Path: <linux-input+bounces-14138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED3B2BED0
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 12:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E60D07A56D0
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E890726B74F;
	Tue, 19 Aug 2025 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFIQneHU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D627A13A;
	Tue, 19 Aug 2025 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755598978; cv=none; b=JC/ZBAZWgAdU76XaJwp3qQg+hx2GUrEsLYapjxMdrJwGnak2jyO8VVwm+tKoX88eRHMfvb3XFyfvgS0JAPdlTf96ujuHtT6PhL5pCRD6qf4+uGu2mnXwp6y9Jyx1VWIXdg5B0hWv1Q1H0VlgavjJBrVjsX29EubH9BaNEQB5qTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755598978; c=relaxed/simple;
	bh=j95Um73gyG4EtltIsfdN0ieCULPUTUdPkrOxfnhQWiw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=njzNnTCCCQw019fD6fQAWmxa/+VUro48PEVsEPdAnicSahZCJ7AG63CTWlsqVsUQuBCLOv8CCIURVmR6BK2R66Q7pjf+m4mOnff33PTqZwMGFGrXrBXKHRaV7q8nCS3A/62TtFGVkgct/ZS0Xv+CQ5jk/SrgnGVTphE3H8JnUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFIQneHU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755598978; x=1787134978;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=j95Um73gyG4EtltIsfdN0ieCULPUTUdPkrOxfnhQWiw=;
  b=lFIQneHULSInvHOW18Q3RV7rGIZUP+jRkotkJV3YfjIV6AAFR3GdRc/B
   rNgOkFkNXIXWK25uoRk1L0yjHS6bN6ODfskUaDT62r6tuKsxzW06HDdgb
   0uPRiCFKS2DE3eL6XfhqfL+zpAK3Sf/ixCQk3MbmlqqBz7v50CrkpX7pg
   wJUCYjIW8QK01B3YjcjA9Cpd+pZfKNfGke+isi2AGWiJVwo1mHgA0+kF0
   kyEV5yn5MokTg6TIa00sGHF+QXd1KNHKHmvOYvgUAhtprM6nsYqbJVZ3K
   v0KZDsp6mUMrqwLYshVkMwmj75LixDNx/5A6Dnk9L07tuHQwsHToQh4mg
   A==;
X-CSE-ConnectionGUID: XThKuLDxQwqs+YiA7Rt5rQ==
X-CSE-MsgGUID: bXXjyfyqScK/i0FS6cGFwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57984851"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57984851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:22:56 -0700
X-CSE-ConnectionGUID: QvlZq7gwQ9+E/5LhCsTkdQ==
X-CSE-MsgGUID: wxs8UbLiQcSp83OgTe8Nxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168616509"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:22:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 13:22:49 +0300 (EEST)
To: Gladyshev Ilya <foxido@foxido.dev>
cc: Armin Wolf <w_armin@gmx.de>, linux-input@vger.kernel.org, 
    nikita.nikita.krasnov@gmail.com, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5] platform/x86: Add WMI driver for Redmibook
 keyboard.
In-Reply-To: <20250813153137.18355-1-foxido@foxido.dev>
Message-ID: <0ed8cf19-09cc-52cd-bc55-bf3f5d9e0c33@linux.intel.com>
References: <20250813153137.18355-1-foxido@foxido.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Aug 2025, Gladyshev Ilya wrote:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
> Changes since v4:
> - Cosmetic fixes from Ilpo's review (posted on v3)
> 
> Link to v4: https://lore.kernel.org/platform-driver-x86/20250801120321.9742-1-foxido@foxido.dev
> ---
>  MAINTAINERS                      |   6 ++
>  drivers/platform/x86/Kconfig     |  12 +++
>  drivers/platform/x86/Makefile    |   1 +
>  drivers/platform/x86/redmi-wmi.c | 128 +++++++++++++++++++++++++++++++
>  4 files changed, 147 insertions(+)
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
> index 000000000000..104c4953d67d
> --- /dev/null
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -0,0 +1,128 @@
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
> +	data->input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;
> +
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
> +	u32 payload;
> +	int value = 1;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length < 32) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> +		return;
> +	}
> +
> +	payload = get_unaligned_le32(obj->buffer.pointer);
> +	struct key_entry *entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);

Please only define variables at the beginning of some block (in this case, 
at the beginning of the function).

The only exception to this rule are cleanup.h related variables which may 
have to be defined mid-function to ensure the correct teardown order of 
the auto variables.

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
> +	guard(mutex)(&data->key_lock);
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
> +}
> +
> +static const struct wmi_device_id redmi_wmi_id_table[] = {
> +	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver redmi_wmi_driver = {
> +	.driver = {
> +		.name = "redmi-wmi",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
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


