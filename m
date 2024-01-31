Return-Path: <linux-input+bounces-1561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB38437E1
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 08:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32AA828BF78
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 07:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E81851013;
	Wed, 31 Jan 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGDVm6PF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835A50A7C
	for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686128; cv=none; b=r9uzB05d3rwcmJcYP1bChL/CK88O30qpc+9mVSTCCFM2e/qANxcLB/5i1M80zBJESk5uQD4bN9vKF3kCBmzxbU1c8Tspk4NH47tzv36kpEuyH4kQRuvpuMbUxD4G+wA/ELatxIKUms1D0wc/1UDKk4LrC0XabGay22jthw7g8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686128; c=relaxed/simple;
	bh=OVrO1Woh8dXStO+EunCK7y5JVz5UAq3ht+SK6B+94xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmv1f1ZC+dTmdvJNm5aJauRWn57WCYWZNMpl9Ms+1rI3wxN4OGp/AWJNG4T6ycxcs4xqfQMz6qfzrzqT89B5I+5c/qhYdAcH8JbnYIB2iCpnApREbds+ZNJtJAWKjg4hZewSU8m0IrwvkgUWX0G9mv8igyZ+afocIDsgCf1pr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGDVm6PF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3604697d63so320027966b.3
        for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 23:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706686125; x=1707290925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QS8V3hSMS+MxbaUUJ4MPbzWyDZlb4P29Em0IV9CEYzM=;
        b=iGDVm6PFCrOZ9dzCsDcQNk1ipt9E+jhXmJQrTog3RRKhIw3zp5omIvyUCUbVOmUceD
         wculpcVI3Y37GJhtjJmf99KR/rFX3FwHIsuflscXF4bXmLksfCPzNNi2h0VqInMb3iWg
         1NvzfwzeUt6oBlqM+y5oReShbGfu/fOAtlGmFAWo94D/1qsuFEcJ2acKeGJx+LYQgTTG
         RXzWYtrS6PmrjRN08mWWngcmgMlzOvZZUW+G9xrE/3IwkoPl47ZJ/c1IF5snGogfcxfT
         1idVygiMLQ1gQ0iPYawG120KuKWm95DaxkctWLtiGjEPYW1FifT89+DsNd6gmC8dt2Zg
         u8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686125; x=1707290925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QS8V3hSMS+MxbaUUJ4MPbzWyDZlb4P29Em0IV9CEYzM=;
        b=xO1tNZyqUynTRhJEJm3IlHBfpeIrkrMdV4P4eo4CpSraZVuiinf9fpRB78lmqsziG7
         Zgfis8ipgca/5y9UgMxdyIv2p+uFsqhGln5AdGRlt5cmtvmyhFSyXGeZir/njZ/Q+0m9
         88OByBBqSjRJwVxAbkAayrv1HQNstUtizJ8cZuXWwc/GHENQOY3cq4o3Dei0NpY+y4OT
         QY2zVAcq/lvd4AoM4zn/0MR3gDQ2NaT9O+comR2YMVWlA2u4OqGMtsC3vijTKBRW5iGl
         XFVfstGYWwtuUn9A573HQjO9hVPR2JxtV6PiC07N9K9jWcirfrntN4yH8G4fgGjKtwVG
         DflA==
X-Gm-Message-State: AOJu0Yykb5Ue0ffIbw+VjievGW5u1Zyq9Hf2hU1pGPSbYHUzfvG33qPY
	fvyL/eD43xW08V64WN6ll9s+HZsnpBNuE1g0aXRZ7h0TOS+SZElwYeAj2cV6maU=
X-Google-Smtp-Source: AGHT+IEQ7m5DIoZ0qyp1QD8vZYIK5WOfiuMOS03Fq0QGx37X6URiFWY2FmKxaDsCpAb/9WwARyhINQ==
X-Received: by 2002:a17:906:e212:b0:a35:9513:4077 with SMTP id gf18-20020a170906e21200b00a3595134077mr498357ejb.13.1706686124757;
        Tue, 30 Jan 2024 23:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUWyRF+vZSTNrXBpR11+lglXzi6vnuvE2tQBhc25RkcgMCR+qbRbWaklbFM8Y/FFnQF6YxjH5805UhRoOUQAyH9oGz7zg6zz9WwFJI9lnO9sEOGllu5gazggSDvKDqjJQp5Z2lV/th88wNfeFtz23mxIanQxI6byzxOwTVKaLzH2Sh8tdEm8IWYr5Vb3PMGzrfb/DCZN1dFieJ9vBpKc5n4cMbQh1h37w88R5YuX+Mn4Rv68kZ8Az94p5cmVnXiI5rebnhj4eHZPWlzHX8wPrtEYyyrTtmnEct37Up5Afoo7LlGA5mW1f3w2x92sy6YCplkrSi2UkPGJan8H3EY8N1xRXhWwjTkCn+4hJn5pwq6TOvjNo7AUuaMQ47y/Gjj2m9Pouy0uwb/imtCTmSeMp0n+GYkNK+59F95wqWxo6R1WTG/ZPIyLwtFIFvYjiVKReonck8Fvzr8yuYClcwg6kCS/gquzDGGHR2BFwKJ/7tqAIWKsqH+o8i3hX4Rxr9XMoy0jBBYDhaRmtYoIKkEtuVnYeI8Xdwzk2ROnuUiQHngO1bDMnXpu+iBG6K7eTGCIPZg7pPBBuhGx5T4NQmi/e1rC7RU9hw0
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a3682ad6354sm143169ejc.41.2024.01.30.23.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:28:44 -0800 (PST)
Message-ID: <f07d7557-c190-4154-8fc7-6a3850b1d162@linaro.org>
Date: Wed, 31 Jan 2024 08:28:43 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 Jeff LaBundy <jeff@labundy.com>, catalin.popescu@leica-geosystems.com,
 mark.satterthwaite@touchnetix.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 bsp-development.geo@leica-geosystems.com
References: <20240125165823.996910-1-kamel.bouhara@bootlin.com>
 <20240125165823.996910-3-kamel.bouhara@bootlin.com>
 <2c8961ff-9fcc-402c-b048-744ae9473164@linaro.org>
 <20240130222844.GA2527859-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130222844.GA2527859-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 23:28, Rob Herring wrote:
> On Fri, Jan 26, 2024 at 12:46:16PM +0100, Krzysztof Kozlowski wrote:
>> On 25/01/2024 17:58, Kamel Bouhara wrote:
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +
>>> +  vdda-supply:
>>> +    description: Analog power supply regulator on VDDA pin
>>> +
>>> +  vddi-supply:
>>> +    description: I/O power supply regulator on VDDI pin
>>> +
>>> +  startup-time-ms:
>>> +    description: delay after power supply regulator is applied in ms
>>
>> That's a regulator property - ramp up time.
> 
> I'm sure there's an existing property name that could be used.
> 
> But why is it needed? Is it variable per board with the same device? If 
> not, it should be implied by the compatible.

I meant, that regulators have such property. Unless this is coming from
the device needs, not from the regulator?

Best regards,
Krzysztof


