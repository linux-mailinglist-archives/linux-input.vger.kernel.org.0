Return-Path: <linux-input+bounces-9998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E86A32ADE
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 16:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A40416978A
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 15:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7A3256C8C;
	Wed, 12 Feb 2025 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URfurnxK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D0271814;
	Wed, 12 Feb 2025 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375459; cv=none; b=T9LgARlIKrfU3PSzsQ1hQvq5KG3mzYwQJBHtIOF2uTkSUhlKnryQY1oPgux/IEyRMdh5YQolJfps+g9lC6yAr/WtXhFtpxhq/LisxLb7FzG8egaCOGpbrMSMVMEmqFoN6brIBKfeZ1fUWplfjXTf7QZoFCTfyDGRzqh+gdMM9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375459; c=relaxed/simple;
	bh=veRJ1seuG5meNk+CJnoyOMvxRECby9IaNKYibL9rsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFRVFVSwSNkDQ/YIrxQISq4Mm6F9vdHA9cyzRd/ONocitJTiMzYRR5VXolP6oFpKuwJur0z4XanksTdJHSjDhstvVOORwNdzpkSvXXQucLvtRsTDxtEUZli8XAxhfMrgN3a4/3jygRIi7yfsk8Or15x4UnNFoKVvR/1zfnaEMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URfurnxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EE5C4AF0B;
	Wed, 12 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375458;
	bh=veRJ1seuG5meNk+CJnoyOMvxRECby9IaNKYibL9rsv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URfurnxKnHDqT67NaXeF+MY87//DBPNEdgtMNSbHJuEcs2WqelZJAMtNB2a7ExU3R
	 qNYbQaQH4EXETek/dstSEgt8j8HVHlX3VGNiv3f55CHQM6nvHpMKqdnZiZr39oPXUj
	 okfs6CO8CLUMyPiPLBzo+rU8ouluHvfaJdBM/aun3YMNEorHsyDPUVk9OTp1nVv+s5
	 hnIkBcqy8Ljx+z7bcLIDvwwE+jdBqmB4lu9wYSXb6GU+2pv6d3fhKh1eG34RodGRV0
	 V2acr5V1TiHFPzw0sCLhkCcpaxrDduHi7b6jaq1dcs3B6TK2Quh+5YEqLvXQiXzlOl
	 2Dmt7EuKcWo4g==
Date: Wed, 12 Feb 2025 15:50:50 +0000
From: Lee Jones <lee@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jeff LaBundy <jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
	Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
Message-ID: <20250212155050.GC2274105@google.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>

On Tue, 11 Feb 2025, Fred Treven wrote:

> On 2/5/25 04:34, Krzysztof Kozlowski wrote:
> > On 05/02/2025 00:18, Fred Treven wrote:
> > > Introduce support for Cirrus Logic Device CS40L26:
> > > A boosted haptic driver with integrated DSP and
> > > waveform memory with advanced closed loop algorithms
> > > and LRA protection.
> > > 
> > Please wrap commit message according to Linux coding style / submission
> > process (neither too early nor over the limit):
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> > 
> > 
> > > +
> > > +#include <linux/cleanup.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/mfd/cs40l26.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +static const struct mfd_cell cs40l26_devs[] = {
> > > +	{ .name = "cs40l26-codec", },
> > > +	{ .name = "cs40l26-vibra", },
> > > +};
> > > +
> > > +const struct regmap_config cs40l26_regmap = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 32,
> > > +	.reg_stride = 4,
> > > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > > +	.val_format_endian = REGMAP_ENDIAN_BIG,
> > > +	.max_register = CS40L26_LASTREG,
> > > +	.cache_type = REGCACHE_NONE,
> > > +};
> > > +EXPORT_SYMBOL_GPL(cs40l26_regmap);
> > > +
> > > +static const char *const cs40l26_supplies[] = {
> > > +	"va", "vp",
> > > +};
> > > +
> > > +inline void cs40l26_pm_exit(struct device *dev)
> > 
> > Exported function and inlined? This feels odd. Anyway, don't use any
> > inline keywords in C units.
> > 
> > > +{
> > > +	pm_runtime_mark_last_busy(dev);
> > > +	pm_runtime_put_autosuspend(dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_pm_exit);
> > > +
> > > +static int cs40l26_fw_write_raw(struct cs_dsp *dsp, const char *const name,
> > > +				const unsigned int algo_id, const u32 offset_words,
> > > +				const size_t len_words, u32 *buf)
> > > +{
> > > +	struct cs_dsp_coeff_ctl *ctl;
> > > +	__be32 *val;
> > > +	int i, ret;
> > > +
> > > +	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
> > > +	if (!ctl) {
> > > +		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	val = kzalloc(len_words * sizeof(u32), GFP_KERNEL);
> > 
> > Looks like an array, so kcalloc
> > 
> > > +	if (!val)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < len_words; i++)
> > > +		val[i] = cpu_to_be32(buf[i]);
> > > +
> > > +	ret = cs_dsp_coeff_write_ctrl(ctl, offset_words, val, len_words * sizeof(u32));
> > > +	if (ret < 0)
> > > +		dev_err(dsp->dev, "Failed to write FW control %s\n", name);
> > > +
> > > +	kfree(val);
> > > +
> > > +	return (ret < 0) ? ret : 0;
> > > +}
> > > +
> > > +inline int cs40l26_fw_write(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
> > > +			    u32 val)
> > > +{
> > > +	return cs40l26_fw_write_raw(dsp, name, algo_id, 0, 1, &val);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_fw_write);
> > > +
> > > +static int cs40l26_fw_read_raw(struct cs_dsp *dsp, const char *const name,
> > > +			       const unsigned int algo_id, const unsigned int offset_words,
> > > +			       const size_t len_words, u32 *buf)
> > > +{
> > > +	struct cs_dsp_coeff_ctl *ctl;
> > > +	int i, ret;
> > > +
> > > +	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
> > > +	if (!ctl) {
> > > +		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = cs_dsp_coeff_read_ctrl(ctl, offset_words, buf, len_words * sizeof(u32));
> > > +	if (ret) {
> > > +		dev_err(dsp->dev, "Failed to read FW control %s\n", name);
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < len_words; i++)
> > > +		buf[i] = be32_to_cpu(buf[i]);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +inline int cs40l26_fw_read(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
> > 
> > All your exported functions should have kerneldoc.
> 
> I'm happy to add this, but I don't know where this directive comes from.
> Could you share where in the kernel style guide (or elsewhere) this is stated?
> There are also hundreds of examples in MFD in which exported functions
> do not have kerneldoc which is why I'm curious.
> 
> > 
> > > +			   u32 *buf)
> > > +{
> > > +	return cs40l26_fw_read_raw(dsp, name, algo_id, 0, 1, buf);
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_fw_read);
> > > +
> > > +static struct cs40l26_irq *cs40l26_get_irq(struct cs40l26 *cs40l26, const int num, const int bit);
> > > +
> > > +static int cs40l26_gpio1_rise_irq(void *data)
> > > +{
> > > +	struct cs40l26 *cs40l26 = data;
> > > +
> > > +	if (cs40l26->wksrc_sts & CS40L26_WKSRC_STS_EN)
> > > +		dev_dbg(cs40l26->dev, "GPIO1 Rising Edge Detected\n");
> > > +
> > > +	cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
> > > +
> > > +	return 0;
> > > +}
> > 
> > 
> > ...
> > 
> > > +err:
> > > +	dev_err(cs40l26->dev, "Invalid revision 0x%02X for device 0x%06X\n", cs40l26->revid,
> > > +		cs40l26->devid);
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop)
> > > +{
> > > +	int i;
> > > +
> > > +	/* Retry in case DSP is hibernating */
> > > +	for (i = 0; i < CS40L26_PLL_NUM_SET_ATTEMPTS; i++) {
> > > +		if (!regmap_update_bits(cs40l26->regmap, CS40L26_REFCLK_INPUT,
> > > +					CS40L26_PLL_REFCLK_LOOP_MASK,
> > > +					pll_loop << CS40L26_PLL_REFCLK_LOOP_SHIFT))
> > > +			break;
> > > +	}
> > > +
> > > +	if (i == CS40L26_PLL_NUM_SET_ATTEMPTS) {
> > > +		dev_err(cs40l26->dev, "Failed to configure PLL\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cs40l26_set_pll_loop);
> > > +
> > 
> > This looks way past simple MFD driver. Not only this - entire file. You
> > configure there quite a lot and for example setting PLLs is not job for
> > MFD. This should be placed in appropriate subsystem.
> > 
> I disagree here because the configuration being done in this file
> is essential to the core operation of the part. For instance,
> setting the PLL to open-loop here is required to prevent any
> external interference (e.g. GPIO events) from interrupting
> the part while loading firmware.
> 
> The other hardware configuration being done here is required for
> both the Input and ASoC operations of the part.
> 
> Lastly, these need to be done in order and independently of which
> child driver (ASoC or input) the user adds. If this is moved
> to cs40l26-vibra.c (the input driver), for instance,
> and that module is then not added, it will disturb the
> required setup for use by the ASoC driver.
> 
> I would really like to get Lee's opinion here because it does not
> make sense to me why this is inappropriate when the configuration
> done in the core MFD driver is required for use by all of its
> children.

FWIW, I agree with Krzysztof.

There's a bunch of functionality in here that should be exported out to
leaf drivers which should reside in their associated subsystems.  From
just a quick glance that looks to include, but not necessary limited
to; IRQs, GPIOs and PLLs (Clocks).

MFD has been used for a dumping ground under the premise of "core
functionality" before.  Tolerance for those arguments are now fairly
low.

-- 
Lee Jones [李琼斯]

