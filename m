Return-Path: <linux-input+bounces-611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8380A120
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 11:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78051281A03
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DE518E38;
	Fri,  8 Dec 2023 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ni8Bhi8G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D114610C2;
	Fri,  8 Dec 2023 02:35:12 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c673b01eeeso1412574a12.1;
        Fri, 08 Dec 2023 02:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702031712; x=1702636512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkstX3w9e/qo2fPuZVECh8CFuxP6tqluCbnekESxGuA=;
        b=ni8Bhi8Ge4pDwjtbGayUd6MUG2fihGf4CZPzIcwk5ppMVtduxV9CZJWD28qn3dT7X0
         EmuEH6H2A1g2CAXqb61+GG2RIOFPs7L9lOYotTTeVqDw1UwlVE0M8qJ1de7YU2cZ1Dvb
         HUUJ911iTPRV+C1QOOkYt1s4g9qHT7Io6ANoxwy0PbWMdcU6RJBwwUnkT/D4ZGS8wzDr
         CjXygPqKN0o2a/wP9iV7XRerNc7LlE63vHh6MThbxzDdpKFSAfNOcPSXfzv7qNaohLh7
         OtD/pX3jasBNrFw1UjTNHL8DAotosip+b2AgkckOpbCSUK9paywFS8UO0hqrTwGZNzU8
         MBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031712; x=1702636512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkstX3w9e/qo2fPuZVECh8CFuxP6tqluCbnekESxGuA=;
        b=bQrrPMP3/T/Ojr2wWRe+BnFdwM8rGOsmwN7avUtpuT9x5Of7JEyAxffqJbkVFbA6c6
         rNtm6m6xoiIClhq66/aKkVwipu9dKmwSAR2+4RJmu3mNY3uDRY7l1FlHMk18ledrwpjs
         QoT/zkttYV72rQpT2YMVvv68rkfc2ApppVoWS9rZ7mqa9fGsK/IfqKTpVr6sUzv7m17A
         TPro/fLIdhFRwt1fnyN+NJuOOFErROL37CzCY+UjTml9tTasTTS6zgab2g5K3qIlrepj
         Ugc+loOnf1DvDeVfSQbyuKHs97XcHfdiGd5BiK3qQKUfJKXHCxdlO1/AMed5z0CCUffd
         VWUQ==
X-Gm-Message-State: AOJu0Yz1T//jeYZ64pag/OgnzP78xaxVDvIF6uG287tNOG9U4mWJNDPR
	sApqMasWykwoFelksBYjFUw=
X-Google-Smtp-Source: AGHT+IEhpNDojxW+0Ttl1fp4tHVdUq1V52TPsbSHLo5etmkQs5V52RtMAzIj20+8QJ93iT2CGJKy0w==
X-Received: by 2002:a05:6a20:e11c:b0:187:c662:9b7e with SMTP id kr28-20020a056a20e11c00b00187c6629b7emr4544880pzb.25.1702031712168;
        Fri, 08 Dec 2023 02:35:12 -0800 (PST)
Received: from ?IPV6:2401:4900:6277:8af4:45bc:8bc9:c94a:54d2? ([2401:4900:6277:8af4:45bc:8bc9:c94a:54d2])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902aa4a00b001b86dd825e7sm1351866plr.108.2023.12.08.02.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 02:35:11 -0800 (PST)
Message-ID: <61053bca-6a6c-4eed-90f8-df43f7c804cb@gmail.com>
Date: Fri, 8 Dec 2023 16:03:03 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231208075037.114598-1-anshulusr@gmail.com>
 <c8e4d495-1d4e-40cb-b599-5a01f75f9257@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <c8e4d495-1d4e-40cb-b599-5a01f75f9257@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/23 15:57, Krzysztof Kozlowski wrote:
> On 08/12/2023 08:50, Anshul Dalal wrote:
>> Convert device tree binding documentation for GPIO attached mouse to
>> json-schema.
>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You cannot have v1 being already reviewed. This is some newer version.
> 
>> ---
> 
> Missing changelog.

This is a copy of an earlier patch[1]. Since the patch had been sitting
idle for past 10 days, I reposed it with the Reviewed-by tags added in.
Please let me know if this is the right way or if there is need for a
changelog.

[1]:
https://lore.kernel.org/lkml/20231126103029.851742-1-anshulusr@gmail.com/

Best regards,
Anshul

