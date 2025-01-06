Return-Path: <linux-input+bounces-8952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA97A01FAB
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C5973A3E5D
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACC51B3955;
	Mon,  6 Jan 2025 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfXJYaTo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF7F7603F;
	Mon,  6 Jan 2025 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147592; cv=none; b=SvhVqWj9fTlnJG2wUJO58Lr6qT2tM3AGoaJtdmqY3Bd5hQ24PTr6NFXzSDPVak5nYLgLRvUg0rGCJKYLUYZU6V4JJCMJ42CxrMQDrvl+aT14jopkVWpDuWoXALXOCWL96Qhc2kOtXVmVOSmpLAKsqFHJdoR8QL/h2UqKcLjcF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147592; c=relaxed/simple;
	bh=8kkUUdglWKgApT7UaPfG0QEd/gnA7s7aPArObH9ARko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRTG9wclGX99nPvf6ee4oFO5PndkTKfDm5brZb4c98q6G2YJlQ3Fbw0vPPZYccqlARssd71IvE6DaEyEa6aPbLYzIl/XaLoIFeWoVlhs9E7C95sOxBxHyEn+/fSWeF0Oos2hQWInFF7BCqJ2B7lTZSNRfUPnmzKqZeRnXxNDaVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfXJYaTo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21619108a6bso185719055ad.3;
        Sun, 05 Jan 2025 23:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147590; x=1736752390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LCJaykvEf3Vvd4cFaecO34X+rwNuJea9xulaGcVOIzM=;
        b=dfXJYaTo8uOCIYLXGd+IwsYYUypymbECj9zvGdYiat8bo1w86H5ogpAZW6ynLoQcM6
         iUq+RxV4a9mF1Tig2vMULw5wcFyKB5Z+jK3Qbv3myu/swwp/dYRZyjtsvz7GF4RYHX84
         N/wkHhrLlbIZfmIFi7rinS5qCWeFqn3p4mQ7d1GXaO3j96JUXXAOj9436rB6tqqxiCx4
         1SPHNXrIMPAUffD1tR8caL033HfAgOFydFMsx1b2ohFCivCBcSvfYYqua5ABg4J/GabP
         9YnpKqn7oQYdiwzywgccOoPH4gcmvY6FLMC0THgEztvgrxQI/yETmyGpeSEl58bGcsBZ
         UaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147590; x=1736752390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCJaykvEf3Vvd4cFaecO34X+rwNuJea9xulaGcVOIzM=;
        b=Mp3IKku3FfO2j75Or5FosyOwVV+eJx5dP7/uRjCiqfxW8Vd9XF6B/h1FR43jn0JEjF
         tRzr94wD01UTljEP7JtJpVpMJuvII7+oVPsW9xFkKNMl02BYiRU0pMlPpvx01cQwVRs1
         HefH1txZrPG/EmnTb7GpplOGt5dgN/6w8NvwokHvJG6BaXuwZZV0Dk0jGGvEmMjqYkbU
         2YWPmh6SuMVHeMCqyS9F9DHDj2gBwN0mYHXaVCnQIkpd+B25FtwtIBUpzsj85VgUDyvr
         it5t739neWKfDqi8ooMKG6kWi9SZL0V9eHwQDALHtj8/qajzB+ITd7UZ1c/Fj/mRE/vp
         MXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fcnyInXrpeIYIw0dpK8fE81y2cWHaMIH0ovziWZK022WOxKTCkNg8+vVBo0wCbfeu3Fngm869ACJiwYu@vger.kernel.org, AJvYcCWiBfZ8FVGC2XctKpKz0A9Cs4Ac7mCMeDyyCR5hSb5pAYFsixTBt3GyTc1TXlyKo2+dBbjEyAahruWiag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHhc2ZnBUYzcgm9wG+yHKnPVzi+WaB10I5yhsOwoVEF0mGYrd
	vfM2gNrx8LU1SzW+Lt3CYB7CLvUamP9m2k/QKPtpm+m4bKl7HLzwGrmfGw==
X-Gm-Gg: ASbGncthc1gH5YoG4dKIfrp+KzaNj7UF+GysWyiOSQ5clREoQS6eNkKsaXmsqozwgTq
	2+pcvI632iQPIv0IZWW92fPbCYpfCYFzMFOfNWaTmZ0CyPv/4O8YOL293JzCrlG1/runiKQwszh
	ohhHoo+N+yTsX/9NWhR09+cr8IfIJL6GH1GznfFB9wWvZXqKtIY/rPHMPQ/V01jMLWA+NciO1P3
	bcnr9PWdxnd/6AdEaL3//M8kxw/Bs975UdZkchBBMMNBvvw7rzGDD0qPA==
X-Google-Smtp-Source: AGHT+IFGDniaMtnWXY6VYea9XflX+VRfEjjo4d/sn4Kg5iote1yBt2lNFp4f2VZaniSXClzcr8xvMQ==
X-Received: by 2002:a05:6a00:4096:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-72abdd7bdecmr84715265b3a.6.1736147590301;
        Sun, 05 Jan 2025 23:13:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d012b1de0sm1290673b3a.80.2025.01.05.23.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:13:09 -0800 (PST)
Date: Sun, 5 Jan 2025 23:13:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tamura Dai <kirinode0@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pwm-beeper - add range check for parameter.
Message-ID: <Z3uCg2M26UQvMHP9@google.com>
References: <20250106025542.13555-1-kirinode0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106025542.13555-1-kirinode0@gmail.com>

On Mon, Jan 06, 2025 at 11:55:28AM +0900, Tamura Dai wrote:
> The parameter "beeper-hz" range is defined in pwm-beeper.yaml,
> so add range check.

What will happen if we try to use data that is out of range?

We now do have tools to check whether DTS is compliant bindings, so I
wonder how useful to also have checks in the kernel....

> 
> Signed-off-by: Tamura Dai <kirinode0@gmail.com>
> ---
>  drivers/input/misc/pwm-beeper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
> index 0e19e97d98ec..455054f9aae6 100644
> --- a/drivers/input/misc/pwm-beeper.c
> +++ b/drivers/input/misc/pwm-beeper.c
> @@ -153,7 +153,7 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>  	INIT_WORK(&beeper->work, pwm_beeper_work);
>  
>  	error = device_property_read_u32(dev, "beeper-hz", &bell_frequency);
> -	if (error) {
> +	if (error || (bell_frequency < 10) || (bell_frequency > 10000)) {
>  		bell_frequency = 1000;
>  		dev_dbg(dev,
>  			"failed to parse 'beeper-hz' property, using default: %uHz\n",
> -- 
> 2.45.2
> 

Thanks.

-- 
Dmitry

