Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEDF290382
	for <lists+linux-input@lfdr.de>; Fri, 16 Oct 2020 12:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395520AbgJPKwI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Oct 2020 06:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395513AbgJPKwF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Oct 2020 06:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602845522;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yB7Ph0gdxvPqjk8UEh0gKWqC+RjwvBlOoPkSdHCaNio=;
        b=I19nHFgTi6c8WO1bxsus+LJesRfWzaCW6bEhJ9+fjS1iXwjtQvEYNxnH6u29oXthCKhRkY
        eGz8A+PgzKtk2o8DTxSs2kjvP7Y24mzXQbe8gLYqrh+yi0ZdDRRm5VwinPIQoO3j4xZHv5
        9A7LUXM1sSr6sOZOgZR33rXf1sqU50Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522--k6CQghmOVi6BRF2QKPYZQ-1; Fri, 16 Oct 2020 06:52:00 -0400
X-MC-Unique: -k6CQghmOVi6BRF2QKPYZQ-1
Received: by mail-ed1-f72.google.com with SMTP id ay19so809159edb.23
        for <linux-input@vger.kernel.org>; Fri, 16 Oct 2020 03:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yB7Ph0gdxvPqjk8UEh0gKWqC+RjwvBlOoPkSdHCaNio=;
        b=QakBFjFDJNVciG0q5kHe7vfqwTii2uC+sTP5emjR36n8ZvfaPP7fmxnrYS+L3oIbED
         jhbMIi/2S4T8b2caL6gcjUEKAGAXCtH40UwG1QPtftPnpIvEUr10wP5BkI+LdX4VZHQn
         nLBpMUtwEh8MX/JKRalPOlsugFso1wbP1YkkH1I5+OrtSSLvHZ4N+jvNa2ptasM5cfFa
         pwB+y5kMGLkTOOpOsf9IqodmT4r1iYEktO2b+eX3olnx7SRIG1PrRX4v4Zy/wlUnHNni
         T7dax55PELkNexTTNtJzSn1EUijJRd4pXqaHmq4gve7M2HUfOnCNrFWgMr5xABXLBKcy
         tMGA==
X-Gm-Message-State: AOAM530vhldgtdfARCBDwkjOGRyA0dKT5PvTMoxpp/JZSV2YifbEOrFG
        5/HRCDQ6m1ZKqQliAapoiTugah7QRXwJiN5QK8CTY7xFQt4zowrrWxclr2RHbCzFVIPjBrsfQPH
        WxurjZs/HDtDgaMNsDT2suyw=
X-Received: by 2002:a05:6402:1cbb:: with SMTP id cz27mr3036907edb.38.1602845518260;
        Fri, 16 Oct 2020 03:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjf/g709+nQeTvd5UuszD4VT2GY6KazfHyBUZ6Q4gd915/a1sNXzmge/zFWJgNeOrTI3Y2MQ==
X-Received: by 2002:a05:6402:1cbb:: with SMTP id cz27mr3036883edb.38.1602845517961;
        Fri, 16 Oct 2020 03:51:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id ba6sm1140670edb.61.2020.10.16.03.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 03:51:57 -0700 (PDT)
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke D Jones <luke@ljones.dev>, linux-input@vger.kernel.org
Cc:     jikos@kernel.org, andy@infradead.org, benjamin.tissoires@redhat.com
References: <20201013073508.10476-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b94065db-72f4-db9e-6f62-44e61b969846@redhat.com>
Date:   Fri, 16 Oct 2020 12:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013073508.10476-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

First 2 general remarks:

1. Please address the review comments from Andy's review
   Note where Andy said to use dev_warn, please use hid_warn
   for consistency with the other hid_foo logging calls
   which you already add.

2. Existing empty lines (context) in the diff should start
   with a single space (per the unified diff format) but
   it seems that your email client has decided to treat this
   as trailing whitespace and remove these spaces, which
   means that the patch will not apply properly.

   See: https://lore.kernel.org/linux-input/20201013073508.10476-1-luke@ljones.dev/raw
   and look for example at line 200 of that file, there
   should be a space there, but instead the line is empty.


On 10/13/20 9:35 AM, Luke D Jones wrote:
> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> almost all modern ASUS gaming laptops with slight changes to the
> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
> 
> The keyboard has many of the same key outputs as the existing ASUS
> keyboard including a few extras, and varies a little between laptop
> models.
> 
> Additionally this keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.
> 
> Misc changes in scope: update some hardcoded comparisons to use an
> available define.

Usually if you need to add a comment like this to a commit message
it is better to break the change out into a separate patch as
Andy pointed out.

> Signed-off-by: Luke D Jones <luke@ljones.dev>
>  drivers/hid/hid-asus.c                     | 148 ++++++++++++++++++---
Normally you would insert the following directly
after your S-o-b for non version 1 patches:

---
Changes in v8:
- Resend of v7 with fixed commit-message

Changes in v7:
- Changed foo
- Add bar
- Removed bla

Notice the changelog gets preceded by a line with just '---'
on it this "cut" line will cause git am to drop it when a
kernel maintainer applies the commit to his tree, the changelog
is mainly there to help reviewers.

Otherwise I have no comments on top of Andy's comment, so one
more revision I think and then this patch is ready to go
I think.

Regards,

Hans


>  drivers/hid/hid-ids.h                      |   1 +
>  include/linux/platform_data/x86/asus-wmi.h |   1 +
>  3 files changed, 135 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c183caf89d49..a2f5469da0e6 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -26,6 +26,8 @@
>  #include <linux/dmi.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> +
> +#include <linux/acpi.h>
>  #include <linux/platform_data/x86/asus-wmi.h>
>  #include <linux/input/mt.h>
>  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
> @@ -48,6 +50,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
>  #define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
> +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
> 
>  #define SUPPORT_KBD_BACKLIGHT BIT(0)
> 
> @@ -80,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_T101HA_DOCK		BIT(9)
>  #define QUIRK_T90CHI			BIT(10)
>  #define QUIRK_MEDION_E1239T		BIT(11)
> +#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
> 
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -305,10 +310,33 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  	return 0;
>  }
> 
> +/*
> + * This enables triggering events in asus-wmi
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
> +{
> +	int err;
> +	u32 retval;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> +		ASUS_WMI_DEVID_NOTIF, code, &retval);
> +	if (err) {
> +		pr_warn("Failed to notify asus-wmi: %d\n", err);
> +		return err;
> +	}
> +
> +	if (retval != 0) {
> +		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>  	    (usage->hid & HID_USAGE) != 0x00 &&
>  	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -321,6 +349,7 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  static int asus_raw_event(struct hid_device *hdev,
>  		struct hid_report *report, u8 *data, int size)
>  {
> +	int ret;
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> 
>  	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
> @@ -332,6 +361,35 @@ static int asus_raw_event(struct hid_device *hdev,
>  	if (drvdata->quirks & QUIRK_MEDION_E1239T)
>  		return asus_e1239t_event(drvdata, data, size);
> 
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		/*
> +		 * Skip these report ID, the device emits a continuous stream associated
> +		 * with the AURA mode it is in which looks like an 'echo'
> +		*/
> +		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
> +				report->id == FEATURE_KBD_LED_REPORT_ID2) {
> +			return -1;
> +		/* Additional report filtering */
> +		} else if (report->id == FEATURE_KBD_REPORT_ID) {
> +			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
> +			if (data[1] == 0xae) {
> +				ret = asus_wmi_send_event(drvdata, 0xae);
> +				if (ret < 0) {
> +					hid_warn(hdev, "Asus failed to trigger fan control event");
> +				}
> +				return -1;
> +			/*
> +			 * G14 and G15 send these codes on some keypresses with no
> +			 * discernable reason for doing so. We'll filter them out to avoid
> +			 * unmapped warning messages later
> +			*/
> +			} else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
> +					data[1] == 0x8a || data[1] == 0x9e) {
> +				return -1;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
> 
> @@ -344,7 +402,11 @@ static int asus_kbd_set_report(struct hid_device *hdev, u8 *buf, size_t buf_size
>  	if (!dmabuf)
>  		return -ENOMEM;
> 
> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
> +	/*
> +	 * The report ID should be set from the incoming buffer due to LED and key
> +	 * interfaces having different pages
> +	*/
> +	ret = hid_hw_raw_request(hdev, buf[0], dmabuf,
>  				 buf_size, HID_FEATURE_REPORT,
>  				 HID_REQ_SET_REPORT);
>  	kfree(dmabuf);
> @@ -397,6 +459,44 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
>  	return ret;
>  }
> 
> +static int rog_nkey_led_init(struct hid_device *hdev)
> +{
> +	u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
> +	u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 0x53, 0x20,
> +				0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
> +						0x05, 0x20, 0x31, 0x00, 0x08 };
> +	int ret;
> +
> +	hid_info(hdev, "Asus initialise N-KEY Device");
> +	/* The first message is an init start */
> +	ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
> +	if (ret < 0)
> +		hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0)
> +		hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +	if (ret < 0)
> +		hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);
> +
> +	/* begin second report ID with same data */
> +	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
> +	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
> +
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0)
> +		hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
> +
> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +	if (ret < 0)
> +		hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  				   enum led_brightness brightness)
>  {
> @@ -460,19 +560,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	unsigned char kbd_func;
>  	int ret;
> 
> -	/* Initialize keyboard */
> -	ret = asus_kbd_init(hdev);
> -	if (ret < 0)
> -		return ret;
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		ret = rog_nkey_led_init(hdev);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		/* Initialize keyboard */
> +		ret = asus_kbd_init(hdev);
> +		if (ret < 0)
> +			return ret;
> 
> -	/* Get keyboard functions */
> -	ret = asus_kbd_get_functions(hdev, &kbd_func);
> -	if (ret < 0)
> -		return ret;
> +		/* Get keyboard functions */
> +		ret = asus_kbd_get_functions(hdev, &kbd_func);
> +		if (ret < 0)
> +			return ret;
> 
> -	/* Check for backlight support */
> -	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> -		return -ENODEV;
> +		/* Check for backlight support */
> +		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> +			return -ENODEV;
> +	}
> 
>  	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
>  					      sizeof(struct asus_kbd_leds),
> @@ -751,8 +857,8 @@ static int asus_input_mapping(struct hid_device *hdev,
>  	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>  		return -1;
> 
> -	/* ASUS-specific keyboard hotkeys */
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
> +	/* ASUS-specific keyboard hotkeys and led backlight */
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>  		switch (usage->hid & HID_USAGE) {
>  		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
>  		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
> @@ -780,6 +886,15 @@ static int asus_input_mapping(struct hid_device *hdev,
>  		/* Fn+F5 "fan" symbol on FX503VD */
>  		case 0x99: asus_map_key_clear(KEY_PROG4);		break;
> 
> +		/* Fn+Ret "Calc" symbol on device 0x1866, N-KEY Device */
> +		case 0x92: asus_map_key_clear(KEY_CALC);		break;
> +
> +		/* Fn+Left Aura mode previous */
> +		case 0xb2: asus_map_key_clear(KEY_PROG2);		break;
> +
> +		/* Fn+Right Aura mode next */
> +		case 0xb3: asus_map_key_clear(KEY_PROG3);		break;
> +
>  		default:
>  			/* ASUS lazily declares 256 usages, ignore the rest,
>  			 * as some make the keyboard appear as a pointer device. */
> @@ -1126,6 +1241,9 @@ static const struct hid_device_id asus_devices[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  		USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD),
>  	  QUIRK_USE_KBD_BACKLIGHT },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> +	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  		USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
>  	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 6f370e020feb..c9f930ddcfd7 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -190,6 +190,7 @@
>  #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1 0x1854
>  #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
>  #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
> +#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
>  #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
> 
>  #define USB_VENDOR_ID_ATEN		0x0557
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 897b8332a39f..ddf72cfe721a 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -69,6 +69,7 @@
>  /* Input */
>  #define ASUS_WMI_DEVID_TOUCHPAD		0x00100011
>  #define ASUS_WMI_DEVID_TOUCHPAD_LED	0x00100012
> +#define ASUS_WMI_DEVID_NOTIF		0x00100021 /* Emit keyboard event */
>  #define ASUS_WMI_DEVID_FNLOCK		0x00100023
> 
>  /* Fan, Thermal */
> --
> 2.28.0
> 

