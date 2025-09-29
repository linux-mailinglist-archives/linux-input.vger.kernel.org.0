Return-Path: <linux-input+bounces-15167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D2BA9DF2
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 17:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFE319213CB
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1232C30B520;
	Mon, 29 Sep 2025 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Nk3rY9CJ"
X-Original-To: linux-input@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35B30B535;
	Mon, 29 Sep 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161186; cv=none; b=j9RK7s2f/jY1FJNGed/XmHKrId6lt+HI2WAn70FV5+1th/UfBFoEAnEKYReSaqVHtts48RHRFFvnrXG/f5hUjOvnB1rOWRrmM4bjTmhU916gxfiSzGR5ci3cmKxtly74edJy6KANP8vdDmptoaVUx/bmirEAReSK5JsNY5D1x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161186; c=relaxed/simple;
	bh=G8YzWykcN+7T3iq/TApLviOykadfZk2GMFlz7NLHNAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRjeW+oTt3FTPgJ8RehoS/s3BZCf2gcfNkKtcS1dt9IYCDLbEJbpa01DdReq3da2xn8ksaEst9j3mU3CKqYfU9UYE2zdL42SmqmGscO9PVXMaNOl/Iz8Yus38IbWX9IBC4H4YZjwmUXojueHnN+aswUIEGmCeFmBFHi6JxP/5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Nk3rY9CJ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1759160696; bh=G8YzWykcN+7T3iq/TApLviOykadfZk2GMFlz7NLHNAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nk3rY9CJqqbOqA28siTjvRRJPZoK+Q/2666t0BH6DGvk2GussB1dqO7MLLsb0+rx/
	 Kkkcej8mYS+fr8tXMylFLYkbjl5XmSZMzQerr8mOsA6OmftZRaL3bXc+Ri3Wym3Mw6
	 Nh0zaYM9T+ovew8WBhJDB7WRL6kDYH2r4MDsvkSo=
Message-ID: <f0539620-87f8-4efd-b27e-443100bc92cc@lucaweiss.eu>
Date: Mon, 29 Sep 2025 17:44:55 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Courtney Cavin <courtney.cavin@sonymobile.com>,
 Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
 <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
 <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>
 <3kww5et2q2mqddpvtqzuj3jqzvfds66qrufawcmumamrqoaugk@tiq6zoe5psom>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <3kww5et2q2mqddpvtqzuj3jqzvfds66qrufawcmumamrqoaugk@tiq6zoe5psom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-09-25 7:45 atm, Dmitry Torokhov wrote:
> On Tue, Sep 09, 2025 at 07:54:33AM -0700, Dmitry Torokhov wrote:
>> On Tue, Sep 09, 2025 at 04:41:26PM +0200, Luca Weiss wrote:
>>> On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
>>>> On 09/09/2025 16:08, Dmitry Torokhov wrote:
>>>>>>>     compatible:
>>>>>>>       enum:
>>>>>>> @@ -36,6 +33,11 @@ properties:
>>>>>>>              pin should be configured for pull up.
>>>>>>>       $ref: /schemas/types.yaml#/definitions/flag
>>>>>>>
>>>>>>> +  wakeup-source:
>>>>>>> +    description: |
>>>>>>> +           Button can wake-up the system. Only applicable
>>>>>>> for 'resin',
>>>>>>> +           'pwrkey' always wakes the system by default.
>>>>>>
>>>>>>
>>>>>> I'll fix existing code, so don't repeat that style.
>>>>>
>>>>> If you ack I can reformat on my side to match the patch you just sent.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Thanks for fixing that up Krzysztof! I noticed but didn't want to deviate
>>> from the style just for this description. Of course better to fix the
>>> formatting in the first place.
>>>
>>> @Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more
>>> feedback,
>>> given the reasons outlined in the cover letter. Also on the driver patch.
>>
>> OK, I'll hold on to this for a couple of weeks.
> 
> Nobody voiced any objections so far, so applied both.

Thanks Dmitry!

