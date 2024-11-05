Return-Path: <linux-input+bounces-7860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D049BC4CA
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 06:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2925C1C21137
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 05:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86521BC9EB;
	Tue,  5 Nov 2024 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8WZmNgD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A4183CD6;
	Tue,  5 Nov 2024 05:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785409; cv=none; b=cxR4yUIC1jpH4FGTIWbT3mtbH9Ba5PDt/hmTdDxtWzWtb/CG0osHAmx2ouCc57+MePgV7DlfovtCy5ND9K59z2cCiiU7i0Qc76RiBV7KzDpA3D6lYnp2vNgCjavNwIt+wPe9BG10lShJtKSqt16RBHeE7wBq9K5JxEF9qMd+lYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785409; c=relaxed/simple;
	bh=zEsosQpSkGcM+e7ca3+3Gr83gvYgqEhfCgrvk4E6etg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnDH82YjZFULCoegiEPeTbCXqBGCOYwEMvXZAxHOMLjMj8TkKYIszGY/f+hVVWQtpDf6zx4ARK8njaw2VjiPzE+CmMuPDNIIropqRfrk1J5gLlxGMjHwepUWN2ton2kEvBoWdfYUamhyPfuG4gcZ+xdlZdQhG3XHEiKEq8Xn0mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8WZmNgD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so3837357a12.3;
        Mon, 04 Nov 2024 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785408; x=1731390208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsVcFqJz4wRBhqSzGcHNCJBnHHITsWxKcJAa/+X/a2w=;
        b=e8WZmNgDBR3cjdvYMCWO+3+YSZjuy/XOf+IDEjzKQ4FMn0CR/AywqALP8AqRv1pLCG
         hRPFSLXxEZqhCsyeugAgjQ0qPc+SWKf5K9lqRM1gqtnrTSud39n/s4yXCEFcSVuIs5KC
         2TisDUV0zwIirOWH8wYOYSXcU7DDuDw0lJlhDa1SY1CZpcggU00J8nclB1eyX6+xTGYt
         nH+wz3GFyOk2W2EoS5UJBbXGum8NS3v6nGQ06zgSiJdEVZllsPxaDS0D5wVPNGlspqTX
         TqzX2/6bcWKMRtVJ2lfOWcBcllN+w1WFCMAgWke5dZg3/zHONMOW13e7e6nQr1CPyy9L
         1vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785408; x=1731390208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsVcFqJz4wRBhqSzGcHNCJBnHHITsWxKcJAa/+X/a2w=;
        b=GPvAGuqi7sSHdyOoTbZNPJ/NdHvPH7fsNYbauA5sPgeoMYz1Qc4/WReUorz4OK1jLf
         5rewcW2Tgszd/3wfYBemUthRzJNYjY5thK7BFwBrpJ4n9l4I6ien5LtfjBMX94/PfkbT
         alWDCLMlGkFMrB3t5ies1AJjgsSI3CPqfBeYDaoxOwG6bnrZnZ6NsItY+1v76Z5spz68
         Lc2FTLE4ETZpBtJcN+IyRzqZTfr8pcyBX708bq2iTgvjixrlpbQoAYy8878kRxgtAdkv
         i9gXcYIcsjJbq1y3j7bAvOKkSkwtmyOUcQPDRpAFV/txqq/lhGnlICusoxcKVlfwjnVI
         P0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBUffDsO/OVZOEDZnZRO3XhDpCGC99gTCa8W1fYSbC73iDIMvJzGGOu+TPWif/+Pw/QXJkLieaa7z0T9Qi@vger.kernel.org, AJvYcCVGb0HslsKw/7Lsb2YkSAZDP9mw3MKHKVAivCW0G9qg9rJ0XkiRe0zOAfMCVkK+a0NzaAcGCExDPi1lMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPs7OH0Hp3Fx8uAxK+hqeBM7MZwEW8PGTCpiyXN1rUKObAesh
	1Iv0Or5GedjW6ucAKQHQz0rbQ66EVeMZRsp6Z5Z1CKKcy2EhDPq9SzIxiw==
X-Google-Smtp-Source: AGHT+IGeBtCd6V8qNq9ebEcfSFdm2ZdE6OmAmnNFRCe0XWRrYZYZju7BqrxrMQB6Gh2X/XT2amzusw==
X-Received: by 2002:a05:6a21:6da6:b0:1db:ee97:56f with SMTP id adf61e73a8af0-1dbee9705c1mr2956519637.25.1730785407531;
        Mon, 04 Nov 2024 21:43:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8cdcsm8677026b3a.39.2024.11.04.21.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:43:27 -0800 (PST)
Date: Mon, 4 Nov 2024 21:43:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christian Heusel <christian@heusel.eu>
Cc: "Ned T. Crigler" <crigler@gmail.com>,
	Peter Seiderer <ps.report@gmx.net>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <ZymwfKiniofjIAQY@google.com>
References: <Zx2iQp6csn42PJA7@xavtug>
 <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
 <20241027163744.2d396c61@gmx.net>
 <Zx5yIEZwT5SxzCTx@xavtug>
 <Zx8hfE2_3zXSTi05@google.com>
 <dcde5b37-2ea7-472e-abe3-2cadc9d1e651@heusel.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcde5b37-2ea7-472e-abe3-2cadc9d1e651@heusel.eu>

Hi Christian,

On Mon, Nov 04, 2024 at 01:06:40PM +0100, Christian Heusel wrote:
> On 24/10/27 10:30PM, Dmitry Torokhov wrote:
> > Hi everyone,
> > 
> > On Sun, Oct 27, 2024 at 10:02:24AM -0700, Ned T. Crigler wrote:
> > > Hi Peter, Christian,
> > > 
> > > On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> > > > Hello Ned, Christian, *,
> > > > 
> > > > On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heusel.eu> wrote:
> > > > 
> > > > > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > > > > Hi,
> > > > >
> > > > > Hey Ned,
> > > > >
> > > > > > It looks like starting with kernel 6.11, disabling and re-enabling
> > > > > > magic
> > > > > > sysrq fails with these errors in dmesg:
> > > > > >
> > > > > > kernel: input: input_handler_check_methods: only one event processing
> > > > > > method can be defined (sysrq)
> > > > > > kernel: sysrq: Failed to register input handler, error -22
> > > > > >
> > > > > > after doing:
> > > > > >
> > > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > >
> > > > > I have found that this issue is also present in the latest mainline
> > > > > release and bisected it to the following commit:
> > > > >
> > > > >     d469647bafd9 ("Input: simplify event handling logic")
> > > > >
> > > > 
> > 
> > Yes, I did not consider that we might want to re-register the same input
> > handler, thank you for alerting me about the regression.
> > 
> > > > 
> > > > 
> > > > A quick fix/hack for the sysrq case:
> > > > 
> > > > --- a/drivers/tty/sysrq.c
> > > > +++ b/drivers/tty/sysrq.c
> > > > @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
> > > > <snip>
> 
> Thanks for the patch, are you looking to fix this in a more general way
> or do you plan on just sending in the above patch? (or did this already
> happen and I just missed it? :p)

I applied the patch that I proposed and Peter and Ned tested. I am not
sure about what you mean by fixing this in a more general way, could you
please elaborate?

Thanks.

-- 
Dmitry

