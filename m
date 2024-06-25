Return-Path: <linux-input+bounces-4623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272B9172A9
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 22:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD9B284CC0
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 20:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AFE17D8BE;
	Tue, 25 Jun 2024 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViIICWdQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533E17D8B2
	for <linux-input@vger.kernel.org>; Tue, 25 Jun 2024 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348652; cv=none; b=RNCPFAcP0WdXZThn4smP7fLWSnJ4Y09aPI7vNnjG0TbsODS4Sd3+bVi1AEj0ca9Hw+15sSU4epiohqP0q1C9pebaSDzLPdMed1FbvpDbE7f6INqkIv2wP086jn4MtK8Hk2yXv19EHjaqUCCqrIeOXlNk7d3y5p52+OCIn/yJxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348652; c=relaxed/simple;
	bh=Ogjj5Y0GInxX7wH4alxoCYfsIpG12FTyThgwrjywxFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LizY8yFNOUXPowJ29wJs4YvUeU6AxFcB3T0A2i12zuBVvW+0eh5TV0z+5vBPj+9N1UvHUnKMIQMLTw3rMAgqNebw29qzp8Uv4pcBnP/tcvNXzrN8CGl1uoF329S+berB+SEsuWMYDRYo0yJwuim6w6uHXrSTw7npKoK0Q5Oa33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViIICWdQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fa0f143b85so26352595ad.3
        for <linux-input@vger.kernel.org>; Tue, 25 Jun 2024 13:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348650; x=1719953450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6GQ6rOvbBTY6MyXxNlEdQ9tXnIS+mQmwp3XvJBUVR8=;
        b=ViIICWdQYrYsYugtkF51SRl/Lx/ltBTN19eh5canSrNEzU8PH4LOCxzTQzWdTW7Ydo
         JVzWduP+vXdjLSAv2dhQyAdUFnpYaxN9/1VUywYox3UlK64zFpbZ/dv4MvyrJOZUOdVf
         Jf/Ot72lYbHmMZ82O6Kpp/gCqHqXSWCN5ES7xxRhEzMQvtuR5zrlInKqyF6wiq884Gqe
         iOwXzP6GyqKoLvPz/MMPwYA2A58/UKbLjCEMzbAI3XG9iwvG7o+G6MyEW0C+gNYgFZVx
         0qVoRjP7nY+rvKefG+ZE6RxdV5Qo/NN36xFG1UBt3bRgBwFwVwJvGa5lVyoaIDRVlQEU
         Kz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348650; x=1719953450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6GQ6rOvbBTY6MyXxNlEdQ9tXnIS+mQmwp3XvJBUVR8=;
        b=Sf99DpmCfx5LdveIEm1EB3ZrAs1uBVFXlH7f5+UHz/6ruY/x6AOuBvpb95BHZoSm9M
         OEfJqTkpmLvmn498aQZZXjCAQvKteVgNGwD13nP6YJ7KYSfWqm0mvYhE2jej+0t72q5H
         lvAdvWppJluysD6MB/t7A+rhAAnNEnwU5Rvf4wmeSrzVj+nBngnyx729x9vkJc3AJ5WN
         cXFh2zjzHhHA054cv7aw1lvs83BRHPQF5856OekpK6EAgJu/hY5uUXKOc0eNPmE6fsGn
         02LVzJc8XCqp3o97T35ap1JsiBlyvl+znyLT5Yy50y+0RcQL4wgEzxmQPJAanO95r1/d
         mDtA==
X-Gm-Message-State: AOJu0YxgHKp8LVwlGKrrmy4KBDum0ZMAPWaww86YGEdKwHeWMXsPu5Oh
	euyoi700SHbB+Ah7A8ewf2BeHYIrZgWNgnrKS9phPbVAekqPmdcF
X-Google-Smtp-Source: AGHT+IF+njpMbFN3tDaGAQW+eWZZC4xDKS0IwvHQHda6wsVP5qAd5E/gEHQxepJ/eRXxs6Hyy8xmLg==
X-Received: by 2002:a17:902:bd07:b0:1f7:23d9:f530 with SMTP id d9443c01a7336-1fa23f8df23mr69726525ad.66.1719348650428;
        Tue, 25 Jun 2024 13:50:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ff4:b46e:2948:c244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5ed2sm86069205ad.155.2024.06.25.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 13:50:50 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:50:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
Message-ID: <Znstp_l5l2PUgIfP@google.com>
References: <20240320072533.170029-1-marex@denx.de>
 <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>

On Sun, Jun 23, 2024 at 08:21:00PM +0200, Marek Vasut wrote:
> On 3/20/24 8:23 AM, Marek Vasut wrote:
> > On STM32MP135F with XPT2046 touch controller attached to SPI bus, it has
> > been observed that the touch controller locks up after Linux kernel has
> > finished booting. Adding a dummy cycle on the SPI bus seems to mitigate
> > the lock up.
> > 
> > The XPTEK XPT2046 controller seems to be an identical clone of TI TSC2046,
> > the datasheet seems to be a clone of the TI part as well, text seem to be
> > word to word identical, except all the pictures have been drawn again.
> > 
> > This touch controller is present e.g. on WaveShare 3.2inch RPi LCD (B)
> > panel, the DTO provided by WaveShare uses 50 kHz SPI clock for this
> > touch controller, which is unusually low and possibly might have been
> > used as some sort of workaround for an issue. The SPI LCD on the same
> > bus uses 16 MHz clock.
> > 
> > SPI bus DT properties spi-cs-setup-delay-ns, spi-cs-hold-delay-ns,
> > spi-cs-inactive-delay-ns, spi-rx-delay-us, spi-tx-delay-us set to
> > range of 500ns..5us seem to have no impact on the behavior of the
> > touch controller, the lock up always occurs. The STM32MP13xx SPI
> > controller users GPIO control for the nCS pins.
> > 
> > Since the dummy cycle happens after the controller has been put into
> > power down mode and both ADC and REF regulators have been disabled,
> > the cycle should have no impact on the configuration of the controller,
> > i.e. it should be a NOP.
> > 
> > It is unclear whether this problem is specific to this cloned XPT2046
> > controller, or whether this is also present on TSC2046. A test on
> > either TSC2046 or ADS7846 would be very welcome.
> 
> Hi,
> 
> Are there still any open topics with this patch ?

I am concerned that we are putting workaroud for a single controller
into common function. Can we quirk it based on compatible? If not then I
would like someone to run tests on other controllers. Unfortunately I do
not have such hardware.

Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?

Thanks.

-- 
Dmitry

