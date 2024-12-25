Return-Path: <linux-input+bounces-8766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DA9FC38B
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 05:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E184165205
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 04:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDD81CA8D;
	Wed, 25 Dec 2024 04:35:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5BB17FE;
	Wed, 25 Dec 2024 04:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735101330; cv=none; b=rUyOi0M/dsIJN0irFhZ0WJbfzvVv5C1JyfSMm+u1R1uYPQfhFNWfFsmQV4lfpqDkOwoOzphy75d28XUMppK+tVIDTabDHBFICN3ZlLMMYPv71DuDmAb2LFq2Hcuo1mcj5puv8MrBlaDJfc2XOtl0PjOQjsrqCRlMJpuGUvcJAvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735101330; c=relaxed/simple;
	bh=sDgb7im0r4huN+INdN99AJxrTH6x+Qzw6ogMJ0/+Yjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqQmYMwPkBS8VSF35rtx8sd6qwA8IJ5PfcrN8Otn+ymkENxz2Gu1gr1F/BhsB/oHGSNtL5WtkasZeXxYNuQGH7QD4DWJ9UXCQmr1bugWNldYKAkCUgsn8VdV1mM1Xedg2iFjOlWBr6yDLswwUNpqB38GMwVrAmDAIV/GBSL8nOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id E9ECE2584CA3;
	Tue, 24 Dec 2024 20:35:25 -0800 (PST)
Message-ID: <4a25e5d0-5e09-4246-8d70-8083d3189d53@cosmicgizmosystems.com>
Date: Tue, 24 Dec 2024 20:35:25 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] HID: hid-plantronics: Add mic mute mapping and
 generalize quirks
To: Wade Wang <wade.wang@hp.com>, jikos@kernel.org, tiwai@suse.com,
 bentiss@kernel.org, perex@perex.cz
Cc: linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 stable@vger.kernel.org
References: <20241224065636.1870713-1-wade.wang@hp.com>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20241224065636.1870713-1-wade.wang@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Also, FYI

base-commit: bcde95ce32b666478d6737219caa4f8005a8f201

for the series...

Thanks,

On 12/23/24 10:56 PM, Wade Wang wrote:
> From: Terry Junge <linuxhid@cosmicgizmosystems.com>
> 
> Add mapping for headset mute key events.
> 
> Remove PLT_QUIRK_DOUBLE_VOLUME_KEYS quirk and made it generic.
> The quirk logic did not keep track of the actual previous key
> so any key event occurring in less than or equal to 5ms was ignored.
> 
> Remove PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS quirk.
> It had the same logic issue as the double key quirk and was actually
> masking the as designed behavior of most of the headsets.
> It's occurrence should be minimized with the ALSA control naming
> quirk that is part of the patch set.
> 
> Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2: Optimize out 2 macros - no functional changes
> 
>  drivers/hid/hid-plantronics.c | 144 ++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
> index 25cfd964dc25..acb9eb18f7cc 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -6,9 +6,6 @@
>   *  Copyright (c) 2015-2018 Terry Junge <terry.junge@plantronics.com>
>   */
>  
> -/*
> - */
> -
>  #include "hid-ids.h"
>  
>  #include <linux/hid.h>
> @@ -23,30 +20,28 @@
>  
>  #define PLT_VOL_UP		0x00b1
>  #define PLT_VOL_DOWN		0x00b2
> +#define PLT_MIC_MUTE		0x00b5
>  
>  #define PLT1_VOL_UP		(PLT_HID_1_0_PAGE | PLT_VOL_UP)
>  #define PLT1_VOL_DOWN		(PLT_HID_1_0_PAGE | PLT_VOL_DOWN)
> +#define PLT1_MIC_MUTE		(PLT_HID_1_0_PAGE | PLT_MIC_MUTE)
>  #define PLT2_VOL_UP		(PLT_HID_2_0_PAGE | PLT_VOL_UP)
>  #define PLT2_VOL_DOWN		(PLT_HID_2_0_PAGE | PLT_VOL_DOWN)
> +#define PLT2_MIC_MUTE		(PLT_HID_2_0_PAGE | PLT_MIC_MUTE)
> +#define HID_TELEPHONY_MUTE	(HID_UP_TELEPHONY | 0x2f)
> +#define HID_CONSUMER_MUTE	(HID_UP_CONSUMER | 0xe2)
>  
>  #define PLT_DA60		0xda60
>  #define PLT_BT300_MIN		0x0413
>  #define PLT_BT300_MAX		0x0418
>  
> -
> -#define PLT_ALLOW_CONSUMER (field->application == HID_CP_CONSUMERCONTROL && \
> -			    (usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER)
> -
> -#define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
> -#define PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS BIT(1)
> -
>  #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
> -#define PLT_FOLLOWED_OPPOSITE_KEY_TIMEOUT 220 /* ms */
>  
>  struct plt_drv_data {
>  	unsigned long device_type;
> -	unsigned long last_volume_key_ts;
> -	u32 quirks;
> +	unsigned long last_key_ts;
> +	unsigned long double_key_to;
> +	__u16 last_key;
>  };
>  
>  static int plantronics_input_mapping(struct hid_device *hdev,
> @@ -58,34 +53,43 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>  	unsigned short mapped_key;
>  	struct plt_drv_data *drv_data = hid_get_drvdata(hdev);
>  	unsigned long plt_type = drv_data->device_type;
> +	int allow_mute = usage->hid == HID_TELEPHONY_MUTE;
> +	int allow_consumer = field->application == HID_CP_CONSUMERCONTROL &&
> +			(usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER &&
> +			usage->hid != HID_CONSUMER_MUTE;
>  
>  	/* special case for PTT products */
>  	if (field->application == HID_GD_JOYSTICK)
>  		goto defaulted;
>  
> -	/* handle volume up/down mapping */
>  	/* non-standard types or multi-HID interfaces - plt_type is PID */
>  	if (!(plt_type & HID_USAGE_PAGE)) {
>  		switch (plt_type) {
>  		case PLT_DA60:
> -			if (PLT_ALLOW_CONSUMER)
> +			if (allow_consumer)
>  				goto defaulted;
> -			goto ignored;
> +			if (usage->hid == HID_CONSUMER_MUTE) {
> +				mapped_key = KEY_MICMUTE;
> +				goto mapped;
> +			}
> +			break;
>  		default:
> -			if (PLT_ALLOW_CONSUMER)
> +			if (allow_consumer || allow_mute)
>  				goto defaulted;
>  		}
> +		goto ignored;
>  	}
> -	/* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
> -	/* 'basic telephony compliant' - allow default consumer page map */
> -	else if ((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
> -		 (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
> -		if (PLT_ALLOW_CONSUMER)
> -			goto defaulted;
> -	}
> -	/* not 'basic telephony' - apply legacy mapping */
> -	/* only map if the field is in the device's primary vendor page */
> -	else if (!((field->application ^ plt_type) & HID_USAGE_PAGE)) {
> +
> +	/* handle standard consumer control mapping */
> +	/* and standard telephony mic mute mapping */
> +	if (allow_consumer || allow_mute)
> +		goto defaulted;
> +
> +	/* handle vendor unique types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
> +	/* if not 'basic telephony compliant' - map vendor unique controls */
> +	if (!((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
> +	      (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) &&
> +	      !((field->application ^ plt_type) & HID_USAGE_PAGE))
>  		switch (usage->hid) {
>  		case PLT1_VOL_UP:
>  		case PLT2_VOL_UP:
> @@ -95,8 +99,11 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>  		case PLT2_VOL_DOWN:
>  			mapped_key = KEY_VOLUMEDOWN;
>  			goto mapped;
> +		case PLT1_MIC_MUTE:
> +		case PLT2_MIC_MUTE:
> +			mapped_key = KEY_MICMUTE;
> +			goto mapped;
>  		}
> -	}
>  
>  /*
>   * Future mapping of call control or other usages,
> @@ -105,6 +112,8 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>   */
>  
>  ignored:
> +	hid_dbg(hdev, "usage: %08x (appl: %08x) - ignored\n",
> +		usage->hid, field->application);
>  	return -1;
>  
>  defaulted:
> @@ -123,38 +132,26 @@ static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
>  			     struct hid_usage *usage, __s32 value)
>  {
>  	struct plt_drv_data *drv_data = hid_get_drvdata(hdev);
> +	unsigned long prev_tsto, cur_ts;
> +	__u16 prev_key, cur_key;
>  
> -	if (drv_data->quirks & PLT_QUIRK_DOUBLE_VOLUME_KEYS) {
> -		unsigned long prev_ts, cur_ts;
> +	/* Usages are filtered in plantronics_usages. */
>  
> -		/* Usages are filtered in plantronics_usages. */
> +	/* HZ too low for ms resolution - double key detection disabled */
> +	/* or it is a key release - handle key presses only. */
> +	if (!drv_data->double_key_to || !value)
> +		return 0;
>  
> -		if (!value) /* Handle key presses only. */
> -			return 0;
> +	prev_tsto = drv_data->last_key_ts + drv_data->double_key_to;
> +	cur_ts = drv_data->last_key_ts = jiffies;
> +	prev_key = drv_data->last_key;
> +	cur_key = drv_data->last_key = usage->code;
>  
> -		prev_ts = drv_data->last_volume_key_ts;
> -		cur_ts = jiffies;
> -		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_DOUBLE_KEY_TIMEOUT)
> -			return 1; /* Ignore the repeated key. */
> -
> -		drv_data->last_volume_key_ts = cur_ts;
> +	/* If the same key occurs in <= double_key_to -- ignore it */
> +	if (prev_key == cur_key && time_before_eq(cur_ts, prev_tsto)) {
> +		hid_dbg(hdev, "double key %d ignored\n", cur_key);
> +		return 1; /* Ignore the repeated key. */
>  	}
> -	if (drv_data->quirks & PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS) {
> -		unsigned long prev_ts, cur_ts;
> -
> -		/* Usages are filtered in plantronics_usages. */
> -
> -		if (!value) /* Handle key presses only. */
> -			return 0;
> -
> -		prev_ts = drv_data->last_volume_key_ts;
> -		cur_ts = jiffies;
> -		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_FOLLOWED_OPPOSITE_KEY_TIMEOUT)
> -			return 1; /* Ignore the followed opposite volume key. */
> -
> -		drv_data->last_volume_key_ts = cur_ts;
> -	}
> -
>  	return 0;
>  }
>  
> @@ -196,12 +193,16 @@ static int plantronics_probe(struct hid_device *hdev,
>  	ret = hid_parse(hdev);
>  	if (ret) {
>  		hid_err(hdev, "parse failed\n");
> -		goto err;
> +		return ret;
>  	}
>  
>  	drv_data->device_type = plantronics_device_type(hdev);
> -	drv_data->quirks = id->driver_data;
> -	drv_data->last_volume_key_ts = jiffies - msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
> +	drv_data->double_key_to = msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
> +	drv_data->last_key_ts = jiffies - drv_data->double_key_to;
> +
> +	/* if HZ does not allow ms resolution - disable double key detection */
> +	if (drv_data->double_key_to < PLT_DOUBLE_KEY_TIMEOUT)
> +		drv_data->double_key_to = 0;
>  
>  	hid_set_drvdata(hdev, drv_data);
>  
> @@ -210,29 +211,10 @@ static int plantronics_probe(struct hid_device *hdev,
>  	if (ret)
>  		hid_err(hdev, "hw start failed\n");
>  
> -err:
>  	return ret;
>  }
>  
>  static const struct hid_device_id plantronics_devices[] = {
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3210_SERIES),
> -		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES),
> -		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES),
> -		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES),
> -		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES),
> -		.driver_data = PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
> -					 USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES),
> -		.driver_data = PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>  	{ }
>  };
> @@ -241,6 +223,14 @@ MODULE_DEVICE_TABLE(hid, plantronics_devices);
>  static const struct hid_usage_id plantronics_usages[] = {
>  	{ HID_CP_VOLUMEUP, EV_KEY, HID_ANY_ID },
>  	{ HID_CP_VOLUMEDOWN, EV_KEY, HID_ANY_ID },
> +	{ HID_TELEPHONY_MUTE, EV_KEY, HID_ANY_ID },
> +	{ HID_CONSUMER_MUTE, EV_KEY, HID_ANY_ID },
> +	{ PLT2_VOL_UP, EV_KEY, HID_ANY_ID },
> +	{ PLT2_VOL_DOWN, EV_KEY, HID_ANY_ID },
> +	{ PLT2_MIC_MUTE, EV_KEY, HID_ANY_ID },
> +	{ PLT1_VOL_UP, EV_KEY, HID_ANY_ID },
> +	{ PLT1_VOL_DOWN, EV_KEY, HID_ANY_ID },
> +	{ PLT1_MIC_MUTE, EV_KEY, HID_ANY_ID },
>  	{ HID_TERMINATOR, HID_TERMINATOR, HID_TERMINATOR }
>  };
>  


