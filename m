Return-Path: <linux-input+bounces-8181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C49809D4598
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 02:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324071F21E7D
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 01:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6293C45979;
	Thu, 21 Nov 2024 01:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhkcd9cs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9832309A9;
	Thu, 21 Nov 2024 01:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732154230; cv=none; b=JBxBSZD2eFVZ0Sow51nAPi4VH13pJx332J5knDgOrHalfbhRxvWrvliYCS4qaoVqudEDJ649XpFulCIcrZ0Wyk2R/nJNxB+g/SX51PvU6UQz7TYfvCN/Yr1d5mCFjv+jcum5aGtdnV6MbOucVv7lzHFGkjTSsSEBsy2INFSKh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732154230; c=relaxed/simple;
	bh=+qRBOdS5QpT6J2mqeV+RUAi6U/3UXxVW/APYQ3NScI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwlbosRAqLit/Z5yq/0e81Ukr204YZTjjNJuvgUfRFdtDYg19Jc9tN0ai9LAEXtN4tPoHP3YbfAxspwk7IkFYf71yKdZzRlCJc0yLyUY6r5jle9zN0NtaP79kfrZCwWiBdlYUfhwaZuYqnLhsV7BisU3OgxDJqRC50tEPp4yDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhkcd9cs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so332973b3a.2;
        Wed, 20 Nov 2024 17:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154228; x=1732759028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcMRqlbCfDiojXUFV5zhu21WNiCGL5ZhoJbd9wpOjhg=;
        b=Nhkcd9csMTWn9cTBQp3m8ZW+S6K9eJ9nGas1Ohnv+BRBNpFBMdRAnWarGMI+EwZYks
         JL7/eDctzf2iPnpJYOYqos00813XP1Dy87J2q1FoC5QatCfzuCIsdAaTPqo3SeKOkAYt
         dstqtVBda3T6+AM/l32CowtI/fz8dUAz10p2sZWlQRYvKNapnnvepHv0joobDlt3SBrk
         DuXB5t5gcaFE6ziFJxtVouBVg4Y//LDZMGdMNp3MsnOY5sioIx+aw6VBVdR5cvMfeM2x
         o81H1lP/jKmUY87VGQGyd9e0iQPI1oPB3e8S/52luIHh1toUbku3hCebTscP8qjIgDED
         cbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154228; x=1732759028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcMRqlbCfDiojXUFV5zhu21WNiCGL5ZhoJbd9wpOjhg=;
        b=PVLwjB+KNp5rt81MkEtyeO76Gir1LPM3C5zp6ddvtgpXHsKE0XaslxjcHsj5SRhqSy
         X0rNgMFoiRIAYIIhR6AzCjGGjuAyN5QpLZl7jZP9A5nVfkcnw8f4184gpVbke5BKikaB
         dRllLStvl02gC88EZcrd895E1J79k5i1vVP7f6ANILjMRAhJ/aqSZFhRe1N4oPb2iU8g
         wMeQzfNqLu8/J2ktMo+dsA2gMXeayhOyRpENiAXhJ4UUkNGc/FcmbEmTL/+jK8dbu4v3
         h6nORE6imdoEmfi95DlkuTXJTNaVk4nVg1ZDbg3kJNbU3gcL+Ng5KSE+8Jlw8toLBieD
         mDMw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ekgBiTf24r6+187V1tTBU9HVCLWj5GdgbR5B6cNZsxGORLf8uojzeYURd3Hjj0JuZ1YnGtSk7qKbr5E=@vger.kernel.org, AJvYcCWPG47LG20rXAq8J7UcmrveNyoNgTTHx44E2Dxu8uipX5SzuCcMaVHG8X0RShkw2p/KH0OOlfPFBAmr@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTu57dfxa08jzyulbG7qezZ2bVOxEYnnVpzSkxqIrcDTJ+7z1
	Aaf/hQQOiLT9fvN7N97BD1AAbmCnRK3he6cgeZUlacUqHJIe/mCa6LB3tA==
X-Gm-Gg: ASbGnctP2hkRY/EUl/ujd9nyxCvQMOLJT8Rx3Z+YmmxPvxUvwMDvrM9x9WAkUkGs/RQ
	6W8RE8JuMuKcLlqQZZ7kDedeXnSD0Dw/0oA/2YhRvnmdGPdu8BZDSMJSDheQSdV9Pg2bNh/+dMJ
	ENVwi7lRcmys6jo+9+yPyzc4rG/RTn3nJRsu6HQQUmqUWHsKm83Q0Y3Kf+lAqOAjy/bGE+bVvzV
	XOFQfDMpJtzIBePnDdDBYaGwn1eqzNZTAnkkHHNnN+Fm//LfzgRdWjAJPZdRracNgdhRSDSFFUH
	QlZ2m4BKEt/tiTLXWgD3vHN6
X-Google-Smtp-Source: AGHT+IEJEsDXjRS5g4p+QXVubUytuWQWU5/p8J2OOZ9LwfrfnVYt4ixAPBZRGWFc5DJvm4/UMRk9zQ==
X-Received: by 2002:a05:6a20:9149:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1ddae1fa776mr7800150637.7.1732154228019;
        Wed, 20 Nov 2024 17:57:08 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befac308sm2427036b3a.145.2024.11.20.17.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 17:57:07 -0800 (PST)
Message-ID: <179b30f0-8fda-47d1-8461-a4919a53e744@gmail.com>
Date: Thu, 21 Nov 2024 09:57:03 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
 <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/11/20 下午 04:41, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..9ccd81a2574d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> Filename matching compatible. You got this comment already.
> 
> 
>> @@ -0,0 +1,69 @@
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
>> +  debounce-delay-ms:
>> +    description: Debounce delay time in milliseconds.
>> +    maxItems: 1
>> +
>> +  scan-interval-ms:
>> +    description: Scan interval time in milliseconds.
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Keep the same order of properties as in required: block.

I will ensure that the properties block and the required block have the 
same order.

> 
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
>> +  - keypad,num-rows
>> +  - keypad,num-columns
>> +  - debounce-delay-ms
>> +  - scan-interval-ms
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad@404A0000 {
> 
> Lowercase hex

I will fix it in the next revision

> 
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> 
> Lowercase hex

I will fix it in the next revision

Best regards,
Mingjen-Jen Chen

> 
> Best regards,
> Krzysztof
> 


