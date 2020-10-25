Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A34298168
	for <lists+linux-input@lfdr.de>; Sun, 25 Oct 2020 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415324AbgJYLA7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Oct 2020 07:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1415322AbgJYLA6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Oct 2020 07:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603623656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kfs4Gtz38la5+sOJBm8ST0xKLouGEGeZa5XcLCnwu6c=;
        b=ZL6uOdyQTrKoyfgyQBkq6z4U36OH2U2oYylkQpNaH5qyQRF1xWLp0xo3VbLaf/06JO3Y26
        Q9wh5ytAnED0GY2qtBc2nc7MaAgFkMcPvWa/UB7lGRKtQindMPwy9eK08MfvW+0rTe9g5s
        YjWRaz8QLdT/+plEn6HSm2xZtifliLE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-KCyN0GNKMdOoluaqDdsvmg-1; Sun, 25 Oct 2020 07:00:54 -0400
X-MC-Unique: KCyN0GNKMdOoluaqDdsvmg-1
Received: by mail-ej1-f70.google.com with SMTP id i21so3418344ejb.5
        for <linux-input@vger.kernel.org>; Sun, 25 Oct 2020 04:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kfs4Gtz38la5+sOJBm8ST0xKLouGEGeZa5XcLCnwu6c=;
        b=kwSlnAmF72KMIClYx8TG9dgwOtXhiTDuPCNz49uaCZ1hjVIZxyQ8vTO0IBLtS+kWSw
         NYRyTnWTuOMj3Irok4ZpQkrtTzFFl2ihVvBOvo6/Uw2qF/iDYKZlhrxoGvFfodQKDWXn
         AdTUF/jfsWsm+e/PYMB3th419ULtb2IdnoBirrD9kqgXWjzxWmMvvqYFN/MU2IYDftnl
         MTmr4gcUj5MhjIfHP1L4Xrk1/U3Sf9fG2kaU8WELYraKcjPUFg1ZqR6Wbx4cbdb/S85T
         TDF4WY3BVj8Gre8iUX++bpK103EBRsbnTSAQMTPHPotA4elNjKgfwIpSI6VeNedhrHgn
         4yZw==
X-Gm-Message-State: AOAM530pxhnRtf1B8QqVfDlP5r97pPrYdrs5yMazM10X4Ca2ij6ZAMhy
        U5J6H2LYA+vM+MLp4aeTN+IH+N6VzUy+9/otDDOgU1Bmoo1/SOdNb86Zk+/P6ZXzoAR9stL2Ao5
        qR5YWG7tmaS8pbOB59PnnfDY=
X-Received: by 2002:a05:6402:1506:: with SMTP id f6mr11179277edw.324.1603623652633;
        Sun, 25 Oct 2020 04:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye0/EghhNU/m4l0QUb4JXJqeljcO0TqrjRkODxh7FdD5jw+ZYn730h6OFFwbwsexOfMiaiRQ==
X-Received: by 2002:a05:6402:1506:: with SMTP id f6mr11179246edw.324.1603623652294;
        Sun, 25 Oct 2020 04:00:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y1sm3428671edj.76.2020.10.25.04.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 04:00:51 -0700 (PDT)
Subject: Re: [PATCH V9] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke D Jones <luke@ljones.dev>, linux-input@vger.kernel.org
Cc:     jikos@kernel.org, andy@infradead.org, benjamin.tissoires@redhat.com
References: <20201025005615.40615-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7a4dd27f-5080-b651-9d8e-7aa57a5b895b@redhat.com>
Date:   Sun, 25 Oct 2020 12:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201025005615.40615-1-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Luke,

I'm afraid that this patch still has all the spaces on an otherwise
empty line (which are part of the unified patch format) stripped. So
this patch cannot be applied without manually fixing it up.

Can you try using "git send-email" for the next version ?

Note no need to worry too much about this, since it is a small
patch we can always fix it up. If Jiri does not want to fix it,
I can fix it and resubmit it (while keeping you as the author).

On 10/25/20 2:56 AM, Luke D Jones wrote:
> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> almost all modern ASUS gaming laptops with slight changes to the
> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> brightness control.
> 
> Additionally this keyboard requires the LED interface to be
> initialised before such things as keyboard backlight control work.

initialized

> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>
> ---

Please for the next version put a changelog here.

>  drivers/hid/hid-asus.c | 116 ++++++++++++++++++++++++++++++++++++-----
>  drivers/hid/hid-ids.h  |   1 +
>  2 files changed, 103 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c183caf89d49..98b033b4951f 100644
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
> @@ -397,6 +426,44 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
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
> +		hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0)
> +		hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);

Hmm, so this construction means that the final return value of this function
may be 0 even if some commands fail.

The actual led calls device registration will get skipped on a failure return;
and we probably should skip that registration on any errors, so how about:

	ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
	if (ret < 0) {
		hid_warn(hdev, "Asus failed to send init start command: %d\n", ret);
		return ret;
	}
	/* Followed by a string */
	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
	if (ret < 0) {
		hid_warn(hdev, "Asus failed to send init command 1.0: %d\n", ret);
		return ret;
	}

etc. ?  This (return on first error) is the normal way of dealing with things
like this in the kernel.

Otherwise this looks good to me.

Regards,

Hans





> +	/* Followed by a string */
> +	ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +	if (ret < 0)
> +		hid_warn(hdev, "Asus failed to send init command 1.1: %d\n", ret);
> +
> +	/* begin second report ID with same data */
> +	buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
> +	buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
> +
> +	ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +	if (ret < 0)
> +		hid_warn(hdev, "Asus failed to send init command 2.0: %d\n", ret);
> +
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
> @@ -460,19 +527,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
> @@ -751,8 +824,8 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -780,6 +853,18 @@ static int asus_input_mapping(struct hid_device *hdev,
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
> @@ -1126,6 +1211,9 @@ static const struct hid_device_id asus_devices[] = {
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
> --
> 2.28.0
> 

