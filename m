Return-Path: <linux-input+bounces-13399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBAAFABE2
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 08:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6B4178B74
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 06:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8F821CA08;
	Mon,  7 Jul 2025 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVd9TlOj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9613A3F7;
	Mon,  7 Jul 2025 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869550; cv=none; b=TKUkhO8KvjXuwN8BK6nBO2CFsRYs25groOlzbhBDXIfqdPf3119esd1l6q0GecqPC1MjmHRUfY7ExwRw1xz7NCbTjjUpGGpFSrwDsU38mUMvbm1HhBoGlCYEZjswDCLxAJpyALl0OkuBWywm1vsVvmx2TEcrXm1110oPGd0VTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869550; c=relaxed/simple;
	bh=BOQKea8RWb6pb8K1uHFfsWVviPbcfc6hGynQohPnLnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5qTcTWvirFJlf+/qIPIxoE4ItHa5jxf7mJuo0Nkcj83qb8OBeSRHbLGpdZd9g8VzZ9grv1Jb1/GT8qy+ChHb0GARXcio2ohbgw5yFU8Irdg7+G9HvjZkOK/4m3JbwlCdB/sEBC+zL05Ebs7QZIY+ygsuTWRZUi275K3exTZg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVd9TlOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F6DC4CEF5;
	Mon,  7 Jul 2025 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869550;
	bh=BOQKea8RWb6pb8K1uHFfsWVviPbcfc6hGynQohPnLnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVd9TlOjDMYh25rp+B4jbCPahvVsY5aDAXR2viHbY+zk7g8uZssUSNQBfh4aVuuR5
	 C4rINy3mKmmBeo61rcRy2FARahXx92CJ7DzC3ZHkM8oLLCyiETGRR2A9HBmomG440n
	 tmLRMg1ID1AWt0/q82y9CWTVhBuq7TSk7xrZQKBe3m9yyBRyTGchUnyws/TqN1KK51
	 3MIPaIoN8M9vlXymTErGD7Ud/K+UszYtG/cw7wHd2UiYxCv1wHuZTsYm76g1hrRaBt
	 09pP4wJuVmk4JpRjBYRWKvYUJolL8jatE7mL7Z8X+Omv3qQ6PMAhQKu+lSB1sYqBqb
	 hp91VI+9hhDWQ==
Date: Mon, 7 Jul 2025 08:25:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Janne Grunau <j@jannau.net>, Igor Opaniuk <igor.opaniuk@gmail.com>, 
	Neal Gompa <neal@gompa.dev>, Jeff LaBundy <jeff@labundy.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: input: touchscreen: add hynitron
 cst816x series
Message-ID: <20250707-groovy-transparent-raptor-a1d843@krzk-bin>
References: <20250706154430.357948-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706154430.357948-1-kuzhylol@gmail.com>

On Sun, Jul 06, 2025 at 05:44:29PM +0200, Oleh Kuzhylnyi wrote:
> Add documentation for Hynitron CST816x series touchscreen bindings.
> 
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> Changes in v9:
>  - Adjust linux,keycodes: Add items with event descriptions, and remove maxItems
>  - Adjust dt example: Fix four-spaces indentation

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


