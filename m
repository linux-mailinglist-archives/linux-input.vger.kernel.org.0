Return-Path: <linux-input+bounces-8127-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1B9D06C1
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 23:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C6928232F
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 22:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1871DE2C1;
	Sun, 17 Nov 2024 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="xLq1cW3H"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6629B1DE2BB;
	Sun, 17 Nov 2024 22:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884373; cv=none; b=UTbIMjIxFlWCDHW6HDz0fqy/K9QMbGqoqRwdOirpkZYEXX8dxRsVytwmXKbxZG0aeapC7nIBa+NDyDa4v1mexsF/ClBmPIwdUpopSIeQK/ZI0YWRxxFHpO2h4is/haxBBO9sYTlpHA9xVG0b8HMW2QTrnivW8N6fg+YsldGk1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884373; c=relaxed/simple;
	bh=k9mMIGPjAE7T/mIsbukE7MMsCOXGLM/F+Drb9ESSV2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgTi8uoPXoZ6WDv7V389qFtLIVxBqgyX5rC6VcQl6wL5Ep4o7ER8wofWdlM1x4LaNXN5AoVRzYd3do/iHNcbzg49pCpkP/ev0QEQimtSTDEjWRjJ5J6Ff55pTjJyV+usE9UbYg9ZghXt5ZinRBY1pzadMNesbDZSB7Dr3C+aYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=xLq1cW3H; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B3E6689003;
	Sun, 17 Nov 2024 23:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731884363;
	bh=3IzmB2O3D7dIbxmRicxWETS2qqEUDSL6zS9NFg7l0sU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xLq1cW3HNrTEtpH3mmvlcfKc4YFfVd40BwLlRhqIH5llADix1BEEhaV7p9lisZKNF
	 N4xQ/l9rrr7qxCSi09HqygcD6pPwYz1mvtf2h4CdQ53jSSopCf6aBfXfsJc7PaAd60
	 t9xy9tCpvGmfucChxJmXUmmHLpeoAcz5p4b6PSX+5hJ9IGKABkT29F+TKvgEqtbkWz
	 28VxZeYdRE7nkqihG6seNDyYsv4UwG4LPQBy82BjWye0zK7FLMrRVo6cuEJQTRUs1c
	 lAg1PSlHxXkRNyc8+xq4S/5u8XBjhTo0T8uXFrkpCon40tMMYmJ2vHv05RWvhDr5i1
	 4mpjelopROc6Q==
Message-ID: <5b203f2a-755a-448b-946a-f14d6060dbb7@denx.de>
Date: Sun, 17 Nov 2024 23:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - Expand xfer array to match usage
To: Kees Cook <kees@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Luca Ellero <l.ellero@asem.it>, linux-input@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20241117033445.work.274-kees@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241117033445.work.274-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/17/24 4:34 AM, Kees Cook wrote:
> Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
> clearing cycle") added commands to struct ser_req::xfer without
> expanding it to hold them. Expand the array to the correct size.
> 
> ../drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
> ../drivers/input/touchscreen/ads7846.c:416:18: error: array subscript 7 is above array bounds of 'struct spi_transfer[6]' [-Werror=array-bounds=]
>    416 |         req->xfer[7].rx_buf = &req->scratch;
>        |         ~~~~~~~~~^~~
> ../drivers/input/touchscreen/ads7846.c:334:33: note: while referencing 'xfer'
>    334 |         struct spi_transfer     xfer[6];
>        |                                 ^~~~
> 
> Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
> Signed-off-by: Kees Cook <kees@kernel.org>
I think Nathan already sent a fix too.

Thanks !

