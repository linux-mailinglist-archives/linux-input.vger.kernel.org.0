Return-Path: <linux-input+bounces-5562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D1950E4F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 23:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DB00B245FC
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 21:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA931A7056;
	Tue, 13 Aug 2024 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irVKiXiW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D81E86A;
	Tue, 13 Aug 2024 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583115; cv=none; b=OJ92xoGZ9aanaSrcHQW2ngKRQEUgljxYDODRcNQciMZ5lp2PP6r3YkXXGlin67KQf4Eor7oSbDgOjrKbaysqm//u9cGnpoOoa+rf48WS2iW4UaFwCtmJQihylq5fWPM+uQSdc8vnnoI/EUEIG24+kksDvsG4jFmrCO+F1izjWRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583115; c=relaxed/simple;
	bh=NtciaEPd56tFHCb6ZhQWuehVK8h6IY4gj9IHnNOOXGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tznXhOZTflh2gysmVAO5LNDREynANQEOxP0x4fFc/ESn5H058dQ+xfiuU3s/1+2Wa+Yhr+vP1/LiOLSFWDyeMrSI46FTU1Qc2f4vp1S4SQieiQf6zpxd8ny2CMhBDVr6YkTo6aTjX3fCUYr5MMTrTtURlDnyhmIKPi2++jJWM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irVKiXiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16969C32782;
	Tue, 13 Aug 2024 21:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723583114;
	bh=NtciaEPd56tFHCb6ZhQWuehVK8h6IY4gj9IHnNOOXGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irVKiXiW2Oc/qn367hvFimsmiuW1S7jVtZ0cmab9jXhOjgAsvwN6xclT/r3RP4sCZ
	 rFn3lXwf1V2Ob0FjY9A/3U5UcP6auY5ylzwkQrnKYQEnS4FU/xDIPNNXkTKL83Jv2l
	 tj52L3S5MLqUIPKQxl3mdAbhamJ1ClPwhHig+e9z5UuwlfQ/q7NubkK29JWquFZz+m
	 popTBNn1e3G6UqOLQnOCoyR0dCiDf7h6W0g8yljAS4tJaWiMxTZ/VJ7ZFEyt36iRDb
	 pXtlLUgcGfoYqhuDEvEGrvgTX9fV5EG3Jnzd4qseJx7n6nXEI9UlBgQYLNNjqFHcwx
	 gHctwLb6HAZ8w==
Date: Tue, 13 Aug 2024 15:05:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	imx@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: convert rotary-encoder to yaml
Message-ID: <172358311160.2028662.8871129494345919782.robh@kernel.org>
References: <20240811214656.3773098-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811214656.3773098-1-Frank.Li@nxp.com>


On Sun, 11 Aug 2024 17:46:55 -0400, Frank Li wrote:
> Convert binding doc rotary-encoder.txt to yaml format.
> 
> Additional change:
> - Only keep one example.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: /rotary-encoder:
>     failed to match any schema with compatible: ['rotary-encoder']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/rotary-encoder.txt         | 50 -----------
>  .../bindings/input/rotary-encoder.yaml        | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


