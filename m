Return-Path: <linux-input+bounces-16011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41824C4FFC3
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 23:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F088F3AF46F
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7100E293C4E;
	Tue, 11 Nov 2025 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+5FUwq5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9F279DCA
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762900670; cv=none; b=EwrEQ6cLQMhxAKvpmPfW9obs/QUIQReF8avDKRZSPPSSwKrPA3oL7zh3jqPIzokECZWVkv+asxovLdc6BN3QjURKKEQXnDIUEYcrAX6HgkneAsRwk+qvKkdBWGaeaUhLmLD1UXd7qEuq+g3YSOIt1Oh3kafBjxnK3FjZEd9fTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762900670; c=relaxed/simple;
	bh=FCTDwSHPXct2twj5vEPI7XJDIXSTRpJaVCHGpFkLGos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJqgIOgRxcg7/ylfsYum1a3YYWjEgkbJ1U1Swk0fXSW9ySYU+IRsIB+jU3tTPiId/DO/Xsz+cZMqIwRHga0dw5iND2ggrRyKsEENBo8BGG5Zia2BgzXkzLrYfvNpGeDWatNCngkEl8GL/Ez+QTixsvWHfyjFT9XXmMLiUYP6mLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+5FUwq5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781997d195aso132909b3a.3
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 14:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762900667; x=1763505467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY/JsJwRFqEAPo4zz6iFwCuMgF7TVQ43wTrMS+JFYqY=;
        b=A+5FUwq5on5MKCn9XZnBWoaabOvDCKurWN0sAJydnAG+15XYJdgKJIjxrBn/+0E7qn
         mN+nA/sR+lT+vC8AVX1gFeTqD0s9toq4tfx0pTlG7rmRY9k+XhAtd6A4GPlrs0X0tW6u
         eMrxT7RsDKdtAJQYr7NLBBe76cet7hdy5cuFr8goyAP5t3R2kJB3Kws5ZeqPurzfFczG
         GoEKtwiDJCNTJXYOxeVKA/OMocVhZ1ZMjwPLjaHFkyPNe+x8JIWYFCy8ZuXU0T6nCUYI
         JZ3SRU0sKaKGanO5UC1if/g95KxU7ypYpDih0FL8umihZz68VA8FWiUMHRLk4WKeh+it
         F/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762900667; x=1763505467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY/JsJwRFqEAPo4zz6iFwCuMgF7TVQ43wTrMS+JFYqY=;
        b=sMDMX5/Nlj2BrcdNLeG0L7Yh+tjHdj5Q+gqxQ3oJkJj+RoyYeTEBuHW/s7tlxO0BLQ
         /nvZBuL+3rIEiDwkxOk2aTLxN5oHeNm72LpliqBr+ntG7GM0LBlwnRfbGb3ACx6egD0o
         XSF2WxFbWxAIws3Y7BOE20e14nQbKKozTYANog5DdWVOm+4pfNjpOPFk5Aqa0x7r0iPq
         zW/424NlKViSa9RRUkBFHIYvTG6/gbo1Q+ulPEwa74p+aXpKvq0tkniScZrzQ/oQ3Ae5
         0n8lFDsq2sosmxc1vCQI05Mk6ZFrIz6RXy2LEgLruvsv8Q0tsvIUGl4Dwyh+YvvVE8Tt
         akRw==
X-Forwarded-Encrypted: i=1; AJvYcCXHrCFhLXSKpVPE508vEo+drPmu2ADlWnMeQyQcNqLDJwJAKaS/oCACrG+pmOpbwfHTGgZFPPnLAQOfFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCufXGs+4gV9WwFwiGN6HbE+5r/SllN1gYgB3DZamXYMcmU9Z
	CpCqKXWjOA2NL9+6GOQt/lRc+fb8/RLDCcizftVGGgbI11xVv4B5CnBS
X-Gm-Gg: ASbGncsy6FFClcvwhG6+qFlurBsRzwowwXJo9spIYvVIfyeJx2V9glPDAJd1zaIuoVD
	ErpBiZDGGJqmA0bnr73sY2lNa6VGzKJZ6FqmmLqd2Y2W214/bC16wLOBMIMuz8/v5ywNu9Ui8EJ
	Ku1Sy1edsu9hEdLzxl2Jaea9iUE+YbyG35ZGlVeplZEmh3IGK6SMPt/qbTnakiQxeU3KsmywfLs
	iA9CGVJ8DwiWioWfj7gbSlNFdrxMsmOBrNZQ9NKOuT7YCmWZ7cGIWQ97g/5t81QvzEQ/6AW2Ryb
	xvYqrv8/kQcvgkb5aEOFRi2vyEjZ7zw4NF8+XPXeezBCdb+MCsQ5jHe3naNYXA7mlArnDu4WSPE
	JNX6vsef4a3QMgfTMkBqC4aYRAaURgAPCq8HTX7MBk0Qedi2gxEUS1Jh6peFg32RAVvaoLZs8GL
	H+2e3kRdJHp/f7YN25KiqyAzJ9hDZ4ut2JpKXpTaY/Ag==
X-Google-Smtp-Source: AGHT+IGsebPDdDt9DfBSkr2ZLSIbfKaYJ2ephQLVFa17Hu06nnyIn94CaIrFQXYun9ezZpFTcjMYQw==
X-Received: by 2002:a05:6a20:6a0d:b0:304:313a:4bcd with SMTP id adf61e73a8af0-3590b40c1fcmr914120637.30.1762900667054;
        Tue, 11 Nov 2025 14:37:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3da7:808e:130d:eeb4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf0ec4f68esm641409a12.1.2025.11.11.14.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:37:46 -0800 (PST)
Date: Tue, 11 Nov 2025 14:37:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan
 touchpad on lid event
Message-ID: <iazucnirwewmavtsxudcynuoy2afzxhzr7nre2wke4d7glypcu@jtotz5oivpsu>
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
 <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>

Hi Jonathan,

On Tue, Nov 11, 2025 at 09:34:07PM +0000, Jonathan Denose wrote:
> Many touchpad modules have a pin which is expected to be connected to the
> lid angle sensor in laptops. The pin sends a signal to the touchpad module
> about the lid state and each touchpad vendor handles this notification in
> their firmware.
> 
> The Elan touchpad with VID 323b does not always have this aforementioned
> pin, which then causes interference between the lid and the touchpad when
> the lid is closed. This interference causes a few seconds delay before the
> touchpad works again, or it causes it to be come completely unresponsive.
> To circumvent this hardware issue in software, implement a device quirk
> which will allow the hid-multitouch driver to register a notifier_block
> to listen for lid switch events. When the lid switch closes, the
> touchpad surface will be turned off and when the lid switch opens, the
> touchpad surgace will be turned on. This triggers recalibration which
> resolves interference issues when the lid is closed.
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 2879e65cf303b1456311ac06115adda5a78a2600..9a89913c193bc110a0a821a901aebd97892c66bd 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -35,6 +35,7 @@
>  #include <linux/device.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/slab.h>
>  #include <linux/input/mt.h>
>  #include <linux/jiffies.h>
> @@ -76,6 +77,7 @@ MODULE_LICENSE("GPL");
>  #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
>  #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
>  #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
> +#define MT_QUIRK_REGISTER_LID_NOTIFIER BIT(24)
>  
>  #define MT_INPUTMODE_TOUCHSCREEN	0x02
>  #define MT_INPUTMODE_TOUCHPAD		0x03
> @@ -183,6 +185,8 @@ struct mt_device {
>  	struct list_head reports;
>  };
>  
> +static struct hid_device *lid_notify_hdev;

This should really be per-device.

> +
>  static void mt_post_parse_default_settings(struct mt_device *td,
>  					   struct mt_application *app);
>  static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> @@ -227,6 +231,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>  #define MT_CLS_SMART_TECH			0x0113
>  #define MT_CLS_APPLE_TOUCHBAR			0x0114
>  #define MT_CLS_SIS				0x0457
> +#define MT_CLS_REGISTER_LID_NOTIFIER 0x0115
>  
>  #define MT_DEFAULT_MAXCONTACT	10
>  #define MT_MAX_MAXCONTACT	250
> @@ -327,7 +332,9 @@ static const struct mt_class mt_classes[] = {
>  			MT_QUIRK_CONTACT_CNT_ACCURATE |
>  			MT_QUIRK_WIN8_PTP_BUTTONS,
>  		.export_all_inputs = true },
> -
> +	{ .name = MT_CLS_REGISTER_LID_NOTIFIER,
> +		.quirks = MT_QUIRK_REGISTER_LID_NOTIFIER,
> +		.export_all_inputs = true },
>  	/*
>  	 * vendor specific classes
>  	 */
> @@ -1840,6 +1847,20 @@ static void mt_expired_timeout(struct timer_list *t)
>  	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
>  }
>  
> +static int mt_input_notifier(struct notifier_block *nb, unsigned long action, void *dev)
> +{
> +	if (action)
> +		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
> +	else if (!action)
> +		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
> +
> +	return 0;
> +}
> +
> +static struct notifier_block mt_lid_notifier_block = {
> +	.notifier_call = mt_input_notifier
> +};
> +
>  static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	int ret, i;
> @@ -1920,6 +1941,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (hdev->vendor == USB_VENDOR_ID_SIS_TOUCH)
>  		hdev->quirks |= HID_QUIRK_NOGET;
>  
> +	if (mtclass->quirks & MT_CLS_REGISTER_LID_NOTIFIER) {
> +		lid_notify_hdev = hdev;
> +		register_lid_notifier(&mt_lid_notifier_block);
> +	}
> +
>  	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>  	if (ret)
>  		return ret;
> @@ -2150,6 +2176,10 @@ static const struct hid_device_id mt_devices[] = {
>  		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>  			USB_VENDOR_ID_ELAN, 0x32ae) },
>  
> +	{ .driver_data = MT_CLS_REGISTER_LID_NOTIFIER,
> +		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +			USB_VENDOR_ID_ELAN, 0x323b) },

The need to have special handling of LID events is a quirk of board
design, not quire of a controller. So I think it needs to be triggered
by DMI quirk.

> +
>  	/* Elitegroup panel */
>  	{ .driver_data = MT_CLS_SERIAL,
>  		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
> 

Thanks.

-- 
Dmitry

