Return-Path: <linux-input+bounces-5004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9292F7A6
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6F6281A52
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D451442F7;
	Fri, 12 Jul 2024 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QCjh1Hmy"
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB0D528;
	Fri, 12 Jul 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775515; cv=none; b=X2b//2PUONKs4C8hwwa9p41JXvbBNt1R82bGefymF0sj2lwULthACOF+s2aMoD4Ab90yzBZtWRC7eVuhnWXMbvK+3W/6Exuyr8eeru519cF3eZDfMaIJGxyIbyhYDQsocsb2BBCK5+N+2NXtybFzpmOfgqA9BPwRCkZWxO3AIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775515; c=relaxed/simple;
	bh=TmkFN1WVJs9VWr+wHupQQV4ONKTklAVdqJpU9x2tESY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gauwQ15h9rmWpLG6NZmBi3AM9xiJAqa4i+NEnlj7K0O0l9PpCOwa31GocjSWgOjHcIfk5sig1kcXaN3XKzk0h0qYx/bcIMhG9iNh0mJFfcIdG+/0FChc70/DiwYFzXfvIuEylv9sGhtyTaD132xFFGKp5vmTn+2czO9y54cdnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QCjh1Hmy; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4C5F40003;
	Fri, 12 Jul 2024 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720775505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTJ/QMYGYqibGbwy+omuvaF8DMn1UrhL+zcUl7y5twQ=;
	b=QCjh1Hmy4MtI6Fd6l/XS3sV6EmobdcfqQLEpyuij6BNa0wgk/nk9X6psQ/c0LmPfbPBNtc
	N57lhgqCCRFRzLMwD9I++p/BvWHYBv7enrFgWlt8e6PCRuzJdyTi2ii4iiZCagvWHHkCBa
	fZdraX9poaDOg3UvkT3iMc3NpjWDBtFcSOryADvpJJOKTpPI6/oqdSBY7dhlRQ4JWBJKA+
	Nuvj+BBNJdCsG37mHEuE3dyQI47d7L1JHhygDqf//WNH/uKomenjIKuDvej4qUi925ZF+T
	2D7uADvoRIpSsvMC18K0CRioXWOpQiz8uoS/UpE4x2VH8h5dvyrI7GfTeso1Ag==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 12 Jul 2024 11:11:44 +0200
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, catalin.popescu@leica-geosystems.com,
 mark.satterthwaite@touchnetix.com, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v16 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
In-Reply-To: <a38609ed1d2a181287f4758e3272c553@bootlin.com>
References: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
 <20240703142520.207066-4-kamel.bouhara@bootlin.com>
 <ZorqmaYfsGFd4HN0@nixie71> <a38609ed1d2a181287f4758e3272c553@bootlin.com>
Message-ID: <6a7bfad6adee31a10b93f465d35ee8ae@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: kamel.bouhara@bootlin.com

[...]

>>> +/*
>>> + * axiom devices are typically configured to report touches at a 
>>> rate
>>> + * of 100Hz (10ms) for systems that require polling for reports.
>>> + * When reports are polled, it will be expected to occasionally
>>> + * observe the overflow bit being set in the reports.
>>> + * This indicates that reports are not being read fast enough.
>> 
>> This comment is strange; if reports are not read quickly enough at
>> the default rate, why not set the default rate at the slowest for
>> which the overflow bit is not set?
>> 
> 
> The rate has been set to the give a good user experience regardless of
> this overflow bit that isn't even processed here.
> 

and therefore I might remove the part refering to this overflow bit in 
the comment.

Regards,
Kamel

