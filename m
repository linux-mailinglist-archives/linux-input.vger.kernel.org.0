Return-Path: <linux-input+bounces-8042-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0D9C6308
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 22:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EBEFB291D0
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 19:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0999D20B218;
	Tue, 12 Nov 2024 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="g4VBV8Ml"
X-Original-To: linux-input@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B516521503E
	for <linux-input@vger.kernel.org>; Tue, 12 Nov 2024 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440467; cv=none; b=TdFZQ9OTDwM8KLc377hDCQlrPYIcprgQMDd5YK+qExjBvBAZjDOC4n2fpcer43X/BpbD0R7lRY6aGDZrfLtI1x29Hp7hY6yosqIh44S1dA2dsBQbKpyspYzXLjCoMNYvwXPCRlv2uPf9pre3Ciwa0I31k+cPaex83/lJm3zcye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440467; c=relaxed/simple;
	bh=o4D1oRg6fQs4yH8QdSxz4ugoPT6wFWtYavo2giDyQ3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAhrc+e+1JeOuWPs57dK3jD/wKpXxuQCIwZblvV/b8mlp20xjY1AtlWm6ioqv8Caz8YEJuG0hNNNTsARmRnyMt7DJvGkmBVHEozc68MOF4XbTMrFYMK5HWSfsxk0g8Kbwaz9mLIk7AJa2HgPrvVxqSJvAKRP0MpXP4vjyqWZfMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=g4VBV8Ml; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1731440460; bh=o4D1oRg6fQs4yH8QdSxz4ugoPT6wFWtYavo2giDyQ3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g4VBV8MlUZVJcKwlGliR3IvXZHPdRPW0aFCYcEvUSi2Cl64UxuyNiC7GTMV70iZm/
	 /qyGYL8LW11NSa1FZO0ptcYIngmdRZEoU2QoMG43NzTgd7o0hgROEuYBu0de+lGW2Q
	 1LmoCPQ3mowVs+eO2EqL+thN44fHv0eebBGSj8ctqBN6KTARRVjxOWd3CbQ4q/Q+mX
	 YsY+yHyi41Zbu9G0ETP/lbAZrEDTvHllxpMLzL5TVdOWXHgnLO/7ZUTC5xWAft3fjx
	 7I/B7ENFJ4xbhdwLQTIg/Id4pN9oCxjC2pvsOQXOfgihkHCH4dNy2YN2Tp59qohkIs
	 VaW7oW1LTMbKzE2YunDdc/JVTNBUoN/dGhgAY0KT5xcaWh+F5ftE0DCJdX66VI1I8Z
	 luD85B5F4JRmPOYjU36aPktTlRMeD741luNZm2zddyIV/hFfG0ucH3q0c3zCf1LgBN
	 /9aMJ3ZZoldSL8Ns7fxTHQVJt2E0iUx6KMvLxGiTyLcSzbYBbx8tcpbYHdo4LYxejt
	 b0Q7tYyzb1MuhKFQkZKcUFtjakLwuk5FwfE4k89WP4nz3UqzDwq35kS7wYVbtDPHQT
	 o4v9iQHDSqdt/awy5Ye0NSXL/xJ84h1+4KEwWWQ5Evfzmp8QuV56z80m0Owvt7bQU5
	 e/DDBdX4CyVDoHtx4mDtgpys=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 8B7E718DC93;
	Tue, 12 Nov 2024 20:41:00 +0100 (CET)
Message-ID: <da5aab40-4a50-4794-b9b8-d473a832451c@ijzerbout.nl>
Date: Tue, 12 Nov 2024 20:40:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
To: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 kernel@dh-electronics.com
References: <20240320072533.170029-1-marex@denx.de>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240320072533.170029-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 20-03-2024 om 08:23 schreef Marek Vasut:
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
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-input@vger.kernel.org
> ---
>   drivers/input/touchscreen/ads7846.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index d2bbb436a77df..90b5251797963 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -404,9 +404,19 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
>   
>   	req->xfer[5].rx_buf = &req->scratch;
>   	req->xfer[5].len = 2;
> -	CS_CHANGE(req->xfer[5]);
>   	spi_message_add_tail(&req->xfer[5], &req->msg);
>   
> +	/* clear the command register */
> +	req->scratch = 0;
> +	req->xfer[6].tx_buf = &req->scratch;
> +	req->xfer[6].len = 1;
> +	spi_message_add_tail(&req->xfer[6], &req->msg);
> +
> +	req->xfer[7].rx_buf = &req->scratch;
> +	req->xfer[7].len = 2;
> +	CS_CHANGE(req->xfer[7]);
> +	spi_message_add_tail(&req->xfer[7], &req->msg);
> +
>   	mutex_lock(&ts->lock);
>   	ads7846_stop(ts);
>   	status = spi_sync(spi, &req->msg);
Sorry for sending a comment this late.

You need to increase the size of req->xfer, because it is an
array of size 6.
     struct spi_transfer     xfer[6];

You're writing beyond the array boundary.
-- 
Kees Bakker

