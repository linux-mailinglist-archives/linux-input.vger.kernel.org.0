Return-Path: <linux-input+bounces-14602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CCB52C98
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 11:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1CAF3BF583
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 09:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D082E7F3C;
	Thu, 11 Sep 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ve/RhH3I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030E2E7BAD
	for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581433; cv=none; b=TRs8oPNd/+XMAZd8b0vvEh8S7hTHRpzONDBLUvB9k1bZBQ8xya9t3tWwKZRrosaaOOfa8lUqfr0/43Jw5GGwr/oCmlI1XS+sOiW4ExtHqZkjuK3tuvVHp5tx64mHADiub1BZaVSyVDRIyJhamhY3+G8ywv/er615+5EOhGvbVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581433; c=relaxed/simple;
	bh=hCP36bK1g9n9JwzH/E4TTsuW0vEKFlD6ISNKD8iTu7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sl4JJGZr3idzr8H/J0JUNbqq5XZn6NbAmuu5nlKhiK4Agt2o83TG4xYA6hFTR6rpHOgjok5PwBctIJRrN1tAEBBdoS4ji2kzm/JTUT1c1F2apQLEJuziRspONlJQw0Lcnq4ATGPki3dhV82aMSf9GMXvE5TrwdKa8vWaaWvtf3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ve/RhH3I; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a16441so68156366b.2
        for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757581430; x=1758186230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH2lZuXo03ctkShYVxwCkSz8K8DFjnMKF7VnIGCqCAs=;
        b=ve/RhH3IzBJ6FGR5F8DoY4LpP/4oXZSNohQwgUrmxJf5gquIYt4S3ZKtfVWyp/9K03
         2+1pNw5Cw8WxaIH0Fdq2UK+E52eu3WxxkL47XTR5HG5wYyxhQud0pSzUXJuGdVClIfZx
         lga1PQPJrD4y28OxNcaHF0WkVkhjTGKGR29l69YlB/AItR5nIF1N8Dwxmo2LKZsuvZkT
         TsjJ6gffaAfp79Omig9C+QAsZ2Fg0dbpaqBJEPyKFe/G6oLD9GbiOnUZzATanZl0ipeq
         cT2POJINHQybith2FtPNQUWet9rR3XSk+dOiZ4cDwOB9t7MLubcaIbLx1zjvLNVstLCc
         NyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581430; x=1758186230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH2lZuXo03ctkShYVxwCkSz8K8DFjnMKF7VnIGCqCAs=;
        b=rauilSgBYEiPRh+eYQa7C4EmFrRf2xKsEeXfL9XkKpXGf52WBfRmETNJqiAscEpkHm
         5/GM+uEaUxZ5xt9Sbl0zBGO9mD7DZDb3Fljn7EE+Mel+ngxwi3LSXozohYak5Wgitr4/
         YeNj4srf/8ftVbKMfVlv6esw1QLo48ykTDhGULrjEm7V1EzApdqhrqLw+ncHgiB78qTV
         R/We9AX1F/j8WqBEAGthmBHJMDyX2hL9yxnmVWaImfM9HQgYkEgBTwbwpbrmlmbkP59v
         mvwDnFCGDw+8BMXJItajHVvhN985/BLgr+DtuvNXNEC8Gk4Q6FbAXv0w0/Fz7HvSxxca
         D3Aw==
X-Gm-Message-State: AOJu0YwByehxirvMD0CvwwcTwNS4bQe7HTFMz6LPAxQdJICt5N88JMdM
	O/cgraEXjmvZobet7Uu8jj9d9XxE4gKIfZm9TX9Hk4YASsGeUrpF2vTa9GkArrDE0+0=
X-Gm-Gg: ASbGnct7ebfzvKBnZ94MYHo8217jCgQ5Pn50ASwWvhfPokTfzmSTOuuy7Eeh5w3ybIv
	MarJf9elGwQElcLSZFFzhyXOHCRhB1Tjue7w10tabY02C+JkZ8NGlnmIP9esmrU/TDhQVqCXrLK
	mTwaGak6zLmRtrBIh11FB0JlWC3iHXLZ9njxDcGbZHhdpfgKCGf7vkm96QKHvYFuKWChLaAEHhK
	ZkdEMscICbRfae1Q7V8syI8XN1OHRu2+3BEmkk5YyhMQjaQFGs+2SaLcr4Jkoo/OtspiEpjVyUH
	xJNedv/vxcSO1l47l+pM/g9sxDaiUc9Q2TuL1sjvzg1MWe7VS23ni6u0r9aLIjj6etcbqEJF/yn
	7zsCafr1Sgcpv7ydXSV02WvC+/RnCnZlO7OH3OvtOjQmSnVwcYdt922yyQCPtiBleStoQR/Z+0i
	1X4X+9L0rbEXyICQI=
X-Google-Smtp-Source: AGHT+IGYHbX4bxEzpGBoE8RL4pjvEVDxxw5P1uMDH0ZHNzEA8Z93mbkTCDQqnz0BR+i756UDdlA/Ew==
X-Received: by 2002:a17:906:1b5a:b0:b07:88cf:8ced with SMTP id a640c23a62f3a-b0788cf8d09mr424305966b.65.1757581429806;
        Thu, 11 Sep 2025 02:03:49 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd0fdsm87715266b.50.2025.09.11.02.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:03:49 -0700 (PDT)
Message-ID: <52b72e63-9aa6-401f-8d7e-397fe0c89dca@fairphone.com>
Date: Thu, 11 Sep 2025 11:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add support for Awinic AW86927 haptic driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/25 16:31, Griffin Kroah-Hartman wrote:
> Add devicetree bindings and a driver for the AW86927 haptic driver, and
> add it to the devicetree for the Fairphone 5 smartphone.
> 
> This driver does not enable all capabilities of the AW86927, features
> such as f0 detection, rtp mode, and cont mode are not included.
> 
> Note: This is my first driver I have ever worked on so if there is
> anything I can do to improve it please let me know!
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
> Changes in v3:
> - Removed obsolete FIXME comments
> - Adjusted Error handling to fit best practice
> - Changed formatting due to feedback
> - Removed obsolete terminology from patch subjects.
> - Properly credited reviewers
> - Link to v2: https://lore.kernel.org/r/20250811-aw86927-v2-0-64be8f3da560@fairphone.com
> 
> Changes in v2:
> - Changed title and fixed license of devicetree binding
> - Fixed typo where the 'm' in 'ms' was excluded
> - Changed error handling return values in driver probe function
> - Link to v1: https://lore.kernel.org/r/20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com
> 
> ---
> Griffin Kroah-Hartman (3):
>        dt-bindings: input: Add Awinic AW86927
>        Input: aw86927 - add driver for Awinic AW86927
>        arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
> 
>   .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  18 +-
>   drivers/input/misc/Kconfig                         |  11 +
>   drivers/input/misc/Makefile                        |   1 +
>   drivers/input/misc/aw86927.c                       | 854 +++++++++++++++++++++
>   5 files changed, 931 insertions(+), 1 deletion(-)
> ---
> base-commit: 3624e9a34b36d64a7037946eda28ae9599363a3b
> change-id: 20250804-aw86927-9dddc32fcaec
> 
> Best regards,

Hi Dmitry, did you get a chance to look at this patch series yet?

Thanks,
Griffin

