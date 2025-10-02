Return-Path: <linux-input+bounces-15196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57740BB26A7
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 05:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40FA1924476
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 03:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5304A23D287;
	Thu,  2 Oct 2025 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ramtwr9p"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4B12CD88;
	Thu,  2 Oct 2025 03:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374441; cv=none; b=WdFgNGhrt/cO1pFExEFgrhWz0YM8wO8gA5Y11JIS0N1xLSYfUo6Sx2/TLGASZ2XVO3rVqb+317Q9Mb3AnRu/6kxAnxIL+yQl18lQj45qXr2tXnBIAIaXoDI2gDmH1U9cuBQ7uhHag9+zxYxHT6G/4gu/2e+1KeR4fdaY1cdAlx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374441; c=relaxed/simple;
	bh=JeT5tvlOvWYmnrAEdaIVrSzdL7W5TUhJqFYD/DOx+bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN5llqYmaFXPDhk7Zqf3nKA1J7uDiu0ZRXnTeuSt8E2R1JOcDKFolODYN1mpTBC393FnCKSBiTAv0xQQR8UL0JaFG2B3C22xnBNPcxXWv9v16pKn908ADbpnHHbELu4rJnKDC7+LxbGjTJSNeuS5ETukd9aryk5l7/r69pi59wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ramtwr9p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDABC4CEF1;
	Thu,  2 Oct 2025 03:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759374439;
	bh=JeT5tvlOvWYmnrAEdaIVrSzdL7W5TUhJqFYD/DOx+bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ramtwr9p7wXlIqewvySxczmyEsembhIEkPclUP89G1yfJgHVH41XbNiOVHAZyXMGB
	 nTafqSWkC0VSvzKSOu/Z74ycX//+zsPgSQw/v/Lbh+urORDbTnwmfbkkv8DE6O9j4g
	 WLYFa58vrYpwe86HRRqgvGGV4O4AOcDKPhjEip8b/s7yOPnu5u5gQu9D8MWscXqcE0
	 l9VaX5XHuV59j1+3wsy/vuNVOmGyrjx3Iq+VF7sd3JssFDDfhdbfa8IuuLuhLuxBLv
	 xt1CeOSJgfT8DX+j3ybD94dRCC2/uJzidokLKrGpZAUDdhAh4+SHh32g/8iHQsL4I6
	 LNrpqBjkjKuUA==
Date: Wed, 1 Oct 2025 22:07:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	imx@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <175937443731.2982292.3723741722041625819.robh@kernel.org>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-1-Frank.Li@nxp.com>


On Fri, 26 Sep 2025 14:47:11 -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> new patch
> 
> previous discussion
> https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
> ---
>  .../{maxim,max11801.yaml => trivial-touch.yaml}           | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/input/touchscreen/{maxim,max11801.yaml => trivial-touch.yaml} (74%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


