Return-Path: <linux-input+bounces-15441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC44BD6650
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 23:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196E3404633
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA672ECD05;
	Mon, 13 Oct 2025 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0WXZx3t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55D2EF65C
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391895; cv=none; b=uUI0RordAYIv881MNir47z3tWugiBLkB6apg4hABCkbFa1wxhUkkx0q/P2Gov3y/PBrLvWsURm3eXGUWoTUEYBxtu8wIGqmybkN2CAoDU8U1j1yI9DuxWQ6cCdC3o12H4weJjLcx0p3vBb576Q4gM615l9SfXM/0Np160sHgo9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391895; c=relaxed/simple;
	bh=4vc+Yp9zyzwBoqiAyGbKXROpeOTn1bgb1ufmkKPBa1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLU5oBg9Bg0nIvJWKXLodndVzq437h+hDjZQLJ6t2TBL4kvn2d+INKGw/XoZW+2aVFNosMuvU+n+/SVG8boznXnFbJ+cszwEwx0/NtPUQAK1RYO7E7DEwStimR2HZQMz5/tAy4p8Wlyz8827piY43FPxVUEY4eZrSHkKWwHKBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0WXZx3t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-421851bca51so3065801f8f.1
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760391892; x=1760996692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZP8w263msakWGHxrXKEh05EayNz8GO1pbOWkrj9kVlM=;
        b=F0WXZx3tVo/u/c5MJVL9DuzTYu2wK5PrHvj++imorvfjs/pydokBZz+PpXs1W0o8iv
         xaGtNKvRkfc5d+7Mc8XWKzwj4QeBxWr97x/faajajqSGXaiepgsUGr4qALjvVHwfCkO9
         WL6K+Dc3mXpO5N+sOehNjlUV6aeclP7I/mYYJFfAtidHyEuCGMsf/LpkzKc+1czWmhFk
         Y/0MO6nElkSHwKPYy+vN+3hAKh9gZAnqMBTf+RAna8Jfl4uC14/NywokD9x4RyAUREKw
         Pl+wIF9Bx+Xhca3zcGoldw/kwwyoNvoT8p/wrxGZ4rALHslWk4ReVHkRRoBYLZ9xUBla
         yIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391892; x=1760996692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP8w263msakWGHxrXKEh05EayNz8GO1pbOWkrj9kVlM=;
        b=WsL0ZgzN4c3OQnAO9ObOl3PL5UqNnUsLjmtA3tpX+5J4LxRczik9lt+ySFDTeh4Wb8
         Zs3FeeKwxCmzhmUDMRG+63z3jhLm+/mdBsJG7SxiVPi5/py/DBdbbLZN1kvWPNHZ7PC4
         NIgT4d8OaRFMS7/Ac3M3CgassZj+ULU7KPyF2mMallHqto2Wp2P5qEH5xWPtJ/m+BmVk
         /LBEw8Fd5l9l6HmFPIC8IXrcdxTmEAOH51f9p4GqCvUf1125Yp2AUHOai1wnr1VCtEd6
         fRFm4odobT6kiu2/BGDnZQw9RwfvUSXTmsKfIZFkyfBxbrmyQNjugMzNm2rqcZrE11AH
         9BVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWkHb0FbYdJMNKBFxFXBp6WaZ1VUj9LxE8WSj+qit8CybseiXKHACQALy+MlEA3NvJg0JganTT25m3wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHlHhbHnslEM23Ia9fKzY+GCf47Z8QlYWJjmkRSGoo7UMltmj
	i3VHh8J3taALs9URYHb2pwSjhYR3dPF26t+qIiRRCy8LdKS0dQPFHH66
X-Gm-Gg: ASbGncv7q+E5HeiiMVbAmaNkZ5f+U87ZAzaBycO5ckaEgBb4JTnP8mpW8JEqtxpG65X
	y0i84yGRwR+UjEcydp2UzDTfiC5/WUYKuSgXDKVpMoSsjMtreosKYqJ7b5ZkVGdcFGp17cp7nL0
	OE51cQ+cA6qhHWP1DNlw9PuxWc3zVEFQVAlm5W0Yhml6QCaGWhScRRcDrrLtVNiyQ56LJLxkbvR
	t/u8b58e4Kkc6uRQRrSKFOd7hXBrC4X04PBsmQPc0FcgRliOsKcaetlaZfi841LDet3+LAH55pD
	F54I68RM4KsGI77rKI1qWmCvVInPjR4hdspEJ8/0SLHSqEsglahNe8sKrZI67kF0r+0jnjHVM/b
	oX5BDpKr+fa2VSNkxf7+N1DRgGHGl8mQM9D60iZCBB0C9aridLstpJsA=
X-Google-Smtp-Source: AGHT+IFty42U39I5/GGfbVI4soxzCNVszxubO0wJifwJ4rQ9MB/OvSIgZERhDNSn3uJ0pvvDwFqOww==
X-Received: by 2002:a05:6000:228a:b0:400:7e60:7ee0 with SMTP id ffacd0b85a97d-4265ef6785amr12332355f8f.0.1760391891611;
        Mon, 13 Oct 2025 14:44:51 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb483bcf9sm211722515e9.6.2025.10.13.14.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:44:51 -0700 (PDT)
Message-ID: <e1e6ee09-ea29-4328-9eae-f2a4a23b3edc@gmail.com>
Date: Mon, 13 Oct 2025 23:44:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251013201535.6737-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/13/25 22:15, Antheas Kapenekakis wrote:
> Some ROG laptops expose multiple interfaces for controlling the
> keyboard/RGB brightness. This creates a name conflict under
> asus::kbd_brightness, where the second device ends up being
> named asus::kbd_brightness_1 and they are both broken.
Can you please reference a bug report and/or an analysis of why they ends
up being broken?
>
> Therefore, register a listener to the asus-wmi brightness device
> instead of creating a new one.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 64 +++++++-----------------------------------
>  1 file changed, 10 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a62559e3e064..0af19c8ef035 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -102,7 +102,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
>  struct asus_kbd_leds {
> -	struct led_classdev cdev;
> +	struct asus_hid_listener listener;
It is my understanding from "register a listener .... instead of creating a new one"
that you are attempting to use the same listener among many devices... so why isn't
this a pointer? And more importantly: why do we have bool available, bool registered
instead of either one or the other being replaced by this field being possibly NULL?
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> @@ -495,11 +495,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>  	spin_unlock_irqrestore(&led->lock, flags);
>  }
>  
> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> -				   enum led_brightness brightness)
> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +				   int brightness)
>  {
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> +	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> +						 listener);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&led->lock, flags);
> @@ -509,20 +509,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  	asus_schedule_work(led);
>  }
>  
> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> -{
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> -	enum led_brightness brightness;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&led->lock, flags);
> -	brightness = led->brightness;
> -	spin_unlock_irqrestore(&led->lock, flags);
> -
> -	return brightness;
> -}
> -
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> @@ -539,34 +525,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>  }
>  
> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> - * precedence. We only activate HID-based backlight control when the
> - * WMI control is not available.
> - */
> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> -{
> -	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> -	u32 value;
> -	int ret;
> -
> -	if (!IS_ENABLED(CONFIG_ASUS_WMI))
> -		return false;
> -
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> -			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> -		return false;
> -	}
> -
> -	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> -				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> -	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> -	if (ret)
> -		return false;
> -
> -	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> -}
> -
>  /*
>   * We don't care about any other part of the string except the version section.
>   * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> @@ -701,14 +659,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
> -	drvdata->kbd_backlight->cdev.max_brightness = 3;
> -	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
> -	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
> +	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>  	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>  	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
> -	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
> +	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
>  	if (ret < 0) {
>  		/* No need to have this still around */
>  		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> @@ -1105,7 +1060,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
>  
>  	if (drvdata->kbd_backlight) {
>  		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
> -				drvdata->kbd_backlight->cdev.brightness };
> +				drvdata->kbd_backlight->brightness };
>  		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>  		if (ret < 0) {
>  			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> @@ -1241,7 +1196,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
>  	    asus_kbd_register_leds(hdev))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
> @@ -1282,6 +1236,8 @@ static void asus_remove(struct hid_device *hdev)
>  	unsigned long flags;
>  
>  	if (drvdata->kbd_backlight) {
> +		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
> +
>  		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>  		drvdata->kbd_backlight->removed = true;
>  		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);

