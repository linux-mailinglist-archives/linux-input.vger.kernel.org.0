Return-Path: <linux-input+bounces-491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08238804DBF
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 10:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AAC61C20C33
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491073E475;
	Tue,  5 Dec 2023 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTIPZSWv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2BC9B
	for <linux-input@vger.kernel.org>; Tue,  5 Dec 2023 01:26:45 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b397793aaso33257215e9.0
        for <linux-input@vger.kernel.org>; Tue, 05 Dec 2023 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701768404; x=1702373204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNHBZx5D35Gv0zasV+7VIgIkMHB/ghsR6r8y0f+6RxY=;
        b=eTIPZSWvOJWBXHCr5FIJ8uoofp4jzGODOX+4+Hx9JU5liIBLnGXACz5vo/Tlk4n/NZ
         MMRF6zXZufJ5CaZQDOvXjhC8pD1r5M8Gaz9yvhQspCw+BOwpsIx+R2BPwDDJ0bllRdJa
         t0Oxgc9VrVs8PkEPsHV1M50Hi3/9V6wTwta0PvwCa48oRQTId0FaUAEYUEM+lxyIfTIe
         oKfAFsY+gWEhxAVF2wUW7XeKkrjHO/Hf4eyFd80xwOghV/nBlA3dBvxmIalfQEx15qHp
         sf/cWn53436hWmqJpfSqiBzXFvwE+XujSv8/h8RYp69j9Y4VkL5vfCxEhNc3FwHdDjch
         DiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768404; x=1702373204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNHBZx5D35Gv0zasV+7VIgIkMHB/ghsR6r8y0f+6RxY=;
        b=a9cxxq+hVRG8u8gC6PEMh63gI2+fS/eEIfcPs/UxDYqbaeL6v1puLJgTgayPpQ7/UK
         6lwnzvTJLUE1oIhsItxn467reYqzj7IyzAOV8IsqZHDNuU6JKrCB1FDLvs1oJ8sE7Vd6
         G+8VtsCSO1fNvVd9OenQtB5CCCA4OKUhEu5cBTmN8nLD+NpgwTyG9w4OSBVxhJ3LiTZp
         nex4PTRl8dLBi9wON3/ljvR4+Wv6EsPrAxD96PAr3JV6h1tl2wuzatKCNK2BpSB2SqYp
         aFynp21ZCYfWNMpS0Dx2lK7jlLBlnSrSQvQ1quIxvjfMPkWtJMa/zRDCqDHj5PwMD4jd
         DhuA==
X-Gm-Message-State: AOJu0YyMwMZTN2XUuTwEk1nTd0jy0uaWDT32GA8qJzYiEwJSlzGExsjR
	DYf9O9z03c28yXx9RPjUdJkpKA==
X-Google-Smtp-Source: AGHT+IGnnDEYV3BttcrF3pmj3Fiyhe5p5UwmqCSZI+LpNdI44X/YQAWmCn739KEwjT6xgxP3UJfDNg==
X-Received: by 2002:a05:600c:35c6:b0:40b:5e26:2371 with SMTP id r6-20020a05600c35c600b0040b5e262371mr331586wmq.34.1701768403830;
        Tue, 05 Dec 2023 01:26:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b0040b34720206sm18034665wmb.12.2023.12.05.01.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 01:26:43 -0800 (PST)
Message-ID: <1a3ce8a9-a9f0-48fe-ac1b-aabbe58967a8@linaro.org>
Date: Tue, 5 Dec 2023 10:26:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Content-Language: en-US
To: Kamel BOUHARA <kamel.bouhara@bootlin.com>
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
References: <20231204140505.2838916-1-kamel.bouhara@bootlin.com>
 <20231204140505.2838916-3-kamel.bouhara@bootlin.com>
 <3ce65c3a-e781-4ba3-8436-8379e8e94d6b@linaro.org>
 <8ac4a9924e1d3b98c9f74dcb07b044b2@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8ac4a9924e1d3b98c9f74dcb07b044b2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2023 10:17, Kamel BOUHARA wrote:
> Le 2023-12-05 09:15, Krzysztof Kozlowski a écrit :
>> On 04/12/2023 15:05, Kamel Bouhara wrote:
>>> Add the TouchNetix axiom I2C touchscreen device tree bindings
>>> documentation.
>>>
>>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>
>>> +$id: 
>>> http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: TouchNetix Axiom series touchscreen controller
>>> +
>>> +maintainers:
>>> +  - Kamel Bouhara <kamel.bouhara@bootlin.com>
>>> +
>>
>> Why you do not have ref to touchscreen? Is it not a touchscreen?
> 
> The common properties are not used or applicable here, should I still 
> ref touchscreen ?

Why they are not applicable? Do you get the panel coordinates and sizes
from device registers or are they fixed somehow in the controller?


...

> 
>>> +    description: I/O power supply regulator on VDDI pin
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>
>> Supplies are usually required. Devices rarely can operate without  
>> power.
> 
> Indeed, can I still have them optional in the driver ?

Yes, I comment here only about the bindings. Bindings are not related to
your driver, but to hardware.


Best regards,
Krzysztof


