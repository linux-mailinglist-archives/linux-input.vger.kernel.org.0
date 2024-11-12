Return-Path: <linux-input+bounces-8044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8269C657C
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 00:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0829B33AF6
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 21:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D509219E31;
	Tue, 12 Nov 2024 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="PeyuKVM2"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D27219E32
	for <linux-input@vger.kernel.org>; Tue, 12 Nov 2024 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731448438; cv=none; b=SvyjJb6nuUO40fjP5nnB4aQXfaIIkdq9+8/OQU4NeMWNh7qVK78rE8A1MWOD/13ZxAs7DsL/TnCRc+Ok8D+5ea97BnEfj+YGqaxDQi7Rxt747BF7YKIQC7QUMz8G/CbRU+3gaMlOrBSqFEMG5ShvjvD/scncA1RpJF7W8sAwObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731448438; c=relaxed/simple;
	bh=LIoROOCccgaHd58Uz4Vfki2o8u0Mw1E1K3ZQCxq+ZZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA9EzGFXyRju8BDUKXo2jWJ8TnPk940Rn1+b/RzG2Z0CsISiHzdeXFhRAODOLCADW/tn4im1S0TcCA20f6J6tGRlSu3DFPDq9fK5iOBL5Zke2LlSdnt9n7ecPN81z8ZpUN0S1DaatvFMILLH3qFDI3mlDMuEBE9qxJjoZVOGl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=PeyuKVM2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3229E894B3;
	Tue, 12 Nov 2024 22:53:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448428;
	bh=U+eiMPSDynU2mLOrhiM1lwtnKZK13GcfqZo+9icO4sA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PeyuKVM2mwtD3T94PXQjU8EtgRf5jfFvhBLelvFKOkxZpB6ujq19Zv4gJa0YVAvgl
	 UWCQB1w6HMrhNmWk2cE2Wk7Wwk8mh83PDiXmrso1Ty2c5uSTJsNN+MrcjdzDLVZD2X
	 thWE+tAQn+4vWhANB3thSBMkkvOmQcAgehSLkUWrq+3kFKhZ5Q2RLrrGPHX3zECDSG
	 9UsqvxiNCvukvcivCUoFUK0TZfAyqPTnTwCE7EoiVxTAAwhIUZyEd7wpuxnrejAt5I
	 9/CVZJfeXlWp7+bK+wojDqqXIKqJ04FpRqYU75dT1gWUrU+D7qblAjssisbrJs1Zld
	 DCZ6Y31dNzoNQ==
Message-ID: <474c8a72-07c9-4a9b-a189-a9a7b533f40a@denx.de>
Date: Tue, 12 Nov 2024 22:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
To: Kees Bakker <kees@ijzerbout.nl>, linux-input@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 kernel@dh-electronics.com
References: <20240320072533.170029-1-marex@denx.de>
 <da5aab40-4a50-4794-b9b8-d473a832451c@ijzerbout.nl>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <da5aab40-4a50-4794-b9b8-d473a832451c@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/12/24 8:40 PM, Kees Bakker wrote:
> Op 20-03-2024 om 08:23 schreef Marek Vasut:
>> On STM32MP135F with XPT2046 touch controller attached to SPI bus, it has
>> been observed that the touch controller locks up after Linux kernel has
>> finished booting. Adding a dummy cycle on the SPI bus seems to mitigate
>> the lock up.
>>
>> The XPTEK XPT2046 controller seems to be an identical clone of TI 
>> TSC2046,
>> the datasheet seems to be a clone of the TI part as well, text seem to be
>> word to word identical, except all the pictures have been drawn again.
>>
>> This touch controller is present e.g. on WaveShare 3.2inch RPi LCD (B)
>> panel, the DTO provided by WaveShare uses 50 kHz SPI clock for this
>> touch controller, which is unusually low and possibly might have been
>> used as some sort of workaround for an issue. The SPI LCD on the same
>> bus uses 16 MHz clock.
>>
>> SPI bus DT properties spi-cs-setup-delay-ns, spi-cs-hold-delay-ns,
>> spi-cs-inactive-delay-ns, spi-rx-delay-us, spi-tx-delay-us set to
>> range of 500ns..5us seem to have no impact on the behavior of the
>> touch controller, the lock up always occurs. The STM32MP13xx SPI
>> controller users GPIO control for the nCS pins.
>>
>> Since the dummy cycle happens after the controller has been put into
>> power down mode and both ADC and REF regulators have been disabled,
>> the cycle should have no impact on the configuration of the controller,
>> i.e. it should be a NOP.
>>
>> It is unclear whether this problem is specific to this cloned XPT2046
>> controller, or whether this is also present on TSC2046. A test on
>> either TSC2046 or ADS7846 would be very welcome.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: kernel@dh-electronics.com
>> Cc: linux-input@vger.kernel.org
>> ---
>>   drivers/input/touchscreen/ads7846.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/ 
>> touchscreen/ads7846.c
>> index d2bbb436a77df..90b5251797963 100644
>> --- a/drivers/input/touchscreen/ads7846.c
>> +++ b/drivers/input/touchscreen/ads7846.c
>> @@ -404,9 +404,19 @@ static int ads7846_read12_ser(struct device *dev, 
>> unsigned command)
>>       req->xfer[5].rx_buf = &req->scratch;
>>       req->xfer[5].len = 2;
>> -    CS_CHANGE(req->xfer[5]);
>>       spi_message_add_tail(&req->xfer[5], &req->msg);
>> +    /* clear the command register */
>> +    req->scratch = 0;
>> +    req->xfer[6].tx_buf = &req->scratch;
>> +    req->xfer[6].len = 1;
>> +    spi_message_add_tail(&req->xfer[6], &req->msg);
>> +
>> +    req->xfer[7].rx_buf = &req->scratch;
>> +    req->xfer[7].len = 2;
>> +    CS_CHANGE(req->xfer[7]);
>> +    spi_message_add_tail(&req->xfer[7], &req->msg);
>> +
>>       mutex_lock(&ts->lock);
>>       ads7846_stop(ts);
>>       status = spi_sync(spi, &req->msg);
> Sorry for sending a comment this late.
> 
> You need to increase the size of req->xfer, because it is an
> array of size 6.
>      struct spi_transfer     xfer[6];
> 
> You're writing beyond the array boundary.

A fix for that was already posted by Nathan:

[PATCH] Input: ads7846 - Increase xfer array size in 'struct ser_req'

Sorry for the inconvenience.

