Return-Path: <linux-input+bounces-10866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB49A635BB
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 14:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5203916C7FB
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 13:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240C21A5B89;
	Sun, 16 Mar 2025 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1mXDZrW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9812139B;
	Sun, 16 Mar 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742130240; cv=none; b=CwlMv68Zzyw/GNKyjTdnHP/n0i/1tYwYNW5Dx1jnxbWC3zaGXA/tw7b9tRh99oInLx00mbUwH0RcRzuii9bnMSZM7JAD/6s78eatY1DEm+t0Wt6KahSRsIehdMYHZNKMInoPpPXEdM+ot4jRco/x+JzX3taElOu8xpb2kjS515E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742130240; c=relaxed/simple;
	bh=HEXeQgREjCl2cboBt4IGZ0XJkceBqK9SYOGeCX0PGdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvhoaclxcgpV+rPOY9b4yUN4XmUdLs1zEFeea/pOc4JzWofSepBfrdYwJJPK/k3bQKu0cd3uKZvxBYstmcAKP9bVbcR027Tkuo1jrqEN1GgXz/fY+E8ALNGJPiMy/ziRretIYUKla3ryIApNPP7Jkajl9y3aoRm9Gmdv2zmmP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1mXDZrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59706C4CEDD;
	Sun, 16 Mar 2025 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742130239;
	bh=HEXeQgREjCl2cboBt4IGZ0XJkceBqK9SYOGeCX0PGdM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i1mXDZrWi/EthwT/OheBAJXydlyseTnbq9IX6Oba83niWW9acYi68YhN5GB6xSLjj
	 LgP1Ur2LtE/HJZYJO5/aHcGkeLCtZf9v/SGZulU15TcBJOIJg6AQw99KyMBC2hL1Bw
	 DMVGZ9VlznPBY/QpKI/MAMnjTkvKtSUdLwjKbSpJYgYPlS579xKkzY9IilhkZU4YIl
	 zW1mR/VDRnDP7HdAhGvZNuy793mkyZ7aEumfm/qifACQUhxqvOLclvIb0/u5oLNmZ0
	 NPD7OYMnaJ4BNHZGFWK+yWUOUGKZ0vjnIzOiXDFGhuKmVasyKb7dLTRsSdMCt5Bh6e
	 tb8jXW5WROfww==
Message-ID: <97cc25c3-4538-4f28-a551-309943ba0768@kernel.org>
Date: Sun, 16 Mar 2025 14:03:52 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] Input: snvs_pwrkey - support power-off-time-sec
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314094213.902-1-ian.ray@gehealthcare.com>
 <20250314094213.902-2-ian.ray@gehealthcare.com>
 <aa893df6-fe40-49a8-920d-7d7240bb18b8@kernel.org>
 <Z9QuC7tZoXj3DRZs@9e5302bffcb7>
 <e58f5851-9988-463b-824e-ad3da1137c33@kernel.org>
 <Z9RBmVQ1l6wx_WJf@c052f8094844>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z9RBmVQ1l6wx_WJf@c052f8094844>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2025 15:47, Ian Ray wrote:
> On Fri, Mar 14, 2025 at 02:31:12PM +0100, Krzysztof Kozlowski wrote:
>> On 14/03/2025 14:24, Ian Ray wrote:
>>> On Fri, Mar 14, 2025 at 01:55:47PM +0100, Krzysztof Kozlowski wrote:
>>>> On 14/03/2025 10:42, Ian Ray wrote:
>>>>>
>>>>>       /* Get SNVS register Page */
>>>>> @@ -148,6 +152,24 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>>>>>       if (pdata->irq < 0)
>>>>>               return -EINVAL;
>>>>>
>>>>> +     if (!of_property_read_u32(np, "power-off-time-sec", &val)) {
>>>>
>>>> And when you test your DTS against binding what do you see? I suspect
>>>> new warning.
>>>
>>> I checked the build logs (from a clean workarea), plus run-time dmesg,
>>> both with the DTS change -- and without it.  There are no new warnings
>>> (specifically nothing mentioning snvs-pwrkey or dts or power-off-time).
>>>
>>> If an invalid value (such as "42") is chosen then the probe fails with
>>> -EINVAL as expected.
>>>
>>> Is there something else that I should have checked?
>>
>> I don't know what your build logs process has. I meant dtbs_check
>> against the bindings.
> 
> $ dt-validate -s Documentation/devicetree/bindings/input/input.yaml \
>   arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dtb 


input.yaml is not your binding, unless something changed. Did it? Is it
being applied here?

Test all bindings, so your schema will be applied.

<form letter>
It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.
</form letter>

Best regards,
Krzysztof

