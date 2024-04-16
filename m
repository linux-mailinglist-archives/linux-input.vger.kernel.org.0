Return-Path: <linux-input+bounces-3094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E588A788E
	for <lists+linux-input@lfdr.de>; Wed, 17 Apr 2024 01:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D161C20F49
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 23:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB0313A404;
	Tue, 16 Apr 2024 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsMh8z45"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1145A4D8;
	Tue, 16 Apr 2024 23:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713310096; cv=none; b=mt69gCFoJ1yBZO7FM/RD2pR++yeYgvdb8DPJ7wTncFCTgRyTW8Rn+gGex+wGK5dGzMlznj1UQKFpRPqBufMGjQ/f3bENejQ8FLLb9WVZrzRTsVp+cdlIgR+WU0pQtZjlNGnbXVzWWJIyv0817coZ24ObgOCAqQrpp+6ixFRyf7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713310096; c=relaxed/simple;
	bh=zYmUTSQZcyzKBovZcx5sqFC7tGFXafGPv3PVb6c5g3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHiEVQTGcSfCBvzTdudqiSvzL5ubqO0f0cD+uriX9OrbWgBheEJDYj26KPG2HYKZcqrF/yu+i+O5hJlCYOPXroF1kHpqb/kzSCeQ7OHV/DsER9x+cS3gUpeBdGkfzyhCmgnhyTR8gJShZ9zwfO0PfTPVt/ZalS//DGDup+OGd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsMh8z45; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ecff9df447so5004032b3a.1;
        Tue, 16 Apr 2024 16:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713310093; x=1713914893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcicAOIqU6mhSWlDYQB3eNVf5iJeGvV5zVvGv8bI8D0=;
        b=NsMh8z45RJScs3sfnhwv78NXCvC3ZpJWzEc8qbitKoyLWDMI/LpamWPolGaEJquRIC
         li4Nfnrgxg5pHYyu3RIFVEYIoC/McABFJGtPKuWWXd1WNoEUHbREqV6++WXwkgXPL5jX
         Cfnq744XSHHRvtinDsfyfnQGLbeoEHQQBIdPXahmUlN7KO/FHn/y/NO/JlIh9cLTboBt
         u+mw0Qief3m6+ELWgPntVa2dAi52S5qw8UpfLda8I4xE85veOdHTqkoWUD7ni2pAVa4c
         GODZmLHpBmav8nlDYsmJNROjkYbtrVLHV4v3mIAMaizSW9wtRW37IpgoZizG/rVmGf8N
         TFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713310093; x=1713914893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcicAOIqU6mhSWlDYQB3eNVf5iJeGvV5zVvGv8bI8D0=;
        b=XmCdu8A5/fui7Po2DTuLiMy5JLiMLOwZxmdKxX5/99bNlj78xlaz+3FX8U0l0L9qDs
         jLq8I0nUwFMm3f1OLzP/fC2piWjhrt8rdcFm1ne694vm9GwRcyOK5JPkH8LJAqZerf9Q
         Pw9OCQoSxDYgw5yX+OPeIiruLRUqhH9UT6qRIjEDA2mdzMsgSIbya97sII1ZEpf/DQ4Z
         nMJ67JxthlAeGQvxagcbPF6dAf0BjrOh3sR+YkPnaRdbWKJ+su6BrvExk3tsl2MMlclY
         rj9MBhosMgiVHgEG44/KnWerWAS5fC1FXOQvB8+C8D9FqPM5OvxFAyzO0s+j9gqqMspj
         gkWw==
X-Forwarded-Encrypted: i=1; AJvYcCXev1hJ9l6xUMeIO+o5+zGxk9pOEdKyBE5/Ulw7Mu7gAQ1DskJEqrfVqK0QoDorHBseMEA45iU7lW0HQtwwGOXqApcMBZZq6mcPy9hofgkmSEkiH4n6bco6OFQVENsGNyfkBVBD2gS7kiukmkokdDYmqB8OBVlqj9JpRAy0448XGc+/2rc=
X-Gm-Message-State: AOJu0Yw/G1t38J5Wu1rvcDygebwajPV5kgJUk9p7mxybYAKt9/TAm05u
	hRmt4mlX9Gg8jlkdhaM1KLlaURe/bdmtYuoYr3Rls6/aD9BYciHM
X-Google-Smtp-Source: AGHT+IFSSpwWnnX8UhSd1JNjINz/7I8Z7Ll0ogOfq48dDdH+l3mjkDJDzBBIu+a1wY8ZQtGQCGheag==
X-Received: by 2002:a05:6a20:dca0:b0:1a7:4a6f:f1a6 with SMTP id ky32-20020a056a20dca000b001a74a6ff1a6mr16224873pzb.3.1713310093051;
        Tue, 16 Apr 2024 16:28:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f653:fa41:d59f:2f4d])
        by smtp.gmail.com with ESMTPSA id s9-20020a056a00178900b006e6a684a6ddsm9475809pfg.220.2024.04.16.16.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:28:12 -0700 (PDT)
Date: Tue, 16 Apr 2024 16:28:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, lee@kernel.org, broonie@kernel.org,
	jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Message-ID: <Zh8JimSH4cFZsy3o@google.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-5-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408153214.42368-5-jogletre@opensource.cirrus.com>

Hi James,

On Mon, Apr 08, 2024 at 03:32:13PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The input driver provides the interface for control of
> haptic effects through the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
> v10:
> Minor concern that playback stop is still misused with respect to not
> specifying an effect ID. The device can only play one effect at a
> time, but setting max effects for the EVIOCGEFFECTS ioctl to 1 would
> restrict the number of uploads to 1 as well.

Sorry for a long delay on my part.

Unfortunately this is not a minor concern, because it breaks the API
that we so far been presenting to userspace. EVIOCGEFFECTS ioctl which returns
input->ff->max_effects is described as "Report number of effects
playable at the same time".

I suggest you limit number of effects to 1 so that we can merge the
driver with such limitation, and then try to figure out how to expand
the API. We will probably have to split the notion of number of playable
effects vs number of uploadable effects, and only accept uploads of
effects that exceed number of playable effects if they all have the same
owner, so that different processes would not be able to affect each
other in case when number of simultaneously playable effects is smaller.

A few code comments below...

> 
>  MAINTAINERS                        |   1 +
>  drivers/input/misc/Kconfig         |  10 +
>  drivers/input/misc/Makefile        |   1 +
>  drivers/input/misc/cs40l50-vibra.c | 577 +++++++++++++++++++++++++++++
>  4 files changed, 589 insertions(+)
>  create mode 100644 drivers/input/misc/cs40l50-vibra.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e804f3766cba..49c2e6e57b09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4940,6 +4940,7 @@ M:	Ben Bright <ben.bright@cirrus.com>
>  L:	patches@opensource.cirrus.com
>  S:	Supported
>  F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> +F:	drivers/input/misc/cs40l*
>  F:	drivers/mfd/cs40l*
>  F:	include/linux/mfd/cs40l*
>  
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 6ba984d7f0b1..ee45dbb0636e 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -140,6 +140,16 @@ config INPUT_BMA150
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called bma150.
>  
> +config INPUT_CS40L50_VIBRA
> +	tristate "CS40L50 Haptic Driver support"
> +	depends on MFD_CS40L50_CORE
> +	help
> +	  Say Y here to enable support for Cirrus Logic's CS40L50
> +	  haptic driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cs40l50-vibra.
> +
>  config INPUT_E3X0_BUTTON
>  	tristate "NI Ettus Research USRP E3xx Button support."
>  	default n
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 04296a4abe8e..88279de6d3d5 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
>  obj-$(CONFIG_INPUT_CMA3000_I2C)		+= cma3000_d0x_i2c.o
>  obj-$(CONFIG_INPUT_COBALT_BTNS)		+= cobalt_btns.o
>  obj-$(CONFIG_INPUT_CPCAP_PWRBUTTON)	+= cpcap-pwrbutton.o
> +obj-$(CONFIG_INPUT_CS40L50_VIBRA)	+= cs40l50-vibra.o
>  obj-$(CONFIG_INPUT_DA7280_HAPTICS)	+= da7280.o
>  obj-$(CONFIG_INPUT_DA9052_ONKEY)	+= da9052_onkey.o
>  obj-$(CONFIG_INPUT_DA9055_ONKEY)	+= da9055_onkey.o
> diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
> new file mode 100644
> index 000000000000..5440cf224f59
> --- /dev/null
> +++ b/drivers/input/misc/cs40l50-vibra.c
> @@ -0,0 +1,577 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/input.h>
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +/* Wavetables */
> +#define CS40L50_RAM_INDEX_START		0x1000000
> +#define CS40L50_RAM_INDEX_END		0x100007F
> +#define CS40L50_RTH_INDEX_START		0x1400000
> +#define CS40L50_RTH_INDEX_END		0x1400001
> +#define CS40L50_ROM_INDEX_START		0x1800000
> +#define CS40L50_ROM_INDEX_END		0x180001A
> +#define CS40L50_TYPE_PCM		8
> +#define CS40L50_TYPE_PWLE		12
> +#define CS40L50_PCM_ID			0x0
> +#define CS40L50_OWT_CUSTOM_DATA_SIZE	2
> +#define CS40L50_CUSTOM_DATA_MASK	0xFFFFU
> +
> +/* DSP */
> +#define CS40L50_GPIO_BASE		0x2804140
> +#define CS40L50_OWT_BASE		0x2805C34
> +#define CS40L50_OWT_SIZE		0x2805C38
> +#define CS40L50_OWT_NEXT		0x2805C3C
> +
> +/* GPIO */
> +#define CS40L50_GPIO_NUM_MASK		GENMASK(14, 12)
> +#define CS40L50_GPIO_EDGE_MASK		BIT(15)
> +#define CS40L50_GPIO_MAPPING_NONE	0
> +#define CS40L50_GPIO_DISABLE		0x1FF
> +
> +enum cs40l50_bank_type {
> +	CS40L50_WVFRM_BANK_RAM,
> +	CS40L50_WVFRM_BANK_ROM,
> +	CS40L50_WVFRM_BANK_OWT,
> +	CS40L50_WVFRM_BANK_NUM,
> +};
> +
> +/* Describes an area in DSP memory populated by effects */
> +struct cs40l50_bank {
> +	enum cs40l50_bank_type type;
> +	u32 base_index;
> +	u32 max_index;

This looks like it is written to the device, so I think this needs
proper endianness annotation. Is there any concern about padding between
the type and base_index?

> +};
> +
> +struct cs40l50_effect {
> +	enum cs40l50_bank_type type;
> +	struct list_head list;
> +	u32 gpio_reg;
> +	u32 index;
> +	int id;
> +};
> +
> +/* Describes haptic interface of loaded DSP firmware */
> +struct cs40l50_vibra_dsp {
> +	struct cs40l50_bank *banks;
> +	u32 gpio_base_reg;
> +	u32 owt_offset_reg;
> +	u32 owt_size_reg;
> +	u32 owt_base_reg;
> +	u32 push_owt_cmd;
> +	u32 delete_owt_cmd;
> +	u32 stop_cmd;
> +	int (*write)(struct device *dev, struct regmap *regmap, u32 val);
> +};
> +
> +/* Describes configuration and state of haptic operations */
> +struct cs40l50_vibra {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct input_dev *input;
> +	struct mutex lock;
> +	struct workqueue_struct *vibe_wq;
> +	struct list_head effect_head;
> +	struct cs40l50_vibra_dsp dsp;
> +};
> +
> +struct cs40l50_work {
> +	struct cs40l50_vibra *vibra;
> +	struct ff_effect *effect;
> +	struct work_struct work;
> +	s16 *custom_data;
> +	int custom_len;
> +	int count;
> +	int error;
> +};
> +
> +static struct cs40l50_bank cs40l50_banks[] = {
> +	{
> +		.type =		CS40L50_WVFRM_BANK_RAM,
> +		.base_index =	CS40L50_RAM_INDEX_START,
> +		.max_index =	CS40L50_RAM_INDEX_END,
> +	},
> +	{
> +		.type =		CS40L50_WVFRM_BANK_ROM,
> +		.base_index =	CS40L50_ROM_INDEX_START,
> +		.max_index =	CS40L50_ROM_INDEX_END,
> +	},
> +	{
> +		.type =		CS40L50_WVFRM_BANK_OWT,
> +		.base_index =	CS40L50_RTH_INDEX_START,
> +		.max_index =	CS40L50_RTH_INDEX_END,
> +	},
> +};
> +
> +static struct cs40l50_vibra_dsp cs40l50_dsp = {
> +	.banks =		cs40l50_banks,
> +	.gpio_base_reg =	CS40L50_GPIO_BASE,
> +	.owt_base_reg =		CS40L50_OWT_BASE,
> +	.owt_offset_reg =	CS40L50_OWT_NEXT,
> +	.owt_size_reg =		CS40L50_OWT_SIZE,
> +	.push_owt_cmd =		CS40L50_OWT_PUSH,
> +	.delete_owt_cmd =	CS40L50_OWT_DELETE,
> +	.stop_cmd =		CS40L50_STOP_PLAYBACK,
> +	.write =		cs40l50_dsp_write,
> +};
> +
> +static struct cs40l50_effect *cs40l50_find_effect(int id, struct list_head *effect_head)
> +{
> +	struct cs40l50_effect *effect;
> +
> +	list_for_each_entry(effect, effect_head, list)
> +		if (effect->id == id)
> +			return effect;
> +
> +	return NULL;
> +}
> +
> +static int cs40l50_effect_bank_set(struct cs40l50_work *work_data,
> +				   struct cs40l50_effect *effect)
> +{
> +	s16 bank_type = work_data->custom_data[0] & CS40L50_CUSTOM_DATA_MASK;
> +
> +	if (bank_type >= CS40L50_WVFRM_BANK_NUM) {
> +		dev_err(work_data->vibra->dev, "Invalid bank (%d)\n", bank_type);
> +		return -EINVAL;
> +	}
> +
> +	if (work_data->custom_len > CS40L50_OWT_CUSTOM_DATA_SIZE)
> +		effect->type = CS40L50_WVFRM_BANK_OWT;
> +	else
> +		effect->type = bank_type;
> +
> +	return 0;
> +}
> +
> +static int cs40l50_effect_gpio_mapping_set(struct cs40l50_work *work_data,
> +					   struct cs40l50_effect *effect)
> +{
> +	u16 gpio_num, gpio_edge, button = work_data->effect->trigger.button;
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +
> +	if (button) {
> +		gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
> +		gpio_edge = FIELD_GET(CS40L50_GPIO_EDGE_MASK, button);
> +		effect->gpio_reg = vibra->dsp.gpio_base_reg + (gpio_num * 8) - gpio_edge;
> +
> +		return regmap_write(vibra->regmap, effect->gpio_reg, button);
> +	}
> +
> +	effect->gpio_reg = CS40L50_GPIO_MAPPING_NONE;
> +
> +	return 0;
> +}
> +
> +static int cs40l50_effect_index_set(struct cs40l50_work *work_data,
> +				   struct cs40l50_effect *effect)
> +{
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +	struct cs40l50_effect *owt_effect;
> +	u32 base_index, max_index;
> +
> +	base_index = vibra->dsp.banks[effect->type].base_index;
> +	max_index = vibra->dsp.banks[effect->type].max_index;
> +
> +	effect->index = base_index;
> +
> +	switch (effect->type) {
> +	case CS40L50_WVFRM_BANK_OWT:
> +		list_for_each_entry(owt_effect, &vibra->effect_head, list)
> +			if (owt_effect->type == CS40L50_WVFRM_BANK_OWT)
> +				effect->index++;
> +		break;
> +	case CS40L50_WVFRM_BANK_ROM:
> +	case CS40L50_WVFRM_BANK_RAM:
> +		effect->index += work_data->custom_data[1] & CS40L50_CUSTOM_DATA_MASK;
> +		break;
> +	default:
> +		dev_err(vibra->dev, "Bank type %d not supported\n", effect->type);
> +		return -EINVAL;
> +	}
> +
> +	if (effect->index > max_index || effect->index < base_index) {
> +		dev_err(vibra->dev, "Index out of bounds: %u\n", effect->index);
> +		return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Describes a header for an OWT effect */
> +struct cs40l50_owt_header {
> +	u32 type;
> +	u32 data_words;
> +	u32 offset;
> +} __packed;
> +
> +static int cs40l50_upload_owt(struct cs40l50_work *work_data)
> +{
> +	u32 len = 2 * work_data->custom_len, wt_offset, wt_size;
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +	struct cs40l50_owt_header header;
> +	u8 *out_data;
> +	int error;
> +
> +	error = regmap_read(vibra->regmap, vibra->dsp.owt_size_reg, &wt_size);
> +	if (error)
> +		return error;
> +
> +	if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
> +		dev_err(vibra->dev, "No space in OWT bank for effect\n");
> +		return -ENOSPC;
> +	}
> +
> +	out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);

You can make this as

	u8 *out_data __free(kfree) = kzalloc(...);

and then you do not need to explicitly kfree() it.

Also, I wonder if you have to zero it and can't use kmalloc() given that
you copy over the entire thing.

> +	if (!out_data)
> +		return -ENOMEM;
> +
> +	header.type = work_data->custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
> +								    CS40L50_TYPE_PWLE;
> +	header.offset = sizeof(header) / sizeof(u32);
> +	header.data_words = len / sizeof(u32);
> +
> +	memcpy(out_data, &header, sizeof(header));
> +	memcpy(out_data + sizeof(header), work_data->custom_data, len);
> +
> +	error = regmap_read(vibra->regmap, vibra->dsp.owt_offset_reg, &wt_offset);
> +	if (error)
> +		goto err_free;
> +
> +	error = regmap_bulk_write(vibra->regmap, vibra->dsp.owt_base_reg +
> +				  (wt_offset * sizeof(u32)), out_data,
> +				  sizeof(header) + len);
> +	if (error)
> +		goto err_free;
> +
> +	error = vibra->dsp.write(vibra->dev, vibra->regmap, vibra->dsp.push_owt_cmd);
> +err_free:
> +	kfree(out_data);
> +
> +	return error;
> +}
> +
> +static void cs40l50_add_worker(struct work_struct *work)
> +{
> +	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +	struct cs40l50_effect *effect;
> +	bool is_new = false;
> +	int error;
> +
> +	error = pm_runtime_resume_and_get(vibra->dev);
> +	if (error)
> +		goto err_exit;
> +
> +	mutex_lock(&vibra->lock);
> +
> +	/* Update effect if already present, otherwise create new effect */
> +	effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
> +	if (!effect) {
> +		effect = kzalloc(sizeof(*effect), GFP_KERNEL);
> +		if (!effect) {
> +			error = -ENOMEM;
> +			goto err_mutex;
> +		}
> +
> +		effect->id = work_data->effect->id;
> +		is_new = true;
> +	}
> +
> +	error = cs40l50_effect_bank_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	error = cs40l50_effect_index_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	error = cs40l50_effect_gpio_mapping_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	if (effect->type == CS40L50_WVFRM_BANK_OWT)
> +		error = cs40l50_upload_owt(work_data);
> +err_free:
> +	if (is_new) {
> +		if (error)
> +			kfree(effect);
> +		else
> +			list_add(&effect->list, &vibra->effect_head);
> +	}
> +err_mutex:
> +	mutex_unlock(&vibra->lock);
> +
> +	pm_runtime_mark_last_busy(vibra->dev);
> +	pm_runtime_put_autosuspend(vibra->dev);
> +err_exit:
> +	work_data->error = error;
> +}
> +
> +static int cs40l50_add(struct input_dev *dev, struct ff_effect *effect,
> +		       struct ff_effect *old)
> +{
> +	struct ff_periodic_effect *periodic = &effect->u.periodic;
> +	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
> +	u32 len = effect->u.periodic.custom_len;
> +	struct cs40l50_work work_data;
> +
> +	if (effect->type != FF_PERIODIC || periodic->waveform != FF_CUSTOM) {
> +		dev_err(vibra->dev, "Type (%#X) or waveform (%#X) unsupported\n",
> +			effect->type, periodic->waveform);
> +		return -EINVAL;
> +	}
> +
> +	work_data.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
> +	if (!work_data.custom_data)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(work_data.custom_data, effect->u.periodic.custom_data,
> +			   sizeof(s16) * len)) {
> +		work_data.error = -EFAULT;
> +		goto err_free;
> +	}

	work_data.custom_data = memdup_array_user(effect->u.periodic.custom_data,
						  len, sizeof(s16));
	if (IS_ERR(work_data.custom_data))
		return PTR_ERR(work_data.custom_data);

> +
> +	work_data.custom_len = len;
> +	work_data.vibra = vibra;
> +	work_data.effect = effect;
> +	INIT_WORK(&work_data.work, cs40l50_add_worker);
> +
> +	/* Push to the workqueue to serialize with playbacks */
> +	queue_work(vibra->vibe_wq, &work_data.work);
> +	flush_work(&work_data.work);
> +err_free:
> +	kfree(work_data.custom_data);
> +
> +	return work_data.error;
> +}
> +
> +static void cs40l50_start_worker(struct work_struct *work)
> +{
> +	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +	struct cs40l50_effect *start_effect;
> +
> +	if (pm_runtime_resume_and_get(vibra->dev) < 0)
> +		goto err_free;
> +
> +	mutex_lock(&vibra->lock);
> +
> +	start_effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
> +	if (start_effect) {
> +		while (--work_data->count >= 0) {
> +			vibra->dsp.write(vibra->dev, vibra->regmap, start_effect->index);
> +			usleep_range(work_data->effect->replay.length,
> +				     work_data->effect->replay.length + 100);

If (I am reading this right you are spinning here playing the effect. It
would be much better if you tracked outstanding number of replays for an
effect and had a work re-scheduled that would play an instance.
Similarly to what code in ff-memless.c is doing.

> +		}
> +	}
> +
> +	mutex_unlock(&vibra->lock);
> +
> +	if (!start_effect)
> +		dev_err(vibra->dev, "Effect to play not found\n");
> +
> +	pm_runtime_mark_last_busy(vibra->dev);
> +	pm_runtime_put_autosuspend(vibra->dev);
> +err_free:
> +	kfree(work_data);
> +}
> +
> +static void cs40l50_stop_worker(struct work_struct *work)
> +{
> +	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +
> +	if (pm_runtime_resume_and_get(vibra->dev) < 0)
> +		return;
> +
> +	mutex_lock(&vibra->lock);
> +
> +	vibra->dsp.write(vibra->dev, vibra->regmap, vibra->dsp.stop_cmd);
> +
> +	mutex_unlock(&vibra->lock);
> +
> +	pm_runtime_mark_last_busy(vibra->dev);
> +	pm_runtime_put_autosuspend(vibra->dev);
> +
> +	kfree(work_data);
> +}
> +
> +static int cs40l50_playback(struct input_dev *dev, int effect_id, int val)
> +{
> +	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
> +	struct cs40l50_work *work_data;
> +
> +	work_data = kzalloc(sizeof(*work_data), GFP_ATOMIC);
> +	if (!work_data)
> +		return -ENOMEM;
> +
> +	work_data->vibra = vibra;
> +
> +	if (val > 0) {
> +		work_data->effect = &dev->ff->effects[effect_id];
> +		work_data->count = val;
> +		INIT_WORK(&work_data->work, cs40l50_start_worker);
> +	} else {
> +		/* Just stop the amplifier as device drives only one effect */
> +		INIT_WORK(&work_data->work, cs40l50_stop_worker);
> +	}
> +
> +	queue_work(vibra->vibe_wq, &work_data->work);
> +
> +	return 0;
> +}
> +
> +static void cs40l50_erase_worker(struct work_struct *work)
> +{
> +	struct cs40l50_work *work_data = container_of(work, struct cs40l50_work, work);
> +	struct cs40l50_effect *owt_effect, *erase_effect;
> +	struct cs40l50_vibra *vibra = work_data->vibra;
> +	int error;
> +
> +	error = pm_runtime_resume_and_get(vibra->dev);
> +	if (error)
> +		goto err_exit;
> +
> +	mutex_lock(&vibra->lock);
> +
> +	erase_effect = cs40l50_find_effect(work_data->effect->id, &vibra->effect_head);
> +	if (!erase_effect) {
> +		dev_err(vibra->dev, "Effect to erase not found\n");
> +		error = -EINVAL;
> +		goto err_mutex;
> +	}
> +
> +	if (erase_effect->gpio_reg != CS40L50_GPIO_MAPPING_NONE) {
> +		error = regmap_write(vibra->regmap, erase_effect->gpio_reg,
> +				     CS40L50_GPIO_DISABLE);
> +		if (error)
> +			goto err_mutex;
> +	}
> +
> +	if (erase_effect->type == CS40L50_WVFRM_BANK_OWT) {
> +		error = vibra->dsp.write(vibra->dev, vibra->regmap,
> +					 vibra->dsp.delete_owt_cmd |
> +					 erase_effect->index);
> +		if (error)
> +			goto err_mutex;
> +
> +		list_for_each_entry(owt_effect, &vibra->effect_head, list)
> +			if (owt_effect->type == CS40L50_WVFRM_BANK_OWT &&
> +			    owt_effect->index > erase_effect->index)
> +				owt_effect->index--;
> +	}
> +
> +	list_del(&erase_effect->list);
> +	kfree(erase_effect);
> +err_mutex:
> +	mutex_unlock(&vibra->lock);
> +
> +	pm_runtime_mark_last_busy(vibra->dev);
> +	pm_runtime_put_autosuspend(vibra->dev);
> +err_exit:
> +	work_data->error = error;
> +}
> +
> +static int cs40l50_erase(struct input_dev *dev, int effect_id)
> +{
> +	struct cs40l50_vibra *vibra = input_get_drvdata(dev);
> +	struct cs40l50_work work_data;
> +
> +	work_data.vibra = vibra;
> +	work_data.effect = &dev->ff->effects[effect_id];
> +
> +	INIT_WORK(&work_data.work, cs40l50_erase_worker);
> +
> +	/* Push to workqueue to serialize with playbacks */
> +	queue_work(vibra->vibe_wq, &work_data.work);
> +	flush_work(&work_data.work);

You already take the lock when you play, upload or erase an effect. Why
do we need additional single-thread workqueue for this? Why do we need
additional ordering and synchronization?

> +
> +	return work_data.error;
> +}
> +
> +static void cs40l50_remove_wq(void *data)
> +{
> +	flush_workqueue(data);
> +	destroy_workqueue(data);
> +}
> +
> +static int cs40l50_vibra_probe(struct platform_device *pdev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
> +	struct cs40l50_vibra *vibra;
> +	int error;
> +
> +	vibra = devm_kzalloc(pdev->dev.parent, sizeof(*vibra), GFP_KERNEL);
> +	if (!vibra)
> +		return -ENOMEM;
> +
> +	mutex_init(&vibra->lock);
> +
> +	vibra->dev = cs40l50->dev;
> +	vibra->regmap = cs40l50->regmap;
> +	vibra->dsp = cs40l50_dsp;
> +
> +	vibra->input = devm_input_allocate_device(vibra->dev);
> +	if (!vibra->input)
> +		return -ENOMEM;
> +
> +	vibra->input->id.product = cs40l50->devid;
> +	vibra->input->id.version = cs40l50->revid;
> +	vibra->input->name = "cs40l50_vibra";
> +
> +	input_set_drvdata(vibra->input, vibra);
> +	input_set_capability(vibra->input, EV_FF, FF_PERIODIC);
> +	input_set_capability(vibra->input, EV_FF, FF_CUSTOM);
> +
> +	error = input_ff_create(vibra->input, FF_MAX_EFFECTS);
> +	if (error) {
> +		dev_err(vibra->dev, "Failed to create input device\n");
> +		return error;
> +	}
> +
> +	vibra->input->ff->upload = cs40l50_add;
> +	vibra->input->ff->playback = cs40l50_playback;
> +	vibra->input->ff->erase = cs40l50_erase;
> +
> +	INIT_LIST_HEAD(&vibra->effect_head);
> +
> +	vibra->vibe_wq = alloc_ordered_workqueue("vibe_wq", WQ_HIGHPRI);
> +	if (!vibra->vibe_wq)
> +		return -ENOMEM;
> +
> +	error = devm_add_action_or_reset(vibra->dev, cs40l50_remove_wq, vibra->vibe_wq);
> +	if (error)
> +		return error;
> +
> +	return input_register_device(vibra->input);

Please no this kind of short hands when there are multiple exists from a
function.

	error = input_register_device(vibra->input);
	if (error)
		return error;

	return 0;

This way it is much easier to move the code around when needed.
	

> +}
> +
> +static const struct platform_device_id cs40l50_vibra_id_match[] = {
> +	{ "cs40l50-vibra", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cs40l50_vibra_id_match);
> +
> +static struct platform_driver cs40l50_vibra_driver = {
> +	.probe		= cs40l50_vibra_probe,
> +	.id_table	= cs40l50_vibra_id_match,
> +	.driver		= {
> +		.name	= "cs40l50-vibra",
> +	},
> +};
> +module_platform_driver(cs40l50_vibra_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry

