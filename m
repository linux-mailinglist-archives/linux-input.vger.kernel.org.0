Return-Path: <linux-input+bounces-9819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31062A2ACEA
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 16:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A89823A89F6
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 15:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898822D4EB;
	Thu,  6 Feb 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/NsDecA"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D78228CB7
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856689; cv=none; b=tGNNCvACsbfIk+iTlK3LAoZGtw85A5qS2H6KYPK0xYBq5j0YpUhb5HBXrW5lQZhHv5jsMCBbCWqekBGY4q8WkuqhUIawbaP1NS09xRHqHp8qD7RlXO/b/+S0RLFuIMHMKlGjINd3Pugf2kVfSGhWZceHT7LAdWJf+PKy3KKo9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856689; c=relaxed/simple;
	bh=ofH9plRtHW0mHPYZ+TgFZKYjkmZPqDoO4ZF5X0QC8QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Prv3+lFAtLuzQeuaf8hSIjF2itYDeUsvOfakaGHbE/u/lmIvCT9MUp52yi2U/1/m8KQdfodUlYoPnI/QkMZ81BknV4NJaOzd8D/06UDzP4kzYr3+zJ+RefdKWD7lIKemFXRFqXmvNlglMtJlhgDCDFkYdF8GohvLiB2yqeD8j9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L/NsDecA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738856686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9fdBjD/4I3d+CAz9Ee6Fxd/lPxcTaRBz6dKzZispYA=;
	b=L/NsDecAfHR4yDp1QvCJHNKA0P+3GwR5KJLNcdsnFLg0d2zDIPLoI8Z8knM/S02+ntZq/S
	sBxLzv+LWrc5hdmdoDJa9pUY/vlKYDKJVQ9T1PRPC5znDCzZmAZ3JsDvYiEr666YQEC589
	AtzY4Qo8iKZsbzGi5qaEEd7rDhFw+GA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-C5q1dLc7OPq9nw0Yx4MDOA-1; Thu, 06 Feb 2025 10:44:44 -0500
X-MC-Unique: C5q1dLc7OPq9nw0Yx4MDOA-1
X-Mimecast-MFC-AGG-ID: C5q1dLc7OPq9nw0Yx4MDOA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aaf8f016bb1so113667366b.2
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2025 07:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738856683; x=1739461483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9fdBjD/4I3d+CAz9Ee6Fxd/lPxcTaRBz6dKzZispYA=;
        b=E2fF2s4g+KXkbKebAh0UH9wKBdH2GXWvmrCqYYrIBh3Gk7H1ybAu5bjlcai9MQNNrX
         TfnKsUsuF4yG5+gEDepV+tjdH5Ykby5d3Aa/RorldtQjNjv4pc/KD8arbmzQ/Muvs8PJ
         dbs4+M7qgsa4/jU/KxaW2pOAnm3XmQbtYod1Sbw0dyEoThwN+ln6Z5GAMxNGCB9Gm5vg
         sEa7L2fQr9kStEbIlEtdouAaPGCdVsHCGKnxP/v9y/ukYd6QdYwMk0yoHKpFbmsAzF1N
         Se5itelHXko0amDK+8rNb1CQ7mrAZcX5n9mUH43OH9Z0vauiGZrIRnZp1d9DIIGRaOA8
         zp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrVdIV2eYRsszC3lZa0uw8VP6ly9rRq6zzXngHpZ2XgPVsDUULzqFHqGxfUHWoQyda3EXkjNkWsKz36w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiiGOymOahuygqDbcWmTpyo+DXu4oBdzCPHpKEHlA0OgOBEcz
	qmTOkSBWcsSRbj8hJHIPS1lKhYvMWVFCEfnYp6Yu2giRdZ6/Imw1sbo2ZFRpO+6Xw1Dn3pgx0UV
	Avdazsv3/uMwKfnczwUQKosWuRadq/iVDGTYCfuvTrMFt6xWB7fuPtGS+OE+l
X-Gm-Gg: ASbGncsU1mCuShbawsemCMWZEX9oHLiR1b4ekPElWeVJhx6bFGWn9K0IBBBV7bETXpK
	ihyE0VSz8d2FIoMNCAUtpRCy++t7MGmtnffero5geBW3/JmlNrGBtQfDbXSlidDPi6/NibMPwVK
	apDrkfEA1QnIDjVb0dkwz12yR2eK5pdioLV+/LVEBST734uWVFOfsKiklE487YosXl4rhoh9RDf
	y5xLJ8VnDUL8T/qIHuugMlz+DHE7DgZS8iqeQkhTXyeJn+yMvqqS2N6hPrHVpIw+yuZdJW6vc9M
	JLZfePE8Y2LM7kq3EOVVCN7rKoomFsPd58hpzFTlBHomC/nGQ8ZZ++dHNcFT9y+WCKBAhJVspYS
	NnqwIBBJ1y8LeTrfL2C1pC0kcJkXCDxl4j2EB2JitXG805EuHazHy/PE=
X-Received: by 2002:a17:907:7f27:b0:ab6:58bc:715b with SMTP id a640c23a62f3a-ab75e363920mr780272266b.55.1738856681766;
        Thu, 06 Feb 2025 07:44:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKhZc+LkeyR5pkedwozP69m7lvDT4dC+KsUBu+nt/ZsSGuPe5iF4PXNAmdpyaEKoMQYbMQhw==
X-Received: by 2002:a17:907:7f27:b0:ab6:58bc:715b with SMTP id a640c23a62f3a-ab75e363920mr780269666b.55.1738856681324;
        Thu, 06 Feb 2025 07:44:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77333522dsm114798266b.126.2025.02.06.07.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 07:44:40 -0800 (PST)
Message-ID: <0bc7e884-fb62-4f75-b826-adaf96a98314@redhat.com>
Date: Thu, 6 Feb 2025 16:44:39 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hid: hid-lg-g15: Use standard multicolor LED API
To: Kate Hsuan <hpa@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250131140241.586305-1-hpa@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250131140241.586305-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 31-Jan-25 3:02 PM, Kate Hsuan wrote:
> Replace the custom "color" sysfs attribute with the standard multicolor
> LED API.
> 
> This also removes the code for the custom "color" sysfs attribute,
> the "color" sysfs attribute was never documented so hopefully, it is not
> used by anyone.
> 
> If we get complaints, we can re-add the "color" sysfs attribute as
> a compatibility wrapper setting the subleds intensity.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
> Changes in v2:
> 1. The commit message was revised with the reviewer's suggestions.
> 2. The incorrect parameters for container_of() were fixed.
> 3. The brightness values were converted by led_mc_calc_color_components().

Thanks, this v2 looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/hid/hid-lg-g15.c | 146 +++++++++++++++++----------------------
>  1 file changed, 65 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index 53e7b90f9cc3..f8605656257b 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -8,11 +8,13 @@
>  #include <linux/device.h>
>  #include <linux/hid.h>
>  #include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/module.h>
>  #include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/usb.h>
>  #include <linux/wait.h>
> +#include <dt-bindings/leds/common.h>
>  
>  #include "hid-ids.h"
>  
> @@ -44,9 +46,13 @@ enum lg_g15_led_type {
>  };
>  
>  struct lg_g15_led {
> -	struct led_classdev cdev;
> +	union {
> +		struct led_classdev cdev;
> +		struct led_classdev_mc mcdev;
> +	};
>  	enum led_brightness brightness;
>  	enum lg_g15_led_type led;
> +	/* Used to store initial color intensities before subled_info is allocated */
>  	u8 red, green, blue;
>  };
>  
> @@ -229,15 +235,15 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
>  				 struct lg_g15_led *g15_led,
>  				 enum led_brightness brightness)
>  {
> +	struct mc_subled *subleds = g15_led->mcdev.subled_info;
>  	int ret;
>  
> +	led_mc_calc_color_components(&g15_led->mcdev, brightness);
> +
>  	g15->transfer_buf[0] = 5 + g15_led->led;
> -	g15->transfer_buf[1] =
> -		DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
> -	g15->transfer_buf[2] =
> -		DIV_ROUND_CLOSEST(g15_led->green * brightness, 255);
> -	g15->transfer_buf[3] =
> -		DIV_ROUND_CLOSEST(g15_led->blue * brightness, 255);
> +	g15->transfer_buf[1] = subleds[0].brightness;
> +	g15->transfer_buf[2] = subleds[1].brightness;
> +	g15->transfer_buf[3] = subleds[2].brightness;
>  
>  	ret = hid_hw_raw_request(g15->hdev,
>  				 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
> @@ -258,8 +264,9 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
>  static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness)
>  {
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
>  	struct lg_g15_led *g15_led =
> -		container_of(led_cdev, struct lg_g15_led, cdev);
> +		container_of(mc, struct lg_g15_led, mcdev);
>  	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
>  	int ret;
>  
> @@ -276,82 +283,20 @@ static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
>  
>  static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
>  {
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
>  	struct lg_g15_led *g15_led =
> -		container_of(led_cdev, struct lg_g15_led, cdev);
> +		container_of(mc, struct lg_g15_led, mcdev);
>  
>  	return g15_led->brightness;
>  }
>  
> -static ssize_t color_store(struct device *dev, struct device_attribute *attr,
> -			   const char *buf, size_t count)
> -{
> -	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> -	struct lg_g15_led *g15_led =
> -		container_of(led_cdev, struct lg_g15_led, cdev);
> -	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> -	unsigned long value;
> -	int ret;
> -
> -	if (count < 7 || (count == 8 && buf[7] != '\n') || count > 8)
> -		return -EINVAL;
> -
> -	if (buf[0] != '#')
> -		return -EINVAL;
> -
> -	ret = kstrtoul(buf + 1, 16, &value);
> -	if (ret)
> -		return ret;
> -
> -	mutex_lock(&g15->mutex);
> -	g15_led->red   = (value & 0xff0000) >> 16;
> -	g15_led->green = (value & 0x00ff00) >> 8;
> -	g15_led->blue  = (value & 0x0000ff);
> -	ret = lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
> -	mutex_unlock(&g15->mutex);
> -
> -	return (ret < 0) ? ret : count;
> -}
> -
> -static ssize_t color_show(struct device *dev, struct device_attribute *attr,
> -			  char *buf)
> -{
> -	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> -	struct lg_g15_led *g15_led =
> -		container_of(led_cdev, struct lg_g15_led, cdev);
> -	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> -	ssize_t ret;
> -
> -	mutex_lock(&g15->mutex);
> -	ret = sprintf(buf, "#%02x%02x%02x\n",
> -		      g15_led->red, g15_led->green, g15_led->blue);
> -	mutex_unlock(&g15->mutex);
> -
> -	return ret;
> -}
> -
> -static DEVICE_ATTR_RW(color);
> -
> -static struct attribute *lg_g510_kbd_led_attrs[] = {
> -	&dev_attr_color.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group lg_g510_kbd_led_group = {
> -	.attrs = lg_g510_kbd_led_attrs,
> -};
> -
> -static const struct attribute_group *lg_g510_kbd_led_groups[] = {
> -	&lg_g510_kbd_led_group,
> -	NULL,
> -};
> -
>  static void lg_g510_leds_sync_work(struct work_struct *work)
>  {
>  	struct lg_g15_data *g15 = container_of(work, struct lg_g15_data, work);
> +	struct lg_g15_led *g15_led = &g15->leds[LG_G15_KBD_BRIGHTNESS];
>  
>  	mutex_lock(&g15->mutex);
> -	lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
> -			      g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> +	lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
>  	mutex_unlock(&g15->mutex);
>  }
>  
> @@ -667,8 +612,46 @@ static void lg_g15_input_close(struct input_dev *dev)
>  	hid_hw_close(hdev);
>  }
>  
> +static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
> +{
> +	int i;
> +	struct mc_subled *subled_info;
> +
> +	g15->leds[index].mcdev.led_cdev.brightness_set_blocking =
> +		lg_g510_kbd_led_set;
> +	g15->leds[index].mcdev.led_cdev.brightness_get =
> +		lg_g510_kbd_led_get;
> +	g15->leds[index].mcdev.led_cdev.max_brightness = 255;
> +	g15->leds[index].mcdev.num_colors = 3;
> +
> +	subled_info = devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_info), GFP_KERNEL);
> +	if (!subled_info)
> +		return;
> +
> +	for (i = 0; i < 3; i++) {
> +		switch (i + 1) {
> +		case LED_COLOR_ID_RED:
> +			subled_info[i].color_index = LED_COLOR_ID_RED;
> +			subled_info[i].intensity = g15->leds[index].red;
> +			break;
> +		case LED_COLOR_ID_GREEN:
> +			subled_info[i].color_index = LED_COLOR_ID_GREEN;
> +			subled_info[i].intensity = g15->leds[index].green;
> +			break;
> +		case LED_COLOR_ID_BLUE:
> +			subled_info[i].color_index = LED_COLOR_ID_BLUE;
> +			subled_info[i].intensity = g15->leds[index].blue;
> +			break;
> +		}
> +		subled_info[i].channel = i;
> +	}
> +	g15->leds[index].mcdev.subled_info = subled_info;
> +}
> +
>  static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  {
> +	int ret;
> +
>  	g15->leds[i].led = i;
>  	g15->leds[i].cdev.name = name;
>  
> @@ -685,6 +668,7 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  		} else {
>  			g15->leds[i].cdev.max_brightness = 1;
>  		}
> +		ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
>  		break;
>  	case LG_G510:
>  	case LG_G510_USB_AUDIO:
> @@ -697,12 +681,11 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  			g15->leds[i].cdev.name = "g15::power_on_backlight_val";
>  			fallthrough;
>  		case LG_G15_KBD_BRIGHTNESS:
> -			g15->leds[i].cdev.brightness_set_blocking =
> -				lg_g510_kbd_led_set;
> -			g15->leds[i].cdev.brightness_get =
> -				lg_g510_kbd_led_get;
> -			g15->leds[i].cdev.max_brightness = 255;
> -			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
> +			/* register multicolor LED */
> +			lg_g15_setup_led_rgb(g15, i);
> +			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
> +									&g15->leds[i].mcdev,
> +									NULL);
>  			break;
>  		default:
>  			g15->leds[i].cdev.brightness_set_blocking =
> @@ -710,11 +693,12 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  			g15->leds[i].cdev.brightness_get =
>  				lg_g510_mkey_led_get;
>  			g15->leds[i].cdev.max_brightness = 1;
> +			ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
>  		}
>  		break;
>  	}
>  
> -	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
> +	return ret;
>  }
>  
>  /* Common input device init code shared between keyboards and Z-10 speaker handling */


