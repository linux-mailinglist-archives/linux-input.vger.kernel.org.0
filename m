Return-Path: <linux-input+bounces-4606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240A915821
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 22:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E530B243EA
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 20:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6DE1A08B5;
	Mon, 24 Jun 2024 20:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFf4xeeL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5A1A08AF;
	Mon, 24 Jun 2024 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719261643; cv=none; b=JXbdS1j3xEzNfAPsIDDhZSdGmYX34eFCfh0tj2ECVj1NSR5TQjmFXI3RCgQPOjW41Y+mmC8G4cdYuuS3ydqQ2dtenPiZh9V0KHieD+/ICjN/F7q5lvfhwRecDq2XVxmbBohFAbzFas7IOnttBGrvuiVDViA6vkYLau5PJ629DBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719261643; c=relaxed/simple;
	bh=HKHNjN12ghdanNjkpEpORPJCe/LeiaO7ZQFLm/IYZGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tawGBcYSCTQzwY+MO442vhSn1NlpmQIBW1hvBpD4U4bDnjKjI3DE3t7GOC6+AhbiQiYMgEse39qEq2F5LCus/XsMXKvTIo5y0WYTADQtQDkHV6uocXsXxKttWyg7JFuCE3tj2koV/NROrNE8oWT8S0FlsOldkQyialFKK28QcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFf4xeeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B10AC2BBFC;
	Mon, 24 Jun 2024 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719261642;
	bh=HKHNjN12ghdanNjkpEpORPJCe/LeiaO7ZQFLm/IYZGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFf4xeeL4k9sn/LrwNkV8wU0k/8bvCXvTg8J1It92zmlMz0GGWeI4K0YXclivemlX
	 BfwuzPtHnzow81aSVsFGyQyfK0ACOe4RMOn3b6WjMtSBvQdf27D3/s9iHNsXlubd3Y
	 7irgaOqdrnXra1FSplPt8d1t6lMzdV/V4ioQHteSjsyqxVL10FrB8kzb//TYckIjDD
	 JKq+y/Wi/JSreT59/65IPFsRTrpVCPwsNGitM0flyQnrT2vvb2gbP5JKffeYejV4Zu
	 1S4ziI/pSocxLMoKCZnh9vGJyMz1bxbfKDCWx3UI1Bi8CBCUlreK0v1FCbVkqPYZmO
	 bXwt334UpzoQw==
Date: Mon, 24 Jun 2024 14:40:41 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/7] dt-bindings: arm: qcom: add OnePlus 8 series
Message-ID: <20240624204041.GA375582-robh@kernel.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-3-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-3-388eecf2dff7@postmarketos.org>

On Mon, Jun 24, 2024 at 03:30:27AM +0200, Caleb Connolly wrote:
> Add bindings for the OnePlus 8, 8 Pro, and 8T devices.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d839691a900c..a41eeb8c3fc5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -986,8 +986,11 @@ properties:
>            - enum:
>                - qcom,qrb5165-rb5
>                - qcom,sm8250-hdk
>                - qcom,sm8250-mtp
> +              - oneplus,kebab
> +              - oneplus,instantnoodle
> +              - oneplus,instantnoodlep

Which one is which device in the commit msg? I can only guess that 'p' 
here corresponds to Pro. A comment after the compatibles would help.

>                - sony,pdx203-generic
>                - sony,pdx206-generic
>                - xiaomi,elish
>                - xiaomi,pipa
> 
> -- 
> 2.45.0
> 

