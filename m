Return-Path: <linux-input+bounces-3762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D58CB12A
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 17:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7ECB1C215CF
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF77143C74;
	Tue, 21 May 2024 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dM8QQmw0"
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D2143C6F;
	Tue, 21 May 2024 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305106; cv=none; b=kx3d5NdQr9/KGMrz59xoXNj6Nhas0BwEu1/QndgqSl4NgGdCu1SQjexrl/JjRvTgr2AH3512yjU9iW3M/h5MnnmhjuF+ORxLCRQ9D2ifz5N48qMDaYNpNKR3ImaY8NHZB9tgdx2KMBF5AraYxiKZrXL+OQujb8u28tyqwH2GGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305106; c=relaxed/simple;
	bh=A3J309TsoqdkIrXDSI0knLWc6p6vrTEOmqxSntKFqCs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=I0lHwVJLXGpZT33rvdYVYKtxQp+17rh1tua4vZkucPn7d7b18d2Gs8ocGjniCKA+7z0w2WmLkLd/jfh1cYbh0tvQ+EXON6CPMAtIC/N03GT9wSUJAL1JAaCMV7GDudFf8i+Ju3TZ+1V7Y54/kvHhU4gvM5NdAxl5gOy6u1RqsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dM8QQmw0; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAC5F1BF204;
	Tue, 21 May 2024 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716305096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElkBmCZAiz2r8dVRfGBgfJobIEqZm/ZvOK4Iwl3Tq2w=;
	b=dM8QQmw0qDIYIjfpu9qQke7m2RDR5886taHKqC9o0InqTDE9M8rTppd82I1AAqPx/0JLdM
	fzYKE6f4xyWsRkhHToCijAZ9E8cIfXojSYJd5azQ53VkZ5h1f4A8H6FacfmyaRfF9IFwgb
	H7CXsJ2BCGmbz0KUOh2smiFLpkKQa/HHzMdNL/HahzbxE8bvE51p3YyjVQDNMGQAoGP+vH
	/3jXzwq+EWvg3ssvibNF6caZeK3HLU7C9bKNrI1pAD9U6RmvKAUmQjzQoFZtUs0AJZ6Pff
	44yqJef2NOM5jWmyDcmcCgpd8AmxzO67NrWhCW4jEKkR3GOvKOlfB9+3c9fAyw==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 21 May 2024 17:24:55 +0200
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>
Cc: catalin.popescu@leica-geosystems.com, mark.satterthwaite@touchnetix.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v11 0/3] Input: Add TouchNetix axiom touchscreen driver
In-Reply-To: <20240419123829.120396-1-kamel.bouhara@bootlin.com>
References: <20240419123829.120396-1-kamel.bouhara@bootlin.com>
Message-ID: <b418074df10f52d64f53ea13bb17977f@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-04-19 14:38, Kamel Bouhara a écrit :
> Add a new driver for the TouchNetix's axiom family of touchscreen
> controller. This driver only support i2c and can be later adapted for
> SPI and USB support.
> 

Hello Dmitry,

I just saw you are still applying patch and I wanted to know if this 
series could be merged as well ?

Kamel

> --
> Changes in v11:
>  - Fix regulators name to match dt-binding
>  - Enable regulators before reset is asserted
> 
> Changes in v10:
>  - Set regulators as required
>  - Enable power supply before reset
>  - Fix ref count due to regulator requested twice
>  - Rebase on v6.9-rc4
> 
> Changes in v9:
>  - Fix issue reported in 
> https://lore.kernel.org/oe-kbuild-all/202402201157.BKo97uWl-lkp@intel.com/
>  - Rebase on v6.8-rc2
> 
> Changes in v8:
>  - Fix missing call to input_report_slot_state()
>  - Fix issue reported in 
> https://lore.kernel.org/oe-kbuild-all/202402020623.8T1Ah513-lkp@intel.com/
> 
> Changes in v7:
>  - Remove startup time from dt-binding
>  - Fix usage table not correctly populated
> 
> Changes in v6:
>  - Fix missing unevaluatedProperties.in dt-binding
>  - Use __le16 to correctly deal with device endianness
>  - Use standart kernel types s/char/u8/
>  - Use regmap api as driver might support spi later
>  - Use get_unaligned_le16() for the sake of clarity
>  - Use devm_regulator_enable_optional()
> 
> Changes in v5:
>  - Fix wrong message constructed in axiom_i2c_read
>  - Delay required between i2c reads is >= 250us
>  - Do not split report reading in two phases as we'll
>    have to wait 500us
>  - Use lower-case in properties names
>  - Make regulators properties are required in dt-binding
>  - Fix bug report: 
> https://lore.kernel.org/lkml/202312051457.y3N1q3sZ-lkp@intel.com/
>  - Fix bug report: 
> https://lore.kernel.org/lkml/6f8e3b64-5b21-4a50-8680-063ef7a93bdb@suswa.mountain/
> 
> Changes in v4:
>  - Cleanup unused headers and macros
>  - Use standard kernel type
>  - Namespace structures and functions
>  - Use packed struct when possible to avoid bitfield operators
>  - Fix missing break when address is found in 
> axiom_populate_target_address()
>  - Split reads in two steps for the reports, first length then report
>    itself so we only read required bytes
>  - Get poll-interval from devicetree
>  - Add VDDI/VDDA regulators
>  - Add a startup delay of 110 ms required after VDDA/VDDI is applied
>  - Remove axiom_i2c_write() as it is no more used
> 
> Changes in v3:
>  - Remove irq-gpios property in dt-binding
>  - Use a generic node name
>  - Fix issues reported in 
> https://lore.kernel.org/oe-kbuild-all/202310100300.oAC2M62R-lkp@intel.com/
> 
> Changes in v2:
>  - Add device tree binding documentation
>  - Move core functions in axiom_i2c as we only care about i2c support 
> now
>  - Use static function when required
>  - Use syntax dev_err_probe()
>  - Add an hardware based reset
> 
> 
> Kamel Bouhara (3):
>   dt-bindings: vendor-prefixes: Add TouchNetix AS
>   dt-bindings: input: Add TouchNetix axiom touchscreen
>   Input: Add TouchNetix axiom i2c touchscreen driver
> 
>  .../input/touchscreen/touchnetix,ax54a.yaml   |  62 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   8 +
>  drivers/input/touchscreen/Kconfig             |  12 +
>  drivers/input/touchscreen/Makefile            |   1 +
>  drivers/input/touchscreen/touchnetix_axiom.c  | 657 ++++++++++++++++++
>  6 files changed, 742 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
>  create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c
> 
> --
> 2.25.1

-- 
--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

