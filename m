Return-Path: <linux-input+bounces-4572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35240913D9C
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 20:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E631E282DA4
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2CD138E;
	Sun, 23 Jun 2024 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Mmjv3F9K"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE95148314
	for <linux-input@vger.kernel.org>; Sun, 23 Jun 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719169124; cv=none; b=EY0b6yu4lBCButxxypR/b1zUn46kWuczclhVnemSvNT2aHAZY2UgFcadpIJAxg8YwmzpYHlt1Z8Rz62WvcC7KptTdmBJCAf8jPCTV+sFPzf6oFJxFtRmOGxD4orQoIEKtJtndUNqvWB1Ua7Xls5NYoChW0FVTd8Vv3DnBjNsL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719169124; c=relaxed/simple;
	bh=ohWdDHCv4AKBamtg2RD0lJhPtwkOYoy5OrL63dfFv18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQ3oz6MHD0QgKsVMTBRyn0HFBuK5VBotk7evwOAAMhmcuLtM8GMTLNx7lLWZFbkUOv5yAY3U4DIet5f35k55dcLFgbqwPOtpiIrwXkGrmjb8ES97u1ICZuXTprv6KCAjFxPC4v2aFrUb1s/1pWe0dhy+d8t5bAedzCndYN5QX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Mmjv3F9K; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5FE2B87DC7;
	Sun, 23 Jun 2024 20:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719169119;
	bh=wGeVAu0t0xa9lrV8E0WY9Qm7MzrprBwclRjTiFCxNXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mmjv3F9KcP/LyDMMBfZtVk3cwcJhZpD2Tk9Vmsau2EzFGjBT5cgvE8txJN4bkXFSQ
	 YuFLfcfP0pzkvbll4pi2eboRHXMYYdUAukVKLX9PbxE/j+mz1LHTWAAsVEAbIMhDfF
	 +JfoexzSOIZBjw58xOwRwYbk/6iUFxdJlRRxLP/y74f3ZWhX1+SkKhKoJxlhPOiLXn
	 rtxlCL+Lg0AH6nHyq5z0L10LXAkAj6V5teuy+olaszZ0hJ/FdhwBqDQvhrIAZGPDB1
	 cBO2IyBD4RkHSM7wtXnjX+Rz2/Pa0bdQR5Tnpa4UpJscJLV9V9JydatO6Cbld5GrpC
	 7Ov3TkiSHtqGQ==
Message-ID: <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>
Date: Sun, 23 Jun 2024 20:21:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
To: linux-input@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 kernel@dh-electronics.com
References: <20240320072533.170029-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240320072533.170029-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/20/24 8:23 AM, Marek Vasut wrote:
> On STM32MP135F with XPT2046 touch controller attached to SPI bus, it has
> been observed that the touch controller locks up after Linux kernel has
> finished booting. Adding a dummy cycle on the SPI bus seems to mitigate
> the lock up.
> 
> The XPTEK XPT2046 controller seems to be an identical clone of TI TSC2046,
> the datasheet seems to be a clone of the TI part as well, text seem to be
> word to word identical, except all the pictures have been drawn again.
> 
> This touch controller is present e.g. on WaveShare 3.2inch RPi LCD (B)
> panel, the DTO provided by WaveShare uses 50 kHz SPI clock for this
> touch controller, which is unusually low and possibly might have been
> used as some sort of workaround for an issue. The SPI LCD on the same
> bus uses 16 MHz clock.
> 
> SPI bus DT properties spi-cs-setup-delay-ns, spi-cs-hold-delay-ns,
> spi-cs-inactive-delay-ns, spi-rx-delay-us, spi-tx-delay-us set to
> range of 500ns..5us seem to have no impact on the behavior of the
> touch controller, the lock up always occurs. The STM32MP13xx SPI
> controller users GPIO control for the nCS pins.
> 
> Since the dummy cycle happens after the controller has been put into
> power down mode and both ADC and REF regulators have been disabled,
> the cycle should have no impact on the configuration of the controller,
> i.e. it should be a NOP.
> 
> It is unclear whether this problem is specific to this cloned XPT2046
> controller, or whether this is also present on TSC2046. A test on
> either TSC2046 or ADS7846 would be very welcome.

Hi,

Are there still any open topics with this patch ?

