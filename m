Return-Path: <linux-input+bounces-4587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0B9141DC
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 07:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAB0F1C220A3
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 05:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82F9175AB;
	Mon, 24 Jun 2024 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWPqIY8o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F54EAF6
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719206325; cv=none; b=eQAiy48Vgj+Qa0NZhs9C/wL/azIwdYHK7OIe8rYpbIyMFe3pbQPTZoCsryoVZkjCqggQJBkfym5vF0xrkyJKjywgGRJuuDOcu1RkSynhdGx6qJOaSU7BTNVbQr2nOsUpTGb3CByFfc8W7iApmXEylRHMSfCxZeU0cQ4sf6yK3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719206325; c=relaxed/simple;
	bh=JrQtr3cmZd5ypuWX2UtYWXpbxSkqdZPXBYDcdnWf7rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW2dmlK+qoHLO0DD+DIYeDFs8AECLanIxodwfqIu1tNTLUBfgp32Off6T9az+FPl/3j+Y17asB+FBmI7BkGNDIiMm2KlchDV1p65VHN1ikK1XO+/Ud+YB62HpkSTd08F9U1VuWDBnHIJ5/Xrq9Ep+GH+DRJbC8DbmaD3K1H2C04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWPqIY8o; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso41993061fa.3
        for <linux-input@vger.kernel.org>; Sun, 23 Jun 2024 22:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719206322; x=1719811122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuyadEulFu3FDpPhLLNT9X9XFnfp6SMEqQX7h8wDmlY=;
        b=zWPqIY8oW69n5s7vDaooegAR+r0mAK3JESSpYMdz30wSJ6fjcBcDK0GcBjxx4Fc3B6
         jKxvi7TxP0CCzIoNtW+P5nf7HfwqNVQ2TprPFUMB59f00eECk6SySprO6FJxlGBsnJ7E
         08YgqMcLwfAH2g2CdRPb4XW/aF7N5tsCiWuQnOUL5wJX9ii/lzvj4RjtNOaBzF/8XhVF
         ht18PjbpFlTbZbPOUzYTC1qbyRJoED3OuHgkYamFrmeONNBAOiN9K4ZpgxD4YEqHAJGH
         dTDCp97mx/T4zAdo79P7IApofd/VueWJDgsfVVbmm769nM4rjuBxk888g1N0JkAA2eOZ
         0wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206322; x=1719811122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuyadEulFu3FDpPhLLNT9X9XFnfp6SMEqQX7h8wDmlY=;
        b=M/OhscsPesrhmSdLC9c5iOzrQP6QmAlZswfz56P1XXx4T4tLQuS03p/Z8pqdkt0e6D
         eA/l0v5z5xKL1uFJoK/LkqPxrBY4IJ6vr1oFsBPnwEypwp5iKUYL9L1ZsNKzOjvQJ3U/
         z0ma3Za2IFjChmKS2OItk9+qLiE6gUDpMioMA13B0eE7eUrW9zfb/cE5L350/6cexZ6E
         wA1FPEkRsP7RmSqo1vH8JADFZq26Qd7pMHCJnKqFOXP8JFGCUOpoPBUf65Zbj90APfn4
         yMNvZve3+YLwzOENO9pvd0Br/S73KJMJ88mI7EBRvjnGb6I5k1SkVsx8i2in/5sLQ7up
         lirg==
X-Forwarded-Encrypted: i=1; AJvYcCXUChj2RDSFMmz8z/VUQYG5qptxmnPS/W/UVqoK8qKUztuXfVAlHgMdWUBVKxafp4UTrrAIe+2Kgc8IcS3ZN0YNNfxg7IWmGX1hOno=
X-Gm-Message-State: AOJu0YxsqaMtpSbMNq8wwRW/In9y18Zo8CQQjzvXTcXBirilT5FtoUur
	1aIfxg558+RHPm2t0cns6k07N+6FrWtSKz3PRv77+F0k8AvZppfMoaI3ijSJxEc=
X-Google-Smtp-Source: AGHT+IFayfixZjNle/0sDVRFWDTPCafxBUrwkkSut5g+TSdNaooCLZ1a3RRLfxCfWY7qdQrrOhDqyw==
X-Received: by 2002:a2e:9dd8:0:b0:2ec:4fc3:a8c8 with SMTP id 38308e7fff4ca-2ec59312e0fmr26152271fa.0.1719206322244;
        Sun, 23 Jun 2024 22:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ed4f89bsm3258471fa.32.2024.06.23.22.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:18:41 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:18:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Frieder Hannenheim <frieder.hannenheim@proton.me>
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
Message-ID: <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>

On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
> Add bindings for the SM8250 OnePlus devices, a common devicetree,
> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
> 
> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
> featuring the Qualcomm X55 5G PCIe modem.
> 
> This series introduces initial support for the 8T, adding drivers for
> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
> 
> The panel driver suffers from similar limitations to the LG SW43408
> panel found on the Pixel 3, namely that after toggling the reset GPIO it
> is not possible to get the panel into a working state.

Just to point it out: this is no longer true for SW43408. The panel
wakes up and works after toggling the reset. It seems, there is an issue
with one of the regulators, but not with the reset and/or panel startup.

> Given the apparent prevelance of this issue, particularly with DSC
> panels, I believe this is a bug in the core DSI code, and not a device
> or panel specific issue. I think it is still useful to accept these
> panel drivers into upstream since, from a users perspective, the panel
> is fully functional just by leaving the reset GPIO alone and keeping the
> regulator on. The only (theoretical) downside is worse battery life,
> which is a small price to pay for a working display.
> 

-- 
With best wishes
Dmitry

