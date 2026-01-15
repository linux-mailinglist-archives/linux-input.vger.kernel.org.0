Return-Path: <linux-input+bounces-17107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D5D22484
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 04:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A9313067F49
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 03:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713202550D4;
	Thu, 15 Jan 2026 03:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="om0hxgjw"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97632749DF;
	Thu, 15 Jan 2026 03:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447168; cv=none; b=JGSAyWX0nQp7rF1UF1dXXyokHxnuc+yUyKJf7JE3hLkq/sdrvfkrRKfDJ/HxjNQ5JPhPhS+/dE574Kleb3nOlArvTOId7sXBSamXm+H0d+2TsURizhL2uZEVKA/TNM1Mi/i4Tt7nbvxrmEcYhoyDd1wesh1UQBIl+dIlejA9YRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447168; c=relaxed/simple;
	bh=2w/5744YaaL1ZUrWHm7tntX/sJVxtLdiF3I3w1EQA+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4p4ShJk41DppLLotKBmW4djckb1I+TPY6qifKpR441oXuDFdm29Peukdb2+Q9ENt1eDh1jOOF8e4+8hv+eA2es9zXOuLUEXDBGEjk8C/0geP290gyVaG+QhBYxH094lMvE3eBYYoIEWmfo8rATMrALZvDm89xYRhG8328FUHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=om0hxgjw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ds7WF0BBXz9t00;
	Thu, 15 Jan 2026 04:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768447161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z34tEk3YZuvzKYmi0keZWcGpKoAkaFFV5vB3a+hk6hk=;
	b=om0hxgjwAXe692H1WOLO939wX7TiDBDv3c+TGRTT86uG72Qt0IeKtBsUTzl+C2J/+REi1z
	WgEMGamBrV8kF+ftBhgJxibWF1pmQ3vWdM6AqSHyusAJxmGTOLmvUqLou6JWobSrOWpYTq
	FKDmyj7W7fRmH7jZjuAJ9ycWECLVB67jNfgWXIHDm+HBNuX21dg9yBELBhcC9Nure7T7uJ
	XZxDgW8I/UszjjffT86Ij1AzOfNosmp78D7LjHbunmwga0g9exJM2wvv8LmLZPEse8d8GE
	2tGz15ItI/KIj9zhm4sosaZVIOHi2A+1RmZaBppES+83Etayk3unHs4/cm5hZA==
Message-ID: <de8a4c1f-8c60-4e3c-bba1-d9808468c8b1@mailbox.org>
Date: Thu, 15 Jan 2026 03:10:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Input: ili210x - add support for polling mode
To: Frank Li <Frank.li@nxp.com>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <20260112234534.225954-2-marek.vasut+renesas@mailbox.org>
 <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21645f2a8f1881500ac
X-MBO-RS-META: 71fek8zu7aruzgquc5whqxfxuwy4w36h

On 1/13/26 5:41 PM, Frank Li wrote:

[...]

>> @@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>>   		return error;
>>   	}
>>
>> -	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
>> -					  IRQF_ONESHOT, client->name, priv);
>> -	if (error) {
>> -		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
>> -			error);
>> -		return error;
>> +	input_set_drvdata(input, priv);
>> +
>> +	if (client->irq) {
> 
> 0 is validated irq number
> 
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L284
> 
> if (irq < 0)
> 
> But it is strange that touch don't connect irq line althougth it works,
> touch generally is wakeup source of system.
Raspi is like that, they poll the touch controllers. It is unfortunate.

