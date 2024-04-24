Return-Path: <linux-input+bounces-3249-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642018B1185
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 19:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 878451C23A70
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B34716D4D1;
	Wed, 24 Apr 2024 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZRKqSuX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299216D4F8
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713981378; cv=none; b=VHTg/wTAnYj+Z2d9DJmsKjTLgsF3sDi+uPdm9/r5js4slycVO2vR1zJlssdBWEumSuajPvjlUicGyl0ae+DILWDW681Uf62wy3n7IPFBC2Dh0X3oU2yPi6K2AzxWAp2FUnnRC/K0tQu8nLzsoKVDrYXl9FnmokIo3+/EMn+d2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713981378; c=relaxed/simple;
	bh=r1FqF5oVAdn4eGFwKaSSY041KkM0+aXKBsyK3v9xQ9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQNlvmPz7QMKDKMeg1RJmWDLmG7pNioS3qMlbRdmdJaYnH/0slvDmV5hyGnQP8T6mCwe26B3o7BT+1nLzb28WEtN0Jqn2GboZIip8+Nv76e4LfYBPzmkoZI1a3oxSXJc+7mkEJY8Cvgy4zykzCYCF+uop2/MDlxOilYm4YGZz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZRKqSuX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51bafbe7509so112472e87.1
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713981375; x=1714586175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5so6i706t8WOp7NbkHR8qKCIEqJVlDQL1Q05xZD1zkc=;
        b=SZRKqSuXL7Jb/gao6QFrqmdtEwMtBUPdmm6h1C90a0PQR/U2Pe51GI9nf93Q7SqZWT
         pnH8ch3lsWhIASqZL4KnF9VqqHd4mBJvQMoQ+0S2w0oMMINLVlH0cPbqBQD44aHddVZh
         YNV3eYJnFSqP/+m1gkZPCV8V+pxI1bwzEH41EroFYwCMu57/c/+pVeX76gfTQjF/ExC6
         rQuKfADnGPjXQVmWE6VhEHkC2Cr0CzJ1BD3Hu8baUbTXNolqYRayVjYgZZ9LPoruKbDN
         hxWx1JDIQrJTKBM+cZ4vTCJoN9VP8NTWVZIhY6OpmvRuL3IGk9w2Bd77DvOrHon0Pi85
         T/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713981375; x=1714586175;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5so6i706t8WOp7NbkHR8qKCIEqJVlDQL1Q05xZD1zkc=;
        b=Nzon4ZgdYtyzOMzWqS7rv7MOJvO84z49bZfTgJN0QYt6qCHpGhT1OfT6UVBQaxMR0F
         T1b925q/eDwXV7EPEP01mdQhoBel1Xifrj1Rg5GgjdGyXtomkEet4XNzPZBh1DPRnlgN
         uApDpVo5SviDYiDp8rE0tGUmyqnYyodEBITVtsYBnVsAkOt0Hx72FEa4G4rkxDaKQMsy
         SItJiRwk7kfAJgR/NOgjO4CyN5SQYsupGKMhKI1u3dp82hXMW9EzOvonIDbOLLV2+RAV
         0f+QSDYwHclKFREZMZxDrV3ZI7T8t1lLGOZFoZuS1bQG2c99GcknWA2VQieG6mC6fZ3k
         ndfA==
X-Forwarded-Encrypted: i=1; AJvYcCWticddABbYCDi+0wfUnS3YAoz2QXU6jbTzwg5fxa+LB3u3aIIxCy6RtpCsMXffa7ZTcHJDPE0xNaj24fHpcONzeZGrmBmCWAdWbVc=
X-Gm-Message-State: AOJu0YzZw/y09ceSYX1rYGkGGBZLTy88r0WpOErL9Z2yUfbcAzDdxKdn
	kHEGvAs+epO4Tf2Rf1sp8H7wRjT0jI2qkKsl7AklFv6FOXxWSzcS1rhp+sLDjPs=
X-Google-Smtp-Source: AGHT+IELOtUgOO5XWCo6T+0MBP7SofjlBZXqP8w0QWGJa3/Qq3MtoVZW3I5pFxdqQmJXc9LO8TuPiA==
X-Received: by 2002:ac2:5e39:0:b0:513:cf5e:f2ad with SMTP id o25-20020ac25e39000000b00513cf5ef2admr2653622lfg.60.1713981374677;
        Wed, 24 Apr 2024 10:56:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906504e00b00a558014ab2csm7629532ejk.145.2024.04.24.10.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 10:56:14 -0700 (PDT)
Message-ID: <9bc9a60c-0e07-44f5-9612-f086fda759ea@linaro.org>
Date: Wed, 24 Apr 2024 19:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
To: Andre Przywara <andre.przywara@arm.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, James McGregor <jamcgregor@protonmail.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
 <20240422164511.2488261-2-andre.przywara@arm.com>
 <20240423111502.6e068887@donnerap.manchester.arm.com>
 <f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
 <20240423135106.02ab4473@donnerap.manchester.arm.com>
 <1714205b-39cf-4803-b251-a35f6b9ab3e9@linaro.org>
 <20240424115539.50efd2f0@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240424115539.50efd2f0@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 12:55, Andre Przywara wrote:
> 
>> For sending other people patches, we could disagree. I stand that I
>> would not ever send incorrect patch intentionally.
> 
> Sure, and the patch was not incorrect, I trust James that far, because I
> know him and talked to him about this patch and the process before.
> 
>> Therefore reviewer's statement of oversight is entirely redundant as well.
> 
> Maybe I missed that, but I don't see anything in the documentation that
> would support this statement. The "reviewer's statement of oversight"
> is only expressed by an explicit Reviewed-by: tag, it seems, and none of
> the other tags seem to include that. I would agree that authorship does,
> somewhat naturally, but I don't see that sending or SoB does.

If you send someone's patch, the patch must be correct to your best
knowledge. Therefore Reviewer's statement of oversight does not cover
anything more.

Otherwise such submitter of someone's patches must not be trusted.

> 
>> I just cannot send
>> someone's patch without reviewing, thus without adhering to points
>> expressed by statement of oversight.
> 
> As you mention elsewhere, this seems to be individual.
> I personally feel that this assumed "implicit review", given through
> the SoB tag or through sending, is weaker than an explicit Rb tag. I agree
> that by sending a patch from someone else I take some kind of
> responsibility for the patch, but in this case I wanted to express

You take full responsibility, not some.

> that I did a proper review of the patch, going beyond the usual process
> checks. Hence the reply with the R-b tag.
> 
>>> independent from review. I mean I doubt that every maintainer sending
>>> patches up the chain (when they add their SoB) implies a *review*? Surely  
>>
>> Yes, every. This applies to mass-maintainers, like netdev, Greg, Andrew etc.
>>
>> Every patch I apply to my subsystems is reviewed by me. I cannot do
>> else, because that is the requirement of maintainership.
> 
> I don't see it that way, I guess many maintainers rely on (thorough)
> reviews from third parties, and just glance over each patch before

I also rely on reviews on other parties, but that does not mean I do not
perform review.

> sending? Doesn't mean that they can and do reviews, but I feel it's not a
> requirement to do so *yourself* for *every* patch?

Reviews are different. If someone trusted performs review, I can relax
and spend less time on it making less thorough review. It's still a review.


> 
>> There are however maintainers (see i2c patches or Intel DRM) who accept
>> patches and do not review them. When they review, they provide
>> additional Rb tag + Sob. This is weird because it means when they accept
>> patch, they take it unreviewed! Their SoB does not imply reviewing patch
>> and this is in contrast to kernel process.
>>
>> BTW, Stephen Rothwell mentions this to every maintainer on adding their
>> tree to linux-next ("You will need to ensure that ... reviewed by you
>> (or another maintainer of your subsystem tree)").
> 
> But this hints that there must be *some* review taking place, and it's the
> maintainer's responsibility to ensure this. But that doesn't mean that the
> maintainer cannot delegate? And then they would just forward patches
> reviewed by trusted people.

Yes, then can delegate to other maintainer, not to random person.

> 
>>> they do agree on the patch (also typically expressed by an Ack), otherwise
>>> they wouldn't send it, but a "review" is still a different thing.  
>>
>> IMO, this would mean such maintainers accept code which they do not
>> understand/review/care. They are just patch juggling monkeys who take
>> something and push it further without doing actual work.
>>
>> That's not how maintainership should look like. Maintainer must take
>> reviewed code and, if other maintainers do not review, then they must
>> perform it.
> 
> Of course, but I feel this discussion goes into a different direction. I am
> not a maintainer for the sunxi tree, I am a mere messenger here,
> forwarding a patch. And I didn't think this implies an implicit review.
> A did an explicit one, to stress that I did look into the patch more
> thoroughly, and also because we are not exactly drowning in reviewers ;-)
> 
>>> The Linux history has both Rb + SoB from the same person and just SoB
>>> signatures, so I assume that it's not implied.  
>>
>> It depends on people. As I said, I2C and DRM provide Review tag. For me
>> this is silly and suggest that all my work, that 1000 patches I took,
>> was not reviewed.
> 
> If you forward a thousand patches, I wouldn't expect you did review all of
> them *yourself*. This would be an almost impossible task, unless "review"
> just means something like: "uses tabs for indentation".

Obviously if someone forwards 1000 patches the review is much shallower,
less careful. To which extend? It's individual. Now go to several
patches for netdev and USB, from less trusted sources, which did not
receive other reviews and look for answers. You might see really
diligent review.

> 
>>>> And you have there SoB which indicates you sent it...  
>>>
>>> Yes, but SoB just means I sign off on the legal aspects: that I got the
>>> patches legally, compliant with the GPL, and that I am fine with and
>>> allowed to release them under GPL conditions.
>>> That does not include any code review aspect, AFAICT.  
>>
>> So you want to say, that you are fine in sending intentionally buggy
>> code, knowingly incorrect, because your SoB and your "git send-email"
>> does not mean you reviewed it?
> 
> Where did I claim that? Of course I would not send intentionally buggy
> code, and of course I did some high level checking of the patch before I
> attached my name to it. But to me this is still different from a proper
> "review", hence my reply.

You did not say that. I am here merely twisting the concept to border
case to show the point.

If you send someone's patch and add Review tag, what does it mean? That
you reviewed this code, so to your best knowledge it is good.
If you send someone's patch and did not add Review tag, what does it
mean? That you did not reviewed this code? So whatever is in the code is
okay? How such case should be understood.

If we take such approach, we must never trust submitters of someone's
else patches, unless they provide review tag. Without review tag, that
person does not take responsibility of that patch.

And that's just not the process which is in practice.


Best regards,
Krzysztof


