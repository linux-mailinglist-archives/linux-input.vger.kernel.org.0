Return-Path: <linux-input+bounces-1107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C75408247D9
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 18:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 552C7B21F4F
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 17:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A7128DB0;
	Thu,  4 Jan 2024 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZuFiS4w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFC28DAB
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 17:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d408c2908cso3957155ad.1
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 09:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704390946; x=1704995746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=quC7k7oFrW9bwd3QWPJNK5cX8UZbc3tSVssspYp6DaQ=;
        b=kZuFiS4wugYnsBwXu/wmJaCoGjQNm86W5006Sr9wiDVsT3Wjvi+RkzjTF918FjWGTi
         6DNOVonFqMun29JJIcW1Av+Qtpu3I75JkTgfw/SptTl3PBy+b/MA3AoruqipD51r8SMD
         VwHhpug35s5Zylt0/16mAWSrWTCk36mj7LzRTKp6iCDH0QD40qsx95EmSqhDIagrvDse
         d24gTJjdrJ/ZiyegCOeTmWsgOMfvj2Oln8ukEXJGZNGpaRiC6ZQaX+JC5mE8QFrvwdAH
         ItJfJch1v409K8NxK+a+q9pIWJPD30xlp/17jzSaoBINVncV8SecW/ZiZ4Yl+ZJY579L
         hgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704390946; x=1704995746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quC7k7oFrW9bwd3QWPJNK5cX8UZbc3tSVssspYp6DaQ=;
        b=TJ4jT73y3gBX0CekhYTnMIxMrzG7xN7Z4DlLXyZs5/UW5OiN4/4nImLWAaiztbl0Tp
         Qo9dejQMtlLmHRkv1AfP75DetIb4keYCwPW7hq/++6J54VEvNLsjdirXgvQ6h2cojoZ1
         Y/UxBPx5ccDgpNhT9/E/zPkH0sPqtFaMc6gdxtWvq5xtimlkcNXB/YXC0c35yqgrc8wd
         XguDX34iGU7Yd5gm7ovUoyEkLx+E0HG4LNIfwduiFGZDvLbVeAz4rRcmLdI7TyIJL7EA
         VoqcrOBXeWF/vG0MsCY9RpwL9BboL5Bxx3M3KXo+dpGgbDfZNg85XAHDZgyHOUlpoGUi
         z/7g==
X-Gm-Message-State: AOJu0YyTFsgbxIVtAVVqpjQrWHnQbUGWXW/Qu0vjOmId7Czw+FiX4Syp
	chpR9fwGdutWr/mcVB5J+glq2JkFgHI=
X-Google-Smtp-Source: AGHT+IFe4L5c0o0Oi2VWhflYAt7qtxIujYOs9YmbzqGzk4C2a9w1aN2W/9HhnVWe026LzHj7r8TGmw==
X-Received: by 2002:a17:902:7ed0:b0:1d4:47d4:82b4 with SMTP id p16-20020a1709027ed000b001d447d482b4mr676531plb.15.1704390946146;
        Thu, 04 Jan 2024 09:55:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1f9:ed78:2bc9:6dbd])
        by smtp.gmail.com with ESMTPSA id r3-20020a62e403000000b006d997b5d009sm21554509pfh.69.2024.01.04.09.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 09:55:45 -0800 (PST)
Date: Thu, 4 Jan 2024 09:55:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bernhard Seibold <mail@bernhard-seibold.de>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>, Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [PATCH 1/3] HID: input - Add microphone mute LED support
Message-ID: <ZZbxHpibdyNY_zUt@google.com>
References: <20240104154941.6919-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104154941.6919-1-mail@bernhard-seibold.de>

Hi Bernhard,

On Thu, Jan 04, 2024 at 04:49:39PM +0100, Bernhard Seibold wrote:
> Define an input event code for micmute led and enable sending it via HID
> 
> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
> ---
>  drivers/hid/hid-input.c                | 1 +
>  include/uapi/linux/input-event-codes.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index c8b20d44b147..96c595bb14ce 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -928,6 +928,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  		case 0x03:  map_led (LED_SCROLLL);  break;    /*   "Scroll Lock"              */
>  		case 0x04:  map_led (LED_COMPOSE);  break;    /*   "Compose"                  */
>  		case 0x05:  map_led (LED_KANA);     break;    /*   "Kana"                     */
> +		case 0x21:  map_led (LED_MICMUTE);  break;    /*   "Microphone"               */
>  		case 0x27:  map_led (LED_SLEEP);    break;    /*   "Stand-By"                 */
>  		case 0x4c:  map_led (LED_SUSPEND);  break;    /*   "System Suspend"           */
>  		case 0x09:  map_led (LED_MUTE);     break;    /*   "Mute"                     */
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 022a520e31fc..f9a4f9040c59 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -952,6 +952,7 @@
>  #define LED_MISC		0x08
>  #define LED_MAIL		0x09
>  #define LED_CHARGING		0x0a
> +#define LED_MICMUTE		0x0b

No, please do not add new LEDs to input subsystem, and instead use "new"
LED APIs that are much more flexible. That is why we built the input
leds bridge in direction of input->leds and on the other way around.

The existing input LED definitions are grandfathered because they are
exposed to userspace (via evdev), but we will not be adding new ones.

Thanks.

-- 
Dmitry

