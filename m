Return-Path: <linux-input+bounces-6039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBF96742F
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 04:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 798741F21DB1
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 02:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663613C2F;
	Sun,  1 Sep 2024 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4Us7wOO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D6922625
	for <linux-input@vger.kernel.org>; Sun,  1 Sep 2024 02:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725156574; cv=none; b=qO6WpXKagVaUln6yqfGxm+/AFxeD6/qS3TYUQeqkwUhRDqMDmTgIqJevn3aO4Z9Lm1awtehGJAVPpIBH5GkcoOEnh5+ngQdSeA+t2HbCWJHiCDyeJdCStQPyopoit9edvzqYlKU5ffRT4RnI1hpjl52m8WBrzYk/s+Q7gTUROwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725156574; c=relaxed/simple;
	bh=fnsLXP3rbGpn1+vhRwwTFI95VmNJ6FOqb9OkeDV9f6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl3Zatf6YPOkZQey5SyQAqCXTiMpyDlArrsWCfcB4cr9w6W9671tgPbf2repzCO5ljh+ksMwjXsKnBSNTKE+u4U/byKUFnAlQmvUpPA9vg9IZu3FE+61eltIHdza5qFOAyIOLAF75js0AmYVImRS0cl1NR1I8fQiCWzf+WzFhQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4Us7wOO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3b5f2f621so2218009a91.1
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2024 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725156572; x=1725761372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESnzGwmVlqgTx6Q+xzRLwFndbi4M3gRG3lMPX179dUc=;
        b=h4Us7wOOyUIbTSYlK+nGDWeo9yDucBeIgm3WsiUhVhiRXkox+dr9vnMp5nZecEAKWo
         1K0/WCOfONsnqUBYnVhYyl2KQ4jgP4AFwrDBNsLERWJecdv86/zPzOJ7JyALquQ3oHVd
         RxiI0h/qp1z1A6HRev+30JchAjmjM7zdAPJRMIMUbTuL5/cG6q4BdoxL1zxtu6HKPOg8
         uoOVSa25VNxTCHTbAaxA2eLJgsn/BEuc8kCcwVq1HxFnKeJMxhE1LT9GcV3Iapnl65co
         KuOxd9YF0XMjFntaxtx3dGsDB1leIs8Lw7BfYdl5LWT+PHm3HgjVwLYNo13+ikmuP1yn
         zNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725156572; x=1725761372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESnzGwmVlqgTx6Q+xzRLwFndbi4M3gRG3lMPX179dUc=;
        b=ZYz8ll+1wAJLoDGqfY5Hgoc9RQMAAE2FbPymMH9B6eQZgr6Y7VTlfz5ECnbQ5d9wG/
         Lw4f2fZthWZDpQmwxiwKe/54bkjKnsj2Jb4n1qPkTIhl57wVltD3erJFzM8C4Akskwd5
         IuOfq/RdVSlZUm5OGcspwlEOl5lVzJIYXqvAn/IVywv49BoUPTF1OPRKWZ/09kzFXRK8
         PLYDPlXYUEq04CvV/nnLLRMjnH/7Ul+QotRKG/h2Pwp1EDr9ExQLNqmWUu47lp4gWQGF
         kgxAR2QYt++Gg8n9VJ4O4TFIewukUS7JCrFZRUHpLxm0ncYYLfbutIB0A+tnRCH4xf2p
         fHaw==
X-Forwarded-Encrypted: i=1; AJvYcCUTgzEoxDOPV27BuKwmzvy8YYVm+ONTyg0WEwDZfh+nMZuYbM3URtZdlrLjW8ftHMgVOINQOacSHQwJSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiXSfmNtPICn7coRV8WsyFcctRLBQbG7I/R82mwt+qIhVIVKG
	I+Wob04LQVzC2nBgJD3P0G8xy43HkE6CboE4BISXDSwrefUjjtIq
X-Google-Smtp-Source: AGHT+IHs3IFHHVSmm+npn4Pn4tqC9RBBtOGGAr9A1NjFkT/AKaWc9DKkHm57P5BiGMiB7s/0I5cdfA==
X-Received: by 2002:a17:903:18a:b0:202:1ca2:92f6 with SMTP id d9443c01a7336-2054731a4bfmr24622935ad.27.1725156571749;
        Sat, 31 Aug 2024 19:09:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1922:345f:3ad8:d306])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1546sm46236965ad.18.2024.08.31.19.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 19:09:31 -0700 (PDT)
Date: Sat, 31 Aug 2024 19:09:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: zinitix - Varying icon status registers
Message-ID: <ZtPM2Xf2Pk6p4QPk@google.com>
References: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
 <20240830-zinitix-tk-versions-v2-2-90eae6817eda@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-zinitix-tk-versions-v2-2-90eae6817eda@linaro.org>

On Fri, Aug 30, 2024 at 04:04:28PM +0200, Linus Walleij wrote:
> The different revisions of the Zinitix BTXXX touchscreens place
> the icon status register (to read out touchkey status) in
> different places. Use the chip revision bits to discern
> between the different versions at runtime.
> 
> This makes touchkeys work on the BT404 on the Samsung Codina
> GT-I8160 mobile phone.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/input/touchscreen/zinitix.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index e47e0bff80db..b6b380f5aed5 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -35,7 +35,13 @@
>  #define ZINITIX_DEBUG_REG			0x0115 /* 0~7 */
>  
>  #define ZINITIX_TOUCH_MODE			0x0010
> +
>  #define ZINITIX_CHIP_REVISION			0x0011
> +#define ZINITIX_CHIP_BTX0X_MASK			0xF0F0
> +#define ZINITIX_CHIP_BT4X2			0x4020
> +#define ZINITIX_CHIP_BT4X3			0x4030
> +#define ZINITIX_CHIP_BT4X4			0x4040
> +
>  #define ZINITIX_FIRMWARE_VERSION		0x0012
>  
>  #define ZINITIX_USB_DETECT			0x116
> @@ -63,7 +69,11 @@
>  #define ZINITIX_Y_RESOLUTION			0x00C1
>  
>  #define ZINITIX_POINT_STATUS_REG		0x0080
> -#define ZINITIX_ICON_STATUS_REG			0x00AA
> +
> +#define ZINITIX_BT4X2_ICON_STATUS_REG		0x009A
> +#define ZINITIX_BT4X3_ICON_STATUS_REG		0x00A0
> +#define ZINITIX_BT4X4_ICON_STATUS_REG		0x00A0
> +#define ZINITIX_BT5XX_ICON_STATUS_REG		0x00AA
>  
>  #define ZINITIX_POINT_COORD_REG			(ZINITIX_POINT_STATUS_REG + 2)
>  
> @@ -425,7 +435,18 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  	}
>  
>  	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
> -		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
> +		u16 iconstatus;
> +
> +		if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X2)
> +			iconstatus = ZINITIX_BT4X2_ICON_STATUS_REG;
> +		else if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X3)
> +			iconstatus = ZINITIX_BT4X3_ICON_STATUS_REG;
> +		else if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X4)
> +			iconstatus = ZINITIX_BT4X4_ICON_STATUS_REG;
> +		else
> +			iconstatus = ZINITIX_BT5XX_ICON_STATUS_REG;

This does not need to be re-calculated every interrupt. I move this into
zinitix_init_touch() and turned into a switch, and applied.

Thanks.

-- 
Dmitry

