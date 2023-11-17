Return-Path: <linux-input+bounces-111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A47EF0F3
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 11:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ADA31F27ECF
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2CB1A271;
	Fri, 17 Nov 2023 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvwBBvO6"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BD6BC
	for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700218111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6k8IHAmotlqH7EuDXtF6EAYwqPFhc4DoxWJcTkS22dI=;
	b=cvwBBvO6BqW8rBBBua7NS4TfJkgg3/QuOZu1vgoqo4L0KOA98d0rw1dINwmAlAztDD//4O
	OewEVhK2/vqCciqB2LL0ffnIf4RjIKEpHUab8lSqOXK1MuWEhsXvOcLVwFAqlpQoMMCQW2
	KJj3ZaHZKiu+WoNLRtIqNRPQdS7S2I8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-Gpi7InN0MRmHcnXaxxncjA-1; Fri, 17 Nov 2023 05:48:29 -0500
X-MC-Unique: Gpi7InN0MRmHcnXaxxncjA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-54442ba286fso1404681a12.2
        for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 02:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700218108; x=1700822908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6k8IHAmotlqH7EuDXtF6EAYwqPFhc4DoxWJcTkS22dI=;
        b=E/othe6+chGOJXnUsLEm2Q+E9gpKmKPKYgaH+Y6qMjX5i0+DzhIMYSdPnb1e+4bkGn
         WcsHAFHVY7TS0edWHnTmT3furjBC7n3ERdRc59oW3T2Vn20/gHwAUhQtcBeDjwvjy5UN
         nyvQZuLiZTO7rUETvxszSab7NEbodqoAnQWAcellANQ6JT1LuBR/lpBHttC063A/du3E
         I625XruBw+kl0c5fdAQHnEFf42dVeN557KVRZ+k6a3zmBpQ8Kz13IiQGXwnnp502Szrk
         95QwQmgh9nVlZTk6fJBFA1nL2LTm5S/G7EJF3ouHNRgTHd3JwROxvaiqcmUaHYzDErSd
         WCjg==
X-Gm-Message-State: AOJu0YxXoR9C03oT6QywnzPKJfGVtDW3pdkJ4JVR9MmanvbHB/6GKB2g
	hmEmIytDAhbga0o259pvPl4yh2cF2Cvxk49DyoyqcuEEqA9iSvqkUyHyKrce8ro8Q5td5P6mVhL
	ZYgHh4QPb5tGPMsKXbfq/Irs=
X-Received: by 2002:a05:6402:35d4:b0:548:4f58:4c98 with SMTP id z20-20020a05640235d400b005484f584c98mr588473edc.29.1700218108206;
        Fri, 17 Nov 2023 02:48:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM0FeXhWipLkjKJe7o5I5a1O2dLv5i9OSouiDoyPcG3Zv5YIDfgTKFv6+wC1QBUxTG8KuWmA==
X-Received: by 2002:a05:6402:35d4:b0:548:4f58:4c98 with SMTP id z20-20020a05640235d400b005484f584c98mr588454edc.29.1700218107839;
        Fri, 17 Nov 2023 02:48:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f10-20020a50a6ca000000b0053dd8898f75sm623452edc.81.2023.11.17.02.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:48:27 -0800 (PST)
Message-ID: <80b8c5fe-e81b-4e05-bf21-19351c51d767@redhat.com>
Date: Fri, 17 Nov 2023 11:48:26 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 11/17/23 09:07, Shyam Sundar S K wrote:
> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> need to have interface between the PMF driver and the AMDGPU driver.
> 
> Add the initial code path for get interface from AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c   |  3 +-
>  drivers/platform/x86/amd/pmf/pmf.h    | 18 +++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 41 ++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 77 +++++++++++++++++++++++++++
>  4 files changed, 138 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 4b8156033fa6..9b14a997cd48 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> +	dev->root = rdev;
>  
>  	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>  	if (err) {
> @@ -482,4 +483,4 @@ module_platform_driver(amd_pmf_driver);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
> -MODULE_SOFTDEP("pre: amdtee");
> +MODULE_SOFTDEP("pre: amdtee amdgpu");
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8712299ad52b..525308519fa3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -11,7 +11,11 @@
>  #ifndef PMF_H
>  #define PMF_H
>  
> +#include <acpi/video.h>
> +#include <drm/drm_connector.h>
>  #include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/pci.h>
>  #include <linux/platform_profile.h>
>  
>  #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -83,6 +87,8 @@
>  #define TA_OUTPUT_RESERVED_MEM				906
>  #define MAX_OPERATION_PARAMS					4
>  
> +#define MAX_SUPPORTED_DISPLAY		4
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
>  	u16 size;
> @@ -194,6 +200,15 @@ enum power_modes {
>  	POWER_MODE_MAX,
>  };
>  
> +struct amd_gpu_pmf_data {
> +	struct pci_dev *gpu_dev;
> +	struct backlight_device *raw_bd;
> +	struct thermal_cooling_device *cooling_dev;
> +	enum drm_connector_status con_status[MAX_SUPPORTED_DISPLAY];
> +	int display_count;
> +	int connector_type[MAX_SUPPORTED_DISPLAY];
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -228,9 +243,12 @@ struct amd_pmf_dev {
>  	void *shbuf;
>  	struct delayed_work pb_work;
>  	struct pmf_action_table *prev_data;
> +	struct amd_gpu_pmf_data gfx_data;
>  	u64 policy_addr;
>  	void *policy_base;
>  	bool smart_pc_enabled;
> +	struct pci_dev *root;
> +	struct drm_device *drm_dev;
>  };
>  
>  struct apmf_sps_prop_granular {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 959146fd483f..47ec563088b8 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>  	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>  	dev_dbg(dev->dev, "Connected Display Count: %u\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "Primary Display Type: %s\n",
> +		drm_get_connector_type_name(in->ev_info.display_type));
> +	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
> +			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
> @@ -146,6 +150,41 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> +static int amd_pmf_get_gfx_data(struct amd_pmf_dev *pmf)
> +{
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector;
> +	int i = 0;
> +
> +	/* Reset the count to zero */
> +	pmf->gfx_data.display_count = 0;
> +
> +	drm_connector_list_iter_begin(pmf->drm_dev, &iter);
> +	drm_for_each_connector_iter(connector, &iter) {
> +		if (connector->status == connector_status_connected)
> +			pmf->gfx_data.display_count++;
> +		if (connector->status != pmf->gfx_data.con_status[i])
> +			pmf->gfx_data.con_status[i] = connector->status;
> +		if (connector->connector_type != pmf->gfx_data.connector_type[i])
> +			pmf->gfx_data.connector_type[i] = connector->connector_type;
> +
> +		i++;
> +		if (i >= MAX_SUPPORTED_DISPLAY)
> +			break;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +
> +	return 0;
> +}
> +
> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	amd_pmf_get_gfx_data(dev);
> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -154,4 +193,6 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_smu_info(dev, in);
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
> +	if (dev->drm_dev)
> +		amd_pmf_get_gpu_info(dev, in);
>  }
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 81b1bd356e83..82ee2b1c627f 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/debugfs.h>
>  #include <linux/tee_drv.h>
> +#include <linux/thermal.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
>  
> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>  	tee_client_close_context(dev->tee_ctx);
>  }
>  
> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	*state = backlight_get_brightness(bd);
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	if (backlight_is_blank(bd))
> +		*state = 0;
> +	else
> +		*state = bd->props.max_brightness;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
> +	.get_max_state = amd_pmf_gpu_get_max_state,
> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
> +};

This is still the wrong thing to do. The new PMF code MUST only
be a *consumer* of the thermal_cooling_device API.

The thermal-cooling device for the backlight itself MUST be
registered by the amdgpu driver.

I believe that the correct fix for this is to add a new flag to
the backlight_properties struct;
And then make backlight_device_register() register
a thermal_cooling_device for the backlight when this new flag is set.

This way we get a nice generic way to use backlight class devices
as thermal cooling devices and you can make the amdgpu driver
register the thermal cooling device by simply adding the new flag
to the backlight_properties struct used in the amdgpu driver.

> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> +		dev->gfx_data.gpu_dev = pdev;
> +		return 1; /* Stop walking */
> +	}
> +
> +	return 0; /* Continue walking */
> +}
> +
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  {
>  	int ret;
> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>  	amd_pmf_set_dram_addr(dev);
>  	amd_pmf_get_bios_buffer(dev);
> +
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)
>  		return -ENOMEM;
>  
> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
> +	if (dev->gfx_data.gpu_dev) {
> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
> +		if (!dev->drm_dev)
> +			return -EINVAL;

You cannot just call pci_get_drvdata() on a device for which you
are not the driver. You have no idea of the lifetime of this device,
the driver may unbind and release the memory pci_get_drvdata()
points to, leaving this code with a dangling pointer which will
crash the kernel the first time you try to use it.

Also since you are not the owner you MUST not assume any specific
type for this memory, you cannot be sure this actually is of
the type drm_device. Basically you MUST not touch another
driver's drvdata *at all*.

The proper way to fix this would be to add some API to the DRM
subsystem to query the information you are looking for form
the DRM subsystem.

Poking directly inside other driver's internals is NOT acceptable,
NACK for this patch.

Regards,

Hans


> +
> +		if (acpi_video_get_backlight_type() != acpi_backlight_native)
> +			return -ENODEV;
> +
> +		dev->gfx_data.raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +		if (!dev->gfx_data.raw_bd)
> +			return -ENODEV;
> +
> +		dev->gfx_data.cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
> +									    NULL, &bd_cooling_ops);
> +		if (IS_ERR(dev->gfx_data.cooling_dev))
> +			return -ENODEV;
> +	}
> +
>  	return dev->smart_pc_enabled;
>  }
>  
> @@ -448,5 +523,7 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
> +	if (dev->gfx_data.cooling_dev)
> +		thermal_cooling_device_unregister(dev->gfx_data.cooling_dev);
>  	amd_pmf_tee_deinit(dev);
>  }



