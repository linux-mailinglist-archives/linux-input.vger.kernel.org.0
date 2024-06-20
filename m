Return-Path: <linux-input+bounces-4515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A518F910DDC
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 18:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60822281304
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABC91B3725;
	Thu, 20 Jun 2024 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uESIfZZj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E5B1B29DB;
	Thu, 20 Jun 2024 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902780; cv=none; b=HJhD97s92cQfLIKXR3GmH2itIOgJ15Ywno+AKwfh9Bm2RYHnhv0db+j3/ITkBT78GrG625W/PYdU/6jbvUVz0bI+JAGSHIeLK959ZZdgbPkkfYnX9FSRFCUQBUD+kbxrQ0hK5Jm6wRjmEIpfXxn/gGvsW5HDzM8sCS/lERCXa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902780; c=relaxed/simple;
	bh=fG8KVi5QY1mojekTQe9QhfP9G7BslmtuP+AahNEpXKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0ymX/Pn/ofyeAMKmq/skG/jL7V+So5ZjPnkHEpi8zva66cBZrcLyoyYOyrInm/NzyLcboA7lfk9CaUoCDZ01baSba1EPtr7ZchJ4rpMtck/DzErSNgD7OS4Rwcq+AHQuc8s1lBM72oGSmd1jC63UW/swfY2boMGRDyIaimDe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uESIfZZj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C290C4AF0B;
	Thu, 20 Jun 2024 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902780;
	bh=fG8KVi5QY1mojekTQe9QhfP9G7BslmtuP+AahNEpXKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uESIfZZjNiFBOVfE8qx6vk1wavLBvtON3pFwFOLTQeVYoCD7zXM/787Tnael/rCwy
	 vjkCw+SVFveD9XInTrP3T1pALwqgOMnXL6VLq7pZL74V9WwXSgGSpQJ4EGgxLcKb0t
	 /WnUTocdwhLlL7tFwWFn7pRFfgKGNtDVPDI11aqz+Omm2EZDgVKA5zKQotMXkQR8uD
	 BpuaBIUQZ4vqikxTKCjWU5yqSgWECvAtLDt8tICh/HlH7M0OOnjnkd66dfloryid2z
	 JNFVtVYFcTTo+orXCRCDpyivuzYWApI+bJdt6Ch1Ay8w94uuQtetFkHht9vDW8TZ7O
	 Gp0XIw20FuO0g==
Date: Thu, 20 Jun 2024 17:59:35 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Message-ID: <20240620165935.GT3029315@google.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>

On Thu, 20 Jun 2024, James Ogletree wrote:

> Changes in v11:
> - Constified function parameters in ASOC driver
> - Removed an unneeded #include
> - Changed number of max FF effects = 1
> - Minor refactoring in Input driver
> - Reworded comment in MFD driver
> 
> Changes in v10:
> - Minor refactoring and logical improvements all around
> - Renamed and added supplies
> 
> Changes in v9:
> - Fixed empty struct by utilizing cs_dsp's post_run callback
> - Style fixes in MFD driver
> 
> Changes in v8:
> - set_sysclk() -> set_bclk_ratio()
> - Added ID table to codec driver
> - Style improvements
> - Fixed ordering of new write sequence operations
> 
> Changes in v7:
> - Fixed sparse warning
> - Moved write sequences to private data structure
> - Logical and style improvements in write sequence interface
> 
> Changes in v6:
> - Updated write sequencer interface to be control-name based
> - Fixed a race condition and non-handling of repeats in playback callback
> - Stylistic and logical improvements all around
> 
> Changes in v5:
> - Added a codec sub-device to support I2S streaming
> - Moved write sequencer code from cirrus_haptics to cs_dsp
> - Reverted cirrus_haptics library; future Cirrus input
>   drivers will export and utilize cs40l50_vibra functions
> - Added more comments
> - Many small stylistic and logical improvements
> 
> Changes in v4:
> - Moved from Input to MFD
> - Moved common Cirrus haptic functions to a library
> - Incorporated runtime PM framework
> - Many style improvements
> 
> Changes in v3:
> - YAML formatting corrections
> - Fixed typo in MAINTAINERS
> - Used generic node name "haptic-driver"
> - Fixed probe error code paths
> - Switched to "sizeof(*)"
> - Removed tree reference in MAINTAINERS
> 
> Changes in v2:
> - Fixed checkpatch warnings
> 
> James Ogletree (5):
>   firmware: cs_dsp: Add write sequence interface
>   dt-bindings: input: cirrus,cs40l50: Add initial DT binding
>   mfd: cs40l50: Add support for CS40L50 core driver
>   Input: cs40l50 - Add support for the CS40L50 haptic driver
>   ASoC: cs40l50: Support I2S streaming to CS40L50
> 
>  .../bindings/input/cirrus,cs40l50.yaml        |  68 +++
>  MAINTAINERS                                   |  12 +
>  drivers/firmware/cirrus/cs_dsp.c              | 278 +++++++++
>  drivers/input/misc/Kconfig                    |  10 +
>  drivers/input/misc/Makefile                   |   1 +
>  drivers/input/misc/cs40l50-vibra.c            | 555 +++++++++++++++++
>  drivers/mfd/Kconfig                           |  30 +
>  drivers/mfd/Makefile                          |   4 +
>  drivers/mfd/cs40l50-core.c                    | 570 ++++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c                     |  68 +++
>  drivers/mfd/cs40l50-spi.c                     |  68 +++
>  include/linux/firmware/cirrus/cs_dsp.h        |  27 +
>  include/linux/mfd/cs40l50.h                   | 137 +++++
>  sound/soc/codecs/Kconfig                      |  11 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/cs40l50-codec.c              | 307 ++++++++++
>  16 files changed, 2148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
>  create mode 100644 drivers/input/misc/cs40l50-vibra.c
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h
>  create mode 100644 sound/soc/codecs/cs40l50-codec.c

Still needs Acks - ping me when you have them.

-- 
Lee Jones [李琼斯]

