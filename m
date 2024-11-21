Return-Path: <linux-input+bounces-8189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030919D4A55
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 11:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42C2BB213F9
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332C01BE84B;
	Thu, 21 Nov 2024 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDOgK7zu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C45FEED
	for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183252; cv=none; b=lNfKxfeTHx21Hq9hZwzhWm0YJpMPdboLNCKmCbM+DOC1nOyU97nQ0qyMPR5UsD2kNJa8+ENhYDYG4izCy+r56nrO+6YC2cz/fVSiPL0LuS327oOZJZUqlKrCUmhFDiRu8r6PwAUiAQwpdFTDL7T2hBuJ+QnjakUtc7jWKESti70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183252; c=relaxed/simple;
	bh=zmq/RKWM99HdwXgqchWwwJMhCjTilAE9DZvU3qOwtFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn74R/OlJY4ZGU5z3RooaYWLPt4b33/kaLZHkVKR5EVydt6lCVRl1iHfHRxyUrNV/miuR+AtI5+jBVR0QHdv5rRZ/pKfmaWjLFpcNp+IB3kC8f6axUxzr2D5r90Nq2vtVDgzODb75hNv277NPS9GE7FUiIuT5nt4vcz9rd65lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDOgK7zu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3807e72c468so107670f8f.3
        for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732183249; x=1732788049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ohOQNJmsf3U6TDKszzvPMzrw+ckEcCqCGtLbTdkd4VI=;
        b=GDOgK7zuc9QLEdt1yKdx6B8SJkitVZzVhsdWd8R6kIh9CnJh+KvUAlVM0MosvLu6Hi
         F7eqamxwr6cDy2ear/IaFxXPlRK20FJ8/nTM363ef9uUx0YMk8QcLzix3DmXo7NGzfbf
         A/AJDaoyXhGsC0UXythPeXVcVTaiymtFh5AG+B0dlla6ZlnyM/KipI/i5n/6u4Ds3Os8
         r5MCwbA9JGAiOgbQ/yMfnw1fLh6XCNWI8XL2gRh4WJp1qNGJR5eRXIE2eavfzyCrcbwb
         z8c4ibnqy6c1yG5TiO8Mx3RyLtktFsCB8GMhg6VMh+C6cyw7+l3WyuLbIKrpzbKB5s9U
         SbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183249; x=1732788049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohOQNJmsf3U6TDKszzvPMzrw+ckEcCqCGtLbTdkd4VI=;
        b=DCstUiPHiFs9wam4FSbRMt5RaCpGqjFZ3DelLzye5ALTbQy7Ik0UEsW4kYhnMs+B6r
         XCI3ePulxNowhiiCsICqPc6Dt1dE6zkAPkyQ96qhPdqV1EsUklezPkQutj2NAMgCJZdV
         YKUaOuCwV12wc5fHVxiDfeTb0PhLD7sMdPP9oaPMz3xsHawIymOkKmZkPWrOkpMDJsUr
         iA3mv95sJqy4o4stKWghT9X8PpxFU8PcG7ZFznP2hyG24o3wlqBZnbh1UvgtaK4H1d5r
         ElwHYdC+8urhLG32law3e5pSKeWWWe6uwB8zpGASEqF30AbTFZaQGtauOwx3NvpyGCd8
         Twlw==
X-Forwarded-Encrypted: i=1; AJvYcCXXg48QkQtWVsbaraFBtwdgNaSQkRfPte+Zo4W7o21Ee1snVa6/6H5mtvdy70BkppzMiJhcgXjSPsqgEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvr62ki7sg4Lx+o7ykoG8mhB/Evdaidr1+UleTIL9eJB6BdAhs
	JWPJJBhiSqVe+XXAnKzdwig13IA7sOe+dXmWc2UjByZCai37y+v9uUP7Zy4wKo0=
X-Gm-Gg: ASbGncum7nX/b98mLS2Rc893J9q1Wk+hvQzgdWsUCwXeeGn1UPn+XjdfjWoUUA46Jlo
	DsNDSwG8eUqXEbr2HVSfT2XHFuzTfJWggrvbFpfvHy33UE5o+bpQYAJzSCX2Hv2LD3Z49Nr51/D
	IIUGE830rkWPp+C0Rca7gFO9IB5NDHINMsDDu8WIXjWWCfdX0yWUJEh+D/MqPuRD5WfrtKssTd1
	wz1tveyajLfh14y6ZDcpc9C58XGxHhD+A8aRqDHKUtOqbJB8DR5DxTvW4LQUwgydDbJjw==
X-Google-Smtp-Source: AGHT+IHIFM5RBsRG92ctCgN9LYsLIXa/i1YN768XTyEt+22HhO06rCb9tOnTK+/qVkjSO7/LnVXQDQ==
X-Received: by 2002:a05:6000:1f8b:b0:37e:d940:a9fe with SMTP id ffacd0b85a97d-38254b2feb1mr1914976f8f.13.1732183248773;
        Thu, 21 Nov 2024 02:00:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4616843sm48827745e9.20.2024.11.21.02.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 02:00:47 -0800 (PST)
Message-ID: <12ee900f-ed9d-4339-ba96-87c22c5ecbcf@linaro.org>
Date: Thu, 21 Nov 2024 11:00:45 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: vendor-prefixes: Add TouchNetix AS
To: Marco Felsch <m.felsch@pengutronix.de>,
 Kamel BOUHARA <kamel.bouhara@bootlin.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>,
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-3-6124925b9718@pengutronix.de>
 <b5hjephfcvdu2jjchodaj5u4yltvatdgmse7xvwkhaepn5dinv@sfl4utyuz34g>
 <20241120081527.s6pfo5soa2tqvra4@pengutronix.de>
 <94c90aef-9807-473d-b71d-168282d87570@linaro.org>
 <3c072ad8e4a15cd23a195855f8e68bfa@bootlin.com>
 <20241121084549.4bzebpuusjreqiik@pengutronix.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241121084549.4bzebpuusjreqiik@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 09:45, Marco Felsch wrote:
> On 24-11-21, Kamel BOUHARA wrote:
>> Le 2024-11-21 08:47, Krzysztof Kozlowski a écrit :
>>> On 20/11/2024 09:15, Marco Felsch wrote:
>>>> On 24-11-20, Krzysztof Kozlowski wrote:
>>>>> On Tue, Nov 19, 2024 at 11:33:52PM +0100, Marco Felsch wrote:
>>>>>> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>>>>>
>>>>>> Add vendor prefix for TouchNetix AS
>>>>>> (https://www.touchnetix.com/products/).
>>>>>>
>>>>>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>> I think this did not happen (only Ack).
>>>>
>>>> Huh.. I used b4 to retrieve the latest Bootlin version. According
>>>> [1] it
>>>> was already present :/ I can drop it if you want.
>>>>
>>>> [1] https://lore.kernel.org/all/20240703142520.207066-3-kamel.bouhara@bootlin.com/
>>>>
>>> Hm? This points to entirely different patch!
>>>
>>
>> Hello Marco,
>>
>> I think the last review from Krzystof is on v7 [1] ?
>>
>> [1]: https://lore.kernel.org/linux-kernel/821ce1d4-bc15-4764-bbe0-315c57e8536e@linaro.org/
> 
> Yeah Krzysztof is right, I pointed to the wrong patch, but still I
> didn't added the reviewed-by tag but b4 did. I ran it again and here it
> is:


I know, it happens sometimes. I also experienced it.

> 
> $ b4 am https://lore.kernel.org/all/20240703142520.207066-3-kamel.bouhara@bootlin.com/
> Grabbing thread from lore.kernel.org/all/20240703142520.207066-3-kamel.bouhara@bootlin.com/t.mbox.gz
> Analyzing 9 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 137 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v16 1/3] dt-bindings: vendor-prefixes: Add TouchNetix AS
>     + Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (✗ DKIM/linaro.org)
>   ✓ [PATCH v16 2/3] dt-bindings: input: Add TouchNetix axiom touchscreen
>   ✓ [PATCH v16 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
>   ---
>   ✓ Signed: DKIM/bootlin.com
> ---
> Total patches: 3
> 
> Krzysztof I'm sorry, shall I drop it from the next version?

Yeah, please drop from this patch and keep only Ack here.

Best regards,
Krzysztof

