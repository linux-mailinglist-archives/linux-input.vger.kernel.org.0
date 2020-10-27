Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BC429A5D5
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 08:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgJ0Hvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 03:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32152 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731218AbgJ0Hvu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 03:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603785108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tcijLcwrUqPJ7t1XmKFvoecfRQ2iELpwRIxDrSpPRvc=;
        b=fXNfIDamgpOtPIP2fbDquQk/qMAA6tr/eXbSqjCOnFDcUG34DAwyYfJPJKnZHD4bCdpK6Q
        i5XzmucafwQ0FWtPUHRerDqy16yprtoVqzGBY3RHXq7EBEruD0LPj9b5xVUc1h7+5Ur5tT
        cs8P/96oGCRCyb3xfGHjET+EKv/A4AQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-nvFkNxXgPdyqm7DP2SCKFA-1; Tue, 27 Oct 2020 03:51:45 -0400
X-MC-Unique: nvFkNxXgPdyqm7DP2SCKFA-1
Received: by mail-ej1-f69.google.com with SMTP id x12so519325eju.22
        for <linux-input@vger.kernel.org>; Tue, 27 Oct 2020 00:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tcijLcwrUqPJ7t1XmKFvoecfRQ2iELpwRIxDrSpPRvc=;
        b=fQis2jTM/EfXhSDG2bs1TO86iC1VykQeBqXBX+u2Wqo8y136NYRISXvTZEOYbnu61c
         lHLVNMGeToKr0k20sFps2chYXe2weWYk8ZFYIFCkZuQWdgk+BjYNFQ6FRbQHi8RXw9AZ
         Q7w9o0fMigmgBiTqMGE4AekWIeJTqA6gZPXtPgoQIpPC6ntkBS/VAt4NyfLTrdK6pLEn
         ozN9tWvB1FWfZi0tGtyYFSih5TQqDfPoFoKZCVEWRwl8I2A0mOk4CeHDGSBPDdR856oO
         M5TMMW4m8W9GN+zV1HfU0dvcydZYPMMlB60VD2khfNS2AonsDw8FZ0wismH+wtijIqkE
         4jPQ==
X-Gm-Message-State: AOAM531WujPKFxLgc4WTScojgRYjmXkw0+Y/64orwuYS315fh4RfYIzk
        CLT3cWj2GI8UlH61G3LUOx9BIqnF2M+SumMzk7H7gbY3ZUxTZAWDiQoXEoY9uOXTNMLnTJpnQlo
        RDQcEl9HBj2U59Gr7lje6NOg=
X-Received: by 2002:a05:6402:156:: with SMTP id s22mr937560edu.178.1603785104195;
        Tue, 27 Oct 2020 00:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw47oIkA4onYcpcv7IQb/E69C7dYEkqcuQfINe4M2MljiMWMESsbJPyJoHipt2QxLbHCfCYVQ==
X-Received: by 2002:a05:6402:156:: with SMTP id s22mr937533edu.178.1603785103885;
        Tue, 27 Oct 2020 00:51:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d20sm399526edp.85.2020.10.27.00.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 00:51:43 -0700 (PDT)
Subject: Re: [PATCH v10] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke D Jones <luke@ljones.dev>, linux-input@vger.kernel.org
Cc:     jikos@kernel.org, andy@infradead.org, benjamin.tissoires@redhat.com
References: <20201026210216.103501-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7b5dd95d-360f-5620-6bd9-3cc2c5d85ae3@redhat.com>
Date:   Tue, 27 Oct 2020 08:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026210216.103501-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/26/20 10:02 PM, Luke D Jones wrote:
> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> almost all modern ASUS gaming laptops with slight changes to the
> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> brightness control.
> 
> Additionally this keyboard requires the LED interface to be
> initialized before such things as keyboard backlight control work.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>
> 
> ---
> Changes v8-v10
> - Remove asus_wmi_send_event and change Fn+F5 to emit
>   KEY_PROG4. The ASUS G14-G15 laptops have a problem
>   with freezes if the user spams this key to trigger
>   asus_wmi_send_event(). It is better handled with a
>   key-bind and daemon.
> - Change cases of dev_warn to hid_warn.
> - Remove out-of-scope changes which are better suited
>   as separate patches.

This version looks good to me, and it applies without problems
(no more removed spaces):

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/hid/hid-asus.c | 123 ++++++++++++++++++++++++++++++++++++-----
>  drivers/hid/hid-ids.h  |   1 +
>  2 files changed, 110 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c183caf89d49..1dfe184ebf5a 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -48,6 +48,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
>  #define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_LED_REPORT_ID1 0x5d
> +#define FEATURE_KBD_LED_REPORT_ID2 0x5e
>  
>  #define SUPPORT_KBD_BACKLIGHT BIT(0)
>  
> @@ -80,6 +82,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_T101HA_DOCK		BIT(9)
>  #define QUIRK_T90CHI			BIT(10)
>  #define QUIRK_MEDION_E1239T		BIT(11)
> +#define QUIRK_ROG_NKEY_KEYBOARD		BIT(12)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -332,6 +335,28 @@ static int asus_raw_event(struct hid_device *hdev,
>  	if (drvdata->quirks & QUIRK_MEDION_E1239T)
>  		return asus_e1239t_event(drvdata, data, size);
>  
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		/*
> +		 * Skip these report ID, the device emits a continuous stream associated
> +		 * with the AURA mode it is in which looks like an 'echo'.
> +		*/
> +		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
> +				report->id == FEATURE_KBD_LED_REPORT_ID2) {
> +			return -1;
> +		/* Additional report filtering */
> +		} else if (report->id == FEATURE_KBD_REPORT_ID) {
> +			/*
> +			 * G14 and G15 send these codes on some keypresses with no
> +			 * discernable reason for doing so. We'll filter them out to avoid
> +			 * unmapped warning messages later.
> +			*/
> +			if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
> +					data[1] == 0x8a || data[1] == 0x9e) {
> +				return -1;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -344,7 +369,11 @@ static int asus_kbd_set_report(struct hid_device *hdev, u8 *buf, size_t buf_size
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
> @@ -397,6 +426,51 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
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
> +	if (ret < 0) {
> +		hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
> +		return ret;
> +	}
> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0) {
> +		hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);
> +		return ret;
> +	}
> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +	if (ret < 0) {
> +		hid_warn(hdev, "Asus failed to send init command 1.1: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* begin second report ID with same data */
> +	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
> +	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
> +
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0) {
> +		hid_warn(hdev, "Asus failed to send init command 2.0: %d\n", ret);
> +		return ret;
> +	}
> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +	if (ret < 0)
> +		hid_warn(hdev, "Asus failed to send init command 2.1: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  				   enum led_brightness brightness)
>  {
> @@ -460,19 +534,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
> @@ -751,8 +831,8 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -780,6 +860,18 @@ static int asus_input_mapping(struct hid_device *hdev,
>  		/* Fn+F5 "fan" symbol on FX503VD */
>  		case 0x99: asus_map_key_clear(KEY_PROG4);		break;
>  
> +		/* Fn+F5 "fan" symbol on N-Key keyboard */
> +		case 0xae: asus_map_key_clear(KEY_PROG4);		break;
> +
> +		/* Fn+Ret "Calc" symbol on N-Key keyboard */
> +		case 0x92: asus_map_key_clear(KEY_CALC);		break;
> +
> +		/* Fn+Left Aura mode previous on N-Key keyboard */
> +		case 0xb2: asus_map_key_clear(KEY_PROG2);		break;
> +
> +		/* Fn+Right Aura mode next on N-Key keyboard */
> +		case 0xb3: asus_map_key_clear(KEY_PROG3);		break;
> +
>  		default:
>  			/* ASUS lazily declares 256 usages, ignore the rest,
>  			 * as some make the keyboard appear as a pointer device. */
> @@ -1126,6 +1218,9 @@ static const struct hid_device_id asus_devices[] = {
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
> 

