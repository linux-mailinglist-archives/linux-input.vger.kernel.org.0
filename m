Return-Path: <linux-input+bounces-13750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295FB17CB2
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 08:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D07991C24DA6
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 06:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2933778F26;
	Fri,  1 Aug 2025 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DV4FXQp/"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC0DDC3;
	Fri,  1 Aug 2025 06:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754028043; cv=none; b=Ne0GwgvAR0YdUswGIxgpFW8VH6v8vmbg1yhQ9r3lMuM07YgIWh5rHCcBhFdandvj4zBLFzeH0h2X6ajtRrxBV+f4g3VZx4anI9npwj72r2TKIJVpK1OGjCfIIzajDUvAPbeM+csRGNBYQST0AMN7tIIoxtJqfKpmfCPU+p49q9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754028043; c=relaxed/simple;
	bh=Uk6FNkjiuU6KebCqcIkLmVP5LAzCcrrnI83BBYjUbIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOkkmxnhbndrEzUKJxCV0hFg9GL8+gQTkuzNex6PoUGnndxjm3NXsbqw9dz7KY15V1/C7k0hocjw/ZTWiFIHYVcvZu1tcAbjan639CdUCX4QI8Da93XZLTtfeBiNJWjasYTIfj5SuWEXX70GqUn7WSqm749HX2fRB2dOMp4rqXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DV4FXQp/; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754028038; x=1754632838; i=w_armin@gmx.de;
	bh=izZmsp93jevYHwwBsyPpdSc6PEJGVjnNB2jeH/0/B68=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DV4FXQp/iYcnGNiPB70dHl8LhNE9CuOOg/M6lDJ86eioCKqoz6PHEnappfrGFQzf
	 6YhYsCOy8vewPRUKN+XIw5BnYK4dSTLkFcKVxE24cdolI6aIbpG0L+xfVOR42ph+g
	 /TNFZgYIKi9N8TfOKZYVshmLsYFbNpsn9zrE0oR9lbjmAGjCGFOXA3c8SeKXFduoT
	 SRt8/0dHbMdphSvDdMwKzn5pO//5iZ+amRixBIoVUV8YG+g3n6x9utea4uE3Zg0Vy
	 xc78UahdoDNy5NDBZLHMpBz5OpH8uxCTKoCuGMJhKClE5sclrjF8rnXrMG7Qbz+LF
	 KZByqAx7eM/Mv3c1Mg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1uSdum3SIb-00t6T2; Fri, 01
 Aug 2025 08:00:37 +0200
Message-ID: <c3314673-0b9d-464a-81cf-7cf1bd737a8b@gmx.de>
Date: Fri, 1 Aug 2025 08:00:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: Add WMI driver for Redmibook keyboard.
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: linux-input@vger.kernel.org, nikita.nikita.krasnov@gmail.com,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250730185619.8725-1-foxido@foxido.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250730185619.8725-1-foxido@foxido.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s/x6Q7YoWb4Sq1+0MSVvMLtEDHRIIKiVeRGz280RJxYZliOE41P
 HT7CMiDKspw8lWSe0qufSyOMPufa1iZ5yE4x3WOVCrKBXJKyyjwILo+rlixrT4LpGsS1o8v
 l3bVxzFQ2xiVETn8IIZWkbjYkhJBZSDDZ+8YVV8sZpOEgyagoZi5a0CeKkWlyfHnDSTq0xU
 AVgylWuvN99NVRmEnGCRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vRi6Vlswy+4=;WCzs9OU+dscIHzNiw/ZEvq6taqE
 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

Am 30.07.25 um 20:56 schrieb Gladyshev Ilya:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.
>
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
> Changes since v2:
> - Fix Kconfig dependencies
> - Accept WMI buffers that are bigger than expected
>
> Link to v2: https://lore.kernel.org/platform-driver-x86/20250729190528.8=
446-1-foxido@foxido.dev/
> ---
>   MAINTAINERS                      |   6 ++
>   drivers/platform/x86/Kconfig     |  12 +++
>   drivers/platform/x86/Makefile    |   1 +
>   drivers/platform/x86/redmi-wmi.c | 129 +++++++++++++++++++++++++++++++
>   4 files changed, 148 insertions(+)
>   create mode 100644 drivers/platform/x86/redmi-wmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0b444e5fd5a..eb25fb10e751 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20965,6 +20965,12 @@ S:	Maintained
>   T:	git https://github.com/pkshih/rtw.git
>   F:	drivers/net/wireless/realtek/rtw89/
>  =20
> +REDMIBOOK WMI DRIVERS
> +M:	Gladyshev Ilya <foxido@foxido.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/redmi-wmi.c
> +
>   REDPINE WIRELESS DRIVER
>   L:	linux-wireless@vger.kernel.org
>   S:	Orphan
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e5cbd58a99f3..9f98a7042e43 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -109,6 +109,18 @@ config XIAOMI_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called xiaomi-wmi.
>  =20
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
>   config GIGABYTE_WMI
>   	tristate "Gigabyte WMI temperature driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index bea87a85ae75..406dd0807ba7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+=3D huawei-wmi.o
>   obj-$(CONFIG_MXM_WMI)			+=3D mxm-wmi.o
>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
> +obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
>  =20
>   # Acer
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/red=
mi-wmi.c
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
> +#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563B=
CA757FEF"
> +
> +#define AI_KEY_VALUE_MASK 0x00000100
> +
> +static const struct key_entry redmi_wmi_keymap[] =3D {
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
> +static int redmi_wmi_probe(struct wmi_device *wdev, const void *context=
)
> +{
> +	struct redmi_wmi *data;
> +	int err;
> +
> +	/* Init dev */
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	err =3D devm_mutex_init(&wdev->dev, &data->key_lock);
> +	if (err)
> +		return err;
> +
> +	/* Setup input device */
> +	data->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;

Please leave a blank line here.

> +	data->input_dev->name =3D "Redmibook WMI keys";
> +	data->input_dev->phys =3D "wmi/input0";
> +
> +	err =3D sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
> +	if (err)
> +		return err;
> +
> +	return input_register_device(data->input_dev);
> +}
> +
> +static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
> +{
> +	struct redmi_wmi *data =3D dev_get_drvdata(&wdev->dev);
> +	bool autorelease =3D true;
> +	int value =3D 1;
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length < 32) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length)=
;
> +		return;
> +	}
> +
> +	/* For linearizability */
> +	guard(mutex)(&data->key_lock);

You only need to guard the actual input reporting, so please move the guar=
d just above the call to
sparse_keymap_report_entry().

> +
> +	u32 payload =3D get_unaligned_le32(obj->buffer.pointer);
> +	struct key_entry *entry =3D sparse_keymap_entry_from_scancode(data->in=
put_dev, payload);
> +
> +	if (!entry) {
> +		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
> +		return;
> +	}
> +
> +	/* AI key quirk */
> +	if (entry->keycode =3D=3D KEY_ASSISTANT) {
> +		value =3D !(payload & AI_KEY_VALUE_MASK);
> +		autorelease =3D false;
> +	}
> +
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease)=
;
> +}
> +
> +static const struct wmi_device_id redmi_wmi_id_table[] =3D {
> +	{ .guid_string =3D WMI_REDMIBOOK_KEYBOARD_EVENT_GUID },

Please use "{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL }," instead.

With the above issues fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +	{ }
> +};
> +
> +static struct wmi_driver redmi_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "redmi-wmi",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS
> +	},
> +	.id_table =3D redmi_wmi_id_table,
> +	.probe =3D redmi_wmi_probe,
> +	.notify =3D redmi_wmi_notify,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(redmi_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
> +MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
> +MODULE_DESCRIPTION("Redmibook WMI driver");
> +MODULE_LICENSE("GPL");

