Return-Path: <linux-input+bounces-13188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67883AED8C1
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574D43B53D5
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F922244683;
	Mon, 30 Jun 2025 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShNzzdJ6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C90242D6C;
	Mon, 30 Jun 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275980; cv=none; b=j2GF6RwUA2Xb/OqKaQ0yztpZkpvCt+jqVZ8/9F9c7j6fOP+wPKLLbSP5CTVu0ziq8d+4CoPeT4OlqqtrQwZzlukuYvR6vJ/va+n0J+upL7/McbFW/rqhOVhbl/M5gZGywp8P3QKM3o5b5gkf8CjK3RDOA291XaLK6bNA1gnxZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275980; c=relaxed/simple;
	bh=cmRrk0/alHFnMCDh8ZgBmDGAlsiNNk6OQwjwWvua4eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gawP9Ve4L9VswbWp16oKtiCLryGmGmUGxUhK7LvAsCOmyWo8iuCyI0HXy8CerO7pICa95o85jl2LUAVTlfEQ3y/ePU6JqPW3331MtprFpmJreb97Rcq2RXSURDl9WEyVFlus0W71KEVjXPwOb7txmjIgXsiPITNBdXWEZaOuLDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShNzzdJ6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so1587354f8f.2;
        Mon, 30 Jun 2025 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751275977; x=1751880777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EpjeoxeqTMuRKQnTiajZ8lmWioJMNpbepadmsjR9rk=;
        b=ShNzzdJ6X//3PXalcNrI6T8GnKFxapjbwLrLKOmaP4MRyc9LSk0kUtl3F2YY+0UPae
         opMw+MHtud+FqWRpE7YkLo4LLEtqViiU41pLKcW8jTIWobrdFkMlJWm3uMXDrIu7hnP+
         hiXBQPCGjvaZhK5XNadwgOVZ5BuUhmkhcwEd42Dpyl61ugU1O8iAPZteTzduVSnQV9uZ
         f/7qHPRSeiCARTkfH9FR+uY2sgVhWnSTfhHNY1ezRVwPGUc/cis8bXBh0J4vxnQsafUQ
         hvXH8V3Q7tkmIs3wizXhsblhKrLfXD6x49IlOOftPIwTBOQmYpJ5nf5NXmHym+XicX3o
         dGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275977; x=1751880777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EpjeoxeqTMuRKQnTiajZ8lmWioJMNpbepadmsjR9rk=;
        b=s0QihumOlCjgQyaiCIRmaQouuro7ZOxHvfk4gT6TfyzqjRw8yJQis3xM36u9CbN9q7
         Ta7ofH5FS0Lg3nXnwwIsx9esLb5Rt9OLmguH/uctKwwYSnvaOCjPVTqE2iu1JCT4vdmH
         9JzCiTEqLtkIU5eSyOw9SL1bjBwetGz6beBgsQJS5+UYroebXgMoZo10NTUY0940RILs
         nfvLIrm3sACmYcLFS9svZwFdsLPiC5DtRpqxDYOdmhyg/717OTuYQOcdtCTZjwT8AFY0
         MITxLr13QZkTjmdeoRnrqQaEVTJk4l0Mu0tl+Nl91OxULJc6Ciq5lwMZWk9Xvt9iCfNT
         xEaA==
X-Forwarded-Encrypted: i=1; AJvYcCX2BRH1Yfj6aVXa/U8pkZDSzzcEctcRc5kAinzzSsM0dvpcLaw+HeZTa71lfw28nwGmWRHBLOpNX78fsg==@vger.kernel.org, AJvYcCXi9E/LZZRFGresND4x8xXD9C6FlVxkwjpmwbdAUhuPdij8pJSO8MZbhPovCO3I1O/gK2NTsfSVVNYnVFT4@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6Va7FXOm8p1DB+xaZqR+2Ejl+jQeWQk5lVOo+t1z4lFpAg5B
	rS665LptUXoUS71bq5mWpL32GbUvb1rJ6Ur4LXYMTUj1fh+Z1Kf9mgJw
X-Gm-Gg: ASbGncvC82VpmaKhyy4dPSjssjkew2Yj3Nk4tRsDnXVlo2K0+iwuknOWq/0NJzvokii
	Hm+/qFv2lsdISzQIvGftA38bGGkADXAHd2obosi/44B6FV6lnXbE027xkFnJZPeEfTzLKHa8Da9
	hmj2duLCnK+tRbX8oLa6D/CvEFBGgTSdlAn/MNMbwJrJUYGPkcQuqzT2zzeljf7g4R5SU7YoWNc
	afoj6FJstTR/svnuJKe/zf9agD9i2wBG4QNo4e9joVMrqbSZ/VMFip0vX3GFX4JvwVLTHEC+u3+
	arx0Bg/KzP10qkasEVQHSGUbsehIT9gjQ98LQeJhjjbgRB3059FNBQt/A/E=
X-Google-Smtp-Source: AGHT+IGHvz7hvIJ1+tHuW3jfh163ytUZXhFdLp1KKKYn3HMiIW+9gH2CLBSNlrNBIT+tb0MdMi6pCg==
X-Received: by 2002:a05:6000:2a04:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a8feb8479fmr7995116f8f.54.1751275976472;
        Mon, 30 Jun 2025 02:32:56 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80bb28sm9684934f8f.43.2025.06.30.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:32:56 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:32:54 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: magicmouse: avoid setting up battery timer when
 not needed
Message-ID: <aGJZxlV-Vyi0EDN7@fedora>
References: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95970C5D46483D0367C1D63CB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95970C5D46483D0367C1D63CB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

Hi Aditya,

On Wed, Jun 25, 2025 at 07:46:04PM +0530, Aditya Garg wrote:
> Currently, the battery timer is set up for all devices using
> hid-magicmouse, irrespective of whether they actually need it or not.
> 
> The current implementation requires the battery timer for Magic Mouse 2
> and Magic Trackpad 2 when connected via USB only. Add checks to ensure
> that the battery timer is only set up when they are connected via USB.
> 
> Fixes: 0b91b4e4dae6 ("HID: magicmouse: Report battery level over USB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/hid-magicmouse.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index f49405d38..3e531905b 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -863,18 +863,22 @@ static int magicmouse_probe(struct hid_device *hdev,
>  		return ret;
>  	}
>  
> -	timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
> -	mod_timer(&msc->battery_timer,
> -		  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
> -	magicmouse_fetch_battery(hdev);
> -
> -	if (id->vendor == USB_VENDOR_ID_APPLE &&
> -	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> -	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
> -	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> -	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
> -	      hdev->type != HID_TYPE_USBMOUSE)))
> -		return 0;
> +	if (id->vendor == USB_VENDOR_ID_APPLE) {
> +		bool is_mouse2 = (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +				  id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC);
> +		bool is_trackpad2 = (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +				     id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC);
> +
> +		if (is_mouse2 || is_trackpad2) {
> +			timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
> +			mod_timer(&msc->battery_timer,
> +				  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
> +			magicmouse_fetch_battery(hdev);
> +		}
> +
> +		if (is_mouse2 || (is_trackpad2 && hdev->type != HID_TYPE_USBMOUSE))
> +			return 0;
> +	}

Instead of duplicating these conditions here and in magicmouse_remove(),
you could move them into a helper function.

Also, watch out the `err_stop_hw:` error case, the timer could be used
there uninitialized.

Jose

>  	if (!msc->input) {
>  		hid_err(hdev, "magicmouse input not registered\n");
> @@ -947,7 +951,13 @@ static void magicmouse_remove(struct hid_device *hdev)
>  
>  	if (msc) {
>  		cancel_delayed_work_sync(&msc->work);
> -		timer_delete_sync(&msc->battery_timer);
> +		if (hdev->vendor == USB_VENDOR_ID_APPLE &&
> +		    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +		     hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
> +		     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
> +
> +			timer_delete_sync(&msc->battery_timer);
>  	}
>  
>  	hid_hw_stop(hdev);
> -- 
> 2.43.0
> 

