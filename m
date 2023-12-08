Return-Path: <linux-input+bounces-612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC880A1A6
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 11:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 475BEB20B9D
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 10:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A55D13FFB;
	Fri,  8 Dec 2023 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tzud9Nmz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658DFAC
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 02:59:17 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54c1cd8d239so2703720a12.0
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 02:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702033156; x=1702637956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omYO2tr3IF6E4n32adcr8uRRuSQKDOkBvgneGfamVak=;
        b=Tzud9NmzgzD/SKH+Ka8fY3z68JW51EJhx0D+LkJAgOvyhfiEaM2xvgqlG/wiV8u6S2
         4X3+SaLFTZWjmeO91A9+EgVdU3AGsPDJ31J+0fgC6eOIgNexYsc1TbNZCdP3/W2OrxwW
         UHCHoBFoBeCh5ZJHXL4Z0yf+ANV5B4DpkUc0O81PoK6w886dRC/kpANsO4iLmrar0dih
         GxhndUuGRTFPm3mQNvTfidIIIVgfGYggYqhtL2t2S/1LujwmxrIg75RqsLczW8q6Xgmn
         dw5qoj4xVdwmgMwdqETk1E2bxde3NG7YOKMN4a+re8KzYs/wvwjEr1uJYOIqCp6Eppa4
         s16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702033156; x=1702637956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omYO2tr3IF6E4n32adcr8uRRuSQKDOkBvgneGfamVak=;
        b=YTq3lre4UX+STLEyvvZD75PUlofVwByJ6oS7ek4BKaD47Q2oyHRjNkF5Sbx2K7HQbT
         gdvUkN5rvn2xRm5IrjyT5DY2247acCJaz6dC1TVIMOAo+tMCk3iDd7fWQ9Cs1iBPXekD
         8fIKn66+ZffWbv3OvQhwPkr4cXDC5/gh+zl9wz7husFOSUf5lo0ucB2Py6CcE1GnbPz6
         wfUMLPqkjw3vrfwqIJgNroZ6Zst3eUwmkYfinH/yGY35i1+6zELnnxehCxyKwnQB4cJo
         yVCtqqd6iPAYh+jUhy1Ee5BE5I6JF/Wv5pisrbP5lasibW7mlzGxm+4HXK2Mk4sBwNSJ
         Knag==
X-Gm-Message-State: AOJu0Ywymbi3ldYn+8vMuaKxivTnW68tP//ryU95iNZEAKR39UYyaTY6
	43i8IWxmatDfqIKq1SP4jBJ+0Q==
X-Google-Smtp-Source: AGHT+IHLMh/0fUGSkVaEp+O0dO+girFxm/mSLVqsIuJ+VSQQolg1rY6vT0e3wKe8dbezFXrRrgdGaw==
X-Received: by 2002:a17:906:caa:b0:9e7:8ad0:a471 with SMTP id k10-20020a1709060caa00b009e78ad0a471mr1139887ejh.12.1702033155837;
        Fri, 08 Dec 2023 02:59:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vc12-20020a170907d08c00b00a1d4a920dffsm860749ejc.88.2023.12.08.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 02:59:15 -0800 (PST)
Message-ID: <c6e70e3a-5108-4327-88e2-038ff9a0c35f@linaro.org>
Date: Fri, 8 Dec 2023 11:59:13 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Content-Language: en-US
To: Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231208075037.114598-1-anshulusr@gmail.com>
 <c8e4d495-1d4e-40cb-b599-5a01f75f9257@linaro.org>
 <61053bca-6a6c-4eed-90f8-df43f7c804cb@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <61053bca-6a6c-4eed-90f8-df43f7c804cb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2023 11:33, Anshul Dalal wrote:
> 
> 
> On 12/8/23 15:57, Krzysztof Kozlowski wrote:
>> On 08/12/2023 08:50, Anshul Dalal wrote:
>>> Convert device tree binding documentation for GPIO attached mouse to
>>> json-schema.
>>>
>>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> You cannot have v1 being already reviewed. This is some newer version.
>>
>>> ---
>>
>> Missing changelog.
> 
> This is a copy of an earlier patch[1]. Since the patch had been sitting
> idle for past 10 days, I reposed it with the Reviewed-by tags added in.
> Please let me know if this is the right way or if there is need for a
> changelog.
> 
> [1]:
> https://lore.kernel.org/lkml/20231126103029.851742-1-anshulusr@gmail.com/

OK, then it should be: "[PATCH RESEND] ...." with a short changelog like:

---

Resending with collected tags.

...

(Sharing this for future, no need to resend it now)

Best regards,
Krzysztof


