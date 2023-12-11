Return-Path: <linux-input+bounces-669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF080C36E
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 09:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0899EB20800
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 08:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607E420DE6;
	Mon, 11 Dec 2023 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BeuwwSxN"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4819B6
	for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 00:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702284033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GpJTYXn4Y3x0HSw8hcJxR1JiPKs8C8VmFlTenscEew=;
	b=BeuwwSxNcWv+yrI01qd+ZAbCoFDgwYKx40YimzIm3Z3cFvvwXJBIZn/LbSbwmvUiSMqILC
	oVlIvss0dmnjs5B+OfPF2tAOFFqp30u97lgael9L1kFuNxUftJmAc//7NKxx+WzYvdHp0m
	nhuYVjtdKu/GYxkxCobM//SeC/RDF2Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-P_CGmM_KN86Qi8yOWLJgwQ-1; Mon, 11 Dec 2023 03:40:31 -0500
X-MC-Unique: P_CGmM_KN86Qi8yOWLJgwQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2006e5e055so10704766b.1
        for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 00:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702284030; x=1702888830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GpJTYXn4Y3x0HSw8hcJxR1JiPKs8C8VmFlTenscEew=;
        b=tD0YOqQk6f99T5lKG/Szmw+7TNM8YX3OjOgme7ZQMnHkvAuBMKj3xfvgihf8sNeK1v
         NZCD1mTT4E5ihGR7msT5Ylp+7NdODIxhNXZOopc8qrzOOkuDmxzLYpsJOMmFACCR1mmy
         60HwE59hLmG33VjgwpmLz1XANWd7el3qGaR7J31ueEI8AfQhHQP6U4P/RF3tK3Ps7G8X
         oWawmw9U0Qs1fEEA8zXvnxHhQ8vY6bTQkvxEcTOCU7GTYqGpuFRAuMCC6xzcRQwtIW2N
         PdCe9qf3mCKtWArtqX2z8whpqGGDUMBbZaZFeq8C2GKrVAy1aqogSrprzgoD9oKhB6oJ
         eTcQ==
X-Gm-Message-State: AOJu0YwLdDxwztQMKQNLM3Kc21+wuQ8QCW70qe+h1BHWIMAHKcCu0/L/
	T4OrwU7g3PmUQYzByJtZ3hYyIOj6o6Zt3RLAl00fEloS0iz09SsTE+zck83WO1XEDO0GpWtbNBp
	sTPfe4EKqtRQLRTK/G7tFxMQ=
X-Received: by 2002:a17:906:3599:b0:a19:a19b:c72d with SMTP id o25-20020a170906359900b00a19a19bc72dmr1928196ejb.125.1702284029987;
        Mon, 11 Dec 2023 00:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ7/SHyl8xt8RR74RGsn1WUC3K6u3ARQafQ26Ms6OI/XbREwv1UlLnSXqTgcHjV6B7emqGzQ==
X-Received: by 2002:a17:906:3599:b0:a19:a19b:c72d with SMTP id o25-20020a170906359900b00a19a19bc72dmr1928188ejb.125.1702284029591;
        Mon, 11 Dec 2023 00:40:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wb8-20020a170907d50800b00a1cb351dd4fsm4478215ejc.9.2023.12.11.00.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:40:28 -0800 (PST)
Message-ID: <bae8cbbb-47d9-4e03-9445-8ca9b50576af@redhat.com>
Date: Mon, 11 Dec 2023 09:40:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 11:15, Shyam Sundar S K wrote:
> In the current code, the metrics table information was required only
> for auto-mode or CnQF at a given time. Hence keeping the return type
> of amd_pmf_set_dram_addr() as static made sense.
> 
> But with the addition of Smart PC builder feature, the metrics table
> information has to be shared by the Smart PC also and this feature
> resides outside of core.c.
> 
> To make amd_pmf_set_dram_addr() visible outside of core.c make it
> as a non-static function and move the allocation of memory for
> metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
> as amd_pmf_set_dram_addr() is the common function to set the DRAM
> address.
> 
> Add a suspend handler that can free up the allocated memory for getting
> the metrics table information.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ec92d1cc0dac..f50b7ec9a625 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>  {
>  	u64 phys_addr;
>  	u32 hi, low;
>  
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
>  	phys_addr = virt_to_phys(dev->buf);
>  	hi = phys_addr >> 32;
>  	low = phys_addr & GENMASK(31, 0);
>  
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	return 0;
>  }
>  
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  {
> -	/* Get Metrics Table Address */
> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> -	if (!dev->buf)
> -		return -ENOMEM;
> +	int ret;
>  
>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>  
> -	amd_pmf_set_dram_addr(dev);
> +	ret = amd_pmf_set_dram_addr(dev);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Start collecting the metrics data after a small delay
> @@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +static int amd_pmf_suspend_handler(struct device *dev)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Free the buffer allocated for storing the metrics table
> +	 * information, as will have to allocate it freshly after
> +	 * resume.
> +	 */
> +	kfree(pdev->buf);

This seems quite risky. You are freeing the memory here,
but the SET_DRAM_ADDR_HIGH and SET_DRAM_ADDR_LO registers
still point to it, so the hw may still access it.

IMHO it would be better to add a "bool alloc_buffer"
parameter to amd_pmf_set_dram_addr() and set that
to true on init and false on resume.

Also I guess that this DRAM buffer is used by the new
smartpc mode and specifically by the command send by
amd_pmf_invoke_cmd() work. In that case you really
need to make sure to cancel the work before
freeing the buffer and then re-submit the work
on resume.

Regards,

Hans



> +
> +	return 0;
> +}
> +
>  static int amd_pmf_resume_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (pdev->buf)
> -		amd_pmf_set_dram_addr(pdev);
> +	if (pdev->buf) {
> +		ret = amd_pmf_set_dram_addr(pdev);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
>  
> -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
>  
>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a24e34e42032..6a0e4c446dd3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>  int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);


