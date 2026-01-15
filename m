Return-Path: <linux-input+bounces-17119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F10D25BAB
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C50030B4052
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC0A3B8D6F;
	Thu, 15 Jan 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SZsRk6Cv"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430333B52F1;
	Thu, 15 Jan 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493988; cv=none; b=ULoRD9T5dTkFvrj5GtHcCI3QctIXyKDYSnlojb6dQbgSKQBpUMaGvXEbyZVs9B1OLlT5h37u0DWgDNi9J4YTAkpzDji0RIgkK+72EtAXiarGMfAYOTwrWgudLIDGkxBEDXSQumI7tVi/UuwIQFVMCF2T3xuGbNbj52FjyqZfHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493988; c=relaxed/simple;
	bh=c6dm+hqoqVJcnCFez8XCiHXaPVwzFXqtSLCRc0ni+Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riZi066GQ4MgwW+OqC/C6v38+a+FnuY05o1gTNOeSCFUMoRiBx4zGh2X4En0R2cp2IOfVb01zVSH5LaDqEvBuKovS7C6XlGBAKs3MaFqiRpmgg8V5oJzekfiQTGM6kdrbq7dJB1jinslTPGGbuq3hqShmt1uGm8DYk/vSZpXyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SZsRk6Cv; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dsSqf5Pj9z9tPW;
	Thu, 15 Jan 2026 17:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbVlRE1xB5UBYN6aIeEhkQSbm7mKLTQQV901VO8zfUI=;
	b=SZsRk6CvxVlJHR2/e0gTmUX6OdCSkIxUNUzDK7LZOjhivebUFCAFzR2AYUeQmv3zU+fTT+
	kLJh+GAmWI1acaS8d+tHu3ZRrbAEs0j46DME2dsl932i2bFEIvmmdd+vEXdA4ldhrl0F7w
	RlctQLWvf3lZ12DZSXYc2NEtR2RHeFAf1kN/0MndoHaPRMdtGNxdGVi04fHenUur0tF3ms
	WJ8ehlnDoxQmjPrdvMelANM6+goKsUs5n2dCyg8Rsb86C8DcqkjYeiy19ewjiAGGfisO2h
	05dR2XyUvUSyxr4ny2Gvjb3QaV4JNQuYqgomt1esvt4nh8fzLkDgMfRgnA/vVw==
Message-ID: <94402ad7-a28b-44db-b1b6-181c2d129cef@mailbox.org>
Date: Thu, 15 Jan 2026 17:19:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] Input: ili210x - add support for polling mode
To: Frank Li <Frank.li@nxp.com>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
 <20260115023530.656645-2-marek.vasut+renesas@mailbox.org>
 <aWkHzd8pKJh91Dkr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aWkHzd8pKJh91Dkr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 50f58aa864ed62790ed
X-MBO-RS-META: gihpjm4c1j65yt88pbaa76zxogzngshf

On 1/15/26 4:29 PM, Frank Li wrote:
> On Thu, Jan 15, 2026 at 03:34:59AM +0100, Marek Vasut wrote:
>> There are designs incorporating Ilitek ILI2xxx touch controller that
>> do not connect interrupt pin, for example Waveshare 13.3" DSI display.
>> To support such systems use polling mode for the input device when I2C
>> client does not have interrupt assigned to it.
>>
>> Factor out ili210x_firmware_update_noirq() to allow conditional scoped
>> guard around this code. The scoped guard has to be applied only in case
>> the IRQ line is connected, and not applied otherwise.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Frank Li <Frank.Li@nxp.com>
>> Cc: Job Noorman <job@noorman.info>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-input@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Test client->irq > 0 for IRQ presence
>> ---
>>   drivers/input/touchscreen/ili210x.c | 84 ++++++++++++++++++++---------
>>   1 file changed, 60 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
>> index fa38d70aded7b..0574f2e86580f 100644
>> --- a/drivers/input/touchscreen/ili210x.c
>> +++ b/drivers/input/touchscreen/ili210x.c
>> @@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
>>   	return contact;
>>   }
>>
> 
> ...
>>
>> -	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
>> -					  IRQF_ONESHOT, client->name, priv);
>> -	if (error) {
>> -		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
>> -			error);
>> -		return error;
>> +	input_set_drvdata(input, priv);
>> +
>> +	if (client->irq > 0) {
>> +		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
>> +						  IRQF_ONESHOT, client->name, priv);
>> +		if (error) {
>> +			dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
>> +				error);
>> +			return error;
> 
> return dev_err_probe()
Fixed mostly in new patch part of V3 , thanks.

