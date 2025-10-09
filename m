Return-Path: <linux-input+bounces-15343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E8BC998C
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 16:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410883AAE45
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 14:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD4B2EA490;
	Thu,  9 Oct 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SqW4U91+"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CAB16EB42;
	Thu,  9 Oct 2025 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021051; cv=none; b=pdA6Pbca+qsUQ8ut8/LBaqoKSAkvouBnOpjF/bp2RFwIyLgQx3j/+npZuwXI2Nj/uJsd+6LfV24oFHsfDxa43pb1Bcko7O8qz6Xov/7vsQvcEfL6K82v1v7OcWR/ycuZEyMAX0m0+lRLNa23S0ABJcMm8NR8WxQLPgDRi5fmMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021051; c=relaxed/simple;
	bh=vOUpPB5u5i02tf+Vp6YLQLkyLztgJp+bJtZ4O6POdI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqi6htUUYBuqaImEVa8k+DSubDmwLzztCb2M0pV40tip49MMZ66fRi+AZDxdlMGE1su9TsdlQrj3XIK//1BiRoQMA+4sX7ltN1IAQ0NCkWJjNYHq3sASpy5IDdRc6UQIfMy2pQ4sG/ZbOXG4x8Yze0r9H/aJfJn9NOWDskMWpEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SqW4U91+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ud9pM9KG0Mb/TVq8w99+LW7M4Nntxs3k8VF1KybKcP4=; t=1760021049;
	x=1760453049; b=SqW4U91+CrN1HzGQg+1IjcNcIyWngiFwCuylI+mXdXyp+p0myjTyHuW7o5eF4
	3hoULLbbUxKvLgWe7kaKrxd1hr2PzephhmrdvL3OlPVx5tkilo5UV+Hl1VJjyzeGlImB5KS9w8vj9
	Mmuhry83rCgDyoIT5HlVqOItY/IK7LYRl9oP1nBO5F8qbfHJ88CeRQ7GejEMbE1FqjM7PMTLFSquA
	hDImxJjBki78E1pWp3kXZLelyp8GYsdpsA6qmIF1chNgyHv6wa3rMqP45QcSGOHQpHajeVvCqtGzt
	zi3+1ODwht8VapbJhA5qRM/uM61QdwlcOOCf/ZOXwU/6V5AGVQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1v6rs7-004Iy2-1B;
	Thu, 09 Oct 2025 16:43:59 +0200
Message-ID: <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
Date: Thu, 9 Oct 2025 16:43:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1760021049;1b64e586;
X-HE-SMSGID: 1v6rs7-004Iy2-1B

On 8/19/25 01:08, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> Define a new structure that contains simple haptic device configuration
> as well as current state.
> Add functions that recognize auto trigger and manual trigger reports
> as well as save their addresses.
> Verify that the pressure unit is either grams or newtons.
> Mark the input device as a haptic touchpad if the unit is correct and
> the reports are found.
>  [...]
> +config HID_HAPTIC
> +	tristate "Haptic touchpad support"
> +	default n
> +	help
> +	Support for touchpads with force sensors and haptic actuators instead of a
> +	traditional button.
> +	Adds extra parsing and FF device for the hid multitouch driver.
> +	It can be used for Elan 2703 haptic touchpad.
> +
> +	If unsure, say N.
> +
>  menu "Special HID drivers"

I suspect this change is related to a build error I ran into today:

  MODPOST Module.symvers
ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1

The config where this occurred had this:

CONFIG_HID=y
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_HAPTIC=m

Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.

Ciao, Thorsten  
>  config HID_A4TECH
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 10ae5dedbd84708d988ea1f594d409ccebd85ebb..361a7daedeb85454114def8afb5f58caeab58a00 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -4,6 +4,7 @@
>  #
>  hid-y			:= hid-core.o hid-input.o hid-quirks.o
>  hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
> +hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
>  
>  obj-$(CONFIG_HID_BPF)		+= bpf/
>  
> diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d659a430c1a6b06ded31d49efe4bded909671cb6
> --- /dev/null
> +++ b/drivers/hid/hid-haptic.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID Haptic support for Linux
> + *
> + *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
> + */
> +
> +#include "hid-haptic.h"
> +
> +void hid_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage *usage)
> +{
> +	if (usage->hid == HID_HP_AUTOTRIGGER) {
> +		if (usage->usage_index >= field->report_count) {
> +			dev_err(&hdev->dev,
> +				"HID_HP_AUTOTRIGGER out of range\n");
> +			return;
> +		}
> +
> +		hid_device_io_start(hdev);
> +		hid_hw_request(hdev, field->report, HID_REQ_GET_REPORT);
> +		hid_hw_wait(hdev);
> +		hid_device_io_stop(hdev);
> +		haptic->default_auto_trigger =
> +			field->value[usage->usage_index];
> +		haptic->auto_trigger_report = field->report;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
> +
> +bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field)
> +{
> +	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
> +		return true;
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
> +
> +int hid_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max)
> +{
> +	if (usage->hid == HID_HP_MANUALTRIGGER) {
> +		haptic->manual_trigger_report = field->report;
> +		/* we don't really want to map these fields */
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(hid_haptic_input_mapping);
> +
> +int hid_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi)
> +{
> +
> +	if (hi->application == HID_DG_TOUCHPAD) {
> +		if (haptic->auto_trigger_report &&
> +		    haptic->manual_trigger_report) {
> +			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
> +			return 1;
> +		}
> +		return 0;
> +	}
> +	return -1;
> +}
> +EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
> diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e89addf5ec280d5b9a59d06088cc08bd4f445c1
> --- /dev/null
> +++ b/drivers/hid/hid-haptic.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  HID Haptic support for Linux
> + *
> + *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
> + */
> +
> +#include <linux/hid.h>
> +
> +#define HID_HAPTIC_ORDINAL_WAVEFORMNONE 1
> +#define HID_HAPTIC_ORDINAL_WAVEFORMSTOP 2
> +
> +#define HID_HAPTIC_MODE_DEVICE 0
> +#define HID_HAPTIC_MODE_HOST 1
> +
> +struct hid_haptic_effect {
> +	u8 *report_buf;
> +	struct input_dev *input_dev;
> +	struct work_struct work;
> +	struct list_head control;
> +	struct mutex control_mutex;
> +};
> +
> +struct hid_haptic_effect_node {
> +	struct list_head node;
> +	struct file *file;
> +};
> +
> +struct hid_haptic_device {
> +	struct input_dev *input_dev;
> +	struct hid_device *hdev;
> +	struct hid_report *auto_trigger_report;
> +	struct mutex auto_trigger_mutex;
> +	struct workqueue_struct *wq;
> +	struct hid_report *manual_trigger_report;
> +	struct mutex manual_trigger_mutex;
> +	size_t manual_trigger_report_len;
> +	int pressed_state;
> +	s32 pressure_sum;
> +	s32 force_logical_minimum;
> +	s32 force_physical_minimum;
> +	s32 force_resolution;
> +	u32 mode;
> +	u32 default_auto_trigger;
> +	u32 vendor_page;
> +	u32 vendor_id;
> +	u32 max_waveform_id;
> +	u32 max_duration_id;
> +	u16 *hid_usage_map;
> +	u32 *duration_map;
> +	u16 press_ordinal;
> +	u16 release_ordinal;
> +	struct hid_haptic_effect *effect;
> +	struct hid_haptic_effect stop_effect;
> +};
> +
> +#if IS_ENABLED(CONFIG_HID_HAPTIC)
> +void hid_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage
> +				*usage);
> +bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field);
> +int hid_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max);
> +int hid_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi);
> +#else
> +static inline
> +void hid_haptic_feature_mapping(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_field *field, struct hid_usage
> +				*usage)
> +{}
> +static inline
> +bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
> +				    struct hid_input *hi, struct hid_field *field)
> +{
> +	return false;
> +}
> +static inline
> +int hid_haptic_input_mapping(struct hid_device *hdev,
> +			     struct hid_haptic_device *haptic,
> +			     struct hid_input *hi,
> +			     struct hid_field *field, struct hid_usage *usage,
> +			     unsigned long **bit, int *max)
> +{
> +	return 0;
> +}
> +static inline
> +int hid_haptic_input_configured(struct hid_device *hdev,
> +				struct hid_haptic_device *haptic,
> +				struct hid_input *hi)
> +{
> +	return 0;
> +}
> +#endif
> 


