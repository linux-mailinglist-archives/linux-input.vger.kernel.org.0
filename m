Return-Path: <linux-input+bounces-12172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9AAAC0DE
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 12:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 908D917C90F
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 10:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BFF27587A;
	Tue,  6 May 2025 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b="Ydn5wlgH"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93926989A
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525952; cv=none; b=bzpp3ZHos7l537vv3b0imI6xpXSmCdUSUziVSwekuhrlfGvwaw0teU0AxGDb0eLpsGhoBxFCePys7J4mi5IXm7qFvXzKFWtF/TsvekRLiTo9oSMsmje/6N36YiYxJx0i2aGy/HhhlWJqYH8gLY84Moy3i+orG/1+zSyy3J2b5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525952; c=relaxed/simple;
	bh=BwhNMp0UKnG882cpIKMkCxp3AB6dxSGE8tTxzzwppPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCP9bMsJKM4feeDYPyNntTt8ohx5EVddOvNwkde6JUfEGiIJ39tGWCd+G2p+5fnkE5wZ5cLaLO06931pC2FqeS/icTMdQ6U22tc/+NJic9CvvOYMOZ5aUGVhevNd9Rn44KE9C+iR/cm4nAoTo+5GfCeZbl6r+XIUiKsDYTk/DrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net; spf=pass smtp.mailfrom=david-bauer.net; dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b=Ydn5wlgH; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id A2ABE17F704
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 12:05:44 +0200 (CEST)
Received: (qmail 10419 invoked by uid 988); 6 May 2025 10:05:44 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 06 May 2025 12:05:44 +0200
Message-ID: <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
Date: Tue, 6 May 2025 12:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505203847.86714-1-mail@david-bauer.net>
 <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
Content-Language: en-US
From: David Bauer <mail@david-bauer.net>
Autocrypt: addr=mail@david-bauer.net; keydata=
 xjMEZgynMBYJKwYBBAHaRw8BAQdA+32xE63/l6uaRAU+fPDToCtlZtYJhzI/dt3I6VxixXnN
 IkRhdmlkIEJhdWVyIDxtYWlsQGRhdmlkLWJhdWVyLm5ldD7CjwQTFggANxYhBLPGu7DmE/84
 Uyu0uW0x5c9UngunBQJmDKcwBQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQbTHlz1Se
 C6eKAwEA8B6TGkUMw8X7Kv3JdBIoDqJG9+fZuuwlmFsRrdyDyHkBAPtLydDdancCVWNucImJ
 GSk+M80qzgemqIBjFXW0CZYPzjgEZgynMBIKKwYBBAGXVQEFAQEHQPIm0qo7519c7VUOTAUD
 4OR6mZJXFJDJBprBfnXZUlY4AwEIB8J+BBgWCAAmFiEEs8a7sOYT/zhTK7S5bTHlz1SeC6cF
 AmYMpzAFCQWjmoACGwwACgkQbTHlz1SeC6fP2AD8CduoErEo6JePUdZXwZ1e58+lAeXOLLvC
 2kj1OiLjqK4BANoZuHf/ku8ARYjUdIEgfgOzMX/OdYvn0HiaoEfMg7oB
In-Reply-To: <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-3) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=BwhNMp0UKnG882cpIKMkCxp3AB6dxSGE8tTxzzwppPY=;
	b=Ydn5wlgHz9wy9nIQG9lu+5dKh6m5Pgvhcu3UGrxIMMnwOiVUu7N3UIpgo72D5NqdwbEeO4C+gm
	evJKo+SYUWl2K/vb0BURikzVbeyUjYIRq8YkNElCX40RMW5PVTM098RcU0j5Jos1tY5+J/2er/LF
	sMDGW+jVwxMDTkU7kOu54mB+rWcCB/5je5RaNa0oOxiJOm+rNp2Yb1RCYOg62+Vo+4vCUC3xthJO
	3UyBNyfv6hewu1+w1nnozKhrxWa6DtV059NAW7CTrLq0K6J6EqLyJj/DXzPr5LHNKM4S1bWJAjj7
	td6NiCrR3/rZYgWdeDWgoXi0fogI6wiHJAPlEefSdEIF/xV3xfUWxbHhfz12cLqqMaU2GMfCAZJN
	n0z7N2pnZeOJKqM4pfDk3hm/Sp5H/jvvhq5t3LfW+LfGk0o5oq9RP1bw3X7mZ9FhQS1HyleebMlL
	ZEPkTS7VFx9rSioj+j0chbq9zL9ohe42uHVDD1cUQRVfNwyZ+uE2exv6pWZ0AC2Guqi5khyoQmrZ
	q/zI+kRlMYYzOheNkGkKQI4hVmAuzbHov/cPRdo8DyIUMYHig1LA7c18hmH5lgZTDHHx7uWUDU3m
	jw8nVb/1go8SX9/XDgY3M9dloAps0TBde8jyALJnWY6c58aGT4TORCZI9YDvci2I90Gc8MKqt7V2
	c=

Hi Krzysztof,

thanks for the review.

On 5/6/25 08:21, Krzysztof Kozlowski wrote:
> On 05/05/2025 22:38, David Bauer wrote:
>> Add device-tree binding for the Semtech SX9512/SX9513 family of touch
>> controllers with integrated LED driver.
>>
>> Signed-off-by: David Bauer <mail@david-bauer.net>
> 
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> work on mainline or start using mentioned tools, so correct addresses
> will be used.
I'm a bit unsure what you are referring to - maybe I've set the options
for get_maintainer.pl wrong, but i use

get_maintainer.pl --nogit --nogit-fallback --norolestats --nol

to determine TO recipients and

get_maintainer.pl --nogit --nogit-fallback --norolestats --nom

for CC destinations.

Granted, my tree was a bit out of date but it was from mainline
and after rebase both commands returned consistent results.

Hope you can provide me with some guidance there.

> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> 
>> ---
>>   .../bindings/input/semtech,sx951x.yaml        | 180 ++++++++++++++++++
>>   1 file changed, 180 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/semtech,sx951x.yaml b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>> new file mode 100644
>> index 000000000000..e4f938decd86
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>> @@ -0,0 +1,180 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/semtech,sx951x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Semtech SX9512/SX9513 based capacitive touch sensors
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  The Semtech SX9512/SX9513 Family of capacitive touch controllers
>> +  with integrated LED drivers. The device communication is using I2C only.
>> +
>> +maintainers:
>> +  - David Bauer <mail@david-bauer.net>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - semtech,sx9512
>> +      - semtech,sx9513
> 
> Devices are not compatible? What are the differences?

The SX9513 is a cost-reduced version which does not
support proximity sensing. With the current support
of the driver they work identical. Should i add this
information as a comment?

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  poll-interval:
>> +    default: 100
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting. Same comment
> everywhere.
> 
>> +      The polling interval for touch events in milliseconds.
> 
> Missing -ms property unit suffix... unless you are using existing
> property from common schema, but I do not see any reference (and thus
> unevaluatedProperties at the end).
> 
>> +
>> +patternProperties:
>> +  "^channel@[0-7]$":
>> +    $ref: input.yaml#
>> +    type: object
>> +    description: |
>> +      Each node represents a channel of the touch controller.
>> +      Each channel provides a capacitive touch sensor input and
>> +      an LED driver output.
>> +
>> +    properties:
>> +      reg:
>> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
>> +
>> +      linux,keycodes:
>> +        maxItems: 1
>> +        description: |
>> +          Specifies an array of numeric keycode values to
>> +          be used for the channels. If this property is
>> +          omitted, the channel is not used as a key.
>> +
>> +      semtech,cin-delta:
> 
> Use proper unit suffix and express it in pF.

To represent 2.3 and 3.8 pF, would it be better to represent in
femtofarad?

> 
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 3
>> +        default: 3
>> +        description: |
>> +          The capacitance delta which is used to detect a touch
>> +          or release event. The property value is mapped to a
>> +          farad range between 7pF and 2.3pF internally. The delta
>> +          becomes smaller the higher the value is.
>> +
>> +      semtech,sense-threshold:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 255
>> +        default: 4
>> +        description: |
>> +          The threshold value after which the channel detects a touch.
>> +          Refer to the datasheet for the internal calculation of the
>> +          resulting touch sensitivity.
>> +
>> +      led:
> 
> I think subnode is here not needed. This should be part of the channel,
> probably.

Just to be sure - you mean to have a property "led" upon which instructs
the channel to be used to drive an LED and include the LED specific
properties in the node of the channel?

> 
>> +        $ref: /schemas/leds/common.yaml#
>> +        type: object
>> +        unevaluatedProperties: false
>> +        description: |
>> +          Presence of this property indicates the channel
>> +          is used as an LED driver.
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
> 
> unevaluatedProperties instead
> 
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    #include <dt-bindings/leds/common.h>
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      touch@2b {
>> +        compatible = "semtech,sx9512";
>> +
> 
> Drop blank line
> 
>> +        reg = <0x2b>;
>> +
> 
> 
> Best regards,
> Krzysztof

