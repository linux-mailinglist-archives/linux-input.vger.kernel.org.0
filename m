Return-Path: <linux-input+bounces-4374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47B909FB6
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 22:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63BE1C2133F
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 20:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC3561FE3;
	Sun, 16 Jun 2024 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAO04SrC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052F5B1E5;
	Sun, 16 Jun 2024 20:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569803; cv=none; b=P0YE62e4MZoF+qttChw4munK6i1moB98PEuKLTWKF8vdmNQ141MMYZwaR++xz7M75ZEQzBPpYsqz1/xobpDt9fxcou4GkrLP7ccjPyfwHtfYuPYRCNrNplAxiwS3nWlsizYmq3DeaCDlThW93WKKaIdGOpg4ahz8xyvFQXsHyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569803; c=relaxed/simple;
	bh=QACmot+B60NDUZXxdSu/ZXjArN90wimBG84xzQ/510Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlY5x9LCi1v0XovA+rw6QC04+iDgf0W8iHGjLW11p2laZDCMQAYe39BO8Qd74HHrAiW/pVEcRu47P7ld4cO2dR4/jr6Ch+fqLIIX/tpsn2kUO51CKKNlMQGLnYbZk/6Sw6R75HJ5xAeEjcJJNpUoOKJ3RgnHFOuDlHunyu9Z5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAO04SrC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AFCC2BBFC;
	Sun, 16 Jun 2024 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718569802;
	bh=QACmot+B60NDUZXxdSu/ZXjArN90wimBG84xzQ/510Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAO04SrCbyCjiYbn+5h1ROGW7kyj+i2U9ise/H6aDR+tqPILiv0VAqXG5d+aU288Z
	 EekMi9RCLaA8KxoCwvpqEzmrj5btd/MvvPLhPBvALNCJv32XAyACh9IMUm3U+49Arj
	 /FIT9yWpsafiEJKuuCs+YFaMVeXkcGB+Ag3PdhoihjxizmtWm41EeKcQAowRY3o0q2
	 0LHrjdPxmoV/pWgh3NqCDu3qwdY7FmacqdsGI9RpLgqluqRQPpGmmqC9G8brfqN/zF
	 roKkZZFbyN6fmxJDnil7ope4EGbAfqXrXCGVeWbR+d3ARUMmkwykDQgaeRTESe1dqH
	 hD8QPpv2xMOOA==
Date: Sun, 16 Jun 2024 15:29:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: qcom,pm8xxx-vib: Document PM6150
 compatible
Message-ID: <yq5r2h45jtjewrvjxtd4cmgvnal35ku2ym4sgqs5hurzebh5zy@d3656hcns6hx>
References: <20240606181027.98537-1-adrian@travitia.xyz>
 <20240606181027.98537-2-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606181027.98537-2-adrian@travitia.xyz>

On Thu, Jun 06, 2024 at 08:10:26PM GMT, Jens Reidel wrote:
> The PM6150 vibrator module is compatible with the PMI632 vibrator
> module, document the PM6150 vibrator compatible as fallback for the
> PMI632 vibrator.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> index 2025d6a5423e..76a286ec5959 100644
> --- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,pmi632-vib
>        - items:
>            - enum:
> +              - qcom,pm6150-vib
>                - qcom,pm7250b-vib
>                - qcom,pm7325b-vib
>                - qcom,pm7550ba-vib
> -- 
> 2.45.1
> 

