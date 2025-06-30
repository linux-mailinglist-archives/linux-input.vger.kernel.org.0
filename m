Return-Path: <linux-input+bounces-13189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBBAED8CC
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7179B3B633A
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 09:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9681F246BB0;
	Mon, 30 Jun 2025 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc9TT+/3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC4246765;
	Mon, 30 Jun 2025 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276042; cv=none; b=QbHT1fizUTKXrPHZmj7vkerM2y5WayLSjeqFWXaVv8br1rdZkMjYaSZ914pEqJZx+i1O32upciZORO4PhqDpStgrL4+iV+ZQ01nSeRt1v7UP2EIlLw9HCGmDcWxk8js6zHsz3xhrawgVqKyQf9HbT0UAOK3G3oqlt9Jc1QsVArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276042; c=relaxed/simple;
	bh=lKvKAZPsS/KYd+XrqLIcBDlTMIP0wJNpfc9MKVQDw0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUYMz0r5VE5UpWoibWpUGcc1fXIT5ZoHJvtEKwI+tlmHX8K0J6B4wJJ8wnAFit34VufrKuzlfhzpnEgueWdhMcBHXujz0ceCqcDX6LkNTbdMqxVMo7b+lmhRkrjjI5ieqXGgtCbloOhC2j0DKFr2k4zx4jyK6e3U/7rIThintlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc9TT+/3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce671a08so11440575e9.3;
        Mon, 30 Jun 2025 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276039; x=1751880839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7ZTVpIkruy1/6yYqzE1LD33CXiYUWxEYB34IGforkg=;
        b=Yc9TT+/3fvPY1QL0MSjrSwCgHCZafOP0w1ndPUuOTI4TS995agKmyNwoc0qZZkiHc4
         c3sAPHUIDIzq3TNO9+XKuH2aqn6wtjkrnrPDPhbQawDmbPSiRnFo/VRLAbEbtTcDOTFe
         Q6mYP5FsrFXYHlPCLLZdCi46mIy3clj85qJgwhP89D3Y25pxCZJElMIl5j2OjznSYIzf
         9ha16fE6tglwmJCj+OoIAsehBjGWcUerGAmgy+gZ0+4t9lbE50PpmcOZUDgiKnw8MiS/
         0cr3rwGO0qoueoOPmg02jaAqwtNXOr/6E17cJQg7uEOzzkv0BJeG3atCgNVnH/YUT3tr
         h87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276039; x=1751880839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7ZTVpIkruy1/6yYqzE1LD33CXiYUWxEYB34IGforkg=;
        b=d1ZIx9SHQKJ4oewaGvJVa7iXXsGeYI/B1M0D2qT6o1IhPkqkPVEUyQXHJQSeRIao+h
         stZnoVYZeCRfEHzBUM92GPjXXIsqAii7VTiiY7lLE7dc7XXtB4yYPell8zT540xpIDp+
         WLFpyYcrv8twCnEj2NgwuZ9GUFdOoBwBXbxjDB6CN9ACWwiY+TMXeLPks/wQj66lJdk3
         U752YmYBvn7Fm9rguJojzmk0n+KezBYwsY5PejR5cRXvubIsGk6cXPAtE3OX3oKcVX4F
         EcGHUEPCgpdY75SdKupaBk77Io1qj26QjhXu0yr531eRArGCedmQGx6e8tz+CG0oQZFn
         ADUA==
X-Forwarded-Encrypted: i=1; AJvYcCVBvjCEhSY0Zt1vHVnRF96jVPZXgJazeeTGKVAaHcXfT47zXM6OSPJDmet2lo3HNXbr4z2R/rSCHZmYBg==@vger.kernel.org, AJvYcCWH17ZSJHgKjSirjNbkIr9t2a/DcPYE24VASJ5glbXxY1cnRgVEA0dMLRCR1rPl3U/k28NCRop8CTCc7T/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjNBC1JhmNWL7ZuFSLhpagelmE5slEmjaZxIax4vbbzKY0ULT
	YJ9Py17Lmkkvf595qt58+HuDJ1ZhNYCHNSDa8aY+QJ8UY/xer9JGotgT
X-Gm-Gg: ASbGncvy8/1uhSachY7t8TqYqzPgipiT8DqhsM2MWqBsa0WVHn0Czr/x5effB7OG8G1
	+1B+K2lfUn9WGm6V5A3/ngnSFOFUxVVzGyFju9jcPxrEm0XRg5r7TEUpX26NhPS2F4mdNVwlONX
	yDROIZ6xEPQMjEX6BxzmoOl4gdgeFBvRsNHErCxnUBU1QzsxbPJ0e0iIpOn/95OacstDxCfj8Z8
	VP/kIVgpsFFdfUjlgGUUBZhZkth0vVqRoRNenCkYKHAKl54QRT3TGSerq/MFq6JMJRCkTyaLbpp
	0x/mZqBWKmcS7PiAumYGl8L6XK+cL03v1qq5UslsRp/LHa49TPYKVN0h3vI=
X-Google-Smtp-Source: AGHT+IGKfXk732rhiWztdNceNorQETUHYReSZk9+wn+MlI8DijKdKrW4IoL0uoGwato1K0rcRQndCw==
X-Received: by 2002:a05:600c:1c25:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-453a349da7dmr13780585e9.8.1751276038748;
        Mon, 30 Jun 2025 02:33:58 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad1adsm159957825e9.24.2025.06.30.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:33:58 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:33:56 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: apple: avoid setting up battery timer for
 devices without battery
Message-ID: <aGJaBJLwA7vbq32k@fedora>
References: <PN3PR01MB95973218D6B4ECDAE8ECF60BB87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597321C9A619D3CB336FB23B87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597321C9A619D3CB336FB23B87BA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Wed, Jun 25, 2025 at 07:46:03PM +0530, Aditya Garg wrote:
> Currently, the battery timer is set up for all devices using hid-apple,
> irrespective of whether they actually have a battery or not.
> 
> APPLE_RDESC_BATTERY is a quirk that indicates the device has a battery
> and needs the battery timer. This patch checks for this quirk before
> setting up the timer, ensuring that only devices with a battery will
> have the timer set up.
> 
> Fixes: 6e143293e17a ("HID: apple: Report Magic Keyboard battery over USB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/hid-apple.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index b8b99eb01..b9f45c089 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -959,10 +959,12 @@ static int apple_probe(struct hid_device *hdev,
>  		return ret;
>  	}
>  
> -	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
> -	mod_timer(&asc->battery_timer,
> -		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
> -	apple_fetch_battery(hdev);
> +	if (quirks & APPLE_RDESC_BATTERY) {
> +		timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
> +		mod_timer(&asc->battery_timer,
> +			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
> +		apple_fetch_battery(hdev);
> +	}
>

The same here, the `out_err:` error case uses the timer and it can
be uninitialized.

Jose

>  	if (quirks & APPLE_BACKLIGHT_CTL)
>  		apple_backlight_init(hdev);
> @@ -985,7 +987,8 @@ static void apple_remove(struct hid_device *hdev)
>  {
>  	struct apple_sc *asc = hid_get_drvdata(hdev);
>  
> -	timer_delete_sync(&asc->battery_timer);
> +	if (asc->quirks & APPLE_RDESC_BATTERY)
> +		timer_delete_sync(&asc->battery_timer);
>  
>  	hid_hw_stop(hdev);
>  }
> -- 
> 2.43.0
> 

