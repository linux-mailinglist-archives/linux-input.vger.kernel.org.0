Return-Path: <linux-input+bounces-14571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD7B4FFB4
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 16:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63DF188874C
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F48343217;
	Tue,  9 Sep 2025 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="G+TRLIk/"
X-Original-To: linux-input@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828D322DBA;
	Tue,  9 Sep 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757428890; cv=none; b=at5PBucH/nvCAsqJgS6P6R3CkOufX+RPOU81cW+cxH0IoUoHytBTy8a2tLC0RFXuws0u+vzgr2pvcg0Ch67zxm1pPRJp3v0DUxxARG6MxLejEMt7mk5bcmtqKRBXnF+ELP7AzN3KIxu0aqgJwAvtTioXjdRfBtOmWCH6F/ABY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757428890; c=relaxed/simple;
	bh=d7Pz/yjrt/tNNpQPMW+9CxclgrWORNrhLXdA1kRna+A=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HI7dYd76AMorPcFJU2XuFJUuYDCOXyb7eMWff+uXsuCa0IiEpBsmQz9BVM+4kykzPK8RMKYxVkVRtlJXSamgjWTFOc959znZn4JwGAofYzpLF/IbX+KVjU/aQnE4UpgEUMHTX8fUIKSlhWtnKr3aDT6nQlqiuFlc86Z3q/Vi4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=G+TRLIk/; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1757428886; bh=d7Pz/yjrt/tNNpQPMW+9CxclgrWORNrhLXdA1kRna+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=G+TRLIk/nPV0lXA8LXXdLf0O+/zIfOnYlz9qkda0YylidJIm4TFtz2ziFg4079FMn
	 W+51shb8OkjPZnW9l/VARK6xuTAzae1TiIqBhJh1t4XCcYCFxFSVAurDn1UXxJkUir
	 714d8AVYEc/MzIzUiEpot6VJnWHxpyH8bLvmqv7k=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 09 Sep 2025 16:41:26 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Courtney Cavin
 <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah
 <bshah@kde.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
In-Reply-To: <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
Message-ID: <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
> On 09/09/2025 16:08, Dmitry Torokhov wrote:
>>>>    compatible:
>>>>      enum:
>>>> @@ -36,6 +33,11 @@ properties:
>>>>             pin should be configured for pull up.
>>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>> 
>>>> +  wakeup-source:
>>>> +    description: |
>>>> +           Button can wake-up the system. Only applicable for 
>>>> 'resin',
>>>> +           'pwrkey' always wakes the system by default.
>>> 
>>> 
>>> I'll fix existing code, so don't repeat that style.
>> 
>> If you ack I can reformat on my side to match the patch you just sent.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for fixing that up Krzysztof! I noticed but didn't want to 
deviate
from the style just for this description. Of course better to fix the
formatting in the first place.

@Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more 
feedback,
given the reasons outlined in the cover letter. Also on the driver 
patch.

Regards
Luca

> 
> Best regards,
> Krzysztof

