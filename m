Return-Path: <linux-input+bounces-16601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E90CC1A95
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 09:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9513053B03
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE15C3396F8;
	Tue, 16 Dec 2025 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DIq5brBR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3948338917;
	Tue, 16 Dec 2025 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874875; cv=none; b=CyR3A0KUj9s7q/NApt5b7LgEPW/5BFUhoKXVQNqfnyCM4QeG0YB7oa1rNpJHBCl9CvpDpdjr80ozjbJSUfFtODix08uTjVXpwJv7MpP4eaf8uXndtchLMQaRAZ8v6EFt+uLnpspj6PqxdIr+2Vi8YnnB+4aD2Uoz3k/elojtK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874875; c=relaxed/simple;
	bh=SJ/d7Yt++0K63irxwjqu7C5E1gWFAP2AUU0Q9oc3kas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roWGeUtNsO71b/rPJeOmD8v63KjYKnFNqF+4zJS1q3809pMiCBDCXqoy4KF5m368ESUlefTsJlFEgPrwJJoe6jHmL3ZKPbQMoS/ErXBIFea1O1CfAJt9RFba5r5TsAVYV+kA+dOXlxtCPXtjT3lCqVt+ZVkOTuJIOU2qw3nPu6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DIq5brBR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D77BEC19D35;
	Tue, 16 Dec 2025 08:47:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 30F5A6071C;
	Tue, 16 Dec 2025 08:47:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3461119431B8;
	Tue, 16 Dec 2025 09:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765874867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gvNrMludRXxgFxLNR7QEWDmK9gJ2gERs277nXQ2+YGM=;
	b=DIq5brBRta/TiINKp4M5huv5tPncOYq/k/KPgcFh83dyP2Ff4kqo0PKdlyN64UzI9pD3Z2
	8hYV/UlhLtD+/+EvXp59CEtjCStQ/UYa+3ZDJYzkyLgHCNtKfesWi+elbS4dfSGE5YGoIm
	KOGOCU5nkjsP/9eg90yut6i1bZ5hN/oUpGIVZh/2Xs2t7T/SJkvmmKEZqWOiPz+TGHiDDJ
	/kouSIHSFYczWt9VOtzmBImKNghpe9lFF1DPmkAJuVJlUsNAc7Yj3y04u8E2dM8gDiVb4U
	HWHn8uXh7VFwbrM+P+jW+Bkzoj9xMP9ltHAy1h6iMOUO5GxjoVI63YjKJnB3iA==
Date: Tue, 16 Dec 2025 09:47:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <202512160847455082a875@mail.local>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On 15/12/2025 13:29:29+0100, Nicolas Frattaroli wrote:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.
> 
> Add the property to the binding with the same default as gpio-keys.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
> index 7aa078dead37..e372ebc23d16 100644
> --- a/Documentation/devicetree/bindings/input/adc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
> @@ -42,6 +42,9 @@ patternProperties:
>  
>        linux,code: true
>  
> +      linux,input-type:
> +        default: 1  # EV_KEY
> +
>        press-threshold-microvolt:
>          description:
>            Voltage above or equal to which this key is considered pressed. No
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

