Return-Path: <linux-input+bounces-13722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC76B164C6
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 18:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1232A188B910
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 16:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A8D2DC339;
	Wed, 30 Jul 2025 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="j1+AwkfI"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE41A0BF3;
	Wed, 30 Jul 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753893208; cv=none; b=pp3T/ooizzIabcq6sfJS5kEr7CTpThncE0NiUtRTqIuOy93ge72jAc6V/jMvCyCszmVGXwM7H+jACIxcpNVx9BaES668T9WEH5+4XhA6dmoUPM9MApEjc0Hh21ZCnrn8+Stt8Ih2yFQXAd3yZ2m/ew+Vqt/DxOGNmasgMyYxuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753893208; c=relaxed/simple;
	bh=FErZ7xZ8PnuFVP1dJiBHysI+aQYdPuyQaBx7RLrY850=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyLmg9mO09eHijW2Chn37neVTA4a5gzUhRnO0S1jRJQ6MdgR4Cyz40FFAEnlgijytP+V4ep9mbuh1iXEpzd5KIVrEtAFZ3pmSuCCbng9wfenpebgtSZ/xukdB4cdSvad++FIBa7wdJVAeo3G68p7g0TGgFdP6LEICZyGRlyLhWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=j1+AwkfI; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753893203; x=1754498003; i=w_armin@gmx.de;
	bh=H3eF3lfoWbUqzXlZ3cF1HjhIfnKdDXgrzJwKQR2tsNA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=j1+AwkfIg9/EDictWNCofoALi98Bz0XELcL2tvLmCkeGJ88woULrSjE21ksjOLK8
	 mRWaSsLaUTUTAjxTYsaKaHV9i5rYhLwXV28SF8g1vEuCxY5RjKpe9rVYv8g5wOxkm
	 Ig73QO21OSda6GowVeuWGPEFi9C2sDj4c7qxHjDdoXb6y/739B1cgmg9HgXCwZXDa
	 TBxb97VCLg+T6wfDCnFrTcOgTXCyKdhw281J4eLItpigBoC9q7ljYSems4qLyN3xt
	 XejCITCX37hoIvVSMtzshi5BM1ktOziv3T/stzttsPhikum3nMsw6BS7ns139Sn/q
	 o73u75VmKIAgHucWXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1ujde60QB7-002NOg; Wed, 30
 Jul 2025 18:33:23 +0200
Message-ID: <8e7f2cde-f068-4696-8298-f83619dfaf76@gmx.de>
Date: Wed, 30 Jul 2025 18:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add WMI driver for Redmibook keyboard.
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: linux-input@vger.kernel.org, nikita.nikita.krasnov@gmail.com,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250729190528.8446-1-foxido@foxido.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250729190528.8446-1-foxido@foxido.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oM2oG3/UrgyyWCyHPnuLLjIJ95hmrOwJwDTSzsTa4OAduLcs3oR
 qeELq8wT2PEP5LQXOJHgVJzMh9vV+lDnk1IgzluTNwgqgaG0dkmiAga2FeaALeVWixbUkXA
 vjwJvkYpl0NyS66/JLuxQSnts/UCAt+biPIDRh6/qu1KnMG55B78jp4Mr9UOUFBgLVCw7H9
 09Qzpk3u+nn/s5Z2oR/9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZmAXzYlLidY=;2SMEWfMPfsu8GusgRzaequmE7yu
 xc4oskkcdUlt4Cr01DbnjvtMcB3+BdFiWevG9tHVsfcVes3LlTndmLhzXdikdxsYva+wE/Lpb
 7S9ZiYrMXdBiep4HhBFoA5Qn6Z9FQIG2tHY5g5dAyPTrCTS1+FdBkPtHV3tU0qOzremXt8hL/
 7EI48FBD9qaryAwXasSwZ2BT82BuDe4vDLGvrjJdl4VUjfye4Z+QlmwdTHk0du0FGbI9zKFxX
 T2WMp9P0qa0Nsqn4A9FN/fwX4KJLjx5WGaQTYmdihORBLnO3Yp1jxSNMCJ+bX7z9J6rXU9zCG
 Qk+Vyj3XdczKzy9slNOTWPZUaWUGRSQG7NMW8MOPaNC/hPfe5sBLrVp5Yf1jgQAwcFHaSzvTJ
 YbSjQFKJf1UiiE3YzLjiNM0CVsUWP+p0Gc4SRU0p9Wib4pX7dilJJaJNVHCJqlCnYReDgPmMV
 vjaEFEZzPtvJ87vvWlL7F/3pq4AILfGQiI6OzWMiIICudXKw8mji7N9jhKUPWOGfd0tR4Gab3
 cJbztm3LoTabHu4MTCxgZoV+EfIGKYQVY8DEI4DzEqQRDTk4AxtuYJnJw8rNSzDcs9PXnN0gn
 2SLGziodzg3Izh2fmjLLEK2A/9eD7zuTUjXztB3Wl+Hu94FJO7SUzfYtM3gAOIVWTiUoE6ChF
 uwDuV5sSA48R9mg+K5qQjrz0AIH68NrQ+DX1PQDPWD+nUCiahCUqkpjJ8FitILvgSQ5k+r5Ej
 nKUG9peFPfxu9VnyIj65LmSvtBZpH9JbYT1Z8z+kAtiH3+UzwI/c4bSmfthxrdTNMLe7XHwVR
 KbtcBjM0ePR2WIVWMVmD7dpEZHK7/DcIsq3YnkD2PTWOFbhFR2eVYKGqEYDYXYK7/m8fYp/cx
 Q0bX/6AgZrfVQWY7p2zQNfymOzV1SLfpUuPAaLAiE3ETK49lw9Enq+YVQLupiR4JMvhn9KAUz
 A4evpjd7TZlB1DLemZWoTUS7Vpj7FOYpdvNum5WkuCW9WN0TbfRQHWaAPjGgBI/F1hgi/Auwf
 jWft3bKkXIuR0gS+XrJPiUgsqxfRLBr07hROB4Dgf/e5dtM3VKN9ZNAMS8KWj+rOZOLVe5OOd
 bSbur51LHC6FX0/o6P3ovQAyt3JsFVLmMyDXYnGIoxMJuj1JlwLAVZTp4xKYQ+X101RUgzzAK
 fv0eOCb65ZZkqNkEX/qLXb8ksWoLUSBtlFK51Bd30Qvpd0UwtKwxNZnsMvZnBAM9L5lC/57/h
 ARBANAGmVXmBoqt2y0UTBoSYFUijSsl2yiwHiClne5K/vYxfxgKsua4p6D6Fkc8o79C8klAye
 8vMeIVbdRPRmJe8iCYdfgxUvfvOabAQVx+/KJPKnS+PHA+y/wcZpG0gQqOxiNx1CfQVvh4LUQ
 nbxNwALaHTf1HWUJJCag4FQcAeVtLdPOf5Es3/IixeLmwBb8ONH1YOjwYxcjGGcRwJ2m/NYVS
 ZM/oAWQAXTVIB3vdkQoNTAim8XxShT0HVc2359izaWoen3PUInO2AuJc05xA+inCrM5l2gW+7
 8tDzP0XVNeKO45Q7yvjTMhNKxOh6Cw1Gg6/MJVFuGFIUpFap5a/0oj3NDYa8ZMsoQpVMeuaVk
 NQe32VpI4oZNWqEc3jXv0Ts2F1opSfYKc3sZ+CzPrxZMHYp84icswYpL5UND0TlDp2tyiQ6cn
 +YoBF4nn9SfEBSgbAykci1xZccM5iFfgnYdyi9EAL4ABw6Vy4ABz2MdeuFJTxttbY/gn01XAU
 qQzfGGPUiSGRS+DPEtzRVW+cWB9Xwh2pkCnrrYyH4OB395plMf//g0vZc65Fe+ZuAfGxTAJ3Q
 4oQcgtGWSjqm7qEc4DURhXsGY6FNQawvuIfu6qjMWX1bZwqPK3UnvlF0ev9RvN3sajBPalok0
 Ioa2y4NFhFx5J/2wEtZ4X1Syc+EvtbNpPsVJa/3TbVM4rzc6l9FrnAi/obJXfRH53EqFijqc0
 q47uM71uYPZDr4QlpFbgPhGe1dmg7zk61rTrkDgk1CLRxDLjcVSF18EkFeeT2DI3DRoUoqybT
 iczEW5ZtQxXxqIkeUrXwxFuh6oyj+UXThXOEmoaN1zsPepIpLc5Ess8GGmgarqOF9eSOCFu07
 2q9F/OPLS2aXF33r0Ig2nnInj78Pp00/b95gJRzaV4C6YnKxs+yDGQUGoiUdTsz4tEv54/gQ2
 wd5071r+CjFR9THr817LAn/o6t5qq+GHD+6QRAqQs37T/OF2zYmHUcZ+Jd2eNkItPkxpUg2qC
 9yzw/cnvCtR/bxbd8XHJgkSKZX2gdBemb1PQKY+ip1AZlK4PdZKBHgNh8vQAMnOEJwB3ozcMx
 a5+cF7LbXGFvrskP9T2W6pinMx0nn/ZBhBMfAQOoib/Qu96nOLstRFeqVabUThMVPvFt20K++
 rHny43SlZI3FwZEeqpXkk4Rhs4gLPYG7DwABHRg+96lf+RFRXTa3PI8/CO6fzLEjbbCePN5IM
 HnNxO3ieU77ZgKt1GvJBNX4oOdvYNdzARed2SJbyoXXxrZ56dgVlcjXyvMfstEMvUP2y7a4Us
 yx0AZCXFFVJ8sgFbgbMKqrSS00pXHqbfaa57By4LLW2bMpYprMi0dwZy73MpSVHVNQx7ztakI
 TmyZSr2Wa18KhdJgXm90tzMoLVaGhtcWLpE/Xk21tNVelAQ2Jauu4AZu/NdEaokkG6ktKExPE
 deOXNXgch3qZaRS18vUIIm4RsXRMpoUiOIc9CgIs8335QpMZoc2ZX9O8e9aa+cIwfzAga/0/N
 Icv3jaqBr96Yx19fDe1DwVkn5VdVwxrdG73geB+wLwlewK69Be7001vD5HDXQbUWJixDFBqWc
 0y3TFJ4JzHz9HuRu0f+fI104EUgvZGBClFn6KLtzh1IiXvYlRcUGhGut60zkZtQFudmSEdH3B
 bSojG3tylTfgLrWmEJ/P92+aHQDsK/52ZpUwUJibeJ90tjGsKaLxs/tsqSLhOajmsAA84t7nC
 JSzxZV+C+yjcZipfdpLqeHpOYLstWoQ/l8WdFvVBiGXfPjCDVmPCAd0APoXhaHcUjRRC0BpZR
 Wf949u2P75H8/NNaarwym413sJT9ktW1nZRaZURTOSnfLQc/apbY+eqSFpVXN29norSgDcTXA
 O6BkdVT3LZnD1HvBq1Xf/qKVJlIns2ihgLUHa4a7gUgtc3z/F/xdWI6L++hu9IGe3AKAwsOgv
 JBNIaYKyZVmY4PphHsSfjkO2DwZLzINqfrBb/xP4KOxhOn3i5GZYzIU0wDYy/sBvCCpZOoh0r
 RgPcPzvR4KnrOn6TfQbSGEtWftf1T57UgPm2AACIKR3ZnxkzRR5oZmXH7xfZHfzQGreJG8A2l
 RU1Ih4NNrFuu66ZaBSvnUOTpIlF5PWOeFROAVjqyKE3tayBS3vjiH5rJiHr9vuJ9xByI0xwrf
 XqPZT2AcbJmKmsz07BfuveqdPIzOhBgwAcDQ6A3QeaITfL9DZZKgfVpy+9tPFLc1jaOwdIJqP
 pq7DFmpVolTs6jDPG3/6Yo7/AVE/981lfoFuZRFkbgzoD4esglzfUtcMO4d0Z1zly3gAF+5X5
 7pacGXu4RNPt61jB+sM4qOhA5T1FmaKyeqM/Pqar0pjpyEVjBoTxFUuLXHIUDcWXaVSvtpAOv
 xR1Doqjg067Bmw=

Am 29.07.25 um 21:05 schrieb Gladyshev Ilya:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.
>
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
>
> Changes from v1:
> - Use sparse-keymap instead of manual matching
> - Fix GUID case so it actually autoloads
> - Other fixes from v1 review
>
> Link to v1: https://lore.kernel.org/platform-driver-x86/20250727223516.2=
9244-1-foxido@foxido.dev/
>
> ---
>   MAINTAINERS                      |   6 ++
>   drivers/platform/x86/Kconfig     |  11 +++
>   drivers/platform/x86/Makefile    |   1 +
>   drivers/platform/x86/redmi-wmi.c | 129 +++++++++++++++++++++++++++++++
>   4 files changed, 147 insertions(+)
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
> index e5cbd58a99f3..3c570cb398d3 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -109,6 +109,17 @@ config XIAOMI_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called xiaomi-wmi.
>  =20
> +config REDMI_WMI
> +	tristate "Redmibook WMI key driver"
> +	depends on ACPI_WMI
> +	depends on INPUT

Please also select INPUT_SPARSEKMAP.

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
> index 000000000000..732688fb94e0
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
> +	int value =3D 1;
> +	bool autorelease =3D true;

Please order the variable declarations using reverse xmas tree order.

> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length !=3D 32) {

Please also accept oversized buffers.

> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length)=
;
> +		return;
> +	}
> +
> +	/* For linearizability */
> +	guard(mutex)(&data->key_lock);
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

I would rather check the payload for 0x00011901 here.

Thanks,
Armin Wolf

> +		autorelease =3D false;
> +	}
> +
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease)=
;
> +}
> +
> +static const struct wmi_device_id redmi_wmi_id_table[] =3D {
> +	{ .guid_string =3D WMI_REDMIBOOK_KEYBOARD_EVENT_GUID },
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

