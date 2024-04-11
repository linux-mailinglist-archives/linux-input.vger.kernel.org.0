Return-Path: <linux-input+bounces-2940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71C8A1979
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 18:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 863271C239C0
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1428615E20A;
	Thu, 11 Apr 2024 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CX5Di0Me"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBF15E1FC;
	Thu, 11 Apr 2024 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849732; cv=none; b=lslZtCa84bDoY1ak2Tl17Q1Wr30Icoj0/sjb0AhKGqcQudm3vcRb+oHVwB5xi5CoDtykUN9G/5SxYO2/hE55FXpzyA549o4+peBwMzp3up1AN7qhjS01T5vGVbDoetXeJcHKSjINCuQwfXevVHcEOSbhiBMPTg5hB5anBSKaAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849732; c=relaxed/simple;
	bh=z0pcroyd11LnVMpI4mi43HQ7jDXW13QpWwjLygxhuGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttP+8ZEEQaCi3OKL044hm80U3qG3rWDDEPn3Sil30I4z0RLOODUqXSonUhHgh/Dvx5tnfxQEnDZT0sJpHrJLgQv+aJ1aNmybyJh1XdhwxVpxgTVhy3ZJ/Ja6itpVbbBeLw3zyBh3e2038OUdSWykVyOUUZMyZIgaqEj+RFBs+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CX5Di0Me; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6B9C072AA;
	Thu, 11 Apr 2024 15:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712849730;
	bh=z0pcroyd11LnVMpI4mi43HQ7jDXW13QpWwjLygxhuGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CX5Di0MeJiiOLUI78MbeuBXjkRJntmpG2H/zV+uqpBdxEE3rsbOczeRF3FzbYGBsR
	 h2wfrTgLAaQnPicJHaZ6NqGqpMGbAK9Xi7Fsqw4q8WuxNRbfm015QuU69OV+5gT/8f
	 Sk0KqDXuwvQgcFX8FcAGFeY0WJACDnzBoRyYZMM0rSo5jdfPTE+Ut9WtspxL1AuwMK
	 8PdRtp4D4+iRSoXLW+5mrtu4nkUeYo9F3utAJNiuHp5nGQAeN03we2PfU1vhX5DM6s
	 y21K2PphWjyM4afWe2/25HNTeuFlJ1tLU2+9oTetnRTVUVuvM912MgZl+Mxvnysscx
	 0D/SlDzMBaabw==
Date: Thu, 11 Apr 2024 16:35:25 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v10 3/5] mfd: cs40l50: Add support for CS40L50
 core driver
Message-ID: <20240411153525.GF2399047@google.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-4-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408153214.42368-4-jogletre@opensource.cirrus.com>

On Mon, 08 Apr 2024, James Ogletree wrote:

> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  30 ++
>  drivers/mfd/Makefile        |   4 +
>  drivers/mfd/cs40l50-core.c  | 570 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c   |  68 +++++
>  drivers/mfd/cs40l50-spi.c   |  68 +++++
>  include/linux/mfd/cs40l50.h | 137 +++++++++
>  7 files changed, 879 insertions(+)
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h

Looks like this hasn't been updated since my last review.

-- 
Lee Jones [李琼斯]

