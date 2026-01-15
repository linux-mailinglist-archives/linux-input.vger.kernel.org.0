Return-Path: <linux-input+bounces-17106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79806D22475
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 04:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C15E300DCBE
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 03:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8272550D4;
	Thu, 15 Jan 2026 03:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nM93/4Yf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hv4nyl8X"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2043EEC3;
	Thu, 15 Jan 2026 03:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447164; cv=none; b=Ld0mnS9d6b8MSrhvjCFBJaL7aDYeLVZARVmYQFafPpdvIfsazdkPh0P2FKzsDySCXh7LvKm12Izw5R0AT/1Mi7Vcqnjfq8gGtZUQOsCYtwfGgGJZmGqmOeK5DCGpFwFsFe7XmzlDq6BtIG5FXFcIPlsVTqwuW4mjLXgVC0FkkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447164; c=relaxed/simple;
	bh=a/s8RyFTmU26OHM5nZW9ZRFeSgDWYTDfKT5daB7jEEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prdA0vQi/NZesw5Hm70nLWfM6MB+cNCWe7/kBDyaUv6k6OCEWdgDPs23ebp15Q25TbesG/jCO0XgeAzWD+opAd0HvKyKfQGjqNgZcjK66AxGgXsiDauuGT/zts385kcltpdIjLS0IlMQKcppUFAgtXOATqN7btCO0TvFBmSCPIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nM93/4Yf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hv4nyl8X; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ds7WF0q2yz9tWv;
	Thu, 15 Jan 2026 04:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768447161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYCn//ajJFESdUktzLtjLLzzxgu2l08pIDEBu9Hx8UE=;
	b=nM93/4YfzVH2s/CrCh47pIgBkEpHbhxGfP1VlZ/sBiHcIpiFEhGJ7oCEsEtfpwEyr0Eola
	0rLSP5GEah3gvzS7MxAhtwayjlPSzFMrP/Ta2km6iVcgHiGtSjb5QeCKlx8t/gNtGiMvjH
	ExZn2uJWu9T7EwzDcDN5POhxPCcH9GFrn9Qu4qBkI039zxAiUZ3ZM2U7KJTn2ioA93sOsr
	Lcez8DpK+4hshlk5WRzdEwsW0bC2ctr3xEFrFih03gkwCTEadfuSt+5VLcprOUF4NJa2xa
	PvKY3ub5f6IkZofwIcyxDdPR5NB3jUQtGELONv58KBQovwaxhdpGMSEXJM0NwA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hv4nyl8X;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <68333066-2065-422d-9582-11a4bbb41e59@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768447159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYCn//ajJFESdUktzLtjLLzzxgu2l08pIDEBu9Hx8UE=;
	b=hv4nyl8X+C5L0yfvBTRJHnkY2Wib3kwRJdVuWWmiaSkh1ZHTtvzODKKkzqd6QEuSTR0Xp9
	MRxTHmFIPSvRMFqULlqmkzxSy2kR1yXhp1ER+y6YjQERGFRisJW6ENzPxITCsmwgMQ9NtO
	JNi0qyZ/gu2SPk6V4JQ+s/5XnGgV41o62DxVG7iqOKOhfmc7vpoGD4EnHhRVJwc4VsAeTo
	uXCT3jmip2uslp1VWvF9KHkmUW0aJp2aNHZOj5Bkv9jFtu1BhwyhmmGsjhoLaGBsuu22mN
	eLEBA1QyOGeh4RhKP6p+cnHf2+TqU6nytuKp1QWQ7asxSQ499ZOW0FUnkmx43g==
Date: Thu, 15 Jan 2026 03:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
To: Frank Li <Frank.li@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <aWZ0OQpQw814smri@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aWZ0OQpQw814smri@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4fwnje3igz56gcg4bmf5i8bjq7ot69do
X-MBO-RS-ID: 94cccf855b537ba6365
X-Rspamd-Queue-Id: 4ds7WF0q2yz9tWv

On 1/13/26 5:35 PM, Frank Li wrote:

Hello Frank,

>> +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
>> @@ -57,13 +57,25 @@ properties:
>>
>>     wakeup-source: true
>>
>> -allOf:
>> -  - $ref: touchscreen.yaml
>> -
>>   required:
>>     - compatible
>>     - reg
>> -  - interrupts
>> +
>> +allOf:
>> +  - $ref: touchscreen.yaml
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - ilitek,ili210x
>> +                - ilitek,ili2117
>> +                - ilitek,ili2120
>> +                - ilitek,ili251x
>> +    then:
>> +      required:
>> +        - interrupts
> 
> Generally, if there are special requirements, move these to dedicated
> yaml file to avoid complex if-else in trivial-touch.yaml.
Done in V2, thanks.

