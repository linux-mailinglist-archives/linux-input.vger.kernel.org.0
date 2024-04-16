Return-Path: <linux-input+bounces-3084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B50AB8A6B1E
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 14:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449C51F223F0
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 12:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A677112BF1D;
	Tue, 16 Apr 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLxNzFBu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A61292D7
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270939; cv=none; b=fTaSn35SlJXv8OytxPkVskJruu7n0+Y81lIVF00DY2svNlm1utVF+ml815ur3oi+9v2/0KePCB6veX1yC91lv5dJU+65jkMfW0CJIOr7SaNwC6nrlWTPGTcLyMDaF2ZeBFd4XsulFTakQRHbyLKFn1fEQPFgGNL3vtQFr7RzJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270939; c=relaxed/simple;
	bh=mypo0opZBER9wWQOgAavLRwTy7MsH9uMUcwwuLVRtko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kylWbwstBST5Xij8qjpN2Cns70ZkXnU+mFp0DWYp7xyk5xOtPN6Rjr+HlC1JioKXDZ38c0+H8LnL1/DrjpDveBeQa2CTtt6qaRdvrmXUJeIcXclsAGHqNmPN4fMj33G9n4VFr8xPTpp8iL6KydpOGabv1u9hgyfyPVruNY8/gyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLxNzFBu; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3656877276.1
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270935; x=1713875735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMDaeedkgoUcBilEAgXcFfPeKOpGphnMuHKiydeGW0=;
        b=dLxNzFBuRGlXZPZ36evQBi6jZU8oOOdJSrU8dQyGuMRLlhHhFnbADxQWlVuXvrOidR
         WOWaP7xUivqBdGkrQF9ELgvNHhfnEsdWWViQWtwGYAvDT4A1k5HEzBPjfpNjc7M9kmB8
         AbU05tg7KMAENEohKWPyiK88k4X/S2RalyRNh0v8de8zKgbsaIpT9amaVIGyZ9f5PwYG
         UaOCw+1tGl6wr/W5uBC08GJw1lj+aZdV2LNjlwYQNSveyTg8VjNHxgwmq+QfKX3k9qKp
         w++BiaF3Fc8QrHj22mY53zVPEF3S1+M4T0eIioEEbtcjwgpmIo3OCMwrNunxx4BSPxsp
         epgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270935; x=1713875735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkMDaeedkgoUcBilEAgXcFfPeKOpGphnMuHKiydeGW0=;
        b=cr+veuB7pd6Fn2Sxej9dKgfEu1nVmQsA3ZIoyO/NE3wk7vOFGG4oIGtq+IT1B1B69S
         MWKslfOyQNuCHE16gC9PWEMlgjC4CHTzvDYfNhNwLQ1e6N+C4Rg8M+VVz4j4fTXyG/ZL
         UJElxa89hVo7sAQMBUSuleQtJFQUWUVFZZ1WltjAUmAVvT19n4FebglhrKjmwpP2V1By
         sIIDa4Cx+GukYS14dUjMlzs8YNkpBnW6dPpK+t/O8XgYEGUgQP5Kjjt3jj2aU+yS0QtM
         On5uaKvm4mfBL21PjeavCzKefpFef4mrVRkNlsHgcrYTNSVcPDSaBvkPYRLU35oZPzyV
         kJxA==
X-Forwarded-Encrypted: i=1; AJvYcCUh4ZglzONt98puzbX+EgSX2L5Zg2309ziolkfZ0T/W9KNFHirzqhBIHGv2wD1uuDBYHOs/EGdZhN6Bw9XIrEsQyk/eLhRn0CTUa1w=
X-Gm-Message-State: AOJu0YyMdUvJNjRYW8/j1ob8SPV5DWs//fBrr6ZGcvEH4U1hUjaTuzEn
	cSnbSFXvC4S24RTceRrZQGrCRd6Kg8V98pIhGzxaJSJtcxyOGOAx2Qcopkh3pR5FHCP6xCZfYBA
	1NihQ9tR1BoHAkGmUSWEoMlAraoKkDKdL03T/TQ==
X-Google-Smtp-Source: AGHT+IE1PCI2g0fQ9ZZM0/Q/13zAHG+ne5m1OrbxIB65cDpuGkaW6y8jlH0VIwn3X0YB6M8c+QdYDGvR3r+3tWeC39c=
X-Received: by 2002:a25:be84:0:b0:dcc:58ed:6ecc with SMTP id
 i4-20020a25be84000000b00dcc58ed6eccmr11179227ybk.41.1713270935631; Tue, 16
 Apr 2024 05:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
In-Reply-To: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:35:24 +0300
Message-ID: <CAA8EJpqy5d3O2csttNqTE6Jd_vL6YovbhkBNewQ5_wYc9rAKXg@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] Add support for vibrator in multiple PMICs
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 05:44, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> Add SW support for the vibrator module inside PMI632, PM7250B, PM7325B, PM7550BA.
> It is very similar to the vibrator module inside PM8916 which is supported in
> pm8xxx-vib driver but just the drive amplitude is controlled with 2 registers,
> and the register base offset in each PMIC is different.
>
> Changes in v11:
>   1. Drop the 1st patch since it has been applied
>   2. Update to address review comments

Please abstain from such changelog entries. Which comments were
addressed? How were they addressed?

>      Link to v10: https://lore.kernel.org/r/20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com
>
> Changes in v10:
>   1. Add Fixes tag
>   2. Update SSBI vibrator to use DT 'reg' value
>   3. Add drv_in_step flag for programming vibrator level in steps
>      Link to v9: https://lore.kernel.org/r/20240411-pm8xxx-vibrator-new-design-v9-0-7bf56cb92b28@quicinc.com
>
> Changes in v9:
>   1. Add a preceding change to correct VIB_MAX_LEVELS calculation
>   2. Address review comments from Konrad
>      Link to v8: https://lore.kernel.org/r/20240401-pm8xxx-vibrator-new-design-v8-0-6f2b8b03b4c7@quicinc.com
>
> Changes in v8:
>   1. Remove hw_type, and still keep the register info in match data
>   2. Update to use register offset in pm8xxx_regs, and the base address
>      defined in DT for SPMI vibrator will be added in register access
>   3. Update voltage output range for SPMI vibrator which has 2 bytes drive
>      registers
>
> Changes in v7:
>   1. Fix a typo: SSBL_VIB_DRV_REG --> SSBI_VIB_DRV_REG
>   2. Move the hw_type switch case in pm8xxx_vib_set() to the refactoring
>      change.
>
> Changes in v6:
>   1. Add "qcom,pmi632-vib" as a standalone compatible string.
>
> Changes in v5:
>   1. Drop "qcom,spmi-vib-gen2" generic compatible string as requested
>      and use device specific compatible strings only.
>
> Changes in v4:
>   1. Update to use the combination of the HW type and register offset
>      as the constant match data, the register base address defined in
>      'reg' property will be added when accessing SPMI registers using
>      regmap APIs.
>   2. Remove 'qcom,spmi-vib-gen1' generic compatible string.
>
> Changes in v3:
>   1. Refactor the driver to support different type of the vibrators with
>     better flexibility by introducing the HW type with corresponding
>     register fields definitions.
>   2. Add 'qcom,spmi-vib-gen1' and 'qcom,spmi-vib-gen2' compatible
>     strings, and add PMI632, PM7250B, PM7325B, PM7550BA as compatbile as
>     spmi-vib-gen2.
>
> Changes in v2:
>   Remove the "pm7550ba-vib" compatible string as it's compatible with pm7325b.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
> Fenglin Wu (3):
>       input: pm8xxx-vibrator: refactor to support new SPMI vibrator
>       dt-bindings: input: qcom,pm8xxx-vib: add new SPMI vibrator module
>       input: pm8xxx-vibrator: add new SPMI vibrator support
>
>  .../devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 16 +++-
>  drivers/input/misc/pm8xxx-vibrator.c               | 93 ++++++++++++++++------
>  2 files changed, 80 insertions(+), 29 deletions(-)
> ---
> base-commit: 48c0687a322d54ac7e7a685c0b6db78d78f593af
> change-id: 20240328-pm8xxx-vibrator-new-design-e5811ad59e8a
>
> Best regards,
> --
> Fenglin Wu <quic_fenglinw@quicinc.com>
>
>


-- 
With best wishes
Dmitry

