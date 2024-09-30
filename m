Return-Path: <linux-input+bounces-6887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6E989AC8
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 08:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A351C208E1
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 06:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E342D16631C;
	Mon, 30 Sep 2024 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqgAYol5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA949165EEB;
	Mon, 30 Sep 2024 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727678548; cv=none; b=SZ0NDT6g1hx96bggXi8RUFN3Oq94jp9xJ8NB2VILXsGcGltE5GnXXpj4REkMKaVCwODNo+N3L/C50p22OxF7kt143xhNXwStBvngd+/EmzQUsrEOl3kZzYYezp5eWp/L7612G7f0/G49gpu5Zg8U2pdEYhxFDKpCXV/dfoREWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727678548; c=relaxed/simple;
	bh=5VoQhXwgKxpbg8eBCDJRN8Z4bGhUFPO8t2fAmZVipxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeMJcMmdYI5s0kLyY4/Ke0EqiMK7nmMVsRfcCEmLQ+hcmDSwUdUceYeWnu/VlDyUXDQEjV+JqaVxRLOAT6ZwfpkG0UD+s1PR2P1MU1ls9g7UCgQ+1hdG2JSMPbTGsoEKTBAPfaLneJIhInbN+EAIX5dtdKtqMpiBWpXcL/CjZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqgAYol5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AB4C4CECE;
	Mon, 30 Sep 2024 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727678548;
	bh=5VoQhXwgKxpbg8eBCDJRN8Z4bGhUFPO8t2fAmZVipxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WqgAYol5ywLVs/5o3BAkiQbKvlsRysyy92uuvDLVQ6fu2aT/OXtXJwXej2jyB4w/j
	 6InZMwUOyV5BI1qdMDlI8HfV8s2iyVlLq1Acm8DnokOuil+uSiNABdrLmpN22S6mYi
	 3t5Qc5SdnqN3zJ1gx/071DGzgqNELhG+MNSuZFUViabACpGYHrWL81u84t/Gmjp9Pb
	 eA1GksvYHf6w6P480MGTenPe447yhye0b0+/2I1ci3v2q6RhzvYAuhn1ldDfsFC4cX
	 GWK8q3HjOmyUXoU/dTeXN35oHx9ji6hfb1mJGznqTHF7SshtxU8e4IrCKjKFhKBY5Q
	 Vu0XworOzCrjA==
Message-ID: <8d5ff5c7-1f66-4a1b-a235-868d13afe03e@kernel.org>
Date: Mon, 30 Sep 2024 08:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
 <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>
 <ZvUwFur1vWYteQMy@ux-UP-WHL01>
 <87d49032-cb94-4cf8-a5e0-44eb2ec37111@kernel.org>
 <ZvoZbWQx5BfMI_Cd@ux-UP-WHL01>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZvoZbWQx5BfMI_Cd@ux-UP-WHL01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2024 05:22, Charles Wang wrote:
> Hi Krzysztof,
> Thank you very much for your advice.
> 
> On Thu, Sep 26, 2024 at 02:32:05PM +0200, Krzysztof Kozlowski wrote:
>> On 26/09/2024 11:57, Charles Wang wrote:
>>>>>  1 file changed, 71 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
>>>>> new file mode 100644
>>>>> index 000000000..849117639
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
>>>>> @@ -0,0 +1,71 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: GOODIX GT7986U SPI HID Touchscreen
>>>>> +
>>>>> +maintainers:
>>>>> +  - Charles Wang <charles.goodix@gmail.com>
>>>>> +
>>>>> +description: Supports the Goodix GT7986U touchscreen.
>>>>> +  This touch controller reports data packaged according to the HID protocol,
>>>>> +  but is incompatible with Microsoft's HID-over-SPI protocol.
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - goodix,gt7986u-spi
>>>>
>>>> NAK, you duplicate again the binding. You cannot have bus-flavors.
>>>> Device is the same.
>>>>
>>>
>>> Could you provide some suggestions regarding this issue?
>>
>> What is exactly the question or problem? There is a binding for this
>> device. Extend it with SPI parts, e.g.
>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml#L22
>>
> 
> This seems a little different from the adxl313.yaml.

Hm? I am reading below:

> 
> The issue we're encountering involves the chip model gt7986u,
> which supports both I2C and SPI interfaces. For the I2C interface
> (using the HID-over-I2C driver), it has already been declared in
> the goodix,gt7375p.yaml file as follows:
> 
> i2c {
>   #address-cells = <1>;
>   #size-cells = <0>;
> 
>   ap_ts: touchscreen@5d {
>     compatible = "goodix,gt7986u";
>   }
> }
> 
> Currently, our design requires utilizing the SPI interface with
> a custom SPI driver. However, the declarations within the binding
> file have led to conflicts, as shown here:
> 
> spi {
>   #address-cells = <1>;
>   #size-cells = <0>;
> 
>   touchscreen@0 {
>     compatible = "goodix,gt7986u";
>   }
> }
> 
> Should I consider merging both YAML files into a single one to fix this?

And there is no difference. I don't understand the problem.

Best regards,
Krzysztof


