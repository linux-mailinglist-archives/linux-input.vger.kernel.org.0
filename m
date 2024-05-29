Return-Path: <linux-input+bounces-3937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9B8D316F
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EEDCB2CA10
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 08:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42704169AD3;
	Wed, 29 May 2024 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDvxttlR"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF316191E
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971165; cv=none; b=VEC9Y9vK6F3EGM9BMrPtwN6iuGs1F2Qr2UKcj/C6kIkccAT0ekBxJeSqfdsREjPXxcmfmSbTeT4nBhf28IilAlFL1MGYMi9b0QX8GOBxgOvn7QZFS7a+mfgmAZSNA5m9lXNbdfBVoqBhJcSfu63Sg+S+kaChid97mYZ0xEZkDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971165; c=relaxed/simple;
	bh=maqqJ321vS1Q/HzZGir5yobPXJZr7lA1Ng4amFP7X28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgEzXe65nCiLNgCYrhj9hwza+Lq8Hdn3liz9Rq17ri1YRpyJazRgREI7UnyS42Kdf/5HjdfVcTXMw9olOXS+ZsRMALu+zJliQQVayDb2GD7lJqbPa9zHslUGyGKGZZN8rY+zmvZ2KgCDMpYzdkuc1AfD1JhVqVwJnQx5U5jRnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDvxttlR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716971162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ex0wo237twTGf99DJGjL3pk6hkyV15tqf0p0Zq/CWKs=;
	b=hDvxttlRVSssnUVD4/SosyXXXpryIGAU0mGhDqqisDMsBhDg2/c9AmiOLK+MNXjWGLRmnE
	geNz6Px+eXs7X9DuBhY9/yrpRDjU0KQU0mEkdvL1tl4hun8+0HgVRLPujdN7iWjoUh4Tug
	uwIHriRJCBVbZmTo5adJR/KrGshFq7A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-OuV05dsWPOuR4_ImajkzKw-1; Wed, 29 May 2024 04:25:59 -0400
X-MC-Unique: OuV05dsWPOuR4_ImajkzKw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-574f933ad35so993197a12.0
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 01:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971159; x=1717575959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex0wo237twTGf99DJGjL3pk6hkyV15tqf0p0Zq/CWKs=;
        b=dyPaNp7E4vRTSQMK/91NIJ4ZavljHwjhAAW/lao0OwJ9vkhH5IpFpVuVM0Sl9i9+qK
         PUYbgyp7Y2HzmLIFAuoEuit4Fgqa7r8nUL0mlSHK2M/W7bBRsHAH6SYnNYNLlzBd7SgA
         Hehx5ARc6I+n17fkk6GGPKihvp9NQ3eXhRZQA3eg3l9bcnbIrRZwmfIq0AbN1QZ6IRqV
         7ROLzySIm6JKiRvRDUv1wLy8T4zMm1JYrVGMgBoam/tX7MJeRBd3hSFppaTVwYCWgxe6
         1B+EVNgqYbbjLUmTy+jDOQevuofWmmiHepgpY76drmYfyge8LMXsbE4FfkDSSsNsCUTT
         rTtg==
X-Forwarded-Encrypted: i=1; AJvYcCUwqt6D5+Ae0B1sIK5E/WRzdOlGX2mpVXODmVDFS7zEfqjr5YYgh4Y64t0STvtNzVwdEQtx4TEWFlN4g5Rdmh2lQzra1bEhjAQ1LDc=
X-Gm-Message-State: AOJu0YzaRlJmKB+KifeGDwBeImdyDWokhB/pFnbpv3E7vU2ps5ipXYoA
	ZH3IgoQW7fCf9SRzDN3bEby01JbiEWBTCfi2AuJJyR7awDS95nxaXmNdg+nfoMm/2Jv2Y1vbXlW
	ZRdwH/QnsHk+ZJs3LqxZE7dSiZLRLEkKrlT9Idk6+/wS/44NspStbyigWkkWy
X-Received: by 2002:a50:bac3:0:b0:57a:349:85aa with SMTP id 4fb4d7f45d1cf-57a034986b1mr825032a12.24.1716971158796;
        Wed, 29 May 2024 01:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8T3RZXlC0XcAUFvXZ+bT26E3eEFOogyg9JpO9HOElMq6THGLh4RzzidPLFJ/iyXVMXKgKfg==
X-Received: by 2002:a50:bac3:0:b0:57a:349:85aa with SMTP id 4fb4d7f45d1cf-57a034986b1mr825010a12.24.1716971158277;
        Wed, 29 May 2024 01:25:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c3bbee4asm5197051a12.76.2024.05.29.01.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 01:25:57 -0700 (PDT)
Message-ID: <ea85df16-53b4-4e25-b7c7-3f74486cdcf9@redhat.com>
Date: Wed, 29 May 2024 10:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] hid-asus: change the report_id used for HID LED
 control
To: "Luke D. Jones" <luke@ljones.dev>, jikos@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, bentiss@kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
 <20240529012827.146005-3-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529012827.146005-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/24 3:28 AM, Luke D. Jones wrote:
> On some laptops the report_id used for LED brightness control must be
> 0x5D instead of 0x5A.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 4cba8e143031..ec3556cc4eef 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -94,6 +94,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  
>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
> +static const char * const use_alt_led_report_id[] = { "GU605", "GA403" };
> +
>  struct asus_kbd_leds {
>  	struct led_classdev cdev;
>  	struct hid_device *hdev;
> @@ -101,6 +103,7 @@ struct asus_kbd_leds {
>  	unsigned int brightness;
>  	spinlock_t lock;
>  	bool removed;
> +	int report_id;
>  };
>  
>  struct asus_touchpad_info {
> @@ -473,7 +476,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> -	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> +	u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
>  	unsigned long flags;
>  
> @@ -513,6 +516,23 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>  	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>  
> +static bool asus_kbd_is_input_led(void)
> +{
> +	const char *product;
> +	int i;
> +
> +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	if (!product)
> +		return false;
> +
> +	for (i = 0; i < ARRAY_SIZE(use_alt_led_report_id); i++) {
> +		if (strstr(product, use_alt_led_report_id[i]))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +


This again feels like you are re-inventing dmi_check_system() please
change use_alt_led_report_id to a dmi_system_id array and drop this
function (you can directly call dmi_check_system(use_alt_led_report_id)
instead).


>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -555,6 +575,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!drvdata->kbd_backlight)
>  		return -ENOMEM;
>  
> +	drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
> +		drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
> +
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;

Regards,

Hans



