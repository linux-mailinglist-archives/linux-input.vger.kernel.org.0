Return-Path: <linux-input+bounces-15791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E7C1892E
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 08:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A29A8509110
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 06:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1810E30BF79;
	Wed, 29 Oct 2025 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoOGCBX/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F2DDAB;
	Wed, 29 Oct 2025 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761720879; cv=none; b=VpvUM0qzF9qon2bYhlNK70YFQUw8cvo/b0v+fGqjssXBla7CtddE8hLTWYGp6AtLuPxcjOygFsEhi8Ik5YmkKcVcYK5/Npy2VuPDkghV8YxgT7cvHZdQtlrqNLvFdyy/MY2w4HNjSVzR1ocSgbl7UWq9vBoPRYdyrOPWA95lYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761720879; c=relaxed/simple;
	bh=4R0KWm5wenARfob6/8rdlFzK0JPGL4SK/5QXUbNr0fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSoLJEjF9UnWbOGU1KtQCHs60yoppVnLl7ingYsVBGEkGDiBBix3zatY+g69wU2/9gLM/ZVku3MV3ETB0ubDSE7tBlLcwqaaz3ZNoBIThKASGpBeFF71T+CIDXgZo9sll2fmLilpf/h+MZYtnbRiOhk19AFuO1UXXOgzzqfP9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoOGCBX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92D6C4CEF7;
	Wed, 29 Oct 2025 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761720877;
	bh=4R0KWm5wenARfob6/8rdlFzK0JPGL4SK/5QXUbNr0fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoOGCBX/cw6SLW8xwKj6s01nFBcLcomcPVoM2OCePKFLKmx38aIFcU1CIuso7MS+m
	 /Cmi9FsnGoqGEeyJMKDGQHmzLOjiQgfexcXhFpN3d8wUqBz+4lQj7XkLpNRdcecD1f
	 eSgwSGIsdfibYJNUUWDFojMQ9UPAXeYlNPFiMKgbWfUQciuwwClV9M6sYPQvtgqT6/
	 5BnOGo4AgVNK2/JKflC8uu84rRrOuM2lGN2qEo/EU6DsXgsH+The4yXA+pwWY970Ql
	 isj9F7T3FwHzq23WXIRVxHxVJufFjViSx6jXr96BeAzRhUUS4jqXL9FxcUSs0tJfYx
	 +ojU0IIsV3jWQ==
Date: Wed, 29 Oct 2025 07:54:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: input: fsl,scu-key: Add compatible
 string fsl,imx8qm-sc-key
Message-ID: <20251029-nickel-lorikeet-of-conversion-ea447d@kuoka>
References: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
 <20251028-b4_qm_scu_key-v1-1-9732e92a5e83@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4_qm_scu_key-v1-1-9732e92a5e83@nxp.com>

On Tue, Oct 28, 2025 at 04:01:28PM -0400, Frank Li wrote:
> Add compatible string fsl,imx8qm-sc-key for i.MX8QM and fallback to
> fsl,imx-sc-key.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/input/fsl,scu-key.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


