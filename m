Return-Path: <linux-input+bounces-3792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCB8CCFD8
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72DFB1C210BB
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 10:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0220013CF82;
	Thu, 23 May 2024 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ7xxNQt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFB54FA9;
	Thu, 23 May 2024 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458616; cv=none; b=Cq3yWkPhZGlOSr06ujPOLyTIyCghSfkStRGtXEeEXcOo773nI2SBV8y7aigm6+lKOqWM9D8BjwyGo4Ik06gSSDtb4Q4WVY/fkoayNYBl2KywCqPyllErdZ2himpGkR1rU0z4SA7TuYRgqTKt83PtI9U67+44EXa2XAg8X7ghzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458616; c=relaxed/simple;
	bh=B4htPf5xVGqwwBiDxnPNiauy0HwH3xHECMfV7BHwozY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfmycfeNGOwElsQ+3726YXsCrmCvXwa+TDelcQA7DXqa8wU5RWF2zPQ8iJiCZymoytsqYVeNYIile0/TEHVikajnnMMWR67goSDuuLc5kEgj+YJHUVfTLeA6DTWOYr7VQA402vmCAxfF6uSvZH3tOup7IHaqWVYGmz9YQwGMZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ7xxNQt; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b281f0d06dso797841eaf.0;
        Thu, 23 May 2024 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716458614; x=1717063414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQx+LcYS09PLD4Y4zGUC2HmR9UsKcG3BWLMiJQmSWWY=;
        b=PQ7xxNQtjGIXnEUGbwdDBR7gpZ2qg5ke9N+vE4dvyB5p4FyI4l6Ddij7IKVlXayofC
         Mmfg9FAO3D25KWtD7YtnfxlhW80aW6LhCSnzGNTHndR2VoTctHjdqMyU5NnyaWjxnMms
         SowiNbhCL0yjL3GZBVCmOCtjtTOy73VBhk23ckCcP8b11piVjaUHpk/6SxR++LQBXg0s
         +Wste+bVnAw5/wx8MIIS+Ks3td5xPvKtjVAHKAOEIt0VPt7Gh0iVj4tYc0gdpxfP3MjH
         wnGB9gx6nw1xE3Pvltci5j9vpwd23t4wPYoGnDXc7AI5H76ZbCooD4T+4TxkB2Xw9ncS
         QD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458614; x=1717063414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQx+LcYS09PLD4Y4zGUC2HmR9UsKcG3BWLMiJQmSWWY=;
        b=wDryOO4DFN1N0FmH/AK0ajLIEai2EJBY1GTMHPCtUQP8DmcCpPaiA8G4tGMq9IugSz
         pkSZnfcaLr2u31eZU26uVH+KTsa9IHxs8Ajcz6BU7xgDj+PHQRg3RDmogT5dnun/qJf5
         6Qkk/RP2pawBj/hZDL1CG2Iau20fKdxL3v9Gr5t97GJquGR/1VxdsHELKVnZnd6LaiGv
         FIuvceZDG+xDvQ2TLG2OS7S7Wv7Z6GceeLau0geCkZCL8ga1CIbq4yFCqqwWM9P1BbOi
         ZA2GbqHRhc2nrZiO68LoSqlebqfgC/cAx9En9tfp3P5H0HzqzBdNXGu+cotV//rSSqBH
         0cTg==
X-Forwarded-Encrypted: i=1; AJvYcCU9QSImN+vTXOGAcKpCHcZxqexwjYLBj/iikP8Uy5xeCgaNx4jWTKCvgXyqhi05tO67+oWOCfvplamHT+Gzfm/0rFAaBPUnxSTu4DmZFMLw+U9iAqxWcFuge4EMJkJDb4NUUhpV7wC5vQ==
X-Gm-Message-State: AOJu0Yysrx1oBXXBvhAMzqFQ2Pb7+BeJju0NI+c3HO9PsuflYwIH40YZ
	QuLxICa8FzI2jXbWIQcLOLTywTePIG6blxzIXQwy2LbTHgnUp7AH
X-Google-Smtp-Source: AGHT+IE3AX0RgKsULxVNb/QunUqi3o/GN0pSoCZQmWAZYBCQadqwCr+epwhZuOeA3sjqRAz15zCQPw==
X-Received: by 2002:a05:6820:2585:b0:5af:be60:ccdc with SMTP id 006d021491bc7-5b69e0eda3cmr4794743eaf.0.1716458614445;
        Thu, 23 May 2024 03:03:34 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e0bf64844sm154398411cf.62.2024.05.23.03.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 03:03:34 -0700 (PDT)
Message-ID: <f613ad78-9e87-4ba7-b944-b1f11ec5294b@gmail.com>
Date: Thu, 23 May 2024 05:03:32 -0500
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
 <7d84912f-7bc4-4376-9f13-31fae16013f4@gmail.com>
 <6635cbee-be58-4c84-9caf-309866f1002b@kernel.org>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <6635cbee-be58-4c84-9caf-309866f1002b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof Kozlowski,

On 5/23/24 01:18, Krzysztof Kozlowski wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - novatek,nvt-ts
>>>
>>> That's too generic. Looking at your driver change, it is not even needed.

As suggested by Hans de Goede, I will fix the too generic issue in v2.

>>>> +      - novatek,nt36672a-ts
>>>
>>> Eh, we have already panel. Why there is a need for touchscreen binding
>>> (binding, not driver)?
>>
>> I am not sure I understand this correctly. Help me a bit here. For
>> context, in mainline there is an existing driver for the novatek nvt
>> touchscreen controller. The driver did not have devicetree support. It
>> only had a i2c_device_id "NVT-ts". I don't know what is the variant of
> 
> I just got a bit confused that you add another binding for the same
> device, but now I see these are different interfaces - DSI and I2C.
> 
>> that Novatek touchscreen controller. To use the driver in Xiaomi Poco
>> F1, I introduced a devicetree compatible for it "novatek,nvt-ts". The
>> However, the Novatek touchscreen controller present in Xiaomi Poco F1 is
>> "NT36672A" which has a different chip id than the one in existing
>> driver. So I created a separate compatible for this touchscreen
>> controller variant "novatek,nt36672a-ts". I used compatible data to
>> differentiate the two variants. Since there are two variants, I am
>> mentioning both here.
> 
> Just to be clear, I don't care about driver here but hardware. You have
> two separate interfaces on this hardware - DSI virtual channel and I2C?

Yes, there are two different interface in the hardware. The display 
panel is connected via DSI and the touchscreen is connected via I2C 
interface separately.

> 
> Best regards,
> Krzysztof
> 

Regards,
Joel Selvaraj

