Return-Path: <linux-input+bounces-5744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9E95BAB1
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE8A71C220A9
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559A1CCB48;
	Thu, 22 Aug 2024 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjsqXF51"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF91CCB3E;
	Thu, 22 Aug 2024 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341287; cv=none; b=iBf4WKVS5VlCGvDrLOYW9VdBhYpPzmPtMgKCM+WFXI8Vo/FIpuIM/QO+xHYd+JHx0WN3kDCmu2JSEJvl/N02v125gLxBRyGE61WvMswvFIv5md5KB+wIc523dDETOL0wCaMwXIAVkTvyZnTCtOs0S2xMDmO5Veq6g9YIiosgpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341287; c=relaxed/simple;
	bh=FTIfxkgUJ0SeKOnA4FuMYhtC+zNiQO/Sz/OaBtJ5cPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXVdPHpYVXzPq+ngt8W6j5s9isOdbIfEPKZ58gmPbiztRxD0mUaMs60tX2UkwQz8FpZKbFOxJpQFBB8HJH5Um03mpmpYvuY5rLY1dKWhzRTG297K8vOEwfeW2drsoXPCSSRD/nxMgyINVpkVNit6301fC84c7bFLgU51Lk3uJuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjsqXF51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311D6C4AF09;
	Thu, 22 Aug 2024 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724341287;
	bh=FTIfxkgUJ0SeKOnA4FuMYhtC+zNiQO/Sz/OaBtJ5cPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjsqXF51eDH6+qOKo8DQbMcNRiv0RxAwkeW5WQIkQSwlD5L9SwPEmuiIcVknMGaHe
	 6rZ5I4imgenmTOkHCjM2Bt+YFBfveD4ygP9ouNL0WDu03xjGhSA1wDdyqhYmPEiuSH
	 EPacgJ3K0n2p+3TshPeaCbnKE4Q3ErrbXH1lrmfJDcuk2czIETp6pm7Kop1niJm5Hb
	 Ier5Tm53jhIGxwbZAISFWxUfLpy6p51RrEsOpmHRA+BQMrvdllVfLg+HrtFqCbzNfM
	 ndR9z/GCvn9QzNciLbRpigKIAUC5fcUxr2Tt0spHEGSiFSkPdDJUkXyP0E5dtnyOJi
	 0LuG5QMzjNifA==
Date: Thu, 22 Aug 2024 17:41:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 11/14] ARM: s3c: crag6410: switch keypad device to
 software properties
Message-ID: <fd3ndlwcjtldu546h5s2seylzncdn5qwftsozkwj4al2f5zkr3@e4te24abely5>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-12-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-12-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:08PM -0700, Dmitry Torokhov wrote:
> Switch the keypad device to use software properties to describe the
> keypad. This will allow dropping support for platform data from the
> samsung-keypad driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  arch/arm/mach-s3c/Kconfig                |  5 ---
>  arch/arm/mach-s3c/Kconfig.s3c64xx        |  1 -
>  arch/arm/mach-s3c/Makefile.s3c64xx       |  1 -
>  arch/arm/mach-s3c/devs.c                 | 27 ------------
>  arch/arm/mach-s3c/devs.h                 |  1 -
>  arch/arm/mach-s3c/keypad.h               | 27 ------------
>  arch/arm/mach-s3c/mach-crag6410.c        | 56 ++++++++++++++++++------
>  arch/arm/mach-s3c/setup-keypad-s3c64xx.c | 20 ---------
>  8 files changed, 42 insertions(+), 96 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c/keypad.h
>  delete mode 100644 arch/arm/mach-s3c/setup-keypad-s3c64xx.c

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


