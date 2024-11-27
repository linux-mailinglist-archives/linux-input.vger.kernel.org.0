Return-Path: <linux-input+bounces-8280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA479DABAE
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 17:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BE34164F2E
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183F3200B82;
	Wed, 27 Nov 2024 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="Pd9a0O9j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2821FA164;
	Wed, 27 Nov 2024 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724416; cv=none; b=UNakcsgFVrKWz+YLnMTgtZp6B2lILcNuXjbmW3hoyTSbLDGE3TL2kDSilU6t0AaRJEJCpxgCAUFYa+FujuHo/GhhFqY8gZDeHMtOEgEOOqWro+7z7lfH0MCaEsR5722adLj1qlw6z7P0CPG3+zWTV1Pdr178RHYZclBtsxfzHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724416; c=relaxed/simple;
	bh=FfQLlwRRif9I+/gHYFJBaAYWwKsQDvbY6HNOz7tQZQw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sek7bglOEJ9QrkbsSDvgNLH3kul7ZAhW+Dk2ZreEf58FeXZAlVM+/fDw6Cc0fXYOMoodmF6cJ5LIZDZ53QrZbVTTlWYB512izqZkG2oPQezDcRwd4e9ebmYVCl2ACPvMu6v/WfF3qi6QTmGAjMVuPHzIPvF1NBVZj1cz/rArQt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=Pd9a0O9j; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id AB55242525;
	Wed, 27 Nov 2024 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732724411; bh=FfQLlwRRif9I+/gHYFJBaAYWwKsQDvbY6HNOz7tQZQw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Pd9a0O9j/rBvngLDrsQ+1Svpho2IgtdWKmo8WWmFHzWOL7ZE29ZRjNA00WdGarcmr
	 I9ZMQfO622xvBj7iLYRVjobe/tOh1r0+ZHzAmN+A00IfHls97RIZ2LTIY6RperA8fA
	 7u6n/irReNXJkFsx9XLEXiTT5RlddLRhro3c2CFXn7MXTcoqPktk4iff/oIteXNrVY
	 Ue1O8NqvCmkSCjri8xjjriRCdW5IOWd2cVkTeVLzdq+b2M1N7nVfP7x9/vd/92rlW2
	 CW6hd950v+1vy71o+x8CH0dAu2AaSJoorokerx/N/D7C15cSJiqffufB45Ma9D6rMA
	 uxtk0iMMvXVpw==
Message-ID: <969b7440-5173-4ecc-af31-c3cd1f3f5acf@marcan.st>
Date: Thu, 28 Nov 2024 01:20:09 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
From: Hector Martin <marcan@marcan.st>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
 Mark Brown <broonie@kernel.org>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <Z0Z7Lrv3rBfzac_e@google.com>
 <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
 <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
Content-Language: en-US
In-Reply-To: <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024/11/28 0:29, Hector Martin wrote:
> 
> 
> On 2024/11/27 17:29, Sasha Finkelstein wrote:
>> On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>> I believe this needs to be done at the SPI controller level. See
>>> "cs-gpiods" property in
>>> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
>>> as I understand, allows overriding controller's native CS handling with
>>> a GPIO when needed.
>>
>> I have already tried doing that (adding the relevant gpio as cs-gpios
>> on the controller)
>> and for some reason none of my attempts worked. Since there is no hardware
>> documentation, I can't really tell why, could be possible that we need both
>> native CS and that gpio, could be memory barrier issues somewhere in
>> the driver core,
>> but the method above is the only one i could get to work.
> 
> Are you sure this isn't just a pinmux problem, i.e. the bootloader
> initializes the pinmux for hardware CS only on one device and not the other?
> 
> See spi3_pins in the DTS in our downstream tree (and the reference from
> the SPI controller). If the rest of the SPI pins are already working
> properly you can just try with the CS pin (same index as on the gpio
> spec). Ideally we'd list the 4 pins, but someone needs to reverse
> engineer the mapping with m1n1 gpiola since we don't know what it is.
> 
> If it really doesn't work with native CS and proper pinmux then cs-gpios
> on the controller should work. If it doesn't something weird is going on
> elsewhere. There's only one CS line, needing both makes no sense.
> 

Looked into this. The pins are 67=CLK, 68=MOSI, 69=MISO for spi0 on
t8103 (they should be added to pinctrl even though they are already
configured by iBoot, ping Janne).

It does sound like there's no hardware CS for SPI0, so the referenced
GPIO 109 is probably just a GPIO. In that case it should work when
declared as a cs for the SPI controller node. If that doesn't work we
need to figure out why and fix it, not add it into the z2 driver.

- Hector


