Return-Path: <linux-input+bounces-4657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D58919E2B
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 06:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47B31F23474
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 04:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0781BF24;
	Thu, 27 Jun 2024 04:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="d0nZiXMO"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A851864C
	for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 04:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719462581; cv=none; b=Wv6MBn+ntDRJH1UsD/DMpmqZ3ngLNnA9ppLnAWrCzKH1Gs7KXdJih857z3ryA9hy810ZsXHUaC/I61mw48yvEs+Gh2nqftdxK0unOPShyrqakQXraSbVI8lwUQu9BvYfsVzT0+JB5W7cE42LhEdmr2hKRhq1Wb8tUelwrG+tNSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719462581; c=relaxed/simple;
	bh=WxM89B8GdFcvIky4khjE/J1YoHF/vA0+MuOxGFXi9Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GG0H6qACp3qQT2X6Kd8gtaeDfngHuImfWYuHmIlBC96dHpINWcLDLabYr8Ns7JVMdfdOG7xMLe4679/gwZLtmNnpu3ap54M4CQ1nm5axbbRVw1bBLKRoRseH3d7ko0Dcba6VuJtfiODauoDSIukj21cah+BXXHmEbCNXCWUCYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=d0nZiXMO; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A82B488418;
	Thu, 27 Jun 2024 06:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719462577;
	bh=aWWqWdnU7+yrg17a567wt24wi3FnoqsfAdqndcpRsW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d0nZiXMObzibcdbTZAGQorY0zyRT0auzjw7CY6AEBxYvuB1+R73uBHeLnmXQ7nDYT
	 XYpIxfV0EbihOpfI0RKuw1XdVaHw68PPwh3eWzqC7BjySTE3o4mHWL9ZDPPBpmds4t
	 Uwf6lUMBGOgVLcx/H/9vk6qtLPOCibIo1Ikq877WmH/6PKTZLJxJCynXaiqZEt5fST
	 Yx6nqUcvz8v9uavrTQe0iPk9oR7z/2P4V83egJ9YksvrrVChIGbiyAasLWtRF+9zu5
	 1ef4DkXDK8U+dmWGEB4Etvz2Jbm83NvmP4pBtl2eC1Ks/8M3DpIjiElmNwUcz9Td/P
	 uKi80dvI+5Jcw==
Message-ID: <15130710-c446-4df0-ad8e-638491399499@denx.de>
Date: Wed, 26 Jun 2024 22:08:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com
References: <20240320072533.170029-1-marex@denx.de>
 <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de> <Znstp_l5l2PUgIfP@google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Znstp_l5l2PUgIfP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/25/24 10:50 PM, Dmitry Torokhov wrote:
> On Sun, Jun 23, 2024 at 08:21:00PM +0200, Marek Vasut wrote:
>> On 3/20/24 8:23 AM, Marek Vasut wrote:
>>> On STM32MP135F with XPT2046 touch controller attached to SPI bus, it has
>>> been observed that the touch controller locks up after Linux kernel has
>>> finished booting. Adding a dummy cycle on the SPI bus seems to mitigate
>>> the lock up.
>>>
>>> The XPTEK XPT2046 controller seems to be an identical clone of TI TSC2046,
>>> the datasheet seems to be a clone of the TI part as well, text seem to be
>>> word to word identical, except all the pictures have been drawn again.
>>>
>>> This touch controller is present e.g. on WaveShare 3.2inch RPi LCD (B)
>>> panel, the DTO provided by WaveShare uses 50 kHz SPI clock for this
>>> touch controller, which is unusually low and possibly might have been
>>> used as some sort of workaround for an issue. The SPI LCD on the same
>>> bus uses 16 MHz clock.
>>>
>>> SPI bus DT properties spi-cs-setup-delay-ns, spi-cs-hold-delay-ns,
>>> spi-cs-inactive-delay-ns, spi-rx-delay-us, spi-tx-delay-us set to
>>> range of 500ns..5us seem to have no impact on the behavior of the
>>> touch controller, the lock up always occurs. The STM32MP13xx SPI
>>> controller users GPIO control for the nCS pins.
>>>
>>> Since the dummy cycle happens after the controller has been put into
>>> power down mode and both ADC and REF regulators have been disabled,
>>> the cycle should have no impact on the configuration of the controller,
>>> i.e. it should be a NOP.
>>>
>>> It is unclear whether this problem is specific to this cloned XPT2046
>>> controller, or whether this is also present on TSC2046. A test on
>>> either TSC2046 or ADS7846 would be very welcome.
>>
>> Hi,
>>
>> Are there still any open topics with this patch ?
> 
> I am concerned that we are putting workaroud for a single controller
> into common function. Can we quirk it based on compatible?

We can, but there is a slight problem. I came across DTs which describe 
this XPT2046 using TSC2046 or ADS7846 compatible string in those DTs, so 
if those get used, this driver won't work correctly. On the other hand, 
those are random downstream DTs, they are not upstream, so maybe those 
are irrelevant.

> If not then I
> would like someone to run tests on other controllers. Unfortunately I do
> not have such hardware.

I did dig through my pile and I don't have one such controller either.

> Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?

I would much rather see this tested on at least one of the old 
controllers than add a quirk via DT compatible, because I believe this 
won't have adverse effects on those controllers, and it would help cover 
the odd DTs which consider this to be a drop-in compatible replacement 
for TSC2046 transparently (even if it really is not quite compatible).

