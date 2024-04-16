Return-Path: <linux-input+bounces-3091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 240568A6D2A
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 16:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542081C2200F
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 14:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607812D205;
	Tue, 16 Apr 2024 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZAIFmKg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507CF12C534
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713275964; cv=none; b=oLb9jdNjABf+IQiwGplo4RRj5VTvgwd63XPnwDXH08aDoT3S5Pu5fnEI/nsuKTMi1tme7oxspnU5KaO7FsRD2LIkxEQ4r2xcWihMg6lVBw86j+rP62Ig+lbV/122CJmmonYz9wxySO9gNlnf+lTge6mLnFheWzvY7lwqz4VHaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713275964; c=relaxed/simple;
	bh=LHyKeXKzNTWwXkPYS/BAIhA9PRdODG+cNEw1D9IU6jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYxtnvcWKP7PoMQFGre0F+toT9vszXRR0m4eg3xbkuzB/VQFlNH664w1Ge39RlE1imnq6Mr2i1KznX+hsBPud+wGF1CeTfygLHN//ZX4A4AYhvxIkANFyVDI/NwH43kgAcZWDxwPIBa9Pa37l8q6w+3YBm0/Av394P5WMMssC1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZAIFmKg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d3776334so5734932e87.1
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713275961; x=1713880761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD9eHBRhW8p2vFdmYSbs5m/0CPQ24aGQTS5i8W86vBg=;
        b=dZAIFmKgWbwxuDtAC33YWFPBMG9SEHY0ijYMMF5sgjt4BSt/LdruMpLSxEK2YPoQF6
         ztoqHnVV7lme3zT1SbofGj4LsGf6gOaRpZGt/vXjkoA04PMTM9l9TAESGnRrklw7z6yV
         QYxC7UbAPjuWqU2xnv6GrnswaHgaWCXKee/5lN1RvsHNux8ceQ+hc5mdaG6KU57BbfU5
         Yf3wB1UOjKrYCccfoaPmPo/eS+sD0Dt9KqtGquXHB5Rq5dSzV2ITodWNjExndlB5wyzO
         p5Wz9kda3w9yzWfkucm3SSVffPkCfd+t5ns3iPD4lGFbtpwc/yzus+3QKLEEXMjDeayf
         WkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713275961; x=1713880761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wD9eHBRhW8p2vFdmYSbs5m/0CPQ24aGQTS5i8W86vBg=;
        b=AXSyZc7psI42ujsenVTn/A1QMNkv4VmRt9RAjjJLSfKGEq7eR/P04xtvYRp/Zvtvo1
         5/SacfdxOIlikr5dhUUmPMgB6SPcN5pNV4jqUt2JJRuisjzbzw5H4FPh75TiCa2/iqEd
         VxitWjBajJlSH5D65p8Ux3kjLe16rkKIf4AYtq4zGsfHlhrodzZ16/mmiQL88OMO1if4
         9kOM23EOhZ1JTx+5jV6MTVYatS9IHJh8Qs3rB8bSzvFfBvX2mN41nVeEdI70iE8yKMQ1
         7584eXEFWDzQKN1CenGVU0VUDfnqPJ3sIKSCQ3DXD1hY269HWNaIr4LcCQLl7vYnLFO+
         pnOw==
X-Forwarded-Encrypted: i=1; AJvYcCW+s0ECydUVq0XcBm1mdSXlscqMSyYlVnhtigaSkOQJdDAlVGtmwP7tYSmrD8P9i9qXf9b9vS0Lqtua+50wJqPaeKcETuo6224UAbw=
X-Gm-Message-State: AOJu0YwZiQIYdhluDKfW/U/q3ZYA9nKf7Ias4+frN9+HCfyt7VGR7NhT
	HcXhBD5uhLbwlD7UTxfGo5mVxrv4Ke+EE3s+JRuZkFPoWSvC1jWH2jWFkxrAvA8=
X-Google-Smtp-Source: AGHT+IE37/W/LNxHjwv+kSmZ5GYL1F0f4rusBwAvgLPgoyr0g/XjmubcRmdvnLkQS2BP/CcBUAheZQ==
X-Received: by 2002:a05:6512:1c7:b0:516:d3ba:5602 with SMTP id f7-20020a05651201c700b00516d3ba5602mr8868189lfp.16.1713275961469;
        Tue, 16 Apr 2024 06:59:21 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id eq2-20020a056512488200b00516c40b05b0sm1585497lfb.215.2024.04.16.06.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 06:59:21 -0700 (PDT)
Message-ID: <08f3b1d1-c3ab-4201-b943-ca35bd321103@linaro.org>
Date: Tue, 16 Apr 2024 15:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] input: pm8xxx-vibrator: add new SPMI vibrator
 support
To: quic_fenglinw@quicinc.com, kernel@quicinc.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
 <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:44, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

