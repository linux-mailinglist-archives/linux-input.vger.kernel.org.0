Return-Path: <linux-input+bounces-8184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB39D487E
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 09:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB799282DD7
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53B21C9ED4;
	Thu, 21 Nov 2024 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="exVU7mcO"
X-Original-To: linux-input@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546918660C;
	Thu, 21 Nov 2024 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176553; cv=none; b=k+WJ7AiYJLeOBaZuxNAht/yX+NG/WhjcIaaT4UUce2MZ2VB3dfDkYSUqLQrkwdhWbavAVuoJPPS+MlaN0gjyVEz5MgqpMju/Y4VeenuHjD1p7ijq0Buuh1mNnBOo9IJ0AhSUAA/QPvW55GrasqB8VH3doIjYjep7HRKyj5QeMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176553; c=relaxed/simple;
	bh=m7ymF/wq7yALwJlsbMdWqYjO+jdF0yOeIDggNPg4Us0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qhh6Rko4jXRwpfCTC+hhHV+IPku1SBKSt2rBbfVJqX48yaPEewfXYKx1r1zHVQVquNQE3pEI3pkvjVuWLKUWn15z06NzMLUEUQCvD/KMNep02liQi+TK7iiNlqmwe0sVFTiYjz4J6y3VQL9u82Ak+s16P4n7G/u2IzGJu0UgaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=exVU7mcO; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095BC240006;
	Thu, 21 Nov 2024 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732176547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrlEWnxa7/AmSPSUP88q9JGw+i2DGecmkyLxjqXJgPo=;
	b=exVU7mcODAx/J1n/42Y7EEDd8XbmEXzNw9gqjoqbwqWSsN9iCtNscWUo9VD4Nb56HWNSND
	W/otEwT9MwxuRJfGlV2/CaLY8iWctUOnZfpGtKRLDW/A1mutuvhi+ncBhFPG7DeZiZWJ20
	xEUMiAwg6HEN3Onzo6RCl0KSz0JWLwiTzW9Ck9NO5D83RdY6QPBfklwUKpKrRBOiJGHsnJ
	aGQXvCUsSGDknOUhKduuKsFHRl2nb/LEX5ZlF9vSHPXFerV++jKWtFRUNFAFmBpgWyNODv
	/tLYei2oZRuXz+5fKbhMst6xQ0CkxSeRRDnVpkAcJaMc5wu+PUxU97YJDK+t+A==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 09:09:06 +0100
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marco
 Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, Danilo
 Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: vendor-prefixes: Add TouchNetix AS
In-Reply-To: <94c90aef-9807-473d-b71d-168282d87570@linaro.org>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-3-6124925b9718@pengutronix.de>
 <b5hjephfcvdu2jjchodaj5u4yltvatdgmse7xvwkhaepn5dinv@sfl4utyuz34g>
 <20241120081527.s6pfo5soa2tqvra4@pengutronix.de>
 <94c90aef-9807-473d-b71d-168282d87570@linaro.org>
Message-ID: <3c072ad8e4a15cd23a195855f8e68bfa@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-11-21 08:47, Krzysztof Kozlowski a écrit :
> On 20/11/2024 09:15, Marco Felsch wrote:
>> On 24-11-20, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 19, 2024 at 11:33:52PM +0100, Marco Felsch wrote:
>>>> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>>> 
>>>> Add vendor prefix for TouchNetix AS 
>>>> (https://www.touchnetix.com/products/).
>>>> 
>>>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> 
>>> I think this did not happen (only Ack).
>> 
>> Huh.. I used b4 to retrieve the latest Bootlin version. According [1] 
>> it
>> was already present :/ I can drop it if you want.
>> 
>> [1] 
>> https://lore.kernel.org/all/20240703142520.207066-3-kamel.bouhara@bootlin.com/
>> 
> Hm? This points to entirely different patch!
> 

Hello Marco,

I think the last review from Krzystof is on v7 [1] ?

[1]: 
https://lore.kernel.org/linux-kernel/821ce1d4-bc15-4764-bbe0-315c57e8536e@linaro.org/

Regards,
--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

