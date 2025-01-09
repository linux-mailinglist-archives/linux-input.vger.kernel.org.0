Return-Path: <linux-input+bounces-9115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C2A0781A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 14:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5B1161094
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 13:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DAE218AB3;
	Thu,  9 Jan 2025 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2gGvQoW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7635C217F4A;
	Thu,  9 Jan 2025 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430459; cv=none; b=Lz9fyxrMt8otcFW3aVmRjWbejzduNPC5qBlmJMafmvEkWrc0SjPNxB3AZZPyRhWNwTM9iaC//UVyXU31yytesehnyCkZl0S7VuivbF/tOLaEAmmrwojUlB/LilIcI9MWSuLL5TgePJ3iVMgjxoErt2SqRZalTgHlJiXXhrRI9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430459; c=relaxed/simple;
	bh=bYSbpXQ1N/MLs9m1AXvryc9InIe2fSP2Ea2V+Gb98fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtBcgOpn+zSXJxBKiTH2PviaSGoHECEjZKSbrdoxojvgEBJS4x6T8TQJGPNGaFVWgAb8h2PudY/AM0isszO0tB9ZmWeeTDsL+H8C5intyckbvjWaThYhhe/HSPepQyLAbuhafMcG1ljaARVP/49sw8ZOojW02udGoaY7E6/TOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2gGvQoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F3FC4CED2;
	Thu,  9 Jan 2025 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736430459;
	bh=bYSbpXQ1N/MLs9m1AXvryc9InIe2fSP2Ea2V+Gb98fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2gGvQoWl3mckegXPBcV6YNVS5098Xc8vOOr4YQgwLuwaxckaQuYQUB/86oYzREvs
	 WuUQTjfra08HtjqDKfsrVXLJJZnNLkiEvUk/JQ+Tp6Iqh6wOtfwjv3pkpAVE5Dg22E
	 7z938aOXqyAzWfoQuxq3dejsNmkBxQ9WiEBxpCaGakENGI5jcuruhWYjLMtQBSGT/y
	 lZSiDURdyYnvWpeMyhKxcRyMTsmcCQartbWgjgOpQ3Kkwp5aS4Ve0GP1dYaGMsuZdq
	 xUOy8Hq48mGPQ122K7RY1RcqKABetXa5CLTkOIkpj6L9bWRNqLn99C4DNTcEAY4wM2
	 OCjTJfFJS+beA==
Date: Thu, 9 Jan 2025 14:47:34 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Subject: Re: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn
 keys
Message-ID: <dytaipha7hln7ktsh3qpwrtlygtn44bv6y2kqr4nuao6ozfd4s@txduug3hioo3>
References: <20241218143309.86811-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218143309.86811-1-vishnuocv@gmail.com>

On Dec 18 2024, Vishnu Sankar wrote:
> Fn Keys like Mic mute, Power Modes/Airplane mode,Selective
> screenshot/Pickup Phone, KBD Backlight and
> star/Favourites is emitted as HID raw events in X12 Tab1 and Tab2.
> This support has been added.
> 
> Thinkpad X12 TAB 2 and TAB 1 Folio keyboard's raw events will get
> detected as Fn keys with this patch.
> 
> Default fn_lock state for these Keyboards are OFF.
> 
> Other than these changes, we follow TP10UKBD's processes.
> 
> Tested on X12 Tab 2.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> V2
> -Rebased to hid.git
> V3
> -Renamed the patch to HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
> -Fn Key macros changed to 4 bytes.
> -Raw data check will look for 4 bytes instead of 3
> -le32_to_cpu () used instead of shift operator to make 32 bit data.
> -iternate through all hid inputs to find the device who generated the event,
> instead of selecting the first available input.
> -removed Fn-F7 as it is working by default.
> -only 4 bytes hid raw data being handled now.
> -additional check to ensure report-id is 0x03.
> ---
>  drivers/hid/hid-lenovo.c | 99 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> index f66194fde891..bfaadd54cba1 100644
> --- a/drivers/hid/hid-lenovo.c
> +++ b/drivers/hid/hid-lenovo.c
> @@ -31,12 +31,20 @@
>  #include <linux/input.h>
>  #include <linux/leds.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_profile.h>
>  
>  #include "hid-ids.h"
>  
>  /* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
>  #define LENOVO_KEY_MICMUTE KEY_F20
>  
> +/* HID raw events for ThinkPad X12 Tabs*/
> +#define TP_X12_RAW_HOTKEY_FN_F4		0x00020003
> +#define TP_X12_RAW_HOTKEY_FN_F8		0x38001003
> +#define TP_X12_RAW_HOTKEY_FN_F10	0x00000803
> +#define TP_X12_RAW_HOTKEY_FN_F12	0x00000403
> +#define TP_X12_RAW_HOTKEY_FN_SPACE	0x18001003
> +
>  struct lenovo_drvdata {
>  	u8 led_report[3]; /* Must be first for proper alignment */
>  	int led_state;
> @@ -71,6 +79,14 @@ struct lenovo_drvdata {
>  #define TP10UBKBD_LED_OFF		1
>  #define TP10UBKBD_LED_ON		2
>  
> +/* Function to report raw_events as key events*/
> +static inline void report_key_event(struct input_dev *input, int keycode)
> +{
> +	input_report_key(input, keycode, 1);
> +	input_report_key(input, keycode, 0);
> +	input_sync(input);
> +}
> +
>  static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
>  				    enum led_brightness value)
>  {
> @@ -472,6 +488,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
>  							       usage, bit, max);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
>  		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
> @@ -582,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device *dev,
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		lenovo_features_set_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -680,6 +700,55 @@ static const struct attribute_group lenovo_attr_group_cptkbd = {
>  	.attrs = lenovo_attributes_cptkbd,
>  };
>  
> +/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
> +static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
> +{
> +	struct hid_input *hidinput;
> +	struct input_dev *input = NULL;
> +
> +	/* Iterate through all associated input devices */
> +	list_for_each_entry(hidinput, &hdev->inputs, list) {
> +		input = hidinput->input;
> +		if (!input)
> +			continue;
> +
> +		switch (raw_data) {
> +			/* fn-F20 being used here for MIC mute*/
> +		case TP_X12_RAW_HOTKEY_FN_F4:
> +			report_key_event(input, LENOVO_KEY_MICMUTE);
> +			return 1;
> +		/* Power-mode or Airplane mode will be called based on the device*/
> +		case TP_X12_RAW_HOTKEY_FN_F8:
> +			/*
> +			 * TP X12 TAB uses Fn-F8 calls Airplanemode
> +			 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
> +			 * Power modes
> +			 */
> +			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
> +				report_key_event(input, KEY_RFKILL) :
> +				platform_profile_cycle();

Hey,

FWIW, this broke the CI with [0]:
ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] undefined!

We are likely missing a DEPENDS or a SELECT in the Kconfig


Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/bentiss/hid/-/jobs/69090460

> +			return 1;
> +		case TP_X12_RAW_HOTKEY_FN_F10:
> +			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
> +			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
> +			report_key_event(input, KEY_PICKUP_PHONE) :
> +			report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
> +			return 1;
> +		case TP_X12_RAW_HOTKEY_FN_F12:
> +			/* BookMarks/STAR key*/
> +			report_key_event(input, KEY_BOOKMARKS);
> +			return 1;
> +		case TP_X12_RAW_HOTKEY_FN_SPACE:
> +			/* Keyboard LED backlight toggle*/
> +			report_key_event(input, KEY_KBDILLUMTOGGLE);
> +			return 1;
> +		default:
> +			break;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static int lenovo_raw_event(struct hid_device *hdev,
>  			struct hid_report *report, u8 *data, int size)
>  {
> @@ -697,6 +766,15 @@ static int lenovo_raw_event(struct hid_device *hdev,
>  		data[2] = 0x01;
>  	}
>  
> +	/*
> +	 * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report ID is 0x03
> +	 * e.g.: Raw data received for MIC mute is 0x00020003.
> +	 */
> +	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
> +			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
> +			&& size >= 3 && report->id == 0x03))
> +		return lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(*(u32 *)data));
> +
>  	return 0;
>  }
>  
> @@ -776,6 +854,8 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
>  	case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		return lenovo_event_cptkbd(hdev, field, usage, value);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1057,6 +1137,8 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
>  	case USB_DEVICE_ID_LENOVO_TPKBD:
>  		lenovo_led_set_tpkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1243,8 +1325,15 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
>  	 * We cannot read the state, only set it, so we force it to on here
>  	 * (which should be a no-op) to make sure that our state matches the
>  	 * keyboard's FN-lock state. This is the same as what Windows does.
> +	 *
> +	 * For X12 TAB and TAB2, the default windows behaviour Fn-lock Off.
> +	 * Adding additional check to ensure the behaviour in case of
> +	 * Thinkpad X12 Tabs.
>  	 */
> -	data->fn_lock = true;
> +
> +	data->fn_lock = !(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB ||
> +			hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2);
> +
>  	lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lock);
>  
>  	ret = sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
> @@ -1288,6 +1377,8 @@ static int lenovo_probe(struct hid_device *hdev,
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		ret = lenovo_probe_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1375,6 +1466,8 @@ static void lenovo_remove(struct hid_device *hdev)
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		lenovo_remove_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1429,6 +1522,10 @@ static const struct hid_device_id lenovo_devices[] = {
>  		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 

