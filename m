Return-Path: <linux-input+bounces-550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7A806D40
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 12:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB672281A5E
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 11:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0080D30CF2;
	Wed,  6 Dec 2023 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INDI4F6G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C551BD0
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 03:01:39 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso567226f8f.3
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 03:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701860466; x=1702465266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7VWu46RJcWVBaO3VsBmAuO5ZqODdSZUgUmBKc59vt4=;
        b=INDI4F6GdRe3tYpNBWJAU40DCIrJAKidpfeGK68r35Ix38QvjXpKfYVN0LOuTOX/Xm
         8FoGNfZnPAPL/HBD3Eoh4V6I3+2i4noynBzb6mqCYVn/LBEHiDwYWOMVxoWtzNVe8XnM
         A/97HdcAy60IZCaBD6STYevm8HS8aQ29QW+Jy1zRH4HwR25Q7mufduVwnwdEc6NFPSLq
         paKc/ea4TAJP5WkfBmXW6R5CE52BdNOSTsLf46wPlrFFApaJ4Rnly08jN1t9qmCE41NW
         3rkk6mmV+DBrZcXI4zQgH9ZqVsbgmMgL3X7B3yjpNyehLs/X9fmXRE0jh2gBZcWTqcV3
         Ap0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860466; x=1702465266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7VWu46RJcWVBaO3VsBmAuO5ZqODdSZUgUmBKc59vt4=;
        b=OLxb60JnJvYKW3Xq8xs8HJCT/1I7wDAoSknqLymROf2/3kDQLcTcdciNUyIG3zXebG
         MmRC0fgOY7fYEg2qrFUbKDdJMloILE3vYhNhB6kaZdXb0bhuMhLEuv0iKlwIe436zLos
         bFEhjOl4uOELo0NkZKsQQouLWaL+ihCGrc8W8QKm7M6Dodgjd0LOWoNGCAfmAov5SdZq
         aPKYBA9Bcz9kVIvR49ykd61gB6AH5jeeMcGFh2ywWS/Ms2oGNvM04Ld0bg09WieR+2HJ
         vIvX7Vke4I10pT69Tn9U3OA6Lu8gBAsKclrozqwKh8XUu9/uVIBrVNNeQf+pcs5A2vpD
         bKBQ==
X-Gm-Message-State: AOJu0YwjALdO9lBfy6HKg/IGmcibMM2+GPwMeuuG91VvRtpK/3Zmnh/R
	Umv9dhbY56Zp+RdKtSPIPzmK8g==
X-Google-Smtp-Source: AGHT+IFJ4h7uhrpbkcPJAPfSbR2scO6garrpGpd5o2EOhJAO81DWTuGxrkeMgAyRPEqm5mww8jQCpg==
X-Received: by 2002:a5d:65c5:0:b0:333:3b0d:457f with SMTP id e5-20020a5d65c5000000b003333b0d457fmr185038wrw.218.1701860466400;
        Wed, 06 Dec 2023 03:01:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id ba18-20020a0560001c1200b00333479734a7sm8669148wrb.99.2023.12.06.03.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:01:05 -0800 (PST)
Message-ID: <f7e1b02a-f8fe-45d4-8bed-2773b68335f9@linaro.org>
Date: Wed, 6 Dec 2023 12:01:05 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: Add Himax HX83102J touchscreen driver
Content-Language: en-US
To: Allen_Lin <allencl_lin@hotmail.com>, dmitry.torokhov@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231206103546.808680-1-allencl_lin@hotmail.com>
 <TY0PR06MB56119F0D60142F4C1435767C9E84A@TY0PR06MB5611.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <TY0PR06MB56119F0D60142F4C1435767C9E84A@TY0PR06MB5611.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 11:35, Allen_Lin wrote:
> Add a new driver for Himax  touchscreen series touchscreen controllers.
> This driver supports Himax IC using the SPI interface to
> acquire HID packets.
> 
> Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>
> ---
> v1 -> v2: Fix kernel test robot build warnings
> Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>
> ---
>  MAINTAINERS                    |    2 +
>  drivers/hid/Kconfig            |    9 +-
>  drivers/hid/Makefile           |    2 +-
>  drivers/hid/hid-himax-83102j.c | 3175 ++++++++++++++++++++++++++++++++
>  drivers/hid/hid-himax-83102j.h |  923 ++++++++++
>  5 files changed, 4109 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hid/hid-himax-83102j.c
>  create mode 100644 drivers/hid/hid-himax-83102j.h

Implement review from v1.

NAK

Best regards,
Krzysztof


