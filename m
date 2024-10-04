Return-Path: <linux-input+bounces-7058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59398FDEB
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83AD1F2425D
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 07:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CF4136345;
	Fri,  4 Oct 2024 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQZT/6Q6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA013211F;
	Fri,  4 Oct 2024 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027516; cv=none; b=ETLdKd9CmSAL4rdZB7LziZUkdIQr77i6IZVr87ZqU36uJIFnTL9ZzXXB+GdyMmhIq14ITmBwZ0addEynbGOhcyuFV2YQFuLVbEehDY8J994BZj2JhBje4NovO2bmqw7cFz08SccfZRDeW5BM7kU9N60pVIh8681aaECMJZY1h8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027516; c=relaxed/simple;
	bh=ZlbYmRwkOsuRusS5YjxEG/WLJWwza8dhGo6FWakGMtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glw9Q69JImGvlwLxxLXOc5VTiWNC3WBaUGboJjib1m+ATe7jS/5vXcQ427Rcyv0Cwr13JkyF9PkALLLtgPPVNH7CGXWoAzGsU0Gr2eR8Kg8pxOuwaGRdadEv2QxOvMs5qYBp1cSLPP/xMYM+kZ97MaVf8eqslbXQsDRt3uEwurQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQZT/6Q6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2853C4CECD;
	Fri,  4 Oct 2024 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728027515;
	bh=ZlbYmRwkOsuRusS5YjxEG/WLJWwza8dhGo6FWakGMtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQZT/6Q6SP0VWVlafKkShFaX1AX3k3vJ1hqZl1uqtFNd8Xcd3cSoFFZdB10NACc/R
	 tdVy0S0z9Ap96/91i4qQPz5J0pcevHxMIIUKlJSqgufrU9+t6SifbjDexihRqH9BET
	 wT9mj+xi27/kqGY1oDVVeP3Sy/BmHuCljsBzKTG/Q/lSfLikurMINI+vS+/HjZ30wH
	 wwFH2mPjtWbU1N+Y9K0wIvnfkymNM3CpSF038FuI9GpbxmotBrHXvW1r8pZ07TZwsi
	 /epfQzvNquTik4q5Hi3Co+49zULUzjg1GrGZRERHNGF9qRUcZssahGdfOqeR7mps72
	 8LWuyMZ/adFlQ==
Date: Fri, 4 Oct 2024 09:38:31 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Subject: Re: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that
 use HID raw events.
Message-ID: <fmirfyqbkuyxnvb3nqdp35x4uovlg3d546g2z4mi3yjdqbgqtj@qk62ds53ozvo>
References: <20241003095124.7611-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003095124.7611-1-vishnuocv@gmail.com>


IIRC, we already saw a previous version of this patch on the list. So
you are missing a v2, and the changelog after the first "---".

All in all, the subject should be:
[PATCH v2] HID: lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys

(dropped the "that use HID raw events" to make it more concise, and
split hid-lenovo into "HID: lenovo").

If you are happy with my remarks below, please send a v3 with the
subject following the pattern from above.

On Oct 03 2024, Vishnu Sankar wrote:
> Fn Keys like Mic mute, Power Modes/Airplane mode,Selective
> screenshot/Pickup Phone, KBD Backlight, Display mode and
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
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/hid/hid-lenovo.c | 122 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> index 3b0c779ce8f7..86ce6152429d 100644
> --- a/drivers/hid/hid-lenovo.c
> +++ b/drivers/hid/hid-lenovo.c
> @@ -31,12 +31,21 @@
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
> +/* HID raw events for ThinkPas X12 Tabs*/
> +#define TP_X12_RAW_HOTKEY_FN_F4		0x000200
> +#define TP_X12_RAW_HOTKEY_FN_F8		0x100038
> +#define TP_X12_RAW_HOTKEY_FN_F10	0x080000
> +#define TP_X12_RAW_HOTKEY_FN_F12	0x040000
> +#define TP_X12_RAW_HOTKEY_FN_SPACE	0x100018
> +#define TP_X12_RAW_HOTKEY_FN_F7		0x080013
> +
>  struct lenovo_drvdata {
>  	u8 led_report[3]; /* Must be first for proper alignment */
>  	int led_state;
> @@ -71,6 +80,14 @@ struct lenovo_drvdata {
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
> @@ -472,6 +489,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
>  							       usage, bit, max);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
>  	default:
> @@ -581,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device *dev,
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		lenovo_features_set_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
> @@ -678,9 +699,63 @@ static const struct attribute_group lenovo_attr_group_cptkbd = {
>  	.attrs = lenovo_attributes_cptkbd,
>  };
>  
> +/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn keys*/
> +static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
> +{
> +	struct hid_input *hidinput;
> +	struct input_dev *input = NULL;
> +
> +	/* Iterate through the associated inputs to find the correct input device */
> +	list_for_each_entry(hidinput, &hdev->inputs, list) {
> +		input = hidinput->input;
> +		if (input)
> +			break;  /* Use the first valid input device */
> +	}
> +
> +	switch (raw_data) {
> +		/* fn-F20 being used here for MIC mute*/
> +	case TP_X12_RAW_HOTKEY_FN_F4:
> +		report_key_event(input, LENOVO_KEY_MICMUTE);

Now I'm puzzled: you are reporting in this function keys that you never
declared in the input device.

So how can you get the events in userspace, they should be filtered out
by the input stack?

This applies to all the reported keys from here.

Are you sure using raw events is the correct approach?

Also, in other words: could you please share a full hid-recorder output
of the device when you press the keys so I understand where the events
are mapped?

> +		return 1;
> +		/* Power-mode or Airplane mode will be called based on the device*/
> +	case TP_X12_RAW_HOTKEY_FN_F8:
> +		/*
> +		 * TP X12 TAB uses Fn-F8 calls Airplanemode
> +		 * Whereas TP X12 TAB2 uses Fn-F8 for toggling
> +		 * Power modes
> +		 */
> +		(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
> +			report_key_event(input, KEY_RFKILL) :
> +			platform_profile_cycle();
> +		return 1;
> +	case TP_X12_RAW_HOTKEY_FN_F10:
> +		/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
> +		(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
> +		report_key_event(input, KEY_PICKUP_PHONE) :
> +		report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
> +		return 1;
> +	case TP_X12_RAW_HOTKEY_FN_F12:
> +		/* BookMarks/STAR key*/
> +		report_key_event(input, KEY_BOOKMARKS);
> +		return 1;
> +	case TP_X12_RAW_HOTKEY_FN_SPACE:
> +		/* Keyboard LED backlight toggle*/
> +		report_key_event(input, KEY_KBDILLUMTOGGLE);
> +		return 1;
> +	case TP_X12_RAW_HOTKEY_FN_F7:
> +		/* DISPLAY switching when connecting to external monitors*/
> +		report_key_event(input, KEY_SWITCHVIDEOMODE);
> +		return 1;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
>  static int lenovo_raw_event(struct hid_device *hdev,
>  			struct hid_report *report, u8 *data, int size)
>  {
> +	u32 raw_data;
>  	/*
>  	 * Compact USB keyboard's Fn-F12 report holds down many other keys, and
>  	 * its own key is outside the usage page range. Remove extra
> @@ -695,6 +770,32 @@ static int lenovo_raw_event(struct hid_device *hdev,
>  		data[2] = 0x01;
>  	}
>  
> +	/*
> +	 * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report ID is 0x03
> +	 * For eg: Raw data received for MIC mute is 0x03000200.
> +	 */
> +	if (unlikely((hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB
> +			|| hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2)
> +			&& size >= 3)) {
> +		/*
> +		 * data[0] is report ID and is same for all 4byte raw_events from this KBD
> +		 * for eg: Fn+F8 0x03,0x10,0x00,0x38
> +		 * report ID here for most of the keys are 0x03.
> +		 */
> +		if (report->id == 0x03)
> +			raw_data = (data[1] << 16) | (data[2] << 8) | data[3];
> +		/*
> +		 * For some Keys the raw data is 6 bytes long but the last 3 bytes
> +		 * will be always Zeros. There is no report-id documented.
> +		 * For eg: for Fn+F7: 0x08,0x00,0x13,0x00,0x00,0x00.
> +		 * In other words the last 3 bytes are dummy for now.
> +		 */
> +		else
> +			raw_data = (data[0] << 16) | (data[1] << 8) | data[2];

This seems error prone: in one case you takes bytes 1-3, and the other
0-2.
Why not using all the time 0-4, and change your #defines?

Plus using 4 bytes means you can use le32_to_cpu(data) directly (if I'm
not wrong).

Which also means that raw_data can be skipped entirely with the
following below:

lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(data));

> +
> +		/* Calling function to generate Key events */
> +		lenovo_raw_event_TP_X12_tab(hdev, raw_data);
> +	}
>  	return 0;
>  }
>  
> @@ -774,6 +875,8 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
>  	case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		return lenovo_event_cptkbd(hdev, field, usage, value);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
> @@ -1054,6 +1157,8 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
>  	case USB_DEVICE_ID_LENOVO_TPKBD:
>  		lenovo_led_set_tpkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
> @@ -1239,8 +1344,15 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
>  	 * We cannot read the state, only set it, so we force it to on here
>  	 * (which should be a no-op) to make sure that our state matches the
>  	 * keyboard's FN-lock state. This is the same as what Windows does.
> +	 *
> +	 * For X12 TAB and TAB2, the default windows behavious Fn-lock Off.
> +	 * Adding additional check to ensure the behaviour in case of
> +	 * Thinkpad X12 Tabs.
>  	 */
> -	data->fn_lock = true;
> +
> +	data->fn_lock = !(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB ||
> +			hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB2);

If that list grows too much, we will probably have to rely on
.driver_data. But something for later IMO.

> +
>  	lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lock);
>  
>  	ret = sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
> @@ -1284,6 +1396,8 @@ static int lenovo_probe(struct hid_device *hdev,
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		ret = lenovo_probe_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		ret = lenovo_probe_tp10ubkbd(hdev);
> @@ -1370,6 +1484,8 @@ static void lenovo_remove(struct hid_device *hdev)
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		lenovo_remove_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  		lenovo_remove_tp10ubkbd(hdev);
> @@ -1421,6 +1537,10 @@ static const struct hid_device_id lenovo_devices[] = {
>  	 */
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
>  	{ }
>  };
>  

Cheers,
Benjamin

