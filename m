Return-Path: <linux-input+bounces-8043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD09C63D1
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 22:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BDA9285CC5
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 21:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6CC218D6B;
	Tue, 12 Nov 2024 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="nbIWyOtN"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD020604B
	for <linux-input@vger.kernel.org>; Tue, 12 Nov 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731448434; cv=none; b=UH6pflt8vy/G2zWOcagiOGx/SiQzzukDY+Duuveu6Nsy2BPpSh3GaBVZj+yJnKF+p6bN6yS3waGZmwOcgfx3M2hO1SMHHlXipF5leNSxRbnldswIXcFYAO77EGn0EJlrM4xQl6LHKQqUeEFjN7BiIoW49zsDq2/UjT9CXTcbUwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731448434; c=relaxed/simple;
	bh=/+IHet/fKL+EBvRl3cVMFxyigwrPSJQYP0+lz7PKW0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3VJSY0IlzuG66UkAgVgLj3QRSwoM6j5Av2LPi2wl1xC3ImrEODJ9pLRttbMazRxZE7ZCSqC9ZQ2KhkIVxZdJGpC6Q1zFEE9wgUyBnGT5xNbgRbiMHnQjmd0GdwouPrwQ5/7Aey5lBO7WGlRoZpLnrHQcWoFua2Dun+39DttYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=nbIWyOtN; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D5B2288F55;
	Tue, 12 Nov 2024 22:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448426;
	bh=Nq6neRu2m4QjWVLogi/qPBskvh4nDzxm85UaluAFueE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nbIWyOtNzEOhc1YvKSmh1urEvUV3BteC+A4rsv8ugu21mUVIJigXmglqMxb+IPvd1
	 xbaT9yor9v5c2fGlXU2WKseW2Q3SifHd25Ywu05tuhjRqKsxep1P73AIEHgiEPH3lC
	 uNAtzb6WS1lGP1x7RlCaxUkcdogsZzZ9OKaOmwij6mTfYlZytidKR+ajcOuxj3+Srx
	 ERBNq/BdaQrqBFHy2vtHiKop6vptai0+7mmnh5nrbAbfAb0C3AUA6HN/CmF+OiVZrj
	 ryiRYWQ4Gj228oE5svHfw61I2Jvlo1h2YCVaKND9SoqQmreglNoaL97V4hwLAbEJWd
	 /LL6ukXc/RkFA==
Message-ID: <e3beaa5f-c347-4dac-9f76-cd32e41fa493@denx.de>
Date: Tue, 12 Nov 2024 20:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] Input: ads7846 - add dummy command register clearing
 cycle
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <43cbfdfb-766b-4640-997e-2e731c8f6875@stanley.mountain>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <43cbfdfb-766b-4640-997e-2e731c8f6875@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/12/24 10:08 AM, Dan Carpenter wrote:
> Hello Marek Vasut,
> 
> Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
> clearing cycle") from Mar 20, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> drivers/input/touchscreen/ads7846.c:412 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 6
> drivers/input/touchscreen/ads7846.c:413 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 6
> drivers/input/touchscreen/ads7846.c:416 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
> drivers/input/touchscreen/ads7846.c:417 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
> drivers/input/touchscreen/ads7846.c:418 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
> drivers/input/touchscreen/ads7846.c:418 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
> drivers/input/touchscreen/ads7846.c:419 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
A fix for that was already posted by Nathan:

[PATCH] Input: ads7846 - Increase xfer array size in 'struct ser_req'

Sorry for the inconvenience.

