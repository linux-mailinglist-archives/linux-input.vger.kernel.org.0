Return-Path: <linux-input+bounces-8130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A25199D0874
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 05:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 403C8B21105
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 04:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866237F460;
	Mon, 18 Nov 2024 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivS5mdQ2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540701EB48;
	Mon, 18 Nov 2024 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731904745; cv=none; b=K45LOlD9DLdJ//G7/dAIDWta1PDP5zNV+FI2nEHg1gRUF4CDnFJUEYC5SUjKluIrdEy02k0BVqKn4LC1WI83YhmH7hSaK6vW4o4tCGfoEdEoahjFUeda4MC5iL2f6Rr6XdIN2FN2dsUnYUY9rXUHAAUumNlwQ6SYN/rrd8VnRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731904745; c=relaxed/simple;
	bh=7plGjMDEMlt/J3128k/TPdaPFrereg8GAEnNA6ZDp3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ti0NMpGkVEGpLsqIxUx5hLXdP49IWOOPQ/wuzfnpX8Twrih0wAQtrWK8xkkga2AjaMZ6Wu6/sxM8Xa0mGkZz4F+N5Q43qaXL6XwZbPz1JxEgqEnX0iByizX71csz0NBlulmo8XratCXs2IkuPl4a58Kn4ZDR2Q82/XZyM3ne4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivS5mdQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74D1C4CECC;
	Mon, 18 Nov 2024 04:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731904744;
	bh=7plGjMDEMlt/J3128k/TPdaPFrereg8GAEnNA6ZDp3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivS5mdQ2YkVCKsa/1qf47Je485JGu12/Co9/jGQ1gHijuFDoXJFh614PN2wglbj+Z
	 O9HBn8AJG2i/CoS12cxA0CZ+uxRp7/GzFAmfKcN8kG3VTZ7JAuXcazj/zdtpt0NUTS
	 UKShj+y+gdup+spREckOegw9/Ll34z2KgO+TO8PF3rkAaEdlhS4ghJosvfTVbfQvWP
	 xr7FSkse4t7zTd2eqkeWvBZV3HsB/rXPpz30+gSLC6RwHUZO7T0pkU4ADbs1FL2dBi
	 CUjBBgafrcwC7Uu8dmc3YGigpfTKByuV7GfFD/s3m3F1be9CN9GPfv5aJ/uBQtFy03
	 Msot7QvTcXYFQ==
Date: Sun, 17 Nov 2024 20:39:01 -0800
From: Kees Cook <kees@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Luca Ellero <l.ellero@asem.it>,
	linux-input@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - Expand xfer array to match usage
Message-ID: <202411172038.DF2CF9CD@keescook>
References: <20241117033445.work.274-kees@kernel.org>
 <5b203f2a-755a-448b-946a-f14d6060dbb7@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b203f2a-755a-448b-946a-f14d6060dbb7@denx.de>

On Sun, Nov 17, 2024 at 11:06:27PM +0100, Marek Vasut wrote:
> On 11/17/24 4:34 AM, Kees Cook wrote:
> > Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
> > clearing cycle") added commands to struct ser_req::xfer without
> > expanding it to hold them. Expand the array to the correct size.
> > 
> > ../drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
> > ../drivers/input/touchscreen/ads7846.c:416:18: error: array subscript 7 is above array bounds of 'struct spi_transfer[6]' [-Werror=array-bounds=]
> >    416 |         req->xfer[7].rx_buf = &req->scratch;
> >        |         ~~~~~~~~~^~~
> > ../drivers/input/touchscreen/ads7846.c:334:33: note: while referencing 'xfer'
> >    334 |         struct spi_transfer     xfer[6];
> >        |                                 ^~~~
> > 
> > Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> I think Nathan already sent a fix too.

Oh excellent! I did a search in lore before sending it but must have
failed to find it. Do you have a link to it?

-Kees

-- 
Kees Cook

