Return-Path: <linux-input+bounces-6285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80196F995
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 18:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD481C20DF8
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 16:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D55F1D3623;
	Fri,  6 Sep 2024 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjMIbunW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A51D1F51;
	Fri,  6 Sep 2024 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725641496; cv=none; b=ePjP1AFKEBdVEYzf9mb48mflT/3Lr3v743t/hZ0lyrk33KcRKxBMNQYdVfc98kZ3IllvF5Eqxx6FLVpJjE+x9xrYkePBY59tRfLVHz7cDDvkwR3+N88sBP5nPIUs26PbTZAqURUsvUp2VW1NQ7I5Sh0kKWE28ScWfW/CLokOiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725641496; c=relaxed/simple;
	bh=Ibkgt2+eQgOzlaz4LVfcmOB2/Tthdu4QxdQZRq7x48k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQjwq30jKkWMB60BBuFg5fjUKa2yrsBXstGSJWaK14NShHnsvqC7O/N/1D/E7S1vi4f/PGRhhyFFzAfBBfkcDfQtcFP/vutJ63u4H1CrM0Ws8ocSC3001YSDzj4Zs/RkU0Sqz5lQQ66s9gMPCvsvJ3Z14VqT73eI0nl8pN5e6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjMIbunW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-715cc93694fso2016282b3a.2;
        Fri, 06 Sep 2024 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725641495; x=1726246295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4Zf0qBJVKBAX2oTkkO2ilQEf9MRXPCVUknF15ax8Qw=;
        b=KjMIbunWUOqldpF0bxwkUOWGkTTdkdQ3my3LVnVm0lF3z0f56aZfDVASEjOz7dGLl0
         p7QaVGhpJB3F4fGT2I+uDUuo8p4ZFoFBZ5CcHAWfQ7LTBU+OwU+295B83BeE1gtS4bOL
         XFwFHX31nNkdBu97hOAsAeiAcJqjqx5bLUWyt8YnU0+wfmu+n//ePVL6gpDRuY0RqrCh
         s1w6W9kRqRiOI03wGaLixWUPZvL+uU39QxiT64oeOwOXJEXV+zB2ksPizD9/chLrMEGk
         aMQZ+dTaln43HwAsbH2zVcbQFnDdD/6NUYsNot2xmPyJZ2t13iblks8tQQEsTr/98EEC
         uyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725641495; x=1726246295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4Zf0qBJVKBAX2oTkkO2ilQEf9MRXPCVUknF15ax8Qw=;
        b=BsInx+ndkKNx3Bw2zLK+IVflpvmz6uqJM0zoed58L6OMKe8xKJco84qEjQRTQQ9MSm
         6FiGeiv9ZJCN21iCRIPlZl0nYDrVwQdcDq9nFhdI90HhenpvKxa78c9r2s/aeAOYuzOp
         WzO96hxwlavIbaxip3QwM7BlWNPivS5TgqEjhL9kyyK9IyZ9KTFBEyQD3bVmXIFfjM1V
         nZyFVo7/l/pmd8MbAS3au12kOqo79RGia3ZbWVx508wXAjNdZUmtUYByJFWbbrFq4S9w
         GTWU52m1nhKjtxR9UFGc99Swd6Y6wLSl80AQSAma3g3PxURWaS/jpZo1nJpT8JyZpazu
         zsag==
X-Forwarded-Encrypted: i=1; AJvYcCUNSZdXsBfjrA4k3EWJzrWKlG5skT6mXEDE/fBzzzZG+/GgjGIuujpeqVQD7iuQ6GbUMss/BEVUr43LMvTe@vger.kernel.org, AJvYcCUYy2gDXlDgPvrVpZqU1i0gTpJcvAg+UFZgIYtvkWP2nYcUcoHiuA5g1rREczKRibsfeC/VD6Ty9GX6pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIg1kI6b/sqj9CmNqtKjQ/XgZx3iIuKWwSKb6mlUD3kJMDSpch
	/qZ2YGjZjNhIMK8Jl2es1ldK0wq0M6u/UKdt/sH/uHWCDUHIZb2V
X-Google-Smtp-Source: AGHT+IFelxxdKcd3hHoXb+4xNySiblzNeAKpXJIt60X2PrLPJ1PnpFDoBGQmt95PhQgRwy0Caz4XXA==
X-Received: by 2002:a05:6a00:4651:b0:70d:3354:a190 with SMTP id d2e1a72fcca58-718d5f1f833mr3579486b3a.27.1725641494419;
        Fri, 06 Sep 2024 09:51:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4846:f267:7877:9a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718d9ffa501sm1247390b3a.138.2024.09.06.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 09:51:34 -0700 (PDT)
Date: Fri, 6 Sep 2024 09:51:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Utsav Agarwal <utsav.agarwal@analog.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
Message-ID: <ZtszE9A-576SmvsX@google.com>
References: <Zr-gX0dfN4te_8VG@google.com>
 <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
 <ZsNcpom_Fm5uCyEj@google.com>
 <9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com>

Hi Nuno,

On Fri, Sep 06, 2024 at 10:38:35AM +0200, Nuno Sá wrote:
> 
> Hi Dmitry,
> 
> This is not forgotten and I plan to start working on this early next week.
> 
> One thing I noticed and I might as well just ask before starting the work, is that
> the platform data allows, in theory, for you to have holes in your keymap [1]. Like
> enabling row 1 and 3 skipping 2. AFAICT, the matrix stuff does not allow this out of
> the box as we just define the number of rows/cols and then without any other property
> we assume (I think) that the map is contiguous. 
> 
> This is just early thinking but one way to support the current behavior would be 2
> custom DT properties that would be 2 u32 arrays specifying the enabled columns and
> rows. Out of it, we could build row and col masks and get the total number of cols
> and rows that we could pass to matrix_keypad_build_keymap().

I'd ask DT maintainers but in my opinion we could add 2 u32 scalar
properties to specify row and col masks (either enabled or disabled,
whatever is more convenient) and then indeed we could figure out the
resulting size of key matrix and use matrix_keypad_build_keymap() to
load it.

> 
> The question is... is it worth it? I'm aware that if we just assume a contiguous
> keymap we could break some old users. But I guess it would be only out of tree ones
> as we don't have any in kernel user of the platform data. On top of it, I guess it's
> sane to assume that one just wants a contiguous keymap...
> 
> [1]: https://elixir.bootlin.com/linux/v6.10.8/source/drivers/input/keyboard/adp5589-keys.c#L630

I think in practice it's just a few extra lines of code, so shoudl be
fairly easy to keep supporting this.

But we can actually split the binding and the driver implementation,
with binding defining all capabilities of the hardware and driver
implementing just a subset of it (i.e. complain if row and column mask
properties are specified and abort probe).

Thanks.

-- 
Dmitry

