Return-Path: <linux-input+bounces-9971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D0A31EA0
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 07:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89EEC168A09
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 06:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD481FC7DF;
	Wed, 12 Feb 2025 06:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVXpk/Dg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B61F0E55;
	Wed, 12 Feb 2025 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739341213; cv=none; b=bX1IKrk3VpplZxzmuV9XtiSNnmncYTDZcvQBWJqv297VXwximQ/MLKOeWqNa/YZ/yc28WANg8JXs+i/5tAwXjqoYFB8oGsaz1AS6KrNOX41/A8DO0OA0xqlIp7fXyCBrkWAOvAaoCuAUvKBA2IJn03ifrMYcVbHSjWxBYXvegAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739341213; c=relaxed/simple;
	bh=wbDldYyO3Krmi8fOY3r5irpwmx7oocImb77NHiathKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnb2A8KqC/sLWkUZ7uFAFoHqwvHzmmgRAAnTShY5ug9YOs/riNFuNCF7NtOnO4vFSqIEqCBFN/3/ZSCZsksEjW+GSEmTOFiSfZEggeal5jwe6nGYTZ7NKMch9OVenXMltN8xT6FYO2+0MGLmG1duq+ANr3BiQAMW0QAEXQDHFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVXpk/Dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88CFC4CEDF;
	Wed, 12 Feb 2025 06:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739341212;
	bh=wbDldYyO3Krmi8fOY3r5irpwmx7oocImb77NHiathKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XVXpk/DgCwaNVCGDEZVAiGW6rDtf8SH+KZOwpopORY23oSAi8lG06HP19CSNKYyW0
	 44K664T75rH/rSQ7R1IVgSA5OTyljYnuju/Wq+qDtFNIQaC4L5mnubg7JGp1cQYpF6
	 kJWJdST8/YY7TAHhrwyBQKM6SdxNFcXTXKiCEzHkdQF4+hQBuEJR3Cn6TaIrnMzZo6
	 i+msqotNM79mD04/hMypkfzMCl2W5qo6tCGy7gVA4PLlrbjyhKN3bAtUau2zYof/FZ
	 AnT+rDoBFlb3ICd5b50aHY8eVLqFWz5gaMAfIW/LcWPaXkCCKB2aJyWzURFASlPKZ+
	 mJhrkJGN70GEg==
Message-ID: <50f8e238-c9f5-4af2-adec-deee98dbb5e4@kernel.org>
Date: Wed, 12 Feb 2025 07:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
To: Fred Treven <ftreven@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Ben Bright <ben.bright@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Jeff LaBundy <jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
 Karel Balej <balejk@matfyz.cz>, Igor Prusov <ivprusov@salutedevices.com>,
 Jack Yu <jack.yu@realtek.com>, Weidong Wang <wangweidong.a@awinic.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Paul Handrigan <paulha@opensource.cirrus.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2025 22:16, Fred Treven wrote:
>>
>>> +	if (!val)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i < len_words; i++)
>>> +		val[i] = cpu_to_be32(buf[i]);
>>> +
>>> +	ret = cs_dsp_coeff_write_ctrl(ctl, offset_words, val, len_words * sizeof(u32));
>>> +	if (ret < 0)
>>> +		dev_err(dsp->dev, "Failed to write FW control %s\n", name);
>>> +
>>> +	kfree(val);
>>> +
>>> +	return (ret < 0) ? ret : 0;
>>> +}
>>> +
>>> +inline int cs40l26_fw_write(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
>>> +			    u32 val)
>>> +{
>>> +	return cs40l26_fw_write_raw(dsp, name, algo_id, 0, 1, &val);
>>> +}
>>> +EXPORT_SYMBOL_GPL(cs40l26_fw_write);
>>> +
>>> +static int cs40l26_fw_read_raw(struct cs_dsp *dsp, const char *const name,
>>> +			       const unsigned int algo_id, const unsigned int offset_words,
>>> +			       const size_t len_words, u32 *buf)
>>> +{
>>> +	struct cs_dsp_coeff_ctl *ctl;
>>> +	int i, ret;
>>> +
>>> +	ctl = cs_dsp_get_ctl(dsp, name, WMFW_ADSP2_XM, algo_id);
>>> +	if (!ctl) {
>>> +		dev_err(dsp->dev, "Failed to find FW control %s\n", name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ret = cs_dsp_coeff_read_ctrl(ctl, offset_words, buf, len_words * sizeof(u32));
>>> +	if (ret) {
>>> +		dev_err(dsp->dev, "Failed to read FW control %s\n", name);
>>> +		return ret;
>>> +	}
>>> +
>>> +	for (i = 0; i < len_words; i++)
>>> +		buf[i] = be32_to_cpu(buf[i]);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +inline int cs40l26_fw_read(struct cs_dsp *dsp, const char *const name, const unsigned int algo_id,
>>
>> All your exported functions should have kerneldoc.
> 
> I'm happy to add this, but I don't know where this directive comes from.
> Could you share where in the kernel style guide (or elsewhere) this is stated?
> There are also hundreds of examples in MFD in which exported functions
> do not have kerneldoc which is why I'm curious.


You are not looking hard enough. It's explicitly mentioned in kernel doc
documentation.

> 
>>
>>> +			   u32 *buf)
>>> +{
>>> +	return cs40l26_fw_read_raw(dsp, name, algo_id, 0, 1, buf);
>>> +}
>>> +EXPORT_SYMBOL_GPL(cs40l26_fw_read);
>>> +
>>> +static struct cs40l26_irq *cs40l26_get_irq(struct cs40l26 *cs40l26, const int num, const int bit);
>>> +
>>> +static int cs40l26_gpio1_rise_irq(void *data)
>>> +{
>>> +	struct cs40l26 *cs40l26 = data;
>>> +
>>> +	if (cs40l26->wksrc_sts & CS40L26_WKSRC_STS_EN)
>>> +		dev_dbg(cs40l26->dev, "GPIO1 Rising Edge Detected\n");
>>> +
>>> +	cs40l26->wksrc_sts |= CS40L26_WKSRC_STS_EN;
>>> +
>>> +	return 0;
>>> +}
>>
>>
>> ...
>>
>>> +err:
>>> +	dev_err(cs40l26->dev, "Invalid revision 0x%02X for device 0x%06X\n", cs40l26->revid,
>>> +		cs40l26->devid);
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop)
>>> +{
>>> +	int i;
>>> +
>>> +	/* Retry in case DSP is hibernating */
>>> +	for (i = 0; i < CS40L26_PLL_NUM_SET_ATTEMPTS; i++) {
>>> +		if (!regmap_update_bits(cs40l26->regmap, CS40L26_REFCLK_INPUT,
>>> +					CS40L26_PLL_REFCLK_LOOP_MASK,
>>> +					pll_loop << CS40L26_PLL_REFCLK_LOOP_SHIFT))
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == CS40L26_PLL_NUM_SET_ATTEMPTS) {
>>> +		dev_err(cs40l26->dev, "Failed to configure PLL\n");
>>> +		return -ETIMEDOUT;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(cs40l26_set_pll_loop);
>>> +
>>
>> This looks way past simple MFD driver. Not only this - entire file. You
>> configure there quite a lot and for example setting PLLs is not job for
>> MFD. This should be placed in appropriate subsystem.
>>
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

Sure.

...

> 
> 
>>
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(spi, cs40l26_id_spi);
>>> +
>>> +static const struct of_device_id cs40l26_of_match[] = {
>>> +	{ .compatible = "cirrus,cs40l26a" },
>>> +	{ .compatible = "cirrus,cs40l27b" },
>>
>> So devices are compatible? Or rather this is unsynced with other ID table.
> I'm not sure what you mean by this.


Lack of driver data means devices are compatible or some sort of other
problem (e.g. ID tables not being in sync, because they are supposed to
be always in sync). Choose, but it is almost never correct. Either
correct the issue or mention why exception is justified.

Best regards,
Krzysztof

