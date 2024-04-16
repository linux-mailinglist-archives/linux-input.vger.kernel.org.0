Return-Path: <linux-input+bounces-3085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD438A6B37
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 14:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED84280FF5
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 12:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353DA12A15A;
	Tue, 16 Apr 2024 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKMYswuQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9485959
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271068; cv=none; b=eMbTwgUEmupYc18RhGfswBuKI9y6DWC/oTc+4nGnSR0R5GTzSZQWOT1kG9UBCQieK9SZsebFj6F5sHrpt6KTPdiwrEnLWu/3kKCg+YGlp0ps37ppTUi7CB4VxosN+DvBR3kW0DJrzwDao7Z3v+MgU3CvluI531gX04ZyigX7z+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271068; c=relaxed/simple;
	bh=4LJ6HXrr7/zGMxHWwNvwLQ04Lnb+7C3+Akuq4JYINEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAsU+/GduTT6N+oLzsK6stqlok13j1OKxo5E5u3LyExRfTt3S6S9MikcVSnqvQq+Z2VO7mMR8wWHMfEq4bDpf00OSa3LgjBz8QfsVoFBmd03lMSShn3KlW7ebYNlGzneoNIotyxMcGx/0uGLFQV2V0CVuMv8tND1oeDFlyF51Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKMYswuQ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6164d7a02d2so50074087b3.3
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 05:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271066; x=1713875866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=STIdOPhZdYvo112wyFBuLZo9s9LDl2Qu/p6eL5RFdqw=;
        b=cKMYswuQgZEgwzR1koQDAyGsBxb4EB1KCyuqReRXmBwa8wYQ6+2R5KXqrddpRIAQ4c
         F4X0bJV1fZpuJk6pC1cO94UZthvSZX57xXRumPWhbfNILLAuMqVHmydrcrFYd5TZDqoL
         cqi1vNDCzJCFGaSOkJvtlkZG9AYDKA9FMWCrGnLWhP3HTS5L4yCp3IjNeHaQQDL3+Jt0
         nDdH3WWMAArezeNHY+lgIXXvTJB+1/GHBfzKZVtDUI8MPQDrx3CfRiMOmu6Qd8uK2XCu
         WbTYHmEAHRaVtJzh63a+QycwcfwHIappfO08eFJN5RelCIG6ndgcGuDgc3HzLj5EGgoq
         L3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271066; x=1713875866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STIdOPhZdYvo112wyFBuLZo9s9LDl2Qu/p6eL5RFdqw=;
        b=GWato2MLers1pxLV6R8518jlH+frDKBLuDq6/P+fupmD0FX5w3DczrHDv5oG1DwcDh
         QBYfmZjvPIdo8OnQghtfwcvH6Si0HDa6PuuWhivKmkVGNMR7mw52IwMTAh2UxVJnKTyS
         bOVXwlAtw04R6tkExjIpu73QOLy3WX7K39WKhe1DCUQ7ytbrcpku9KB4ZQBP69sPNh8D
         qvkeoo5ll8arGK0D9Ai27bbjSxyooo7qlBNP/zGZ/P6eNKB/3Ooz/zuHQ2w+/URK78js
         IxrZROkMXUQ1gAtPapUe6ANAbSPUdm3Vem+r5zxnCoXAiQPRps6S05CY0qyJTTUK/4a2
         U5zw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHhqvoWjKAMN2ZE8+aPRYuAhY4lOfZA353i9Ii7Y0UkQUuWQghJ00WzEnabCFlcn2cUl02WIIvHJ1jyEH7M2wQNUQe6YThRcAje8=
X-Gm-Message-State: AOJu0YxDvFPg3kDeBM2Y2//34/6E+UG5rgc+Fq1OTXH8LkBOkJTpKE9g
	7woPP/wF5AhQHPwKw8186JoXXCGN3gXj2O46Wx2FF28h+JHyEVTRH8PUb/8bokmXCJygt5L2FrX
	1AmWG/yFnxVYkrFAJd+M46mtfeIsQXPlZbsVN3w==
X-Google-Smtp-Source: AGHT+IFeOA4awc8p/M3BUkgYhbJYeLw7xEDVGKxA6dOrgdfoPaGNeyp56yT+LyP9EbyhGTUoUXAgTBz2Xy3BL/MSook=
X-Received: by 2002:a5b:186:0:b0:dcd:4d:d342 with SMTP id r6-20020a5b0186000000b00dcd004dd342mr10998368ybl.50.1713271065794;
 Tue, 16 Apr 2024 05:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
 <20240416-pm8xxx-vibrator-new-design-v11-1-7b1c951e1515@quicinc.com>
In-Reply-To: <20240416-pm8xxx-vibrator-new-design-v11-1-7b1c951e1515@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:37:35 +0300
Message-ID: <CAA8EJpr0wV-Fgyyf7tQ-HheYPNmDvCkj4vWL-9rd=gmXrAXOMw@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] input: pm8xxx-vibrator: refactor to support new
 SPMI vibrator
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 05:44, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> Currently, vibrator control register addresses are hard coded,
> including the base address and offsets, it's not flexible to
> support new SPMI vibrator module which is usually included in
> different PMICs with different base address. Refactor it by using
> the base address defined in devicetree.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 41 ++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

