Return-Path: <linux-input+bounces-1602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADF845003
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 05:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059B31F2A696
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 04:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7241D3B786;
	Thu,  1 Feb 2024 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="pMYWn59+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B863D3B197
	for <linux-input@vger.kernel.org>; Thu,  1 Feb 2024 04:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706760271; cv=none; b=Yum6Tu13nvKZnXBi839ARySvu2B984iicbQXRbWOBWPcoxVrkJ1ec0zp6j2gI/mfgC633LQ/urvGjGkDePpIehWlvFYRwrf8zKzS1n3fZhBB7m5/HD6UTltiuzX193GspPVZat2QWxruJdPeTd8u3QPsmcJrpqROiMC64uWhRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706760271; c=relaxed/simple;
	bh=U+z/Gzi2e8oSaSkN5Mf9nf9eVZKujMwhE9OLgovc7bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0zYx3JJFLJUz6+C/axKeAB10PySG2zJQbzRFPvWekt49yAC1xoMwHas0sZPsxQsB2lRD+qp+wSJzXqfhQrXLxf8VaafWAf3Ot3r22Yng1SxG4T+2iqeU9cBfX08ptw387LeEU4vzzfae8OqddXJzjnAIHimiZQ0nw7AQF7wKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=pMYWn59+; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cf5917f049so6612001fa.2
        for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 20:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1706760268; x=1707365068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1pCpqVMhWzU3nLiNxALZDbTH3+vNR66xyNLLKO0v8w=;
        b=pMYWn59+cHhsWgr23hYLZ+Mp1Er1uJdeAOsf2u6UaBEWvrra4HjgjJMG/0DuZTnFCq
         jdizSoHWrB4oHAK0jBV/Ci1fD1d6xnD8jZLAVPkxukQA3l0omqddNVBPxKIcjowloqgP
         0QO4vhtJ1305mJ+lcm5Ptuv94fgplSu3nhAKsXV2iJnhYE/PfiPy9hilN3vuAzXrFgqr
         Cl4nuzNDS1CBhR7n5ZVFeu6PywrAWdPczJ165tTU3uF1RWtNOn8HVzjyM12uQIHce3Nk
         5hBTDCkBMRO2Vc/nWMYqbNOgs07ZFvxRsN+P0oazYfmj6MISAMkYJCSzd+N56cZXfGE1
         1EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706760268; x=1707365068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1pCpqVMhWzU3nLiNxALZDbTH3+vNR66xyNLLKO0v8w=;
        b=WQGXvTBeALECrKQ4qusmwnj4AY8rxWqlpNu+qBdKrXXXnyvbcr8tDJOoZuMqarzzWa
         7+1JXcOCh6pQtR0DDOLpPZuIFpY0VOv7X1zco9+z2cmpxw8Wo2++1LJP/+ZhDqQf2HeN
         qhBaP8xKCl6faVJKHCXVtYo22NxbtpazEHSMX6qZzi0Gm5pYHPsOfYpOgYTARRyS7IJT
         KXWp7d6GYk58UTfqNFbJThcxqdgQvmkg5PQ9eaGSg4VrkWq14BaksjZGonuCqIlIBm90
         a45DR+CXorLoqlhifiMJiejoybDjc88Q2WrGaITvSKcCSMguLnmemPOFHTBzCSp0Shd8
         hWlw==
X-Gm-Message-State: AOJu0YxqhrHFy92H3ZKPHWyAt4OiefO7278tgLsHUNxciDuKCzjaOrtA
	hyKdRCIcnwG+Dm937RYjYLe318izpbdpfJ+LKMn5bmwasvBZAJdMJ9UXzY7uNpWn/DpaUdcWd+n
	WBngAXammAwVxt9koDdwHtpZ0cOIptzn5qH+DBA==
X-Google-Smtp-Source: AGHT+IFe5H/phU7lMtzKlpQzEnleJByHGXLacQC79IKXkfpOvLnNeg3HBnc/RI/6OD+znY9scOVD1GK6dfOsLTNVxEI=
X-Received: by 2002:a05:651c:1cf:b0:2d0:6fe8:bb2a with SMTP id
 d15-20020a05651c01cf00b002d06fe8bb2amr2054277ljn.32.1706760267723; Wed, 31
 Jan 2024 20:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-x13s-touchscreen-v4-0-39c0f9925d3c@quicinc.com>
In-Reply-To: <20240131-x13s-touchscreen-v4-0-39c0f9925d3c@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Wed, 31 Jan 2024 22:04:16 -0600
Message-ID: <CAKXuJqh0Js8t6YHLOOj8p6YQgKAAfchVLXfFWotVVR_H8bFsbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sc8280xp-x13s: Enable touchscreen
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:07=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This documents and defines the necessary properties for the I2C
> HID-based touchscreen found in some SKUs of the Lenovo Thinkpad X13s to
> work.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Changes in v4:
> - Introduced the patch in the HID driver removing the comment about the
> need to update the binding.
> - Link to v3: https://lore.kernel.org/r/20240129-x13s-touchscreen-v3-0-c4=
a933034145@quicinc.com
>
> Changes in v3:
> - Rewrote the commit message, to properly describe the problem being
>   resolved.
> - Link to v2: https://lore.kernel.org/r/20240126-x13s-touchscreen-v2-0-53=
74ccc9e10d@quicinc.com
>
> Changes in v2:
> - Dropped output-high from &ts0_default, to avoid bouncing the reset
>   line unnecessarily
> - Link to v1: https://lore.kernel.org/r/20240125-x13s-touchscreen-v1-0-ab=
8c882def9c@quicinc.com
>
> ---
> Bjorn Andersson (3):
>       dt-bindings: HID: i2c-hid: Document reset-related properties
>       HID: i2c-hid-of: Remove comment about post-reset in DT binding
>       arm64: dts: qcom: sc8280xp-x13s: Fix/enable touchscreen
>
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml  | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 7 +++++--
>  drivers/hid/i2c-hid/i2c-hid-of.c                           | 5 -----
>  3 files changed, 11 insertions(+), 7 deletions(-)
> ---
> base-commit: 8bf1262c53f50fa91fe15d01e5ef5629db55313c
> change-id: 20240125-x13s-touchscreen-48012ff3c24e
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>
>
Thank you for this work!

Works great on my Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>

