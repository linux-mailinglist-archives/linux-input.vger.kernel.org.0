Return-Path: <linux-input+bounces-3428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 868248BAA17
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2024 11:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7061B21744
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2024 09:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C506F14F9C1;
	Fri,  3 May 2024 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asEolMju"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6214EC5E;
	Fri,  3 May 2024 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714729406; cv=none; b=i8zzgK/LQAKvxJmpiQ928XBp6tzE64GRiPDvxZpqBbf5zwodt04QsxcYw2Lsi9wxgsibnUfOoIJkWaEb1cqZcr434+O9NLQ8zM0704RV0fLnT12p2lgBqeag40R/RYUYih6jrH1N55bpu1phiv0bEsPlC6Bb8ssMys77bi1xvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714729406; c=relaxed/simple;
	bh=rdkGL5zAgtlTdBAu4bUr2IDxNC1yUPBfhs1xZZnCq6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAg022LFP7BYPYRfQ8u1fBYWdZbQF0wc2qEsm0SABfU80+3bDOxGNr/DKZiDR5YoRIpyfCFi1IFOYoM9GKbgnauuP2XL6yoZSS6ZtZm53plnVPwgBDNmVD0pyhevVZnTblBp1eI4DHwcLJsyDwCRxkgZK+c30+jAhwccyQckvHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asEolMju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86F9C116B1;
	Fri,  3 May 2024 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714729406;
	bh=rdkGL5zAgtlTdBAu4bUr2IDxNC1yUPBfhs1xZZnCq6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asEolMjuv8xoKoz+QvucW8JAUGDB/4TvsxuaDxEF9wPMOFFbLVoDlcEyonZx2xGEI
	 /MaOwyfmiL7XfwM+85bfYIYBYR3TGGfWJ98qteU11Uw5xnjt8owRtcpgaiJ2o933YY
	 R9OF2uHC1yNYe08tGZyCZLl3gVz0ZHXyvdjqb4PFBTAmMbBAdLKNLcNYcziLkJmieu
	 cRrRGe7zS+L+VC6E8pOpidyLORmjZ6kccIWMK5gX2QFd88ZjQkOyznHkZhpJ6Aw6BN
	 3oj4pNT3C+SE7Chsg47V7MFEzmYbcM+3i/8bgprdxNCJnvpCvbQzX7B+iwyI56nXaD
	 HJkvTfBJxzyiA==
Date: Fri, 3 May 2024 10:43:19 +0100
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 00/19] backlight: Constify lcd_ops
Message-ID: <20240503094319.GP1227636@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <171472928415.1323021.3458121588308140519.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171472928415.1323021.3458121588308140519.b4-ty@kernel.org>

On Fri, 03 May 2024, Lee Jones wrote:

> On Wed, 24 Apr 2024 08:33:26 +0200, Krzysztof Kozlowski wrote:
> > Changes in v2:
> > - Collect tags, including wrongly places Thomas' tag (which requires me
> >   to manually edit 15 other patches to drop it).
> > - Combine here checkpatch patch:
> >   https://lore.kernel.org/all/20240414185440.288812-1-krzk@kernel.org/
> > - Link to v1: https://lore.kernel.org/r/20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/19] backlight: Constify lcd_ops
>         commit: 9258e31adebf0ccf0797867841f3f9800695dba2
> [02/19] backlight: ams369fg06: Constify lcd_ops
>         commit: 8053c4fa200c3fef07859bac9469ad3f26f5aba1
> [03/19] backlight: corgi_lcd: Constify lcd_ops
>         commit: 18c5d4ab9f6312f2c9c6c409287d552112db810a
> [04/19] backlight: hx8357: Constify lcd_ops
>         commit: 1d669c1998b559393ec2eaac0449f4989a255049
> [05/19] backlight: ili922x: Constify lcd_ops
>         commit: e77fef89de954b1557cb91b64696cd4fc06c80ad
> [06/19] backlight: ili9320: Constify lcd_ops
>         commit: 06cfc92faa1eabb2ea226c58d6fd0b5ab117ee39
> [07/19] backlight: jornada720_lcd: Constify lcd_ops
>         commit: a54b4999dc204bc5839bb70602078c7c8e4a5010
> [08/19] backlight: l4f00242t03: Constify lcd_ops
>         commit: 657e6c1b270e9f4a890059f5d08a08ea842fa1a8
> [09/19] backlight: lms283gf05: Constify lcd_ops
>         commit: 66e5a10818fd332e973d36429e36f4c436a86a91
> [10/19] backlight: lms501kf03: Constify lcd_ops
>         commit: 31c205d1e8426dd0cce0143c500ff1ff71fe64d1
> [11/19] backlight: ltv350qv: Constify lcd_ops
>         commit: 24424f84d7568d9d794657622e080b1cba1e9290
> [12/19] backlight: otm3225a: Constify lcd_ops
>         commit: 02949072ee8fb6141cd8ac2be9867ef466580ddb
> [13/19] backlight: platform_lcd: Constify lcd_ops
>         commit: d217a8d5a39851caa16996756682715c9debb4a9
> [14/19] backlight: tdo24m: Constify lcd_ops
>         commit: c7a1809d1982f671e66a4b1c1ffd8bdd5ba260aa
> [15/19] HID: picoLCD: Constify lcd_ops
>         commit: 238724635763e7c5d82c0581b0c49e5dfdd5505a
> [16/19] fbdev: clps711x: Constify lcd_ops
>         commit: 55d9a955375af3b3fd5725a9b5cbc658d4bdd244
> [17/19] fbdev: imx: Constify lcd_ops
>         commit: a6abbb5783345c4c7cc9fbd583b81e167bd0207d
> [18/19] fbdev: omap: lcd_ams_delta: Constify lcd_ops
>         commit: ca991e8e096c9f0cff0300289e2d4813192b8ef3
> [19/19] const_structs.checkpatch: add lcd_ops
>         commit: f02aeccbec6108d768f54d31e7cb48b06c0e3814

Please ensure you use checkpatch.pl before submitting:

====

ERROR: Does not appear to be a unified-diff format patch

total: 1 errors, 0 warnings, 0 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

"[PATCH v2 19/19] const_structs.checkpatch: add lcd_ops" has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
WARNING: Missing commit description - Add an appropriate one

ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 7 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

====

Some of them are a little odd.  I fixed the relevant ones

Submitted for build testing.

If successful, I'll submit a PR for the other maintainers soon.

-- 
Lee Jones [李琼斯]

