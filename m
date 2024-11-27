Return-Path: <linux-input+bounces-8279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B552F9DAAC6
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 16:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46DB2B21292
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0EB200119;
	Wed, 27 Nov 2024 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="hIo7tdzy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE01FF7D0;
	Wed, 27 Nov 2024 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732721359; cv=none; b=ayFx73PwurxgwDRh7/wRSohkqT3i8JZ399wNQin7XMElNqWT5g2770IkWySVW2WMkZSG/8WggaleP/plTh9SVrQHgEis+JE7OIeRQrioOTRwoewM76YA1oIReug2w819k1Bz4n9G6c2pTcxtdbUbEL770bornmRcYCFYHJw9HkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732721359; c=relaxed/simple;
	bh=2vJooQxDCFwloAiYjdkYj6nOIAaBL9PWzbzwFJSF9X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4kv/1/ZrgkWgSNujHpW3qMAf6dTERUTCd4d2T514iohHZm3obGt94b+q9w6QodPO0en5sLCAkh4kwDXVpzXOgPZXWZcJdypziZFp6u9a/ew8vTAYOdyKLKm2HAFNjVgYv41+0sQdaKDOly235pMol3kdtf2XowjMx4A9nEtn+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=hIo7tdzy; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id F247843587;
	Wed, 27 Nov 2024 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732721353; bh=2vJooQxDCFwloAiYjdkYj6nOIAaBL9PWzbzwFJSF9X4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hIo7tdzyArdTp4Z8DYTMTyp7aaI3whJ2Rcw0dRCLCMAOlolDRG1FCc1cCVcharF+T
	 O9id0ZBAgSaGPlOmlLVFIMOpulNMtGwge1ucAjrUo0q+33INpbK901XBwFGMRi+ZaR
	 9vDvRzm4OEZQo58uXdDr0ekqKMXtt0QcfagGGi1eKhX8xlRs3AAY2gltjlsrR5IBDQ
	 ZelOG7bJE9bcrh0XUsUSXU2M9zGQDD3VohAi5kJGkR8PsWjl3Nki8SywbLImvP/C1a
	 ArcRa+tvw7/LEWmtjZWflh1S3Cxv6gj3V6TL0xQf6YWtFvZUMc05SjtRGml0WYyPQF
	 lNwtZ/QVz81/g==
Message-ID: <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
Date: Thu, 28 Nov 2024 00:29:11 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
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
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024/11/27 17:29, Sasha Finkelstein wrote:
> On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>> I believe this needs to be done at the SPI controller level. See
>> "cs-gpiods" property in
>> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
>> as I understand, allows overriding controller's native CS handling with
>> a GPIO when needed.
> 
> I have already tried doing that (adding the relevant gpio as cs-gpios
> on the controller)
> and for some reason none of my attempts worked. Since there is no hardware
> documentation, I can't really tell why, could be possible that we need both
> native CS and that gpio, could be memory barrier issues somewhere in
> the driver core,
> but the method above is the only one i could get to work.

Are you sure this isn't just a pinmux problem, i.e. the bootloader
initializes the pinmux for hardware CS only on one device and not the other?

See spi3_pins in the DTS in our downstream tree (and the reference from
the SPI controller). If the rest of the SPI pins are already working
properly you can just try with the CS pin (same index as on the gpio
spec). Ideally we'd list the 4 pins, but someone needs to reverse
engineer the mapping with m1n1 gpiola since we don't know what it is.

If it really doesn't work with native CS and proper pinmux then cs-gpios
on the controller should work. If it doesn't something weird is going on
elsewhere. There's only one CS line, needing both makes no sense.

- Hector


