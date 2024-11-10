Return-Path: <linux-input+bounces-7997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602A9C32D8
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 15:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A6228146E
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B132E17BCE;
	Sun, 10 Nov 2024 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwTTR8vS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92685588E;
	Sun, 10 Nov 2024 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250098; cv=none; b=K7KPCBktopTA6v0WL4spBFKFXbA+ptu+qOXBER9uU7534FvE6a2MZIji5SjOwVMJNRGRgSohGNHY52hkIdk9fjb3hXlZ3H3PK23lqff9qMh+DqBZ1L2bU2BERU7Bpoa1Zouqbb+u8HLaqda7OYx8U5/u7oADeLyieJ7m8ii5pNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250098; c=relaxed/simple;
	bh=9vs+HQ1awcKA/L/KTwiAnynwJ+u6HzV5LcxrQRdidkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIdel50NVgTm1tRNAOwcs8ov+dtOBo0nRv6qGjPe8C+F3sBUN1tYKb44KfqevuKpRF53Hkrj2woERhOMMwK1QCBzVy7UuPoBwrkPi1bjpnnBK1Fj6Y4j5Pu7zM3WSyHCdBwO95fTv21mUOiOZ4KE+SsNtSNaaFq1XpUt9foA8GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwTTR8vS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so3025217a91.3;
        Sun, 10 Nov 2024 06:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731250096; x=1731854896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQOqYsTHym9lxrVeULcXEetu1nTlsfApGjExzZ9wPdc=;
        b=VwTTR8vSet/NlZzPgWi3Tj5EIjaTHtTOffHe1XWvqn/2hpCGhHXWlMXUDSVDWOWwuf
         chycUUcR4bjDqib752puCLHNdEEe3XAuHK60Cp4FRtogtlUuPNRy+TdqTCBhcq6HwR8L
         dugRdN9AHh6eI/nkraMBqbTNh83mzy+HW4R0YLSSv8GS64Gw114Y7UtFNeyZI8A0Ic4X
         6YV9StU5Tt7koqk8WvK+Mjh28gtqbxZXJ2WWJ9ay5NSw8teDsH+7ABWTnmUbyXHtV9Mc
         q4kXdsIoW9Y2mYl/JoAeH6dcEGuoJ3OKZm+gfh6i1Q4hWJwaxIdMa3J3q2mdRZ/PSnyG
         d4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731250096; x=1731854896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQOqYsTHym9lxrVeULcXEetu1nTlsfApGjExzZ9wPdc=;
        b=F3ZJuXJjyR9OyuhEHJ/vAmuZx1tGeoqXmdHNYhXdL/1/s1/OIzDNbiKlgia0tk6L0u
         THZmo142FSOu7rjekVl175OW1YMF7b6ZW4n6ERwP5bp4r01QcNfJ8Z9GQHhi3Ta2dJe7
         N5juZdDGUkbzgncgpwSco2oYLauWJjo+CrQopCx5T55lpQ8iEIG2FgVe+i9gHVI3IqTJ
         ZTX+NKd2bgRwY9o4YhFCzwWVWDkRqgApopvAGOAxwxx6wECTXMaSB7z/MEdfOp8WAM+a
         LahqoCtrfGi1W2mIFmYfzvk/qy24aRepu/SkhLOuePwO+ko3Q5JbhRoLWJQYLJpRPxW1
         W7tg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZIvA6EbfpItoeW29CYXzUi9JzH9X5RiNxufHpUkxJrjdknKycuuA8oCGiE183xz2gZPS84M7+wstNA==@vger.kernel.org, AJvYcCXtIciZenki8fT9VLhWI32cNhIs+q7RMWgqfiQnK7gcIiXOuIkZTcLRYPYb3RxC8cEQu8/xdCqdmZ89Fruv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5c0iKo+ZGtYLZnaDUWhEyvKuqCgWgs5acN4NRIjpz8ZRXInWM
	HLGvVc3gKTUmKeYl40lD6UZv4U4+1mVZ5CiqQgOezhPzghjKZLK+AJ0i8Q==
X-Google-Smtp-Source: AGHT+IE6641ScPmXUAlSnKLfgBlsNGp3nfgM8H3+QQ/JAvtLW+p8T11kFB4L1rQheob6ea3ZlBlcmQ==
X-Received: by 2002:a17:90b:51d2:b0:2e2:daab:cc69 with SMTP id 98e67ed59e1d1-2e9b171f11emr12473440a91.12.1731250096149;
        Sun, 10 Nov 2024 06:48:16 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm6876184a91.41.2024.11.10.06.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 06:48:15 -0800 (PST)
Date: Sun, 10 Nov 2024 22:48:12 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Callahan Kovacs <callahankovacs@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, jose.exposito89@gmail.com
Subject: Re: [PATCH] HID: magicmouse: Apple Magic Trackpad 2 USB-C driver
 support
Message-ID: <ZzDHrOr43KO+CtuL@visitorckw-System-Product-Name>
References: <20241110002816.6064-1-callahankovacs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241110002816.6064-1-callahankovacs@gmail.com>

Hi Callahan,

On Sat, Nov 09, 2024 at 06:25:56PM -0600, Callahan Kovacs wrote:
> Adds driver support for the USB-C model of Apple's Magic Trackpad 2.
> 
> The 2024 USB-C model is compatible with the existing Magic Trackpad 2
> driver but has a different hardware ID.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219470

Thanks for your patch. However, all kernel patches require the author
to add a Signed-off-by tag at the end of the commit message. Could you
please resend the patch with this correction?

See: https://www.kernel.org/doc/html/v6.11/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Regards,
Kuan-Wei

> ---
>  drivers/hid/hid-ids.h        |  1 +
>  drivers/hid/hid-magicmouse.c | 56 ++++++++++++++++++++++++++----------
>  2 files changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 92cff3f2658c..0f23be98c56e 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -94,6 +94,7 @@
>  #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
>  #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
>  #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
> +#define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
>  #define USB_DEVICE_ID_APPLE_FOUNTAIN_ANSI	0x020e
>  #define USB_DEVICE_ID_APPLE_FOUNTAIN_ISO	0x020f
>  #define USB_DEVICE_ID_APPLE_GEYSER_ANSI	0x0214
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index 8a73b59e0827..ec110dea8772 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -227,7 +227,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
>  		touch_minor = tdata[4];
>  		state = tdata[7] & TOUCH_STATE_MASK;
>  		down = state != TOUCH_STATE_NONE;
> -	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		   input->id.product ==
> +			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		id = tdata[8] & 0xf;
>  		x = (tdata[1] << 27 | tdata[0] << 19) >> 19;
>  		y = -((tdata[3] << 30 | tdata[2] << 22 | tdata[1] << 14) >> 19);
> @@ -259,8 +261,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
>  	/* If requested, emulate a scroll wheel by detecting small
>  	 * vertical touch motions.
>  	 */
> -	if (emulate_scroll_wheel && (input->id.product !=
> -			USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)) {
> +	if (emulate_scroll_wheel &&
> +	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
> +	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		unsigned long now = jiffies;
>  		int step_x = msc->touches[id].scroll_x - x;
>  		int step_y = msc->touches[id].scroll_y - y;
> @@ -359,7 +362,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
>  		input_report_abs(input, ABS_MT_POSITION_X, x);
>  		input_report_abs(input, ABS_MT_POSITION_Y, y);
>  
> -		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
> +		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		    input->id.product ==
> +			    USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
>  			input_report_abs(input, ABS_MT_PRESSURE, pressure);
>  
>  		if (report_undeciphered) {
> @@ -367,7 +372,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
>  			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
>  				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
>  			else if (input->id.product !=
> -					USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
> +					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
> +				 input->id.product !=
> +					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
>  				input_event(input, EV_MSC, MSC_RAW, tdata[8]);
>  		}
>  	}
> @@ -493,7 +500,9 @@ static int magicmouse_raw_event(struct hid_device *hdev,
>  		magicmouse_emit_buttons(msc, clicks & 3);
>  		input_report_rel(input, REL_X, x);
>  		input_report_rel(input, REL_Y, y);
> -	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		   input->id.product ==
> +			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		input_mt_sync_frame(input);
>  		input_report_key(input, BTN_MOUSE, clicks & 1);
>  	} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
> @@ -545,7 +554,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
>  			__set_bit(REL_WHEEL_HI_RES, input->relbit);
>  			__set_bit(REL_HWHEEL_HI_RES, input->relbit);
>  		}
> -	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		   input->id.product ==
> +			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		/* If the trackpad has been connected to a Mac, the name is
>  		 * automatically personalized, e.g., "José Expósito's Trackpad".
>  		 * When connected through Bluetooth, the personalized name is
> @@ -621,7 +632,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
>  				  MOUSE_RES_X);
>  		input_abs_set_res(input, ABS_MT_POSITION_Y,
>  				  MOUSE_RES_Y);
> -	} else if (input->id.product ==  USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		   input->id.product ==
> +			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 253, 0, 0);
>  		input_set_abs_params(input, ABS_PRESSURE, 0, 253, 0, 0);
>  		input_set_abs_params(input, ABS_MT_ORIENTATION, -3, 4, 0, 0);
> @@ -660,7 +673,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
>  	input_set_events_per_packet(input, 60);
>  
>  	if (report_undeciphered &&
> -	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
> +	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		__set_bit(EV_MSC, input->evbit);
>  		__set_bit(MSC_RAW, input->mscbit);
>  	}
> @@ -685,7 +699,9 @@ static int magicmouse_input_mapping(struct hid_device *hdev,
>  
>  	/* Magic Trackpad does not give relative data after switching to MT */
>  	if ((hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD ||
> -	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
> +	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +	     hi->input->id.product ==
> +		     USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
>  	    field->flags & HID_MAIN_ITEM_RELATIVE)
>  		return -1;
>  
> @@ -721,7 +737,8 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
>  	int ret;
>  	int feature_size;
>  
> -	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
>  			feature_size = sizeof(feature_mt_trackpad2_bt);
>  			feature = feature_mt_trackpad2_bt;
> @@ -766,7 +783,8 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
>  
>  	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
>  	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
> -	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2))
> +	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
> +	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
>  		return -1;
>  
>  	report_enum = &hdev->report_enum[hdev->battery_report_type];
> @@ -835,7 +853,9 @@ static int magicmouse_probe(struct hid_device *hdev,
>  
>  	if (id->vendor == USB_VENDOR_ID_APPLE &&
>  	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> -	     (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 && hdev->type != HID_TYPE_USBMOUSE)))
> +	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
> +	      hdev->type != HID_TYPE_USBMOUSE)))
>  		return 0;
>  
>  	if (!msc->input) {
> @@ -850,7 +870,8 @@ static int magicmouse_probe(struct hid_device *hdev,
>  	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
>  		report = hid_register_report(hdev, HID_INPUT_REPORT,
>  			MOUSE2_REPORT_ID, 0);
> -	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
> +	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
>  		if (id->vendor == BT_VENDOR_ID_APPLE)
>  			report = hid_register_report(hdev, HID_INPUT_REPORT,
>  				TRACKPAD2_BT_REPORT_ID, 0);
> @@ -920,7 +941,8 @@ static const __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  	 */
>  	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
>  	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> -	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
> +	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> +	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
>  	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
>  		hid_info(hdev,
>  			 "fixing up magicmouse battery report descriptor\n");
> @@ -951,6 +973,10 @@ static const struct hid_device_id magic_mice[] = {
>  		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
>  		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
> +	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
> +		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
> +		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(hid, magic_mice);
> -- 
> 2.45.2
> 
> 

