Return-Path: <linux-input+bounces-10487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CDA4BA82
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 10:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EE13AEB81
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDF91F03D9;
	Mon,  3 Mar 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8FZA9Id"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA681DE3A4;
	Mon,  3 Mar 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993192; cv=none; b=ahFJ+ArRGyJ0ViQBaBMeAOFVxfYKhFFpCmDzSyDj6aj8S8yDWe9LWIsL3PtlfDWf3ZQPBfAlOHylHkhk2cV5MiJwT44PAyAcFskqUw4p2UOOb7XIoUGMdL5GzppI3RihX7hpUru2fEhBUcWsuYMg1C3Nu+CcWlsOQChREd/Ygnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993192; c=relaxed/simple;
	bh=QwuGfAuwprD+j2dKL09ENSbGeVpMOFZ5TDDf5sIlNtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohqig/EpqcvkHEjRrGqBqlcm5MZKkoA7jzSWV3vbQaAlHThbj4CW2rBlpQzkqP9sIaCTlejV3qRQUe+dYKjcs5PhUdKPrGy/ozEKBZyBYYTqVdjGPllL/IFKK8g+gyJQ62f2fxcywB8qwRAQeijB+Nl4ZopoUx1QqjTrXAok1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8FZA9Id; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B769C4CED6;
	Mon,  3 Mar 2025 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993192;
	bh=QwuGfAuwprD+j2dKL09ENSbGeVpMOFZ5TDDf5sIlNtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8FZA9Id8R90zWQ8FjBwyX7ZcCW9Zww9MJCH3Yi/tLksympvYv7MyL0qMOigIzmtl
	 zuE/pWLxqF6RPBvj+B7GivYjJRsfeSg1YiXaRa1045OWsIFBcv/J+Di4oHH31amxbw
	 qXkFK0kbSsx8JTV0tmQKYya7dCl7tcy1XFWWYm5Lc183mIZEYqaXrLbADNafbb/4vY
	 EXoASLWmaaGsuqFuh8i244lDMym+rGhrLz9IixHIf8SYKjrkIs2KBRwRUm35j3vZIm
	 U69//QV9+KsGEDxpv+O2cftt0qX3pEjJxAt3onuyLC8uMnkUMiMslDoWXzJD2OMSpY
	 jmqdPoeAfXS+g==
Date: Mon, 3 Mar 2025 10:13:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use
 unevaluatedProperties
Message-ID: <20250303-secret-emu-of-exercise-7c71f6@krzk-bin>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
 <20250301-pocof1-touchscreen-support-v3-1-af01c3b30b55@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-1-af01c3b30b55@joelselvaraj.com>

On Sat, Mar 01, 2025 at 05:43:07PM -0600, Joel Selvaraj wrote:
> In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
> FT8719 touchscreen is integrally connected to the display panel
> (EBBG FT8719) and thus should be power sequenced together with display
> panel using the panel property. Since the touchscreen controller uses
> almost all the properties present in touchscreen.yaml, let's remove
> additionalProperties: false and use unevaluatedProperties to include all
> the properties including the needed panel property.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


