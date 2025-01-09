Return-Path: <linux-input+bounces-9113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFAA0777B
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 14:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 228F81680F7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 13:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399C021766D;
	Thu,  9 Jan 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHVTqaSL"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0B1E868
	for <linux-input@vger.kernel.org>; Thu,  9 Jan 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429513; cv=none; b=f7uh1yZKv42vgbwXHnhFhLZ75OAv/TBtN6DGYoNZzSLlWuIt4lhABJLQuAN8CF7xivMzWpwhp/qsCJiD8Vr5ZWicz4Gk5JrBGzl5+B8Htmw/xYztvosQfdKq7ZTfYupng1djBxXDn9xNR5Y0xo7AjTbi7Xo2EnMx5VBarWAGUJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429513; c=relaxed/simple;
	bh=h6tDIVLA2NdfYxqj1f3GfO1M35fLIUXQzQOq2RGOofw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XocEeqHVcRkWmwdFBopdW/ACZU7rMwKfntde8VGxp4mPpFOyD/jncegFRaGl6wSSNqOsyRAyyFM8j8HGjCuNPbvfDmxQf3oxpJ08o09M0VGraPLRp2amKu3pNAndfFD/zGhxHOkSUbsVQSe2I9TaVo+yHG5taAN5BRlt2TtxWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHVTqaSL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHrccDheOfu0y4UyOrxCd3esaxXksV6f6XBTaKt0n/Y=;
	b=GHVTqaSLB1MqIADJMe3XJOtrfqtpjAxDrlrHPkR2gTeJeYRkQ+Vaz5wj3yzHeihvzWfR8v
	kt4t6nBKzTZu8Kf9Qgkjdzm2bmEi+IcWL0nwbSQP2tD+v+DXatYIATY2hkRjLkcjYP0hHk
	sU2635eHd9l+dz7CBI7TOZsvJw7Yc6w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-ULwHPHSuO9SmUKbjlM7fDA-1; Thu, 09 Jan 2025 08:31:48 -0500
X-MC-Unique: ULwHPHSuO9SmUKbjlM7fDA-1
X-Mimecast-MFC-AGG-ID: ULwHPHSuO9SmUKbjlM7fDA
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d90b88322aso1020782a12.3
        for <linux-input@vger.kernel.org>; Thu, 09 Jan 2025 05:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429506; x=1737034306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHrccDheOfu0y4UyOrxCd3esaxXksV6f6XBTaKt0n/Y=;
        b=mJlt4NfwGB1LuPHH8bSAVwyLDGv5qTdlHEUuY+6GCeGf9mUZwM9QzWCl1eTo8pr8cy
         hvpjoW5ZNaKttF8sco+1FkKesvRtqjoF2Uu6Ut82/NxzKb74sib73TpSrUl3vA1s4aE0
         lMas0YnkYUXs4G0nMxNxri6NfbzhVWlhJM7t0vsXbp3aQxTPxzlYKaB2P/dTzeRrgiG2
         Kuk32+Iwlfkg5cfO7eBAmY+kzupWDrOdcTJPf/PrJnQK5G2tjPN6Ol1NngLSemXs71nJ
         lvr6FSXmsBlPDaccHYUnR7b9pzVy8KZtwKoZHoOErNf9omVWTjfNU3jS2axa+Imqxlee
         eSdA==
X-Forwarded-Encrypted: i=1; AJvYcCXqB8Vd12BH7x/JUnTqmLZN+gptbvfXKaBHCQxV+sWxdBaFv58KrL+42Ar+NW/9G0nqbnRaqdOcGVm+rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6oGtLewwp6iX0Ri3yUdr8UALkdVcD1ehlfgI8M0nHPBp72X+i
	ZBfLdqduw2fL152xe3q7hLsZylyeakgc8As1tWDme+ib+a6SP3G3nc2HKCFw+z8DlJgHPV14vWz
	V9uFiJFM3cnroM/csUX98WXB5+DhBYdN04zeCAK70LrMBZAA8x7jTlZr/sbn+5tkHt+NkLGRglA
	==
X-Gm-Gg: ASbGnctJLAJUEbOLLF4BFXIMqpYvvN0okMfeNv5dWNhF9UyATBRWH/C418QhDy1sQ+5
	JnEUozcxERjos+EaVNZ4mwptSV/LYhvjVBKLFLyHrmuCyC23ZXGCGaFBHd6mxeazHWjyw6fpf01
	r0wM/stbSTdeG72wN468qkTeSsYZf6tHcg/5iAvs7ZdMLNfGo58VGkbNWtgeGReWPdBrgnjg5q8
	T9KPvQG9e4y/4XRlomD9iNG8yar9tlSYQpbp4+iRHn40Gw11Ujw91BYMvM9DobJjySQejk2h+By
	EysgzKtIJXL4ZOSRW+QxLgpNyG6z
X-Received: by 2002:a05:6402:194e:b0:5d8:211a:4d59 with SMTP id 4fb4d7f45d1cf-5d972e178e1mr6900618a12.19.1736429505821;
        Thu, 09 Jan 2025 05:31:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLaPbHFgiuzEAd0BxKLtbWPBNcpQyzXjgiElURNfBqtvmva6y0YBOnxKjlE9lwCPRrc2TKdg==
X-Received: by 2002:a05:6402:194e:b0:5d8:211a:4d59 with SMTP id 4fb4d7f45d1cf-5d972e178e1mr6900590a12.19.1736429505358;
        Thu, 09 Jan 2025 05:31:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046d7b8sm586052a12.69.2025.01.09.05.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:31:44 -0800 (PST)
Message-ID: <c39ac349-b1f3-4ab3-bbd7-98450fe4f7e9@redhat.com>
Date: Thu, 9 Jan 2025 14:31:44 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid: hid-lg-g15: Use standard multicolor LED API
To: Kate Hsuan <hpa@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241218085955.555316-1-hpa@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241218085955.555316-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

Thank you for your work on this.

On 18-Dec-24 9:59 AM, Kate Hsuan wrote:
> This work migrated the multicolor LED control to the standard multicolor
> LED API. Moreover, the codes related to the "color" attribute used to
> set up the color previously were removed.

I think the commit message needs some work, I would write for example:

"""
Replace the custom "color" sysfs attribute with the standard multicolor
LED API.

This also removes the code for the custom "color" sysfs attribute,
the "color" sysfs attribute was never documented so hopefully it is not
used by anyone.

If we get complaints we can re-add the "color" sysfs attribute as
a compatibility wrapper setting the subleds intensity.
"""

> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/hid/hid-lg-g15.c | 145 ++++++++++++++++++---------------------
>  1 file changed, 68 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index 53e7b90f9cc3..52159cecca27 100644
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
> @@ -44,7 +46,10 @@ enum lg_g15_led_type {
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

red, green and blue are now only used to store the initial color intensities
I would add a comment for this:

	/* Used to store initial color intensities before subled_info is allocated */
>  	u8 red, green, blue;
> @@ -227,17 +232,18 @@ static int lg_g510_get_initial_led_brightness(struct lg_g15_data *g15, int i)
>  /* Must be called with g15->mutex locked */
>  static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
>  				 struct lg_g15_led *g15_led,
> +				 struct mc_subled *subleds,

The g15_led already gives you a pointer to the subleds, so I would
drop this argument, leaving the function signature unchanged.

>  				 enum led_brightness brightness)
>  {

And then instead at a subleds helper variable here:

	struct mc_subled *subleds = g15_led->mcdev.subled_info;

>  	int ret;

I would do the led_mc_calc_color_components() call here instead of in
lg_g510_kbd_led_set():

	led_mc_calc_color_components(&g15_led->mcdev, brightness);

>  	g15->transfer_buf[0] = 5 + g15_led->led;
>  	g15->transfer_buf[1] =
> -		DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
> +		DIV_ROUND_CLOSEST(subleds[0].intensity * brightness, 255);

The reason to do this here, is because led_mc_calc_color_components()
already does the scaling of intensity by brightness for you, see
its code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/led-class-multicolor.c#n14

So instead of using subleds[x].intensity, you should directly use
subleds[i].brightness and drop the calculations, resulting in:

	g15->transfer_buf[0] = 5 + g15_led->led;
	g15->transfer_buf[1] = subleds[0].brightness;
	g15->transfer_buf[2] = subleds[1].brightness;
	g15->transfer_buf[3] = subleds[2].brightness;

>  	ret = hid_hw_raw_request(g15->hdev,
>  				 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
> @@ -258,9 +264,11 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
>  static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness)
>  {
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
>  	struct lg_g15_led *g15_led =
>  		container_of(led_cdev, struct lg_g15_led, cdev);

This container_of() now is incorrect, this assumes that led_cdev points
to the cdev part of the anonymous union in struct lg_g15_led, but for
the g510_kbd_led handling the mcdev part of that union is now used.

So the correct container_of() usage would be:

	struct lg_g15_led *g15_led =
		container_of(mc, struct lg_g15_led, mcdev);

please fix this.

(the old code happens to work because the led_cdev member of
struct led_classdev_mc happens to be the first member)

>  	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> +	struct mc_subled *subleds;

With my proposal above to keep the lg_g510_kbd_led_write() function
prototype unchanged the other changes to lg_g510_kbd_led_set() can
be dropped.

>  	int ret;
>  
>  	/* Ignore LED off on unregister / keyboard unplug */
> @@ -268,7 +276,11 @@ static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
>  		return 0;
>  
>  	mutex_lock(&g15->mutex);
> -	ret = lg_g510_kbd_led_write(g15, g15_led, brightness);
> +
> +	led_mc_calc_color_components(mc, brightness);
> +	subleds = mc->subled_info;
> +
> +	ret = lg_g510_kbd_led_write(g15, g15_led, subleds, brightness);
>  	mutex_unlock(&g15->mutex);
>  
>  	return ret;
> @@ -282,76 +294,15 @@ static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
>  	return g15_led->brightness;
>  }

You also need to update the container_of() in lg_g510_kbd_led_get(),
so you get:

static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
{
	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
	struct lg_g15_led *g15_led =
		container_of(mc, struct lg_g15_led, mcdev);

	return g15_led->brightness;
}


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
> +	struct led_classdev_mc *mc = &g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev;
> +	struct lg_g15_led *g15_led = &g15->leds[LG_G15_KBD_BRIGHTNESS];
> +	struct mc_subled *subleds = mc->subled_info;
>  
>  	mutex_lock(&g15->mutex);
> -	lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
> -			      g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> +	lg_g510_kbd_led_write(g15, g15_led, subleds, g15_led->brightness);
>  	mutex_unlock(&g15->mutex);

With my proposal above to keep the lg_g510_kbd_led_write() function
prototype unchanged all changes to lg_g510_leds_sync_work() can be dropped.


>  }
>  
> @@ -667,8 +618,47 @@ static void lg_g15_input_close(struct input_dev *dev)
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
> +	g15->leds[index].mcdev.led_cdev.max_brightness = g15->leds[index].brightness;

max_brightness should be 255, not the current brightness:

	g15->leds[index].mcdev.led_cdev.max_brightness = 255;

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
> +		subled_info[i].intensity = 255;

You are already setting subled_info[i].intensity to the correct value above,
which you are overriding here, so this line should be dropped.


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
> @@ -685,6 +675,7 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  		} else {
>  			g15->leds[i].cdev.max_brightness = 1;
>  		}
> +		ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
>  		break;
>  	case LG_G510:
>  	case LG_G510_USB_AUDIO:
> @@ -697,12 +688,11 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
>  			g15->leds[i].cdev.name = "g15::power_on_backlight_val";
>  			fallthrough;
>  		case LG_G15_KBD_BRIGHTNESS:
> -			g15->leds[i].cdev.brightness_set_blocking =
> -				lg_g510_kbd_led_set;
> -			g15->leds[i].cdev.brightness_get =
> -				lg_g510_kbd_led_get;
> -			g15->leds[i].cdev.max_brightness = 255;
> -			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
> +			/* register multicolor */
> +			lg_g15_setup_led_rgb(g15, i);
> +			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
> +									&g15->leds[i].mcdev,
> +									NULL);
>  			break;
>  		default:
>  			g15->leds[i].cdev.brightness_set_blocking =
> @@ -710,11 +700,12 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
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

Regards,

Hans




