Return-Path: <linux-input+bounces-8131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED439D087D
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 05:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8CB11F2163F
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 04:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378B013AA3F;
	Mon, 18 Nov 2024 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kwh29RCP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32828E8;
	Mon, 18 Nov 2024 04:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731905842; cv=none; b=BIOGClrOIiCg/+pRwl2vDIidsFMGjnQpsmfHMsVDN8vx8bh+LbwOPsGqPPfoM0tFe4zQpeXGGnUwyxgxs/lfk05KMcVinJ+RTSb5zD13u7UBY21rjXG1LXE/sEDvT+Uf5hkrBSQbdAS2/d31FAVN33CGdFgir8SP2yMAlCqyXtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731905842; c=relaxed/simple;
	bh=RDFoccmBbUG9mDMuNRjLsJp+c4tSDmLr0ljFQUAJiNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnEtZK6qRGObm81MCwJPun1Y62KguoyEKKN8UunG158sgIOitAnfLoAiFR5aCZNKQhkx7y8kAHkNcDbwy8jyuPJ89xHRox79+7rqREX5hCj9Z1IL4v7WccAPkzyC6fHma8rqHHYP7q4/rNGjergmr/pX26g0cvPcV4CmY9wIW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kwh29RCP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7248c1849bdso1061380b3a.3;
        Sun, 17 Nov 2024 20:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731905839; x=1732510639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivpk/6a9FVTK14LGJxyzJRLvkjX9z5WDNg6sgfAnKMA=;
        b=Kwh29RCPTwrkczdt3Pkdz3EZMZUMj+iUmeQENd8pQtn1rc1wU4I0pa8+Sqbus5ymJv
         e7sUeRmbgVkl4Q3O9evkHMY+KiW8wFTR6WWn1KkFP/U9i4gudb1xc4mPXs/p0a1VjeyI
         KD1iXS3CBPJPL5D1NuQWw7+4xeV7gj1CpoTJhsgbTpgA3IhPfdIqjRmsiNNv8lJRNXwG
         YHoJU7gMHHMvlpsLdDYA5NMtJt2tn0b6PEVSHsaC69NHA4kKe7TRJcFuW3Q6G/t9Gnea
         XQbSQYNCZDTOynpCksTGYXg3lv7bwNRDcFHiQV8KhMMrDozGeCuL9auDCBuHDSZszIla
         IZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731905839; x=1732510639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivpk/6a9FVTK14LGJxyzJRLvkjX9z5WDNg6sgfAnKMA=;
        b=QyB+tOH0AoBRw69qvCI4cDYwhH+LGuWA3WSrLMu4Uc9//+Xipy4Qju3dlq4p35v3vj
         2/6MeMdzhB1eUID/+x7YTB55Ap1Vsv+wGzn29mowldp/lAbPEzN/LQgcvfdMTypy5+ff
         sFdlPfaiEQ7BDeOxRBohvHh3HOfzwPNU+H4FlT2G9KHeEJqsFbvMcMNDC6NUTdrKsbQm
         119k+UmlcsdRpzDgnuod/Rro0yC0n38m2VEeEIa8IvHT/FwHiPnftBnGVdu7jXEmDsYM
         NZye+t/IVUKRCjYAbHWmGqT8lMmJ1ipos74nDAbz4py383BfDSrcjx3GGljpDgAlfvFd
         /rOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDlxhCRDnawAwuCRUsv7rkXV8LJ3Wny+A7zygEnwe50OWjvASNXO08zXyOeiJWKmCGhp1h3xQZth5I92Fjo0Q=@vger.kernel.org, AJvYcCWf8ARiCiN3+xOEr+FsVRSoH5UO/f7sQPsLa5ZCyb/7hB8eBja9yCU58ylnbk7OZGRUHsakfmhxSQ54DYc=@vger.kernel.org, AJvYcCX/mlGf7x+jy3HuJoVrYBoCe+P1hBqBREMlk+JghQxJKUnl9OcPCfSa7VaIj3YkSXq9GJyM+CeEwukgQC7e@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYk2Cpvs0Lec06A+uELDLxs/68dgWHxEj9ty3wimA20iYydU9
	AnkrU8AbCFx4DKgVCH5+BsVSSDKOUmCJwBgXnSeoOWBxmkVj/g1o
X-Google-Smtp-Source: AGHT+IFY/PEHeJv1qHCjVc9kKffOdgoPKdsLp+gjBkjeOi717Fmwl99g42EhrK4uTdUZIcA+VtE+Tw==
X-Received: by 2002:a05:6a20:258f:b0:1db:d998:513e with SMTP id adf61e73a8af0-1dc90b55109mr18184479637.22.1731905839000;
        Sun, 17 Nov 2024 20:57:19 -0800 (PST)
Received: from google.com ([2401:fa00:8f:201:980d:1149:a629:ef93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771c083dsm5388204b3a.103.2024.11.17.20.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 20:57:18 -0800 (PST)
Date: Mon, 18 Nov 2024 04:57:12 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Marek Vasut <marex@denx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Luca Ellero <l.ellero@asem.it>,
	linux-input@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - Expand xfer array to match usage
Message-ID: <ZzrJKKoCr7cUNVwC@google.com>
References: <20241117033445.work.274-kees@kernel.org>
 <5b203f2a-755a-448b-946a-f14d6060dbb7@denx.de>
 <202411172038.DF2CF9CD@keescook>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411172038.DF2CF9CD@keescook>

On Sun, Nov 17, 2024 at 08:39:01PM -0800, Kees Cook wrote:
> On Sun, Nov 17, 2024 at 11:06:27PM +0100, Marek Vasut wrote:
> > On 11/17/24 4:34 AM, Kees Cook wrote:
> > > Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
> > > clearing cycle") added commands to struct ser_req::xfer without
> > > expanding it to hold them. Expand the array to the correct size.
> > > 
> > > ../drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
> > > ../drivers/input/touchscreen/ads7846.c:416:18: error: array subscript 7 is above array bounds of 'struct spi_transfer[6]' [-Werror=array-bounds=]
> > >    416 |         req->xfer[7].rx_buf = &req->scratch;
> > >        |         ~~~~~~~~~^~~
> > > ../drivers/input/touchscreen/ads7846.c:334:33: note: while referencing 'xfer'
> > >    334 |         struct spi_transfer     xfer[6];
> > >        |                                 ^~~~
> > > 
> > > Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> > I think Nathan already sent a fix too.
> 
> Oh excellent! I did a search in lore before sending it but must have
> failed to find it. Do you have a link to it?

I am pretty sure I applied the fix already, but I might have forgotten
to push it out. My workstation is offline at the moment, when it comes
back online I'll make sure the fix is there.

Thanks.

-- 
Dmitry

