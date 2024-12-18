Return-Path: <linux-input+bounces-8659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B19F68A7
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 15:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B37A7166B97
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 14:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0663A1B4254;
	Wed, 18 Dec 2024 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="TN+1zDu8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Klmsk+I5"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F43219ED;
	Wed, 18 Dec 2024 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532580; cv=none; b=lTYLtPeO1nh7V3L5SktMNkBXd9EXAmMeqbi4oGtw4+oKM9k+v+pFdCzaHEcXU/sZG29/MWwYYmKLOyy9VwgT77JHcVKs14rnP9VEyvSa8lHGbruGNpsZoTFwAaNPmB/G9XEVpXk+K6Zga95SZ+GtHG2PaW5VkWCoeB1aa/VDlaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532580; c=relaxed/simple;
	bh=MA1zKLqlunmwr+MLFERsXDA4QTRRVnZkyb9Grn+f1bY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gLxRTIPYJ7nEBQ6aQUXFsUW7XAkn3uiUO+MHg85Q90lysTcYzEpxbc6XW9dDDdB1SPkWgVCpJN2znmgtctbSQNWdTQiZcSN85mPIwqUISAIDEB55WmDeMh9XzjCEKjviYiM4uQ6hjfLSC9Ux4EbWV3QuoQjKr5nlL2L0MU6xXEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=TN+1zDu8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Klmsk+I5; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B0642114009B;
	Wed, 18 Dec 2024 09:36:15 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Wed, 18 Dec 2024 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1734532575;
	 x=1734618975; bh=p4kH5Yq6Hz0ihs1QFUr8sOrtU365/A6J97nf3ekHVvo=; b=
	TN+1zDu8hQtiiLRcpQ7FbegfMCngq1cQxO750XzX+6dPL2pX9S0SN4btJFPxAaag
	ExcGmu/TxUzAPRXCxvlUMYLDhAy/LIn4gFxhMArN0Q6usXrEL686n1cgffJtVyIq
	OF3HM1CAhEzZx2OBU+usgrqnyhqwjsvTaf3Qg1z8HnauhwQ3pAGqYOHH5m1gU8pZ
	nVyySdQW+ou4ukhe28DoL7ammLrShYXgLIJvqVDCsnmufd7nytnsAzrBmLa63w4y
	ELUkbpNGM2u+5OsiRv4VG2jmiVGfvYEMnLGIqLXetyLZm4+sUV2elel1bobCorCZ
	hx+fI+KQe3xXwK3sPpI+oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734532575; x=
	1734618975; bh=p4kH5Yq6Hz0ihs1QFUr8sOrtU365/A6J97nf3ekHVvo=; b=K
	lmsk+I5pmsWhEPsXGebp5mhtm6ppnhp+x+wvHP4pBxpFGrIUbIioxUkT94ZeCs8a
	ggiicRQTkp4+i4rGc1RE454I5rXbo3eW9Umk+kTRQ+6e/XOoIhKUqlYajpyL0rLF
	wyjwObGHJf64cQ5dR4I1yhbnkIC3NldDUKmHSOEKTYi+g73MFG9ug9XPULx5gpah
	XEcuvwf7qEXSJZdvNNMQAdl9rTWQmffXBfVu+P4BaE08QPJVoiubQAt+Po44eKfU
	7NvHLItve/NqygE787V4ZPHh1M8tBStI03mkC6HbIExvtXmL2doBU3lkNcOis1OW
	G1Ctowcbm8ePIRJcSf+RQ==
X-ME-Sender: <xms:391iZ7e8mZClexOFfibyeteJQcRgZNm4ZPUXBm3t4UysiEku0n16Kg>
    <xme:391iZxPgq6MEH5CyS0lIU9spBs_STqj6HOTi1eLBq1fG4XUBAEFeFYr0XzkvgErhg
    nIutIYb_TTkQLduKFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnoh
    hvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedt
    veehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohes
    shhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepvhhishhhnhhuohgtvhesghhmrghilhdrtghomhdprhgtphhtthhopegs
    vghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehvshgrnhhkrghrsehlvghnohhvohdrtghomhdprhgt
    phhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:391iZ0jSYx7KKl5WW9AprtLruA5pXvYgBB9KD1LRixND8EGIdaGW-w>
    <xmx:391iZ8-ksC5FkGAC3xZcV4lb2tweBJXzwlcyJSLxGu-pXC6H7XNVKQ>
    <xmx:391iZ3vqX0IDnRwocp1akm43zaMyTNA0YmoNkSHOojLs7VfEbHlRww>
    <xmx:391iZ7H0y8OjFWTFJFJn1By6GcnbcBVi8YtQ9HuXUu8C7dGBJoorBA>
    <xmx:391iZ9Usl8SgPAp4tSwraVOHd8tFgFJ0Uc4ElO5gTtgeR3wlPZ53O9gx>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 687603C0066; Wed, 18 Dec 2024 09:36:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 09:35:55 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Vishnu Sankar" <vishnuocv@gmail.com>, "Jiri Kosina" <jikos@kernel.org>,
 bentiss@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <4f43652e-420c-4c8b-996a-27c02c8f3bdf@app.fastmail.com>
In-Reply-To: <20241218143309.86811-1-vishnuocv@gmail.com>
References: <20241218143309.86811-1-vishnuocv@gmail.com>
Subject: Re: [PATCH v3] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Two thumbs up :)

On Wed, Dec 18, 2024, at 9:33 AM, Vishnu Sankar wrote:
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
> +static inline void report_key_event(struct input_dev *input, int 
> keycode)
> +{
> +	input_report_key(input, keycode, 1);
> +	input_report_key(input, keycode, 0);
> +	input_sync(input);
> +}
> +
>  static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 
> led_code,
>  				    enum led_brightness value)
>  {
> @@ -472,6 +488,8 @@ static int lenovo_input_mapping(struct hid_device 
> *hdev,
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
>  							       usage, bit, max);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
>  		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, 
> max);
> @@ -582,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device 
> *dev,
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		lenovo_features_set_cptkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -680,6 +700,55 @@ static const struct attribute_group 
> lenovo_attr_group_cptkbd = {
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
> @@ -776,6 +854,8 @@ static int lenovo_event(struct hid_device *hdev, 
> struct hid_field *field,
>  	case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
>  	case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
>  		return lenovo_event_cptkbd(hdev, field, usage, value);
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1057,6 +1137,8 @@ static int lenovo_led_brightness_set(struct 
> led_classdev *led_cdev,
>  	case USB_DEVICE_ID_LENOVO_TPKBD:
>  		lenovo_led_set_tpkbd(hdev);
>  		break;
> +	case USB_DEVICE_ID_LENOVO_X12_TAB:
> +	case USB_DEVICE_ID_LENOVO_X12_TAB2:
>  	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB:
>  	case USB_DEVICE_ID_LENOVO_X1_TAB3:
> @@ -1243,8 +1325,15 @@ static int lenovo_probe_tp10ubkbd(struct 
> hid_device *hdev)
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

