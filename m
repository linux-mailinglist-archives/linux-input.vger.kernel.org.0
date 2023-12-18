Return-Path: <linux-input+bounces-827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586E816A82
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 11:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EEA81F22C08
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48614134B0;
	Mon, 18 Dec 2023 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W8qk2ult"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B112B72
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e3295978aso1285769e87.1
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702893970; x=1703498770; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VA/CRanBtTCRovCAjUXUUqFal04ewMnPxSdzdrqR1E=;
        b=W8qk2ultb45/Ch6N8nRXxKuaeAURmCGqaYbDD7i2Alx5zssSKlOuALSRPg2eU8uqZi
         iTOuyNxEK0Q+AF3vH4e3bhNEI3L+YuPtWzVeFYh5scB0Yeer+NmWQxLX48Wsl1CQ961i
         zLFVuvtS5Z6fit+K4u90N8M9zuPCTY0X+4ZXrNOTeJPyGiAy9pVsHYoJjMwsorWTinc+
         VcR9XZkrkZXcfDciW82wuE1IwF4BAd8JziRjB3GI7JmJn5+oXbHAN6WqvNH4UzuEMyZ/
         Hr25o5TPyrY4bxUkn5HhamoGo7nsE6817PXvSJTJagHsNj4Htzd5JmzlW57XO9bjUC3u
         sefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893970; x=1703498770;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VA/CRanBtTCRovCAjUXUUqFal04ewMnPxSdzdrqR1E=;
        b=MqoLwdUmVKR+oxoACE1Z8PC+2C7fERlvxn8tCrnPOBOVeQKGsrpwDtthbG/83P1SzP
         dUIAo5OkmVhLp68Rm0Ekp5FVK8jlBE6TmBMftWrnS6sh5Mvw6ChAp4PR99LDUwyAAj9H
         VUJkPdAndL0nU1YFKoSmomFFiOLnIcYIIAyEDO1NMCr5mP8s7g25IEwRd/rTpWTIT2MP
         ZAFSXJW1pA89ap4meXQGSu4Xl1hnrjYzcs5ql8Mzn3/Fx0EL7LCqbn7U8i3V3Rp5slgp
         HAvqKaDx0mjOxJGjioSV+TsE0laC777HyxNGQH+L56Z7nowYkbOLMi+bxQJztvDtIHy5
         cF0w==
X-Gm-Message-State: AOJu0YyqicR55TdqdQnaRKW90YmtNuHYdKjgPpGl12wJT7ohfLlCgB2T
	XqokyxnehXMD/4NP0513W9sWfA==
X-Google-Smtp-Source: AGHT+IFCG1LeGpU5/GNoQJmL3eATMQXYVBtGPKHhL0PgOA1ESfMQJcHbRUG84Pce3zr14zoOrn8qAQ==
X-Received: by 2002:ac2:4c8d:0:b0:50e:302d:b19f with SMTP id d13-20020ac24c8d000000b0050e302db19fmr1131963lfl.84.1702893969704;
        Mon, 18 Dec 2023 02:06:09 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id c6-20020a0564021f8600b0055306f10c28sm2065429edc.28.2023.12.18.02.06.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 02:06:09 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 11:06:10 +0100 (CET)
To: Guy Chronister <guylovesbritt@gmail.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: google_hammer: Fix invalid ENOSYS warning and
 unsigned.
In-Reply-To: <20231212182038.28530-1-guylovesbritt@gmail.com>
Message-ID: <nycvar.YFH.7.76.2312181103260.24250@cbobk.fhfr.pm>
References: <20231212182038.28530-1-guylovesbritt@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Guy Chronister wrote:

> Fixed warnings about ENOSYS and bare unsigned without int.
> 
> Signed-off-by: Guy Chronister <guylovesbritt@gmail.com>
> ---
>  drivers/hid/hid-google-hammer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index c6bdb9c4ef3e..d567f020bead 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -324,7 +324,7 @@ static int hammer_kbd_brightness_set_blocking(struct led_classdev *cdev,
>  	}
>  
>  	ret = hid_hw_output_report(led->hdev, led->buf, sizeof(led->buf));
> -	if (ret == -ENOSYS)
> +	if (ret == -EINVAL)
>  		ret = hid_hw_raw_request(led->hdev, 0, led->buf,
>  					 sizeof(led->buf),
>  					 HID_OUTPUT_REPORT,

Could you please elaborate why this is funcionally correct thing to do? 
How are you now handling the special case when 
hdev->ll_driver->output_report() callback doesn't exist for the specific 
low-level driver?

-- 
Jiri Kosina
SUSE Labs


