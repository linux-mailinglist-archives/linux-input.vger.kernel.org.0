Return-Path: <linux-input+bounces-15775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FFC13AF2
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 10:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E06E3B67AA
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D7F2DE1E4;
	Tue, 28 Oct 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/qUlU0Z"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124F2DD5F6;
	Tue, 28 Oct 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642185; cv=none; b=GGm9FkLkcUzntrJ49zcDN+vgtR58gaTPCPR8FVf9iPpTgRmXpjr7J4TbXw/ruMPcRMCkcgUiE5vyApy0Jepm+xhz7T4Paeticb79pCcOYg0ma31DdLuRHapiO5dzZkn4mDlfBSeHGCDu4j4+1kqmqzeVNDPBXB+VKWKZvlAFIUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642185; c=relaxed/simple;
	bh=WPuS1p03nJA56MEoRrTM+Ywn8nh+8dI3UapF3Ehxvpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgfKW7rdHTSYK+41kNw7L5yeHw6MiR03LjURCb4kRKWLr6Iu8jcEz+3c4uQdB6iOTPy7LLSSO6Cmz2eABXKM2JaXTzsshjDBxFs4sqhntJB/ca+Xn5EfT9AgDx70hZb+LpMn0mE2jO1VBknw5rntdzWpK5S1TiLm3MmQpxpEePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/qUlU0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6594EC4CEE7;
	Tue, 28 Oct 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642185;
	bh=WPuS1p03nJA56MEoRrTM+Ywn8nh+8dI3UapF3Ehxvpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/qUlU0ZPopjFTMLx4zYjlF2i9nz19usJHFqW8oZoBpQsXaVLIIUPFiJtVNUGvcem
	 I6BMGesn8kLn2u8QrlcyfeImFZsBa0ksoziH8pqUYlvqfaOzbgk/ciUEd5x5ScVIiT
	 6w1qAqNZVYtyb3R0ugjvBwgciveN84SPJuqnFi034iKCf1LEBRHgfZF8W76nAMcjhp
	 Ol9yO16MLt0ZNc+N76hYogP/ewRNr1sCWlzoddDUoUOqow/VezgwJi/hkJ68iD6dHW
	 UUL3zgb6LlJjtJi6p7arEfOAdzC4OgV3L9FMXSc3xw3DRMkpmNA7iV0Lde+fivLLdF
	 hA2OqtsnlbRuA==
Date: Tue, 28 Oct 2025 10:03:02 +0100
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
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Message-ID: <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>

On Mon, Oct 27, 2025 at 06:48:11PM +0100, Josua Mayer wrote:
> port property is used for linking dsi ports with dsi panels.
> Add port property to ronbo dsi panel binding.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> index 04f86e0cbac91..a2dc67a87fa3b 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      const: ronbo,rb070d30
>  
> +  port: true

Port is never the second property. Please look at other bindings.

Also, missing blank line and missing top-level ref for panel-common.

Best regards,
Krzysztof


