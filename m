Return-Path: <linux-input+bounces-11542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FCA7BA43
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 11:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94885189BEBE
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56D71B414E;
	Fri,  4 Apr 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSUiO4NR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA51A23A6
	for <linux-input@vger.kernel.org>; Fri,  4 Apr 2025 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760457; cv=none; b=fkQwLITWOEWeyK9dNlZphijLY9/SaqgSGQSf5o6OJBaA/mfbN4iY4qt7P0g7+y3SCWevq4yByJLVv+mLdGHUWmcZpa7OgeVo4N/1l1po09InkEdL+frG6AgTusxHY4TEp9upk6v1ju33dzqVdPLP7FuwIdK6rcR6bTEsVVN2Xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760457; c=relaxed/simple;
	bh=hNeF7z0PXm+fZ7v87K6B50kIrzIayzQQzo6kuSxs2hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COLb8ScZN8aRJezFQMqKSYz9AZ+jEVE78RFm/UOjuXsZURhT1uFHOhXWjK3V7E2jtYNW4hh+WjusJ/e7lJeLQwUfpEo7mKRkOq2gN0qQVAlAgi7SOn09fxrJCaN135lAu5Vp8nlE7Xm0x6/YRum4I9lR7f31Nh1AbDw1JlpLL7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSUiO4NR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf3d64849dso281917366b.3
        for <linux-input@vger.kernel.org>; Fri, 04 Apr 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743760453; x=1744365253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYAlHXEplBZR8C+Nf50IvIJmhOSpOhaYvMLYZLbAtKw=;
        b=PSUiO4NRJ7BCL0mL0p8SghQIM+pQNmuV+iah/Hy03TDHKCYzo1v81v6VsIbkNXjQ0W
         OiX+DzmB7vSvZV8M3a5btnnym/02igUBTmAdq7J3ghGuqgzSazAMCAkNtJrRu67xuIhO
         cldE6KnKKsw0ubqsqG12NiTY/OBIpQ7bx8HB1BQor/8LjeZzfltGmF8Hxsnw47h7vqJg
         OvBaf5OtAweU98FE8h41o4PjR/kni+OWNwbY4aIkHqK4m3yNdmtqvM3q8kv15SKh9Fuy
         DLdM/Uhq0pcH50AWd3DrlXuJs345e85iXp2EUnq4qkqN1lDf9k4TlyHfMULoWP2MF2sY
         QZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743760453; x=1744365253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYAlHXEplBZR8C+Nf50IvIJmhOSpOhaYvMLYZLbAtKw=;
        b=VAocAijzZAlCD2nqbrzvo018ui30nlQ5R5e9g8BQfGG0LryvUM+Qo9AzePKiW2jXVv
         73KI2FTIm0x+1TfwB0cM+X+LEhfIaxn2UyFq9n5nnir6q6qeUE9OXUO4dYLGXjJRTNJT
         ft7rbUEjeziWL1Awa+UZWTG20VoOSm8ccsZyzOam4R2u9enfys1S3MN1LDOTciHX5Qa/
         8o1cz/SIUzran86Ke6ZoIzXagiUCYXgAL4dlZjAnJlT6Az5Pnoyq6lN+yRBWp07vgRrK
         dwCjUNqaPex7CFLoF4voELG+fzXLdXaV2lPC6+AOrV2hVW17ZMcMlyJOILc6e9XTlNrX
         ftUA==
X-Forwarded-Encrypted: i=1; AJvYcCWZfyDF0zaguDjk4VURG2ZR08JkczQoOW/kEMEYuRuej/ToUK1upTz+gupf9rZZlZyPMbyUoaO1gqYhyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9dDGLbeI/AYQZikeyNNkUELwIbqz8m6h0kZLWi3udxWPaN/y
	anJdukMewxRddzXByzgmJwzULlMU7rSOzfpLfspVeFeId7R0K5QUkd7HUdTC2JE=
X-Gm-Gg: ASbGnctL5EKmCvKL2vxG0Zs2tbwmtprcM3TUU7J9KFD2n8PmAVyhcJ3DGIs8mUXXzCf
	cJlnmTTjMmnFI4zJd5gSqPw7jrBkHIIwvR/svWS/Fx7mB/6BkwUnYAYApe/qVmAK+GmnD1Ex8Fu
	8G92BnrAmB+WW+N6COiYN/yDyGCcY/uq/iCzXmndtUHd5QQTdDSNYgQBXfjzz8X/nxd9LhaXdJ/
	WvtE5IG4+lWraMCXd1eA1D87qfCwmvTOTeilBl+V/+PjOiqvoTUlQDXxYnSknKIOp5LiP78M6p5
	gsEdWNQw5v1nNMXpDk/kveaJ2NZBkZTvgUxgEG1L1xEX9FQyyg7CR/7g
X-Google-Smtp-Source: AGHT+IHVK1xPFjgUlctqGoP+C/6wMdr/sOeO1yGK5ebaeEn+PcqQk/KtPy0g6bA4aI5FsjIRW2rTCA==
X-Received: by 2002:a17:907:6d29:b0:ac1:f19a:c0a0 with SMTP id a640c23a62f3a-ac7d177475emr226973866b.20.1743760453343;
        Fri, 04 Apr 2025 02:54:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:e124:1321:48a4:8c63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f651sm224335566b.123.2025.04.04.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:54:12 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:54:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v37 24/31] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
Message-ID: <Z--sQj-fXwXkk5iS@linaro.org>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
 <20250404002728.3590501-25-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404002728.3590501-25-quic_wcheng@quicinc.com>

On Thu, Apr 03, 2025 at 05:27:21PM -0700, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/q6usboffload.h  |  20 +++
>  sound/soc/qcom/Kconfig        |  12 ++
>  sound/soc/qcom/qdsp6/Makefile |   1 +
>  sound/soc/qcom/qdsp6/q6usb.c  | 278 ++++++++++++++++++++++++++++++++++
>  4 files changed, 311 insertions(+)
>  create mode 100644 include/sound/q6usboffload.h
>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..35ae26ba6509
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * sound/q6usboffload.h -- QDSP6 USB offload
> + *
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/**
> + * struct q6usb_offload - USB backend DAI link offload parameters
> + * @dev: dev handle to usb be
> + * @domain: allocated iommu domain
> + * @sid: streamID for iommu
> + * @intr_num: usb interrupter number
> + **/
> +struct q6usb_offload {
> +	struct device *dev;
> +	struct iommu_domain *domain;
> +	long long sid;

"long long" feels like overkill for sid, given that it's essentially
either an u8 or -1. I see you just copied this from q6asm-dai.c, but
unlike q6asm-dai, you don't seem to check for sid < 0 in PATCH 28/31
(qc_audio_offload.c).

Looking at the logic in q6asm-dai.c, it feels like this could really
just be an "u8", since the -1 for "no iommus specified" is effectively
just handled like sid = 0.

> +	u16 intr_num;
> +};
> [...]
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> new file mode 100644
> index 000000000000..cb8c4a62a816
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> [...]
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct q6usb_port_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u16(node, "qcom,usb-audio-intr-idx",
> +				   &data->priv.intr_num);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read intr idx.\n");
> +		return ret;
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> +	if (ret < 0)
> +		data->priv.sid = -1;
> +	else

Could just do if (ret == 0) here and drop the if branch above, if you
make sid an u8 like I suggested above.

> +		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
> +
> +	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
> +
> +	data->priv.dev = dev;
> +	INIT_LIST_HEAD(&data->devices);

I think you also need devm_mutex_init(&data->lock) or separate
mutex_init()/mutex_destroy() here, if someone enables
CONFIG_DEBUG_MUTEXES.

Thanks,
Stephan

