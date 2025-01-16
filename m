Return-Path: <linux-input+bounces-9284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76336A141C1
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 19:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B443AA2E0
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 18:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65761DED44;
	Thu, 16 Jan 2025 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Y6PQ3Fvn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713054414;
	Thu, 16 Jan 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052735; cv=none; b=fTNJfugghxqRlLiA8WS46XvlxFp8FTWf38na/1vTxLnT0qNDrFTSJ5E6PdAvD8wx1Er6QIld/fXVldYfJoAP8xjVbY0W9Lcka54CHeiT+52ZPKVkW+oPiYVYxS+RJOUuBSbAH4KwuX7lKRfvWQX5nEuhH+JKsh2JsLNvnj3u9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052735; c=relaxed/simple;
	bh=u7B7uOeANP0AIyRzsKpbRgdcXBQtJQnOnczOyJpdeCs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SyOwJfWOEdVqq7fPY2yr0IVWMpdCTEJExvO6yvOZwzwJX4Vo2JJpR04QoRfgiCT8Ygkp0wkQI0EMLk4cAYAL6S2GGSOe6hio8DqOBkVej0uu0ABxa3CTvaKQMujzX4QgNYE1DMslmSiX7nmmIwY/qq3TYMqmyWP/Bkwp8MhdTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Y6PQ3Fvn; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id YUcMt4fhDca4eYUcPt1pRr; Thu, 16 Jan 2025 19:29:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737052172;
	bh=j9oYM2nhbNGXRPuJiBbUWz5fz1jwLD1jTEG4VwkIdxQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=Y6PQ3FvnW+AjZ1qS4Dw87U3Xkm1gObPNfFPCDBKm1bSd/CfbHSPO24P+07jzIFknI
	 CSZ9Qs5PO8hSkkjJCE1d1UBWShEeICLDZ6Wbe0Cv/nO/Gjlt9NyykteQrWWvUmg+NW
	 YTV2G1VJVBugXY7+TMrxtJUuhUZ/+1xtfm0SSzLufu9zO7Ma40h77kI69HKUAR78ma
	 bPKytJYiQuquFZTR4IDGYG7+H676kQ2I57lSqg1d7bytdKSN5ml8v+hXnenVwUVUM+
	 k20PLelLwwqXZQXB3iU6OCM3rEzU35dQ3lKPQAw/yTqQkKafhy5ksBzrFe/3ars1Ub
	 /qa//Z7hiwVGg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 16 Jan 2025 19:29:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
Date: Thu, 16 Jan 2025 19:29:22 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: devnull+fnkl.kernel.gmail.com@kernel.org
Cc: alyssa@rosenzweig.io, asahi@lists.linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 fnkl.kernel@gmail.com, j@jannau.net, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev,
 robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> +static int apple_z2_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev = &spi->dev;
>> +    struct apple_z2 *z2;
>> +    int error;
>> +
>> +    z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
>> +    if (!z2)
>> +        return -ENOMEM;
>> +
>> +    z2->tx_buf = devm_kzalloc(dev, sizeof(struct 
>> apple_z2_read_interrupt_cmd), GFP_KERNEL);
>> +    z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> 
> This will allocate 8192 bytes because of the way the allocator works.
> It needs around 40 bytes for the devm stuff + 4096 requested. So 
> rounding rules will allocate 8192 bytes.
> 
> So either you could allocate "for free" much more space, or you could 
> allocate (and document...)
>      z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres), 
> GFP_KERNEL);
> 
> or have an explicit devm_add_action_or_reset() that would require less 
> memory, but would add some LoC.
> 

or leave it as-is, of course ;-)

> 
> See https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/ 
> devres.c#L97
> 



