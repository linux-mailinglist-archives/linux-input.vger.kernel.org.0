Return-Path: <linux-input+bounces-3771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05B8CC2B5
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 16:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A41151C20805
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 14:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E096AB9;
	Wed, 22 May 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvbmvQ+m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FE291E;
	Wed, 22 May 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716386443; cv=none; b=HvCsD7M1czb5t2sIurorWsFXLsJoy8LzRSESZ0vkGX5oigXW18JzMlgbKbvzEX2OSTIwfgY9W+ExzpSjnU8YCtGYbK/AsmWemIg7zKrEdZ2y9SG1PyGBuTDCUgBKj5BWdjTtZmVvoTUE0ryO83nJYYEjY3hF5bqeip83VOkZbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716386443; c=relaxed/simple;
	bh=hEJtbxuTU7u47j1LyQ3YcGTGaRcZXPfzBah4TtO4oxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoXi3p0aoqNte1SQiocuObPyhZRLKHEW+V8czBhJrVZCZEEdenGb9ZeqTRkvDUr+E5Kkzcjphdzt0RpLulF3EmJhYKGGj2aSljnUWHbnag+Ltt3+ZuJX8ILucgkYTIFKtgAVoeRkqzAeWc7LsgISi3FdHK16kiF78b7O8OmBR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvbmvQ+m; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43df6e94734so9586021cf.2;
        Wed, 22 May 2024 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716386440; x=1716991240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yM2OoMcmEt3tXE4jP9xtaDdUrBqGEgqa+sSrb8xMSoU=;
        b=EvbmvQ+mjP7h4ZmiF0MMrNVnt+rm/tjwZ+/vm0FJiU8yvD2twuQgxtrErBbICKu0H2
         AVrVx+D3UefkN8W+Q00uGg2xWFWmFHaGhMGb3b7UORxnjopDBu5zY6x6pQeAEk2fi/u7
         2PUTpaJ7cgO9VnIEUvbxkhCTNgAju4Ws9ETjovj0VHFBnNjyutke/z6O8bGn7yLwwXoC
         a/S7CUqW8ckvWaY/eH/55agBku322Bed31j1Q7T4wVn5Ap+pjYaBYWViqlZfeCEo+l3X
         3+C5TNJcB1BJ5DR/lTF3Xx49z6bMo4RTOQv+oHVyAU+1hX0eyPMb7JyhLUzQxJjSJY1I
         3e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716386440; x=1716991240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yM2OoMcmEt3tXE4jP9xtaDdUrBqGEgqa+sSrb8xMSoU=;
        b=gAFOCcEkfO7uIcVQBK0DELOfqoWIs7Jcpp8uZNJpPwk6oVW88Oi16MdVwbtE4+oBpO
         fAxtT5Mx0PoK/J7MYRmLPsr/BDoIZud7A1n13UjJJjp5zKu15cDMan0iCJiC6hHpDC7F
         2JuEmqZVR7VfgOXp5JXERAxrctofy9wHp+bIhbjKshMY/7loNpfZKw0nyMskBlmmi2PN
         sFbfvXcC3bhJuyuUryc5sXF/b7wRoHj1QAjd5j3ppdcPjx+LHFqVaktvT4Lva1Ub9zYD
         oV+1A43BQkj9C8tv1SMQrjKcSLFVazovV2t5fVQYYQRtuyNOFo3FWlTLVVcHG7huiccV
         cqOg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ke0OFSKAJAQk9lXTpqQms4+NKOAe3FgEqe/Ziblrf6l+CQYhDZ3gVj9WO298QFIZFnRNG+NSQNbTPruFvCQoIAGAxFgeShI4pJnjzs5zRoHgMxLaNvVLTNoYJ/OJAs7iprDfsZQErA==
X-Gm-Message-State: AOJu0YwczZaYMgpmS7B2IMQCpuPtQnpc+wAEX392QQ5sD2Jtze5oLH9h
	591FBMN87XLx0VCg1Tsrnzc2eruqAJGXdTnW6tE3VSNgzi41Nxdo
X-Google-Smtp-Source: AGHT+IEJpPDLtfjnd4rRpNf7Mq6ICRE2mqLlxArtMiDKAPLb0KG7ry0SYr/F5fEDilmWGAF0JH3lVA==
X-Received: by 2002:a05:6214:3004:b0:6a3:3d77:f7d8 with SMTP id 6a1803df08f44-6ab8098e47bmr19491846d6.6.1716386439922;
        Wed, 22 May 2024 07:00:39 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f205d7dsm133994676d6.132.2024.05.22.07.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 07:00:39 -0700 (PDT)
Message-ID: <7d84912f-7bc4-4376-9f13-31fae16013f4@gmail.com>
Date: Wed, 22 May 2024 09:00:37 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: document Novatek NVT touchscreen
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
 <20240521-nvt-ts-devicetree-regulator-support-v1-1-8d766c639dca@gmail.com>
 <6f22e42d-8a06-4c24-93bd-25b6ac141cea@kernel.org>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <6f22e42d-8a06-4c24-93bd-25b6ac141cea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof Kozlowski,

On 5/21/24 11:48, Krzysztof Kozlowski wrote:
> On 21/05/2024 14:09, Joel Selvaraj via B4 Relay wrote:
>> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>
>> Document the Novatek NVT touchscreen driver which is used in devices like
> 
> driver? or device?

touchscreen "controller" would be correct I think. I will fix it in v2.

>> the Xiaomi Poco F1 [1]. Also, include the devictree binding file in the
>> MAINTAINERS file.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9
>>
>> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>> ---
>>   .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
>> new file mode 100644
>> index 0000000000000..7839c6a028e4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nvt-ts.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Novatek NVT Touchscreen Controller
>> +
>> +maintainers:
>> +  - Hans de Goede <hdegoede@redhat.com>
>> +
>> +allOf:
>> +  - $ref: touchscreen.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - novatek,nvt-ts
> 
> That's too generic. Looking at your driver change, it is not even needed.
> 
>> +      - novatek,nt36672a-ts
> 
> Eh, we have already panel. Why there is a need for touchscreen binding
> (binding, not driver)?

I am not sure I understand this correctly. Help me a bit here. For 
context, in mainline there is an existing driver for the novatek nvt 
touchscreen controller. The driver did not have devicetree support. It 
only had a i2c_device_id "NVT-ts". I don't know what is the variant of 
that Novatek touchscreen controller. To use the driver in Xiaomi Poco 
F1, I introduced a devicetree compatible for it "novatek,nvt-ts". The 
However, the Novatek touchscreen controller present in Xiaomi Poco F1 is 
"NT36672A" which has a different chip id than the one in existing 
driver. So I created a separate compatible for this touchscreen 
controller variant "novatek,nt36672a-ts". I used compatible data to 
differentiate the two variants. Since there are two variants, I am 
mentioning both here.

Between, the chip_id and wake_type are the only values that changes 
between these two variants. And these are only checked during the probe 
and is not used anywhere else in the code. If we remove this sanity 
check during probing, then there is no need for two variants and we can 
just keep the generic "novatek,nvt-ts".

Kindly let me know what is the correct thing to do here? How this should 
be handled? I will be happy to address it in v2.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  vcc-supply: true
>> +  iovcc-supply: true
>> +
>> +unevaluatedProperties: false
> 
> This goes after required:

Will fix in v2.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
> 
> 
> Best regards,
> Krzysztof

Regards,
Joel Selvaraj


