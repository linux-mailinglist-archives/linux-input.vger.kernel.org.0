Return-Path: <linux-input+bounces-8683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04A9F82C2
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46FDE7A1014
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 17:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA44198845;
	Thu, 19 Dec 2024 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3ohROY6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB70155342;
	Thu, 19 Dec 2024 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734631072; cv=none; b=JBVJCvEYHs379sjQqVRohWiEIw1Gg8hdko0ekn8NFA+Fw/zXvhgSFr98p7K52tO5OfJTOqK1+WkrrbvQFL15ZAGOcCHRHQUsTNf4mjLBjKux0xisUqa40WyJMIUElqLvbZL+BEfpBA2lpEIPcZcNcm6qJaNUCU0adkg8SgEkpIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734631072; c=relaxed/simple;
	bh=HwsB1+SO6TcBSdbbtu7k0GA/NbWrPb1KLY2jJB6RDBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QhYIKqyqPVx8vzJQ16e26rTtWXD8Z7t+eBf3qToyPFBrHe7MTbougQMeBEMxx9cnY2jbEE9dDVknPH3VaJTplvtSqkK9HGzXL5sPF8pgcvPkuR/+zT7eaCaYFShw0A2dBIf9a0+AgluNOyEynxElXWfY0W6/Tz7tlolhIZagOmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3ohROY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6034DC4CECE;
	Thu, 19 Dec 2024 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734631071;
	bh=HwsB1+SO6TcBSdbbtu7k0GA/NbWrPb1KLY2jJB6RDBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S3ohROY6GFgEc6BPp9b0/IRl3mhFx4mQO1TjekEs4TSnvlmRWaxIZwYW547+asMje
	 4pL/XYRY0law/KgToSmdCeS3xq84yDWOzPKhFwa+x5xCPRG5bpMVLSoKd2ExU70nHB
	 BdVhU3FPg1uRK7sqkV+Ydt3j/alAukujhHUUdv/17SGxKyDFBTDaXOVp9sopSYqx7R
	 taOFHY5lmPC5r68XAwcVOISfxgQe5s5KHvg6GG89OQfjD1SH7tvXc8ZIY5JlVuij0K
	 g+tL7K0dql6IpB5nIJ0vdIGGpsm58a+wvQl3V2nCtNoqKllk7S9ZTpkK8y2YIhDcrt
	 6jv+0kTgxO19g==
Date: Thu, 19 Dec 2024 18:57:48 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] [RFC] Input: remove evbug driver
In-Reply-To: <Z2HzxziYyF9-vxns@google.com>
Message-ID: <ss361op7-9op7-pr29-5pr7-4867rqn1rqo4@xreary.bet>
References: <8n377s5p-3r9n-ro38-3r2o-p536745552qo@xreary.bet> <Z2HzxziYyF9-vxns@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Dec 2024, Dmitry Torokhov wrote:

> > From: Jiri Kosina <jkosina@suse.com>
> > 
> > I've never heard of anyone having used this driver for debugging at least 
> > in over past decade or so. Since we have tools like evtest, this driver 
> > seems to be rather superficial.
> > 
> > Also, it apparently causes confusion among people who accidentaly enable 
> > CONFIG_INPUT_EVBUG and are annoyed/confused by their kernel log being 
> > spammed by a lot of useless data.
> > 
> > Let's just remove it.
> 
> Agree. Applied, thank you.

Thanks Dmitry.

I don't see it in dtor/input.git though .. ?

> Interestingly:
> 
> dtor@dtor-ws:~/kernel/next $ git grep -i evbug
> arch/arm/configs/davinci_all_defconfig:CONFIG_INPUT_EVBUG=m
> arch/arm/configs/imx_v6_v7_defconfig:CONFIG_INPUT_EVBUG=m
> arch/arm/configs/moxart_defconfig:CONFIG_INPUT_EVBUG=y
> arch/arm/configs/omap1_defconfig:CONFIG_INPUT_EVBUG=y
> arch/mips/configs/pic32mzda_defconfig:CONFIG_INPUT_EVBUG=m
> arch/sh/configs/sh7785lcr_32bit_defconfig:CONFIG_INPUT_EVBUG=m
> arch/sparc/configs/sparc32_defconfig:CONFIG_INPUT_EVBUG=m
> 
> I am curious why moxart and omap1 have it as 'y'. 

The dmesg on those architectures must be a real pleasure to read :)

> Thanks.

Thanks,

-- 
Jiri Kosina
SUSE Labs


