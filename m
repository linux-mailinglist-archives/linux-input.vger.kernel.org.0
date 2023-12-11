Return-Path: <linux-input+bounces-671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0480C3CA
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 09:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A9F1C2093F
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 08:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340DD210F1;
	Mon, 11 Dec 2023 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RY8BxDY9"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F903D9
	for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 00:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702285172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CffctwSCWq8WSoGnn4F9pl5V4m8l/OPODOnSyJ0+fcY=;
	b=RY8BxDY9EiYEvF67Vc1uc7YkI29/5aRtp6DkkSi1qA5Zr68g3mJr/1YDlXDsLWosafhV68
	FzjlP7YY7/XFcnsj7FXBL9Dmet9A/av+Zbu3qDHao2U/fBI0cwgNTYvcCl/n7poyhn0awS
	/ZTLFHnYzc76k4RueBCzwNUBtY05qaI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-hmvdmsjWPSqrKm5jJmDRqQ-1; Mon, 11 Dec 2023 03:59:31 -0500
X-MC-Unique: hmvdmsjWPSqrKm5jJmDRqQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1d38492da7so263218666b.0
        for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 00:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285169; x=1702889969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CffctwSCWq8WSoGnn4F9pl5V4m8l/OPODOnSyJ0+fcY=;
        b=LI7S9pHigouW/Di2s84ykNTDiuBUtDTwTxd0naQvmbkyEm+Es5KyybMaMUVI745th1
         SmhqMracWEyJ10qEmEzQ6diyJpdDvM+1itjqIb/cxs/zYzPcg3sD8sAMNaI1Gto4gi1c
         eUDhS+zRU5jEOscCo0bmRa+K4KDddFVRxwuiNbEzel5uiPzmQ+F2QERCgOl9RH9nuveg
         WgrW2L65E2TU/pqSmIB9cOg4Tt12x7W3YS8sBzPjEs1Oqa6P4nMtOs+DUX6ZNKMQQjHd
         XTjEqS1AK64fANNtwuYrTWVala1LriM3jwm299lIJ5S9/pmAKEtiLcNK5FnEotebWOvM
         TCrA==
X-Gm-Message-State: AOJu0YyqJ5VNdkrJ1RHLNo8NP0WmN9gKVqG+zrAWBXovEuihY8oa8rva
	xMLHFyCu3WjoOgn39iQm6kXAS9l2BOuw7ltk5T+lvWSuIi4Jgd8yCTBDC4OBSXgDYS5R5xdCFT5
	5Y4Nu5xnVYT3kYSK2wk6C4qM=
X-Received: by 2002:a17:906:de:b0:a19:a1ba:bada with SMTP id 30-20020a17090600de00b00a19a1babadamr1187350eji.128.1702285169789;
        Mon, 11 Dec 2023 00:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZNKDh9WMDonZ7Txgjs2xciajtNM+d4zE3nleQ9RJ5Zh1MG2eQXSO4+InvYcnpfqXdfoMeSQ==
X-Received: by 2002:a17:906:de:b0:a19:a1ba:bada with SMTP id 30-20020a17090600de00b00a19a1babadamr1187339eji.128.1702285169450;
        Mon, 11 Dec 2023 00:59:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wb2-20020a170907d50200b00a19084099a4sm4524692ejc.16.2023.12.11.00.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 00:59:29 -0800 (PST)
Message-ID: <a24a0460-333a-4eef-825f-3e614b936973@redhat.com>
Date: Mon, 11 Dec 2023 09:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/15] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-12-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204101548.1458499-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 11:15, Shyam Sundar S K wrote:
> A policy binary is OS agnostic, and the same policies are expected to work
> across the OSes.  At times it becomes difficult to debug when the policies
> inside the policy binaries starts to misbehave. Add a way to sideload such
> policies independently to debug them via a debugfs entry.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  1 +
>  drivers/platform/x86/amd/pmf/tee-if.c | 54 +++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 593930519039..8712299ad52b 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -219,6 +219,7 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	struct dentry *esbin;
>  	unsigned char *policy_buf;
>  	u32 policy_sz;
>  	struct tee_context *tee_ctx;
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 5f10e5c6335e..f73663c629fe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -16,9 +17,14 @@
>  
>  /* Policy binary actions sampling frequency (in ms) */
>  static int pb_actions_ms = MSEC_PER_SEC;
> +/* Sideload policy binaries to debug policy failures */
> +static bool pb_side_load;
> +
>  #ifdef CONFIG_AMD_PMF_DEBUG
>  module_param(pb_actions_ms, int, 0644);
>  MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
> +module_param(pb_side_load, bool, 0444);
> +MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>  #endif
>  
>  static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> @@ -269,6 +275,48 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
> +				   size_t length, loff_t *pos)
> +{
> +	struct amd_pmf_dev *dev = filp->private_data;
> +	int ret;
> +
> +	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> +	if (length > POLICY_BUF_MAX_SZ || length == 0)
> +		return -EINVAL;
> +
> +	dev->policy_sz = length;
> +	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
> +		return -EFAULT;

dev->policy_buf = allocated in amd_pmf_get_bios_buffer() to
be of the original dev->policy_sz. So this needs to re-alloc
dev->policy_buf to make sure it is large enough.

Regards,

Hans




> +
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return length;
> +}
> +
> +static const struct file_operations pb_fops = {
> +	.write = amd_pmf_get_pb_data,
> +	.open = simple_open,
> +};
> +
> +static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
> +{
> +	dev->esbin = debugfs_create_dir("pb", debugfs_root);
> +	debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
> +}
> +
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->esbin);
> +}
> +#else
> +static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root) {}
> +static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
> +#endif
> +
>  static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  {
>  	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> @@ -281,6 +329,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> +
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> @@ -382,6 +433,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +	if (pb_side_load)
> +		amd_pmf_remove_pb(dev);
> +
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);


