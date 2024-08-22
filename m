Return-Path: <linux-input+bounces-5746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1695BAEF
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E71D1C20F7F
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4AC1CC8B6;
	Thu, 22 Aug 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqu0Yazw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF41CC892;
	Thu, 22 Aug 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341760; cv=none; b=QgqXh7/GdRFWVoMTQnEnvmprp3PPbFbjsEjB1FM41JdENBon8N549QGuxHMnlE1O1JglME56fa23Q6Bac0fjBILYTqqM3cV32nWjAWf4ZoW0sJZft3U6QmyUNJWIQimt0MVzT/XeYBbH+h6bZkGJRMWehElg7eSqKKwKyBawOyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341760; c=relaxed/simple;
	bh=r6e4+MB0BMi0nDYW7f+QbhtzlR69Tkrowry8L1Pk1Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdAy2BER3ZtvP29xXzJBAzFiAPrvGIhQ1sOLk2uN9HO4agG4R9A9SldVStZQeMc8nnYCqHOnCiovA2juwKSWh4CngwKkd/XvzZ+AyAmktDtNeh1OyHLL1rI7CQtoFSR3J78A8sjCAvaMKs86dhKcGSxsmqTzP/ar8i8Hq/I6wAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqu0Yazw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12870C32782;
	Thu, 22 Aug 2024 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724341760;
	bh=r6e4+MB0BMi0nDYW7f+QbhtzlR69Tkrowry8L1Pk1Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqu0YazwB5Cz2DzboGWe6bJo/9nGQZGVCnpZ9Ol0YsF6syeCHsV5aaa2kmVtKioQZ
	 GH/IUFYZhK6o09Mo/4IVmDyDgJqL+x594TQFT7tnL2t2xcRtH5oYWXaW+AQcDsyvG/
	 GUWoJWUGa+BwGtAfJT2vWLOdycSKsZUI+sro5cF6wncEGdaebEyZJljuZsJxzN6Ani
	 N2yv2E/J5RhwDG5nvXCbFCwDUWWPLzlSQ+5feXZY69YhwpHkW/l2xwamRbuyCNERwU
	 nZOcWbX0pYWijMvjvvo0bzmENPZfP3Sn2BxG2D0/hjdiuC9wZ8mcc4b/OiJ4KcQp5I
	 mnEkHJxJH/lgA==
Date: Thu, 22 Aug 2024 17:49:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 14/14] ARM: s3c: crag6410 - convert GPIO lookup tables to
 property entries
Message-ID: <3qfdoq7ycc54gqnvuesco7gtnabhgs5oanxx6dkdftmsjzxtw2@mprcx7qbhu5x>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-15-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-15-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:11PM -0700, Dmitry Torokhov wrote:
> Static property entries support defining GPIOs and are more similar to
> device tree properties and are not prone to losing link between device
> and a lookup table because of changes in device name. Convert the board
> to use them.
> 
> This also fixes issue with recent conversion to GPIO descriptors
> where GPIO lookup tables were specifying incorrect GPIO chip name
> ("GPIO<N>" vs "GP<N>").
> 
> Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
> Fixes: a45cf3cc72dd ("spi: s3c64xx: Convert to use GPIO descriptors")
> Fixes: 9a5ed0bac86e ("regulator: wm831x: Convert to use GPIO descriptors")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  arch/arm/mach-s3c/devs.c          |  35 ----------
>  arch/arm/mach-s3c/devs.h          |   1 -
>  arch/arm/mach-s3c/mach-crag6410.c | 108 ++++++++++++++++++------------
>  3 files changed, 67 insertions(+), 77 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


