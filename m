Return-Path: <linux-input+bounces-13683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98063B10F3C
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 17:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91DC567405
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 15:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B722E041A;
	Thu, 24 Jul 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvIf4E+k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EB2EA475;
	Thu, 24 Jul 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372599; cv=none; b=GB8vFImqQ19aW4bKMjv49H5XP0qLFH64j/dwZKLNvURfSPvX41cexNzgEnpKtGbzFu8qRRZCEF3OyQSEYFDUYg2FO9pbNYizCVW4CAPHy7ruEmyVocc1UmEMKcGRVmDlfdjQVFkdxAwf6FCY5x8l/Q3UuSwiZ7fG6RRX7A+UURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372599; c=relaxed/simple;
	bh=n76rYzvR5HNLYrbPk+c3jxWWr0EO3aJ5upUChLy8z2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNQXxUUJiylEwxixdCUak7ZaTPAyiBUBmeTgU5qySglx4JtImM2iA63rYetPepl7ItXHU0p+EPJTY4Q1HUGotxogX/KrfdZ583KaIwX0nYuIDhSI301UlY1Bm4aw7O14riW7IUpIcCmD1h3gYB+9e7HnyLQ+OzHhmKA/tonkXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvIf4E+k; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4563a57f947so11515935e9.1;
        Thu, 24 Jul 2025 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372596; x=1753977396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o83zBJBstcF/Wy1xzbweztussHtlTkiwf5UO9FXpsOo=;
        b=GvIf4E+kYisEsNbMxPkXeVaIwjai4jAMPCKvc9AEcZsJD4ctxlr1/K1aH4O7f9uDey
         KdLAFG4YMmS13R+pqJZ6nI1aof7SVv9bbXmjhvqNMdD4oa2ffv8AcMc84NUrWXI0jFp/
         1cb8DUFFKX14tMdPKPyphHAQoVBCS1Om6nF2J+QuRBMouzRgq032GRmJrNsCMceQnPZ0
         iK9dDyJ94t66QAn2XhtYOauOAbpljnuiyTIOlOi7xzxZE1HL0RsdcauOLQ2p7agGEJd3
         iB9e9FBBaASOxayoTkXvb5c31hoD4kwz2ey4I4lcNnxxshHT4ejDX1yRMzcrBgwpgqnu
         8olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372596; x=1753977396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o83zBJBstcF/Wy1xzbweztussHtlTkiwf5UO9FXpsOo=;
        b=icDkSNfTuxupG/KLiBnMG0p1r7lqGeSCR3aTeJIVmbbCTmsVQWlQGjbinCn55mkHon
         4SOcrH64ACu/UAeMNCH7pEuM94kQ+5usd8MX/Cvmj5zFxFYdQcwGvL/3vNCmul8wK+Mz
         3gVHf95Jnv0mHkS4qhG6hjSrcsO32KcRHauYnhlCmH/BLZu/7VyvrJd+bUkEVSatDFY7
         SlOhJWHejmEidAnzd46QviwJ6Y4NwOJ9kdF5qpSSTNqF8eVLZl3DCF8Ug7tu4WdahHnJ
         0f3gD8zuVmWTg1UvDmn35RxwJpu1oqi4L9SPqnj44NPeb1YJ4k+iHh+i/yYPRYrcfYaS
         li2A==
X-Forwarded-Encrypted: i=1; AJvYcCVmIp9vo6/cEYtWOG94RKnUj6YQRh4y3jsFrgoiV8PRCRJOACoiB5nABSIQOw7bEt57ldQ/Imnk@vger.kernel.org, AJvYcCWvnzsruqrbALnDrEh9nPeG000vCqGAIfSWYMmoOiL5zg4pl0z66ts0tgo5Zwa+XzmTpR04ay7rTqyDRg==@vger.kernel.org, AJvYcCXWiabaYt5dXQfNlIbDftfPID9iK+PZQGm7zfp/JFmeq1nkwYmPySq0yBKH/I5odYvTILbm1gAtu4LOUZAA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83bukv4dA/27RcLqnXH0aF9x0XWB407cEHs5F3uigtlrFlgrW
	0wPPO2O7L38RaFx9P61Vfp7s8ptLqoQAv11KMGDHCCIuYX4GOAvies6Z
X-Gm-Gg: ASbGnctHPXeMWDJXn2rg3G/KDRnfW9rDjLP+4Qw6YNK/Qa9eaOLHCuxkp+CIBSg4Cxh
	Msa6658GJKNuyYlfntMl8LDh8Hh/VRCpmOleQ6dFrRW76tAqqglfw4v9RBmxHTAvdbd5lvPD4N+
	6ocCiI0XXMIO7fFH/vd5FjlzvZ8DlqGEF37ttZ/dD497u+O2QBZF46u1KQxcgQ6tFZpZQOn4Vxm
	0/pzIT+BaS62gaqrXkkkIBy5tT/ARS0l50j7MB3TiZSgs90otpeHSmAc+leRGY46RBY3arp5eaQ
	yZ8pqfp+SQldUrUyFCfONqa6iycFiM/SYZO4Vzw2T1RnvqO8XfX7i9hBcjP2vNH8hyALP/4imIH
	yZY71OBU0x/p2u1oSVKg=
X-Google-Smtp-Source: AGHT+IF/PPPu8+0Yui0YAUCGbDmi7ENIGHLe1rI53uFn9cp4lRPNHcQL31rkdGhAah7Q9SeG8Yhmbg==
X-Received: by 2002:a05:600c:8b54:b0:456:f22:ca49 with SMTP id 5b1f17b1804b1-4587048a0famr25142945e9.0.1753372595287;
        Thu, 24 Jul 2025 08:56:35 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:2f51:41cb:ec3a:df63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72665sm2641398f8f.25.2025.07.24.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 08:56:34 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:56:26 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: fix integer overflow in set_abs()
Message-ID: <aIJXqs-U8vDpYv0S@gmail.com>
References: <20250723173659.59327-1-qasdev00@gmail.com>
 <914ff45b-2260-42c0-9ccf-a3efd667d4f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <914ff45b-2260-42c0-9ccf-a3efd667d4f5@kernel.org>

On Thu, Jul 24, 2025 at 08:58:40AM +0200, Jiri Slaby wrote:
> On 23. 07. 25, 19:36, Qasim Ijaz wrote:
> > It is possible for a malicious HID device to trigger a signed integer
> > overflow (undefined behaviour) in set_abs() in the following expression
> > by supplying bogus logical maximum and minimum values:
> > 	
> > 	int fuzz = snratio ? (fmax - fmin) / snratio : 0;
> > 
> > For example, if the logical_maximum is INT_MAX and logical_minimum is -1
> > then (fmax - fmin) resolves to INT_MAX + 1, which does not fit in a 32-bit
> > signed int, so the subtraction overflows.
> 
> The question is if it matters with -fwrapv?

Ah yea thanks for bringing this up Jiri. I think you might be correct,
after doing some research it looks like the kernel enables -fno‑strict‑overflow 
which implies -fwrapv which leads to wrap around instead of UB If I undestand
correctly. So with that in mind this patch probably doesn't do anything
useful, do you agree?

Thanks
qasim.
> 
> > Fix this by computing the
> > difference in a 64 bit context.
> > 
> > Fixes: 5519cab477b6 ("HID: hid-multitouch: support for PixCir-based panels")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >   drivers/hid/hid-multitouch.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 22c6314a8843..687638ed6d0f 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -540,7 +540,8 @@ static void set_abs(struct input_dev *input, unsigned int code,
> >   {
> >   	int fmin = field->logical_minimum;
> >   	int fmax = field->logical_maximum;
> > -	int fuzz = snratio ? (fmax - fmin) / snratio : 0;
> > +	s64 diff = (s64)fmax - (s64)fmin;
> > +	int fuzz = snratio ? (int)div_s64(diff, snratio) : 0;
> >   	input_set_abs_params(input, code, fmin, fmax, fuzz, 0);
> >   	input_abs_set_res(input, code, hidinput_calc_abs_res(field, code));
> >   }
> 
> -- 
> js
> suse labs
> 

