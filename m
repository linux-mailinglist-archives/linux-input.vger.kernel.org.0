Return-Path: <linux-input+bounces-3790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B38CCC2C
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 08:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D662839E3
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 06:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA76713B5B9;
	Thu, 23 May 2024 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1iBK16J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB713B5B4;
	Thu, 23 May 2024 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716445091; cv=none; b=LILyC8qw8GKUPQ7vJMdQ8HcaaK+FA94RYl4rFpSE0BabKGLqArwiWffrjU83UW3l03J8RGqAq1mASEOpfL3/fiDhkfF5bZ9SKT/K2M9otXkEmT0wOCkf1vw7UOh1v2EoPqRL4scmsqWOoKMjCBH8r597gjXiIqtWA8CZjJE5NN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716445091; c=relaxed/simple;
	bh=OTVberI1BuWIOdkUJoRqDYrgj07Ee4OnvLviPQ6WZyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zufap+hg9pJjTT7oCgei8pMmKcIdNBiFtxieXu6a9v8KldgICMMPuPn5UnzO68Mw5y6Y528gJrJrDQL6ua6mua7HojOGyMrK1jiFp6IH/CVa6qbdBkSFw/L8oYNWmcEk6tYHTTIh1nCBKhQdrZPfaQo89xf1z0qm10j2mgH+BiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1iBK16J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685D6C2BD10;
	Thu, 23 May 2024 06:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716445091;
	bh=OTVberI1BuWIOdkUJoRqDYrgj07Ee4OnvLviPQ6WZyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1iBK16JsfklLNDCeR2CthstsTpZqlPFXA4X1zV+lmD26PIYA5DbMSLdsk5XHlgYd
	 Gfz0cUTb478dCKnZ9Ip1SDKs9qi2dHCiyp+G6K9te5xeEX97Sa7xk51zCtH0CVSpDd
	 /8jzGZA3j9n2hg7gxa/iCO5wb3es6PygQ0qxmv4hwvdGRJgb/KkVgqJRIj2XOEnyeq
	 3MXwOEaBmMYSEDtM/z09EYgC5nMrq68ihui4j9cFY49iYPFcfM+TLrl7ELCLr9OtXn
	 9kutEJ+CeySg6OcDj1576zPJSfoGrkkFFFUWS1onHGYSH+R2W2cNsqs3f8KDAHyyIu
	 Z3eMQFvXGznxA==
Message-ID: <6635cbee-be58-4c84-9caf-309866f1002b@kernel.org>
Date: Thu, 23 May 2024 08:18:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: document Novatek NVT touchscreen
 controller
To: Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
 <20240521-nvt-ts-devicetree-regulator-support-v1-1-8d766c639dca@gmail.com>
 <6f22e42d-8a06-4c24-93bd-25b6ac141cea@kernel.org>
 <7d84912f-7bc4-4376-9f13-31fae16013f4@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <7d84912f-7bc4-4376-9f13-31fae16013f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:00, Joel Selvaraj wrote:
> Hi Krzysztof Kozlowski,
> 
> On 5/21/24 11:48, Krzysztof Kozlowski wrote:
>> On 21/05/2024 14:09, Joel Selvaraj via B4 Relay wrote:
>>> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>>
>>> Document the Novatek NVT touchscreen driver which is used in devices like
>>
>> driver? or device?
> 
> touchscreen "controller" would be correct I think. I will fix it in v2.
> 
>>> the Xiaomi Poco F1 [1]. Also, include the devictree binding file in the
>>> MAINTAINERS file.
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9
>>>
>>> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>> ---
>>>   .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++++
>>>   MAINTAINERS                                        |  1 +
>>>   2 files changed, 63 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
>>> new file mode 100644
>>> index 0000000000000..7839c6a028e4a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
>>> @@ -0,0 +1,62 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nvt-ts.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Novatek NVT Touchscreen Controller
>>> +
>>> +maintainers:
>>> +  - Hans de Goede <hdegoede@redhat.com>
>>> +
>>> +allOf:
>>> +  - $ref: touchscreen.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - novatek,nvt-ts
>>
>> That's too generic. Looking at your driver change, it is not even needed.
>>
>>> +      - novatek,nt36672a-ts
>>
>> Eh, we have already panel. Why there is a need for touchscreen binding
>> (binding, not driver)?
> 
> I am not sure I understand this correctly. Help me a bit here. For 
> context, in mainline there is an existing driver for the novatek nvt 
> touchscreen controller. The driver did not have devicetree support. It 
> only had a i2c_device_id "NVT-ts". I don't know what is the variant of 

I just got a bit confused that you add another binding for the same
device, but now I see these are different interfaces - DSI and I2C.

> that Novatek touchscreen controller. To use the driver in Xiaomi Poco 
> F1, I introduced a devicetree compatible for it "novatek,nvt-ts". The 
> However, the Novatek touchscreen controller present in Xiaomi Poco F1 is 
> "NT36672A" which has a different chip id than the one in existing 
> driver. So I created a separate compatible for this touchscreen 
> controller variant "novatek,nt36672a-ts". I used compatible data to 
> differentiate the two variants. Since there are two variants, I am 
> mentioning both here.

Just to be clear, I don't care about driver here but hardware. You have
two separate interfaces on this hardware - DSI virtual channel and I2C?


Best regards,
Krzysztof


