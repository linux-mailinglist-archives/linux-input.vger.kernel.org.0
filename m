Return-Path: <linux-input+bounces-3985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A183F8D5FAD
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 12:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8381F2237E
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131A4152500;
	Fri, 31 May 2024 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHg9/wm3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77E152188;
	Fri, 31 May 2024 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151099; cv=none; b=QTTvNW1XQ9G2o8MQIcQUrhnpCF8PENaPgYXGnqi80jolV4EvcdwdINqG4aoFhGJmuE42+w2ODQshB36nF4Hp6bXUlNVgACgpkpasT91sw1bPLBRR+jioOVCAnKYYsPHPBINOXG+EIs9brwvCtCcLAxqqMLPX2/+XQpeaZKA0S9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151099; c=relaxed/simple;
	bh=8maQ6Q3charUiy3VU7HJTXAXtan7ZZFMKnes9nHGVx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNZRJC0deWggZwGB3sZwW+kNpmf31v19efbG9ds06ZtcXDI5XGZrYcgW1/Gz3bXWtFVrrQXmhHFTyLWL+FUr/1rP674KY/R+5bW7QL/NBgCrqfioPJaPYNe/x2bJlNbL69BiORFDAqF+iEGwHrwGakgazhAwgp17ObG1qAs8OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHg9/wm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55F2C32786;
	Fri, 31 May 2024 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717151098;
	bh=8maQ6Q3charUiy3VU7HJTXAXtan7ZZFMKnes9nHGVx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHg9/wm3QJFLM7y46xYnGT2OcRoyqJGSga8lKn5AeWDpQCL5vgWpOT+zT3yXZuUee
	 l2Uot/6viN949g8jOi6QZ5BsyNzFywSjNAuMidmRnrk+8/0viNTlRXvyk6U38peEcG
	 an7pEvjzxUkadT52eQWITt0Vg4DbKGNOOfdu1RlAf5USxD3kPawNPvrEgpsowZ4fRn
	 rmfbhmtBkkJH3woz9/UcwuOfE0+Gf5lMosbkIYrLQ2Lvx/yCDxuyXSFi3xhXD94oXH
	 8LK+4fQJ+l3CxYFUMN0DuydYJhSHZcTahs6HQy2gNO2I8psRwsRAEjzsRf4j3dx9rE
	 0/3I/+fdZvK2g==
Date: Fri, 31 May 2024 11:24:52 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] mfd: add driver for Marvell 88PM886 PMIC
Message-ID: <20240531102409.GB1005600@google.com>
References: <20240504194632.2456-1-balejk@matfyz.cz>
 <20240504194632.2456-3-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240504194632.2456-3-balejk@matfyz.cz>

On Sat, 04 May 2024, Karel Balej wrote:

> Marvell 88PM886 is a PMIC which provides various functions such as
> onkey, battery, charger and regulators. It is found for instance in the
> samsung,coreprimevelte smartphone with which this was tested. Implement
> basic support to allow for the use of regulators and onkey.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     v6:
>     - Address Lee's comments:
>       - Don't break long line in the power off handler.
>       - Set PLATFORM_DEVID_NONE. This should be safe with respect to
>         collisions since there are no known devices with more than one of
>         these PMICs, plus given their general purpose nature it is unlikely
>         that there would ever be. Also include the corresponding header.
>       - Move all defines to the header.
>     - Give the base page's maximum register its real name.
>     - Set irq_base to 0.
>     v5:
>     - Address Mark's feedback:
>       - Move regmap config back out of the header and rename it. Also lower
>         its maximum register based on what's actually used in the downstream
>         code.
>     RFC v4:
>     - Use MFD_CELL_* macros.
>     - Address Lee's feedback:
>       - Do not define regmap_config.val_bits and .reg_bits.
>       - Drop everything regulator related except mfd_cell (regmap
>         initialization, IDs enum etc.). Drop pm886_initialize_subregmaps.
>       - Do not store regmap pointers as an array as there is now only one
>         regmap. Also drop the corresponding enum.
>       - Move regmap_config to the header as it is needed in the regulators
>         driver.
>       - pm886_chip.whoami -> chip_id
>       - Reword chip ID mismatch error message and print the ID as
>         hexadecimal.
>       - Fix includes in include/linux/88pm886.h.
>       - Drop the pm886_irq_number enum and define the (for the moment) only
>         IRQ explicitly.
>     - Have only one MFD cell for all regulators as they are now registered
>       all at once in the regulators driver.
>     - Reword commit message.
>     - Make device table static and remove comma after the sentinel to signal
>       that nothing should come after it.
>     RFC v3:
>     - Drop onkey cell .of_compatible.
>     - Rename LDO page offset and regmap to REGULATORS.
>     RFC v2:
>     - Remove some abstraction.
>     - Sort includes alphabetically and add linux/of.h.
>     - Depend on OF, remove of_match_ptr and add MODULE_DEVICE_TABLE.
>     - Use more temporaries and break long lines.
>     - Do not initialize ret in probe.
>     - Use the wakeup-source DT property.
>     - Rename ret to err.
>     - Address Lee's comments:
>       - Drop patched in presets for base regmap and related defines.
>       - Use full sentences in comments.
>       - Remove IRQ comment.
>       - Define regmap_config member values.
>       - Rename data to sys_off_data.
>       - Add _PMIC suffix to Kconfig.
>       - Use dev_err_probe.
>       - Do not store irq_data.
>       - s/WHOAMI/CHIP_ID
>       - Drop LINUX part of include guard name.
>       - Merge in the regulator series modifications in order to have more
>         devices and modify the commit message accordingly. Changes with
>         respect to the original regulator series patches:
>         - ret -> err
>         - Add temporary for dev in pm88x_initialize_subregmaps.
>         - Drop of_compatible for the regulators.
>         - Do not duplicate LDO regmap for bucks.
>     - Rewrite commit message.
> 
>  drivers/mfd/88pm886.c       | 148 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/Kconfig         |  12 +++
>  drivers/mfd/Makefile        |   1 +
>  include/linux/mfd/88pm886.h |  69 +++++++++++++++++
>  4 files changed, 230 insertions(+)
>  create mode 100644 drivers/mfd/88pm886.c
>  create mode 100644 include/linux/mfd/88pm886.h

I don't see any more issues.

Are you planning on seeing to Mark's review comments?

-- 
Lee Jones [李琼斯]

