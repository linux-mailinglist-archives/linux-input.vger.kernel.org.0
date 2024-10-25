Return-Path: <linux-input+bounces-7691-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9769AF92E
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 07:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C647E1F22D7C
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 05:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B85418E02E;
	Fri, 25 Oct 2024 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxNxtX3s"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55375176AAD;
	Fri, 25 Oct 2024 05:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729834616; cv=none; b=r701zmOBiVmtTFUNgecTIl2rByvXbBjg6hCh4aK0Lrztuf4wo+gL2lKBGtU8l5rvcrfsoUvV9cQ99CVfMvLYH7RYSM44WsWDdneZBtIS/2+yF6UTs2NBB2m9nz/KNXJcQLUhK2A0Juu69joR7fltqtnPou0j5qQ2u3phH4KMj8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729834616; c=relaxed/simple;
	bh=i3/s0UBOE+JpqQinyKWy7NDxsOZT5rbIizN4f+s4GoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItEwBZ8JJCGXvHKPaY0Amf0+24R7Pl5EkZEEuKu0BIFy+p2QQWr501l+sYgnzdiqyOQQGbyeY6+8xj48TVB6MUGVbW5pI8/ctJCiY/X0/fBYXjLTLSxw76PK8e1oUKsunjQ/kA9PfMm8MljdXuUE86fMLbFTWJOx2PGZVS/Pon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxNxtX3s; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so1211090b3a.3;
        Thu, 24 Oct 2024 22:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729834613; x=1730439413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvCggmtLdEUI172Y83XNX/Onv4GEKVaPGfEZwS/XjT8=;
        b=YxNxtX3s5xS6Lp1TMJw/nQNd+Ffcq5Cq7zp3EUVCSXZbEjWcNXBXzgCyrs3IhSQWC3
         x9/HwwVRNP/zb4G7rbCjLV4KPBAp7sgCGz5y0n79ldSLTG7H2RaqxXbOntbkZCTG5jdy
         nILcW5vHEAu202PHVvSfkySzdU0mPVN9mzrIsIbXs3B2FWDCj3JKaRMNSWUhLMyduvrW
         2HIylshShKiMSDchI9nWv5PETzAEgtlFmGVlmshdh84dU7ABhCNm4xxAcojnHTBNjeU/
         N3GqTdfb9pmvrVyZWn8nb5V6o4ceA4+71DC2vogxc8toJ6LsBV0rFKpIzDDnzvmPlhXu
         uH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729834613; x=1730439413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvCggmtLdEUI172Y83XNX/Onv4GEKVaPGfEZwS/XjT8=;
        b=A5gYzqq9r9wcPzYetjqlEN5XQLNo+Rcw/GiFToSTYcx/FE8sfS2P3HjSUp5FP0saEQ
         ix0+Yg0JrOANjfazHeERYLRIejX9VQTZPAS2InkPZN1RsKr4cvLEML8K/CvlJGGU+UAK
         82AIZU9w8w2pXDM+PXwzqSweUUZFZJFGGlWxEKG4V2ArVNqkaKKqD7Z8X/BXCIPFhcwF
         ASx9BMqPExDn2dilkiL4ozPgsCGNsu72eMzPHWWP5UOgwaaMuUrgGTdbrQiovokFaryO
         Hcg5rDsL6YhMjSQjT4+pRbN6/dSO+1oDXp691xHDlV1ybzrLZmlMD+1a+4Mfwmlnhpmz
         UaiA==
X-Forwarded-Encrypted: i=1; AJvYcCWe3jKM7RlDadiDtJE595Ttq/TSZdELAT2lT6lraKeH+bxzQs5+24kHgc+fW6l3AN+5tHUZ5e8xXytqi1o=@vger.kernel.org, AJvYcCXdP3UszEySahSfjWWW0Sk2XnRGuvfQEKMtSX11KAjiGRaarqIhxl++SmVIYS70pzkbwe7fuUVyEXrT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/uvW3g1M4TluyyLOOWjfgTl7Ok3QtgH9TjuhCRNhf3ssQXwq
	KAd/n6O3VZIEEKUe+I+QWluESqvQ2PpeHqoN3alaiDsp56+pBFXPiu4GwMur
X-Google-Smtp-Source: AGHT+IGzbzwpbOrc+GHYvSHu/3iAhi85esxI7itU+Q8udNFbHIvIFqzfKJoIJUw9BF55+RUzypHRzw==
X-Received: by 2002:a05:6a00:3c94:b0:71e:7a56:3eaf with SMTP id d2e1a72fcca58-72030bba11fmr11795617b3a.24.1729834613433;
        Thu, 24 Oct 2024 22:36:53 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8660dd1sm333486a12.14.2024.10.24.22.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 22:36:53 -0700 (PDT)
Message-ID: <871e9a4c-7a3c-4a24-8829-a079983033da@gmail.com>
Date: Fri, 25 Oct 2024 13:36:48 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
 <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024/10/23 下午 04:40, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 06:31:57AM +0000, mjchen wrote:
>> From: mjchen <mjchen@nuvoton.com>
>>
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: mjchen <mjchen@nuvoton.com>
>> ---
>>   .../bindings/input/nvt,ma35d1-keypad.yaml     | 88 +++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>   create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
>>
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
Sorry, I will remember to run checkpatch.pl before uploading the
subsequent patches and fix all errors and warnings
>> diff --git a/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
>> new file mode 100755
>> index 000000000000..3d9fc26cc132
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> Filename based on compatible. There is no nvt prefix. Entire filename is
> somehowdifferent than compatible.
I will modify it to: nuvoton,ma35d1-keypad.yaml
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/nvt,ma35d1-keypad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVT MA35D1 Keypad
> NVT? Nuvoton?
I will change NVT to Nuvoton
>
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
> Missing vendor prefix... or why are you not using existing properties?
>
>> +    description: |
>> +      key debounce period select
> select? or clock cycles? I don't understand this. Say something useful
> here.
>
>
>> +      0  = 0 clock
>> +      1  = 0 clock
>> +      2  = 0 clock
> Heh? So this is just 0
>
>> +      3  = 8 clocks
> This is 8
>
>> +      4  = 16 clocks
> 16, not 4
>
>> +      5  = 32 clocks
>> +      6  = 64 clocks
>> +      7  = 128 clocks
>> +      8  = 256 clocks
>> +      9  = 512 clocks
>> +      10 = 1024 clocks
>> +      11 = 2048 clocks
>> +      12 = 4096 clocks
>> +      13 = 8192 clocks
> Use proper enum
I will update the definition to specify the debounce period in terms of 
keypad IP clock cycles, as follow:

nuvoton,debounce-period:
     type: integer
     enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
     description: |
         Key debounce period select, specified in terms of keypad IP 
clock cycles.
         This value corresponds to the register setting for the keypad 
interface.
         The following values indicate the debounce time:
         - 0 = 0 clock cycles (no debounce)
         - 3 = 8 clock cycles
         - 4 = 16 clock cycles
         - 5 = 32 clock cycles
         - 6 = 64 clock cycles
         - 7 = 128 clock cycles
         - 8 = 256 clock cycles
         - 9 = 512 clock cycles
         - 10 = 1024 clock cycles
         - 11 = 2048 clock cycles
         - 12 = 4096 clock cycles
         - 13 = 8192 clock cycles
>
>
>> +
>> +  per-scale:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
> Missing constraints
>
>> +
>> +  per-scalediv:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Per-scale divider (1 to 256).
> Missing constraints
>
> Both properties are unexpected... aren't you duplicating existing
> properties?
pre-scale:
This value configures the IC register for the row scan cycle 
pre-scaling, with valid values ranging from 1 to 256
per-scalediv:(I will change pre-scalediv to pre-scale-div)
This will describe its role in setting the divisor for the row scan 
cycle pre-scaling, allowing for finer control over the keypad scanning 
frequency

I will change it to the following content:
nuvoton,pre-scale:
     type: uint32
     description: |
         Row Scan Cycle Pre-scale Value, used to pre-scale the row scan 
cycle. The valid range is from 1 to 256.
     minimum: 1
     maximum: 256

nuvoton,pre-scale-div:
     type: uint32
     description: |
         Divider for the pre-scale value, further adjusting the scan 
frequency for the keypad.
     minimum: 1
     maximum: 256
>
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
>> +  - per-scale
>> +  - per-scalediv
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad: keypad@404A0000 {
> Lowercase hex and drop the unused label
I will modify it to: keypad@404a0000 {
>
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> Lowercase hex
I will modify it to: reg = <0x404a0000 0x10000>
>
> Best regards,
> Krzysztof
Thank you for your guidance!
I look forward to your further comments.

Best regards,

Ming-Jen Chen



