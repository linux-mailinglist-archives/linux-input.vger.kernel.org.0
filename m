Return-Path: <linux-input+bounces-12690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6EACC081
	for <lists+linux-input@lfdr.de>; Tue,  3 Jun 2025 08:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49DD168248
	for <lists+linux-input@lfdr.de>; Tue,  3 Jun 2025 06:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F421268C6B;
	Tue,  3 Jun 2025 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQsEk4KY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601F268C62;
	Tue,  3 Jun 2025 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933525; cv=none; b=bYwDGfH1ZBnctXPzWrHPE0sqDuuqasCWEADqOgTOG+ABtzEoE84ZkGTNb/Z4N05BnZYxMocz0Iy8Db+Maor2HOAU8wNI9L9gdXbqaqBwWeenmXhErPzXqhUdRVVheCFqhvZSFgdNL/ll+hGjzJKV+SyffTQF/wE+ro8/kyQry3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933525; c=relaxed/simple;
	bh=lzFWTJcfuXOBClAas9MZhq4SE623nomGZJJDIWUBeao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdB42TvL/hsHjf1WoCtcSGJ3Rp/s9Creq1im+BdmIoJn3mw+pmr64Ag3C6KtAnkSPROuD5eD5uLvivyPZNZRfeMOOvX19raT0sBl1jQTj2DbAoBfGbKjLBWBTY+VlIIQCz6AvipIUe8HPw/MFq4LZOF+3lRcktL24uA2zaRG270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQsEk4KY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBFBC4CEF1;
	Tue,  3 Jun 2025 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748933524;
	bh=lzFWTJcfuXOBClAas9MZhq4SE623nomGZJJDIWUBeao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQsEk4KYKFv043uT2ksf1vsov/djJPEWvFanpxuaJ8nYi7AJbOloqeL3kboeYQnbM
	 BfVX0BmuEPU3p9IG2/yHSI49SXq9uYDrHEVz2i6pI5RdzPe9iiCORY7wBRpkS7/oO6
	 YZURw3M2DMthp07VDM1SRGbA0/HRUAJrt7yGPuNpGRI90gefrStaDM6FTugZ2XBPzG
	 /eFvprl1WnQvMvu4r9YcgbK/0IDYY/IlOAu7d5vJYVXwwG2JLKVb2EEzyke+hvAy+H
	 cawXnY0fB15gvaHKHcfpSxhFTW9vRe0XH2CwJyo/wDGdGXkVbuzjf5x/Npsw4b0VVc
	 iG2ZekZ407B6A==
Message-ID: <0fb4b411-1b27-43fc-8d48-e5220fc85478@kernel.org>
Date: Tue, 3 Jun 2025 08:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
To: Job Sava <jsava@criticallink.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 jcormier@criticallink.com
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>
 <20250521-wandering-tested-porpoise-acbef7@kuoka>
 <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>
 <20250529-wise-tremendous-stork-a7d091@kuoka>
 <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 15:07, Job Sava wrote:
> On Thu, May 29, 2025 at 5:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Fri, May 23, 2025 at 09:46:49AM GMT, Job Sava wrote:
>>> On Wed, May 21, 2025 at 6:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Tue, May 20, 2025 at 01:43:36PM GMT, Job Sava wrote:
>>>>> The TPS6594 power-button option permits users to enter STANDBY or
>>>>> ACTIVE state by a push, release, or short push button request.
>>>>>
>>>>> Signed-off-by: Job Sava <jsava@criticallink.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 15 +++++++++++++++
>>>>>  1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>>> index 6341b6070366..a40808fd2747 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>>>> @@ -37,6 +37,21 @@ properties:
>>>>>        device on the SPMI bus, and the secondary PMICs are the target devices
>>>>>        on the SPMI bus.
>>>>>
>>>>> +  ti,power-button:
>>>>> +    type: boolean
>>>>> +    description: |
>>>>> +      Optional property that sets the EN/PB/VSENSE pin to be a
>>>>> +      power-button.
>>>>> +      TPS6594 has a multipurpose pin called EN/PB/VSENSE that can be either
>>>>> +      1. EN in which case it functions as an enable pin.
>>>>> +      2. VSENSE which compares the voltages and triggers an automatic
>>>>> +      on/off request.
>>>>> +      3. PB in which case it can be configured to trigger an interrupt
>>>>> +      to the SoC.
>>>>> +      ti,power-button reflects the last one of those options
>>>>> +      where the board has a button wired to the pin and triggers
>>>>> +      an interrupt on pressing it.
>>>>
>>>> Don't you need to handle two other cases as well? I assume you copied
>>>> this from the other binding, but all three options are valid?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> Hello Krzysztof,
>>>
>>> Thank you for your response!
>>>
>>> I agree that the other two cases are valid options. However, for this
>>> particular patch series, they may be out of scope. The primary goal of
>>> this patch is to enable push-button functionality, rather than
>>> addressing the VSENSE or EN modes.
>>
>> Binding should be complete, because if you design this as bool, it
>> cannot be later changed to three-state (enum).
>>
>> I don't know if the EN and VSENSE modes are anyhow useful, maybe people
>> interested in this hardware should say.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Thanks again for the feedback.
> 
> I modeled this binding after the TPS65219 PMIC, which uses a boolean

Yeah, that's what I meant in my first reply.

> for ti,power-button, despite the same EN/PB/VSENSE options. Since this
> patch only enables PB mode, I felt a boolean was appropriate and
> consistent.

Properties should have only one type, so that would be a different
property. Someone knowing the device should come with arguments whether
other states for this are useful at all. Or not useful and then argument
that in commit msg for example.


Best regards,
Krzysztof

