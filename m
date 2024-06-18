Return-Path: <linux-input+bounces-4447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82C90D586
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 16:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C63B311ED
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 14:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CD2179955;
	Tue, 18 Jun 2024 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgk1EWoC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD15179652
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719588; cv=none; b=gHy8gdjk+owyVyuGIc4r7Gi6d5heCy+IuY4gTX0TKvXnziao2V9mLvYNbdjokRd0SfL3zgO1AI/Z/gprX80BA922Fc9TqCEA48jf4JtnyoOiUncZcYV+r8Jrfov2FKeVff2Rh7J2EZVS8vNhXwxSyv+FEL4ccw6Txg8pxxietZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719588; c=relaxed/simple;
	bh=7hLqheXnE9W0qWhH3a25KKsYl8gJBb+w+/flsviwYBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nugzj1RoHm28aH9C+tvgvDUamUGTTtk1f8S/GGOGI9cxCqxeqXpZskmFHLaVgpd6bWQL7ZT44NJcBONqsxr1ahv4BPzIwMM7fpwre/1LBvam3a6lHzN27q2ckVOqQ4sEDncA56OHLboORaUiYghoDM4szVOeAqu5AITva1+by/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgk1EWoC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c82101407so9113853e87.3
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719584; x=1719324384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
        b=xgk1EWoCl8tP+E8X1Y51Wk3TJv5r3RQI0LzQ7SWU2G9qHwThPnaWunvGD6RBjFYKD9
         YCaNmldQu6vttxm7XSDmDx0A8qEWy3tSlYi1CpF7wnd1EnHFasUbo0jVn8fQPEeORloR
         q1t3pkpYGH2Xm3rp2XF/EDrQjH+x+p/wz0XzDbtLZmY40W6yObCFGOQQAE050mVoLqKX
         WAAPtlt3cGGI3n9WpfVfsw3IHwDv/rkur7ogqoAlmhzpJQRpmbOgiUiDppAMH+j8pdZp
         RmeIUxq7hmrsazEqaV3dkomjFpkyCuPyMWYGkqWY4cedEKxmT/HvRK8JMasJgNi3rs0s
         ldxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719584; x=1719324384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
        b=GPkLGe6NDD/YPO62wnfqTPfd7SyHevUslw0HaCy8s82NnVPAbnp0tjMOAQzBJmPl0l
         u5lizVRF3I+/lgMI91E31Z+74ZJSb9ccaY5pzoUW9sc6zBNlGYX3QIKD4zM3OsB62kYE
         Cvk09Xi315tZXFEEqEZ2H14sjSJB51j8GCg6AI0V2RcuMguAf+NnhTMdAmwH2dl8cGpv
         oGVl51P4ggetw1X38x5XjuY9izNPb7Rtmc0Ynm5akt7lEJ9WfbdlxawCcxAuJDLedAwB
         XukjvxpTfLXmnO1G99KNX1LIE8f7Z4BEufYFjRODsNp3jIY+mhT5xZexN+MdHHyHScFG
         bORw==
X-Forwarded-Encrypted: i=1; AJvYcCXXiVx71pECaiC0Jma+X8SfEYiNIV1AUU7zv6rKElDPtv+gwWDwK7hZT3yHfhO+wH1/4LZbgp2V5lFh9UIHINHQGEG6ChJ1+VC3yZk=
X-Gm-Message-State: AOJu0Yx326dCHlRzfK2jxexVDkLpdv7MG/JMU92fbmM1USiAyY46W0PJ
	/HxlLUIf+8NwpzgcPMIGsEGCYQnu8ho0TMpK5wS3p35+TX05c9NVKvOAr8PaDDs=
X-Google-Smtp-Source: AGHT+IGY5kISvhIt6rGqgfv/SlC1aIqmQbwMlMYxf3oPhg19EaPl7J618YwZRjbodQ1Ardwyi8neOw==
X-Received: by 2002:ac2:44a2:0:b0:52c:a5cc:27e7 with SMTP id 2adb3069b0e04-52ca6e9dafcmr9013751e87.66.1718719584220;
        Tue, 18 Jun 2024 07:06:24 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287ad4fsm1536033e87.201.2024.06.18.07.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:06:23 -0700 (PDT)
Message-ID: <31921e1d-da7f-4846-9d69-4e27d61cb464@linaro.org>
Date: Tue, 18 Jun 2024 16:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] arm64: dts: qcom: starqltechn: remove wifi
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
 <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

