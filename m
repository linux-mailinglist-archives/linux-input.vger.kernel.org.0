Return-Path: <linux-input+bounces-15774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4DC13AE6
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 10:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B9C856217B
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 09:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855DD2DC79C;
	Tue, 28 Oct 2025 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWKmH91f"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C66262FC7;
	Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642034; cv=none; b=hiCa0qbGADMgYPHT9aON5yidjGDxkheoAutKjVOL10uum0w9xM79Af97lTrQ3N2bmGmr2MaOw8oBgjQBsfOiGA9wRGoSgOVKVpYsGQGcASVJzaHyfdlx06c9sKfeFev92QdX3F65x+VUT2zFVqFD5GCak52xuy+PcseatA57lPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642034; c=relaxed/simple;
	bh=rZ4NQKQCLrbiX4zUi8bRocWHIWn3QwuUM+myMdN/DI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnOKtWpWytyAd0HDEuAEEZgkDGKqJVogbbZzz3+fmvNup8CPAYLF0MGftIdFCllAPdLd9mKWAFuk2C9C7Uv9uy6Uptq3yqFAQXrYJgujyw1evl0e2I8j1xO0RliZpJMD97UZg3Ero+uczQPNnYP/qnMXMTKYJpKc5kvEmfmv5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWKmH91f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AD3C4CEE7;
	Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642033;
	bh=rZ4NQKQCLrbiX4zUi8bRocWHIWn3QwuUM+myMdN/DI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWKmH91fKqGtdl9lsayw35svBXtixc0YgYQVpuIVL9pV3DyVI4ORJsSFIQJ6+TAjL
	 mwtHeqgdSesSUYZPa8eQPhQ+WLFLpDNuRwGR8zjohAwM4FDUvR4zwfjjk5WqMkrMfP
	 /0ie3QweE1xAT7iov3Jl8fEMazj1vSI85Km1nxoi18ebyoueCbsmN+3FFRYPiDwguS
	 Es/Vka2CmLvy5ZsCb90LXqp7lTuXfy5lscQa8tnB5hkoRnt3II2VVOouuHkmVfzB0e
	 wU4QETD4dROrAf25zaUsYknU6tnD4fPGfXr03WMdBuJJlyVF4HPXCnfGPcVxDl5BX5
	 vSHxEvZG/OzvQ==
Date: Tue, 28 Oct 2025 10:00:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Message-ID: <20251028-truthful-dexterous-hyena-d3d4c5@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>

On Mon, Oct 27, 2025 at 06:48:10PM +0100, Josua Mayer wrote:
> Add bindings for various SolidRun boards:
> 

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> - i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
> - SolidSense N8 - single-board design with i.MX8M Nano
> - i.MX8M Mini System on Module
> - i.MX8M Mini HummingBoard Ripple
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


