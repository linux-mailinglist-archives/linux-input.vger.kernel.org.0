Return-Path: <linux-input+bounces-2622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08E88FE47
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 12:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D508B21FBF
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 11:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253967E103;
	Thu, 28 Mar 2024 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0V87NQs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8D524BD;
	Thu, 28 Mar 2024 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711626277; cv=none; b=lNu2OOXF03J24e1dSaGTTUghjRSb1IoDs1IVbrE0vxnSIG0A6O02i2vt/VGv+czBqyYQUejLopQoz6IFTBUt7uILK1e06Ynlta9s4jrtlO70GoDwQUN3VWEuyqvMcjSNgnRr7idhJQcoZMZ30PWovsOUU5PMA8h7LBqos8h/LwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711626277; c=relaxed/simple;
	bh=p/l9VIkENyT1OmY25HO3ekE387A0ApR8Gsw/jiLAWK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwOVAMHauvCn6QAHEAnst39zmDPMRMwpiMec7PbNYWdyHXcdR4Z516icFBo8r4oB5k0+7cFUjDeKIYgk8NKt2b9PwxgYLHvcIqlo6P/b32ke4C5FzPfq7QjvTGLbjYzURgfEBwVMQ+CaKcdLtXSd1xgSYaYNxuPxxYDabXIrtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0V87NQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30767C433C7;
	Thu, 28 Mar 2024 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711626276;
	bh=p/l9VIkENyT1OmY25HO3ekE387A0ApR8Gsw/jiLAWK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0V87NQsRixWt0dPQUP4wiEyCTi3RQUbUoHlZ3YjUUIytF9cN3IV4nx/CKutUGrZd
	 t2xT/a1e3It5eNYhj0gf4BeFdtMOYYlE83J0xxW9SxuZa/XdcC63gS1fa2ga2ul0Em
	 VheHSyLmCG3tlqmpnuNAkqX6j0UikLoMYtnAx/c0F58ldKXIFUYApS7lN7uM2sJ0cd
	 TpIKG6eQGPCX5G134LP4947KkSFfWk4mUFHtl0+U9oZbxoEtnF2gsbpGM3hd/Xxtm2
	 z+2EL4LxOPRbfi9ZVnCAezY7g2PnAaxm2KVWn0WqXvqfo1PvnVt0Vss7QMpWHugHKt
	 v6PDqDCiHXFXA==
Date: Thu, 28 Mar 2024 11:44:31 +0000
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 0/5] Add support for CS40L50
Message-ID: <20240328114431.GC13211@google.com>
References: <20240320192956.2395731-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320192956.2395731-1-jogletre@opensource.cirrus.com>

On Wed, 20 Mar 2024, James Ogletree wrote:

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
>  drivers/input/misc/cs40l50-vibra.c            | 577 ++++++++++++++++++
>  drivers/mfd/Kconfig                           |  30 +
>  drivers/mfd/Makefile                          |   4 +
>  drivers/mfd/cs40l50-core.c                    | 570 +++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c                     |  68 +++
>  drivers/mfd/cs40l50-spi.c                     |  68 +++
>  include/linux/firmware/cirrus/cs_dsp.h        |  27 +
>  include/linux/mfd/cs40l50.h                   | 137 +++++
>  sound/soc/codecs/Kconfig                      |  11 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/cs40l50-codec.c              | 308 ++++++++++
>  16 files changed, 2171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
>  create mode 100644 drivers/input/misc/cs40l50-vibra.c
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h
>  create mode 100644 sound/soc/codecs/cs40l50-codec.c

MFD part looks okay.

I need Acks from all of the other maintainers before I can process the set.

-- 
Lee Jones [李琼斯]

