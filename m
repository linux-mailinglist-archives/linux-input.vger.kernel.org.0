Return-Path: <linux-input+bounces-5747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E7695BAF8
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E1D1C235AC
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCEA1CCEE8;
	Thu, 22 Aug 2024 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6K1MwMC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2691C9EC4;
	Thu, 22 Aug 2024 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341813; cv=none; b=Jf9fNTjkOIk5HiLRfrro14LIC0Vw33sSzUP42l8weRvV5Zgu3rdPuYgUp3R36kmi/2Z9j5YItXW8ruLb2Z76JrA9YtTqP6fXF1csg5dBz5BHxysyA0+2kdIJqpWT1h+P8rLXE0opc6RHSZ24BoLhkWZ5obmmaWvraByhzTyUHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341813; c=relaxed/simple;
	bh=mSYYVTkmoYUtwEeD3+5W5SN/5U8n0bSGvGL2wpln02I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoLbJk+bBCl3pO7zjP9IMQj6CjM0x03nrYsC5Tknbc3D8Dyfh4cz1+ifG/nTyIhpLFYRyBWwhyrvZW9CxdcQcbOq2NeSPZt051WZmb77C0mdRYgs6N5X/kutQ0kr7XCzyUtTNJLxNmanc+qrDka27psfQbI+oRh6yu4I4wbVPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6K1MwMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EBAC32782;
	Thu, 22 Aug 2024 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724341812;
	bh=mSYYVTkmoYUtwEeD3+5W5SN/5U8n0bSGvGL2wpln02I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6K1MwMCwFEOkxtIaIbMeU0TrBxJfane8pGUBJ6VYEx2k83jAtyxlxNl+7NyiIeSM
	 927SjSGJ6VpC+UKlnIIn1CcFoAfpiw6Rw09m3p8OkSkQWTuXXqd6wmWFsYeXSKZWqV
	 3DLXmnJ3ynTeJLzCv264lodJwW/OXOdeFqZ3n5MM5y8A63BkS6R3PrIEjxVk0kTThF
	 9OOcKITbBVhu6nyH80cOeMgQ0LPuEFrwUDDDE0uCY7VSsNmnY8QmJw08CLAljv8+dl
	 WooW6mqJ9XPTQqdzNPdzBXqm6dys19KCjInZYf70lUHLkl1F6XiIBjRlIxmHRvCEX5
	 44vFZmmsu/tAw==
Date: Thu, 22 Aug 2024 17:50:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 13/14] ARM: s3c: crag6410: use software nodes/properties
 to set up GPIO keys
Message-ID: <4zsdppcuzdjgeipotbmdybhpaylpfpfmemyyfkpkn3b6qra6sq@3lzw2u4ji4cf>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-14-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-14-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:10PM -0700, Dmitry Torokhov wrote:
> Switch the gpio-keys device to use software inodes/properties to
> describe the buttons and switches. This will allow dropping support
> for platform data from the gpio-keys driver in the future.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  arch/arm/mach-s3c/gpio-samsung-s3c64xx.h |  5 ++
>  arch/arm/mach-s3c/gpio-samsung.c         | 35 +++++++++++
>  arch/arm/mach-s3c/mach-crag6410.c        | 80 +++++++++++++++++-------
>  3 files changed, 99 insertions(+), 21 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


