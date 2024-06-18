Return-Path: <linux-input+bounces-4448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9390D5A5
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 16:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53A50B2C566
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 14:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBEB158D88;
	Tue, 18 Jun 2024 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTDie1rZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A5158A39
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719624; cv=none; b=rym25PEYAgvNtftZQ1pROXRPnmAOMcFN6f+xBjt4fC1KUQLJzpvM8KTXNPPZ/8scYIteiBHhj2iVKe3LSFMJC+YhYtZAsyUtXFJbLhIO0aLzAlvAc4Q9TfYkezHfH2RKRs75MKtwWmSWoNxKIWcQsEVat+5lhJzNmDyQuznd2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719624; c=relaxed/simple;
	bh=Hbmv3XFMpSTJICmgDgzCN1gkqr2Z8G4rUOXR0h+8tB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+dOHY4jEC/Pd6MFBvKyn4cdL5UG/EWW8sHAdHRFvXujDLXcIkMM5IckdqWj4Fw2krcXl2n+98IDJfOGwwHxpPLpDuUIM9tUWQM9US3HAzf6CcmuSDurbFGUdHWEBYrez8mBF4rQsbYykHdI544+w8k1MkctLosEUVsHNpr3RC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTDie1rZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so64913501fa.2
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719620; x=1719324420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
        b=mTDie1rZDbPcRXKv2x+uaYRkLxIb1KXZXxguJF89CGrEoo5kduNje4eMTEqOrODAEF
         zgdR5eJaWRtBWo4yKF2cLvZbO6xHDY+HagLXPYtLSM1874pKcYRXdodqsInp2Q5zzScg
         xvlq0kBwM98kIDlTDbnSFlQDVkYXdrnIQr2L/MtuZRT8qMXc+d4tNsfxOXPNtC/DzInS
         WrxoCmaKPhJfZ6R8LDyhlCXP/GUuM/tU/huFgDUzUJSXB/082T9CBQN9Ns/4cL6O8zka
         ZOTvqnfR9+mFE9b5MmPksS/VqZEIiKhjDiWFO6nz3blInChKtGv/oj+2Dem24qYwA5dl
         jQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719620; x=1719324420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
        b=hBA6Gjt0TUu5kWpi6R2fB+36wLHoP4NmSA8FlCTZQhZJv2ck4ENKkaZ63zIRXA8KJq
         OA6dvZFUOqQPiptYu199rROHBz9Hj+6QdUAgOoOrpfWeSubY/DqDopa2kXRSEZWlINt4
         Ya5jEp5jmr3JhL1yU6yJL1S7ytPsoUYE4aTt+225zDwl7XYj/5w6o7T4m22pIz5ZeWex
         JgpcglalWFV3jtShz1rzcLDFU6eUnP0wWNd05U0Ftt2qGU3z4eV0tHDXipwOLEnNJA9d
         +BV3HdDU63JseoBr6mbkeukf36kPB+kCKLHUfhvb6OYZLCXZ7QK7galCSt20m8Kldi9T
         Xlzg==
X-Forwarded-Encrypted: i=1; AJvYcCXLfZ2VUVQsy+xz4xlhA7bw0WrMCzD0o7WSbqrsQ15RcYtv8+uAO7z2JuPxuY97/8x47FTeFO3S1kLQupg6MbZQtJyKNxJI0LUjWwQ=
X-Gm-Message-State: AOJu0YxIGJ1puSjahNLydagWIpMX16rC2cQUAFRFZU932hDeg32iobqh
	hp5mlIxklpTYbRdw3fsAXxPaE/XBiOWzPxsE/Hf3cVeWxSSIVOT36wRZgsgW/Nc=
X-Google-Smtp-Source: AGHT+IFJLofjUC4t74eowxJ2/hsKLGcRlwVabKgkrjURD4QDMFbmjNw63Vi/v4qqaIE7wwB4ATA/8w==
X-Received: by 2002:ac2:5de8:0:b0:52c:8289:e891 with SMTP id 2adb3069b0e04-52ca6e56efamr9347270e87.6.1718719620233;
        Tue, 18 Jun 2024 07:07:00 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28723dcsm1517734e87.151.2024.06.18.07.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:06:59 -0700 (PDT)
Message-ID: <51ee3d59-cca9-45d0-8a0b-31bc707b22cd@linaro.org>
Date: Tue, 18 Jun 2024 16:06:54 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] arm64: dts: qcom: starqltechn: remove
 framebuffer
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Remove framebuffer because a panel driver introduced.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Not sure if you want it gone, this still provides framebuffer output
for the first 1 second or so

Konrad

