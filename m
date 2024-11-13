Return-Path: <linux-input+bounces-8068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FD9C7F11
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 01:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 081B32846C1
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 00:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF3C19AD70;
	Wed, 13 Nov 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIOkKEzS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35102199948;
	Wed, 13 Nov 2024 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542320; cv=none; b=gvL9zbcKK3Vy23Ak9nUZoHsaNFRmm3jzcj6VGGajWkiUg8+nzBBear2EAlGYnP2iFiZkqs8+fOGXmlawfoDToEX70BBhtDGUOoMwz0GxDHgVxH94OJ0JG7J2RX3L31jR4LNDaZwS3o1pwSvxL0OxXjKJ0pNIomljEStdH9G3DiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542320; c=relaxed/simple;
	bh=X76DQqCtNSpzWw/s+4011JsP24w0AxI7zjOruEKdsqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Armuc4lGzaNPM+uUgVf6OmkETbDo8Xs7+WhN+kR0ICulNIj9LJ7eddX97zTVtjZ78Q4wbJbGF6UeHEJcSW4eL471bGqZuwDomgR0u5s6hL9dSwVOclngTIsp9tmAu6h0YPdnANeoQcWlBHmkht2Ywx89HFtu5yMHJ790v3oxUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIOkKEzS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7f12ba78072so5752205a12.2;
        Wed, 13 Nov 2024 15:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731542318; x=1732147118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPUlb3VBMTlmosq70yahB7ivXqgjw6fLoL5yh5SfhFE=;
        b=UIOkKEzS6p5Ru3DD/XTj/NpYKCQJD1zwGcah4zUX9QDGAig3ySOyeZCEZn3vD9uWUQ
         txXQ3yvVPSKhPYmMufvEW0PthJNV29WS61AqQSah2WnXTBZ6ap+ojeipqnIePo9vWkeH
         7ytugBczFvXlhaGbLrNVEo4t0XS0LuD12uN8I8fhON15Bk/GDVqFQe76Y9xdz/ms/Jnc
         gOAaGOBzkypFe4X8vrRGtBtTTcR1gh+IrnpKpjxfwu0HNCdE0gM+sf3Nt2Ne5htQ8msw
         YVZ0/R3a6HEH06YshCPyR8N2gNANvpjETrJC2MZPEjBO9l5zvRdbA/SIhfLk/7yLYRXs
         kkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731542318; x=1732147118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPUlb3VBMTlmosq70yahB7ivXqgjw6fLoL5yh5SfhFE=;
        b=iUcxBdAn8ddGGnNCsGr/jr4xOFnA85fCOEg8sY0Iqc65b2xvzvcw7DggYaip9IuzO5
         /n/N9gn4DIymTPa+59Sv/e8jKlIn5vZEIIrTGuJ0aVesvUeDu+N4zPmOPao5RB1IN2fI
         2jFhw7DfgilCOTGHU9qE8BBJ+uDuI6rWvtcN2f36O6lgdubSSR3Zal0nhEJdidlsMKMw
         HL83LDOG4cL/39mBJAk/IriqJkAJ1GFMwNcGBsMfDQhq4kgXqYRqpE40jMsCn6aBEGr0
         4cAFIr0UBCLFqDusnLk71i7w5ulIfCNMRN+IyS+SEicEfMoDOMsm+HWdvrf+ZU91nYbZ
         VV1A==
X-Forwarded-Encrypted: i=1; AJvYcCW6uCQn79QbBVBOPfQFc/lH8IZvak1wb5j/73uaTZnOxvAGIUNEhfpv2oFeyptZJG9UHHsliYEFXcDa@vger.kernel.org, AJvYcCWaa8hmV7ekUzaWVCBbmowhyD3/URnjQhy6pthIxffpeoFGT7k418XL+uRlMtsOt0qz6GYZkktrAS/kOEjq@vger.kernel.org, AJvYcCXhEe0THtWtkJ9xtJOPm079AVNgVZYg3vDDGMVB3RRAIBylVG8F8eQdfIX6+S677+KkwXL/yPo4LPyf6Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHXbSFBo6MAYzz8xwaOpGWjdPhbmSCb2/RCOLE92q3a4hjGfN
	Els8Kbe92kdzPjiBrCHmgBU7tR09e5/QDpsJ6AspdZZ5/GoMIb2W
X-Google-Smtp-Source: AGHT+IHOyod3VXmk40tVpnrNG9DlVhMryxGrcLmpbXsiCrrp/ME48mm5tCfyOy0LYdi695U39z6Qug==
X-Received: by 2002:a17:902:e84e:b0:20c:7661:dce8 with SMTP id d9443c01a7336-21183d668d4mr312024285ad.36.1731542318242;
        Wed, 13 Nov 2024 15:58:38 -0800 (PST)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde1b8sm115569335ad.60.2024.11.13.15.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 15:58:37 -0800 (PST)
Message-ID: <6f20fb7c-ef70-400a-b359-55f101d8821a@gmail.com>
Date: Thu, 14 Nov 2024 07:58:33 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mjchen@nuvoton.com
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
 <20241112182551.GA1394330-robh@kernel.org>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <20241112182551.GA1394330-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024/11/13 上午 02:25, Rob Herring wrote:
> On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: mjchen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..71debafc3890
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Keypad
>> +
>> +maintainers:
>> +  - Ming-jen Chen <mjchen0829@gmail.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/input/matrix-keymap.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-kpi
>> +
>> +  debounce-period:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
>> +    description: |
>> +      Key debounce period select, specified in terms of keypad IP clock cycles.
>> +      Valid values include 0 (no debounce) and specific clock cycle values:
>> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
> No need to list the values twice.
>
> We already have a bunch of debounce time properties. Don't add more. If
> you have the clock frequency, then you can use the existing
> "debounce-delay-ms" and convert to register values.
>
>> +
>> +  nuvoton,key-scan-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
>> +      This parameter controls how frequently the keypad is scanned, adjusting the response time.
>> +      The valid range is from 1 to 256 clock cycles.
>> +    minimum: 1
>> +    maximum: 256
>> +
>> +  nuvoton,key-scan-time-div:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Set a divider that adjusts the scan time for each key.
>> +      This value scales the time it takes to scan each key
>> +      by multiplying the key-scan-time by the specified factor.
>> +      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
>> +      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
>> +    minimum: 1
>> +    maximum: 256
> Again, we have existing properties such as scan-interval,
> scan-interval-ms, and scan-delay. How is this different?
>
> With a single property in time units, you can solve for how many clock
> cycles.
>
I will remove the custom properties.

I introduced and replaced them with the existing properties, such as

sacn-interval-ms, and debounce-delay-ms as you suggested.


>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - linux,keymap
>> +  - debounce-period
>> +  - nuvoton,key-scan-time
>> +  - nuvoton,key-scan-time-div
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad@404A0000 {
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
>> +      interrupts = <79>;
>> +      clocks = <&clk>;
>> +      keypad,num-rows = <2>;
>> +      keypad,num-columns = <2>;
> Surely these should be required?

I will add "keypad,num-rows" and "keypad,num-columes" to the required 
properties in the next verision.


Thank you for the feedback.

As both Conor Dooly and Rob Herring point out, I'll make the changes as 
suggested.

>> +
>> +      linux,keymap = <
>> +         MATRIX_KEY(0, 0, KEY_ENTER)
>> +         MATRIX_KEY(0, 1, KEY_ENTER)
>> +         MATRIX_KEY(1, 0, KEY_SPACE)
>> +         MATRIX_KEY(1, 1, KEY_Z)
>> +      >;
>> +
>> +      debounce-period = <8>;
>> +      nuvoton,key-scan-time = <1>;
>> +      nuvoton,key-scan-time-div = <24>;
>> +    };
>> -- 
>> 2.25.1
>>

