Return-Path: <linux-input+bounces-743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B1810A9A
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A81CB20DAE
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD54510A08;
	Wed, 13 Dec 2023 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGhhSFu6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF2EAB
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 22:44:38 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c3f68b79aso44900535e9.0
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 22:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702449876; x=1703054676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sqb9HLXRupmLPjMGImMDXLcC75oDDVzgVthoSDs2V7c=;
        b=EGhhSFu6CuhvZgDCWWrsQmoVWwZtqvW+X+UxhmF++9vybZVvTXBedF3/AUG9rYw4dh
         mspfosdCapFGTZ8jWDFnS/E7E5tMl+DDVfE1N0UsArLZDIrlgAqv3aG2Q1GHG0NK/Frp
         EUSQ4HyIlCXe9FyOGJNPCRu0XYbNVMSUwWjze54w6AeT5VCLjyLpuaNyhpjhr27QWtMt
         2BQDnGREsvbGSVjffwjcoJ5oVLfY3f2ik53M68Yr/QOt44H6zgKwe4GzJa30I1V72HrG
         4NrRUYlRzeIrQW+v4mIiE/au1tbmeFVqYbT+d1aBgJ5S4KY302EYkqKu52eBKieO19BF
         UcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449876; x=1703054676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqb9HLXRupmLPjMGImMDXLcC75oDDVzgVthoSDs2V7c=;
        b=jX4/DV+2q4M9ATHvIt3KA3n5Pi02tJ/yNPlS9Q1zkowx+uLPZBYXcCuZyAEQjQL5Nu
         lTPt99LgEeEKXMW+2UbxSxKa00FTST0m7dWaIS+V3Akrr0+a8fv5D99Fi10eOMzPOju4
         D4YzNMrwsP6NsQkYN81PJ/fOK4xZHfmONB0oL2PjelmWLc91yd/jf3rmz1skrGO0bSzx
         dAnnJYFru7RREioQ/wwQLzhNC1ftVjFBj2calCxeiGGJxjOF5Rx1eP7bTNofBTyyu0WG
         5WjeKI0ZurU4A/uCDf25q1pyFQNOJ81vApdHr8Ai3fBWGAXWYrVSmrFoNSn+AGgr3S92
         qCww==
X-Gm-Message-State: AOJu0Yxk4oaceQ9vF28h07jKERbw1I+Rjsqj5Kst20zejd9FwVHKlbom
	1SeriPt0GSHgR7vRqCecz1t/6g==
X-Google-Smtp-Source: AGHT+IG3ik2GzEaveqhuLhT5xJoGFxr41LSj/+ZmVmVb2BxAv9TceemlPW6u35BKtYQA7zvFirsksQ==
X-Received: by 2002:a05:600c:444c:b0:40b:3d6e:16b7 with SMTP id v12-20020a05600c444c00b0040b3d6e16b7mr3917555wmn.33.1702449876648;
        Tue, 12 Dec 2023 22:44:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id w12-20020adfcd0c000000b003334010a849sm12356765wrm.109.2023.12.12.22.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:44:36 -0800 (PST)
Message-ID: <ce238248-6bac-41df-94ba-b494c5c09631@linaro.org>
Date: Wed, 13 Dec 2023 07:44:33 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 Jeff LaBundy <jeff@labundy.com>, catalin.popescu@leica-geosystems.com,
 mark.satterthwaite@touchnetix.com, bartp@baasheep.co.uk,
 hannah.rossiter@touchnetix.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 bsp-development.geo@leica-geosystems.com
References: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
 <20231211121430.1689139-3-kamel.bouhara@bootlin.com>
 <20231212-rework-bounce-f4d9d12362a4@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231212-rework-bounce-f4d9d12362a4@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2023 17:57, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:14:28PM +0100, Kamel Bouhara wrote:
>> Add the TouchNetix axiom I2C touchscreen device tree bindings
>> documentation.
>>
>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>> ---
>>  .../input/touchscreen/touchnetix,ax54a.yaml   | 64 +++++++++++++++++++
>>  MAINTAINERS                                   |  6 ++
>>  2 files changed, 70 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
>> new file mode 100644
>> index 000000000000..cbdf48fc538b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TouchNetix Axiom series touchscreen controller
>> +
>> +maintainers:
>> +  - Kamel Bouhara <kamel.bouhara@bootlin.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> 
> Weird, you add this ref here but do not actually allow any properties
> from it since you have "additionalProperties: false" below.
> 
> What's the point of its inclusion?

It still brings the type of some fields or the constraints. However need
of specifying "poll-interval" already points to missing
unevaluatedProperties.


Best regards,
Krzysztof


