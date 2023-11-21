Return-Path: <linux-input+bounces-174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431767F2DC9
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0C3D281491
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E3546548;
	Tue, 21 Nov 2023 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/DgohbM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418C3D49;
	Tue, 21 Nov 2023 04:54:54 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cb7951d713so1727287b3a.1;
        Tue, 21 Nov 2023 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700571294; x=1701176094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APDg0JFczp621Nji+tuh/Qlng7+/H1U7mmX2HOaGoF0=;
        b=T/DgohbMfHGqCauD9/iwE3l22qXiHqShX0T8n7n3OgdTUf+dByouwfG4D1yA88UggH
         g2Bez5CO6m3OHVlOvsfck9o4ipsS6le3/fsc4jQGcw0fJzzcCBKs4RzV+J3ILKEcsfMU
         iRM/x1A6+l89ec+Zk6o12LapM8I44+EfVbHaU4Xpn0UXvWq1V3jRxOxBbiby+Ikp0Nqx
         ZgblVIPZYSV8v+8TZS+MZsmmqH353PQ/sp29VFXa0MTCYe/suy3MlHqQn1YmHQUXwTBX
         QjAuEVUs3TYcFUzvkyOS8Hf5vrBUL11pWbfmL32OOm3nzzZE1ierGEJemyeQRpm8WfzT
         6pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700571294; x=1701176094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APDg0JFczp621Nji+tuh/Qlng7+/H1U7mmX2HOaGoF0=;
        b=m/2lrwPK8tVIK+ZiMwvfvNF1/o2rPC7rUJZcoykeHJ8eSL830of6bP1sS/OEN6UTiY
         S/F8v/qlZOpqm/FBDefmu5dcpf60PYR/+fZ+e9S8qBFuOTLMdfwjxnnfnqKu6uHfUVHX
         LUDQ5A9+M+p9X1QpXNmp6rqXKeqak7YeiHQ5P2yU3+lWk7czdJpYOCcpKjno8XYBL7XU
         jGM9D5VXG8DFK31AByRTtg+X+YNn1wJJRiMycFRysOEyjYlVQCVX9mqdxWU9vHD78KEh
         d7U7F0KBBpx33SfOiXAPWzw0T5dh20IArv6kMwCZfcgrT1hNXQxigDf3AO21zv8yviHw
         nzaQ==
X-Gm-Message-State: AOJu0Yw6Mf69Wy6Do3C/z/LjvQoV6M35CFoC18mDEsP6kyWcysFI8qlS
	NRlvXM51thxUGM2DjAi+aro=
X-Google-Smtp-Source: AGHT+IEngvPw3d1IsOspFoHzqgu/DzbyLuPYIK3Y1V0BGB6MjVoi327NxD54joKaxDn6U5QAvanzfA==
X-Received: by 2002:a05:6a00:1486:b0:6cb:440c:1f60 with SMTP id v6-20020a056a00148600b006cb440c1f60mr3775560pfu.13.1700571293618;
        Tue, 21 Nov 2023 04:54:53 -0800 (PST)
Received: from [10.3.171.174] ([103.4.221.252])
        by smtp.gmail.com with ESMTPSA id u9-20020a62ed09000000b006b8ffc49ba5sm7828157pfh.38.2023.11.21.04.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 04:54:52 -0800 (PST)
Message-ID: <bb6d239d-0fb9-4353-b262-92810861b8e8@gmail.com>
Date: Tue, 21 Nov 2023 18:23:10 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeff LaBundy <jeff@labundy.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231121123409.2231115-1-anshulusr@gmail.com>
 <1bd2a6cc-aa01-4370-be19-88ffa524086e@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <1bd2a6cc-aa01-4370-be19-88ffa524086e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/23 18:22, Krzysztof Kozlowski wrote:
> On 21/11/2023 13:34, Anshul Dalal wrote:
>> Adds bindings for the Adafruit Seesaw Gamepad.
>>
>> The gamepad functions as an i2c device with the default address of 0x50
>> and has an IRQ pin that can be enabled in the driver to allow for a rising
>> edge trigger on each button press or joystick movement.
>>
>> Product page:
>>   https://www.adafruit.com/product/5743
>> Arduino driver:
>>   https://github.com/adafruit/Adafruit_Seesaw
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 
> Previously you sent untested patch. Did you test this one?

Yes, I have tested this one.

Regards,
Anshul

