Return-Path: <linux-input+bounces-113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 019007EF1BD
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 12:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 774DE1F26A15
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 11:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C7D52F;
	Fri, 17 Nov 2023 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6Uxb0xM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B384131
	for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700220700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvtsnLB81XSKdoU+nTsRM4sUaPasK28u2sZ9LUREODc=;
	b=B6Uxb0xMa0H5QmuKsmVZkGMs+HQ+N41xT6EddROkgt1dCID9n7YDt3OqpKRDGeGTd+wK6l
	cRx0Cbm6w1o3pwxgGPMiMgEMvXcx/ekPwd5X4tH+YB21AVeNi1RY2uun9Da4f5VB1V6zny
	NmLnxudoQU9hyYG132s2T14VmsFaAG8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-uH1XT0K1Mg2ONZOEfQboJw-1; Fri, 17 Nov 2023 06:31:39 -0500
X-MC-Unique: uH1XT0K1Mg2ONZOEfQboJw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-53e02a0ebfdso1361092a12.3
        for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 03:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700220697; x=1700825497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvtsnLB81XSKdoU+nTsRM4sUaPasK28u2sZ9LUREODc=;
        b=GF5a6a5SVjTI5utxP6ga4lYe5MRpiiMp/bAWcCnKSVvNMdkkMiER3YqDrSANlQhpZs
         MHU9MmcOZZezjn8NRfH0MV40X3C+htFIjClIQAdVsRgd5WC+dG5rJKTgJOus+1933XPe
         fEAimb2dnR5mB7c0Il9cQ1gSjmmBNXD8xlKhg0NtziD6Od9PUUQ5mMQuzqz8B7lHvuJu
         OM4mmwGl+qx90dX+sDHhkC949e/2Qdy7SJUd3jsfCoJEhPcCXfLd9E7g0gN3Ua5PrHRz
         M6+goE+vR6WRikz0lHQLBrIhRm3aBgh/wS7+gBNwOO4+V6ayI/pu2Bx3W1SFYAQlqMi0
         F7pA==
X-Gm-Message-State: AOJu0Yx7D90izPPomSgEpegqaClTr+O5M3sk6HFKvD6zCj4MZYhA9MFw
	piXa2Qw7WUua8VeHhKzZ2MLmQLK9RBZ/kVdHLsEoqeKmqtDiuFT5n8o//CbG76l0e2DJgfTsyX0
	FmBvq4k99uenuE1ETP5/TAHpqCV4Tf+A=
X-Received: by 2002:a17:906:688d:b0:9e2:c2a6:5c86 with SMTP id n13-20020a170906688d00b009e2c2a65c86mr12952718ejr.35.1700220697613;
        Fri, 17 Nov 2023 03:31:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8wlAgdL/1Yrjo3mRDVzr8d/oRI4MVBhcItGLQQwxOBVfaNPf7b3dN0/95d9CMbZ/L9pjYhA==
X-Received: by 2002:a17:906:688d:b0:9e2:c2a6:5c86 with SMTP id n13-20020a170906688d00b009e2c2a65c86mr12952703ejr.35.1700220697262;
        Fri, 17 Nov 2023 03:31:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709060b4c00b009b928eb8dd3sm678128ejg.163.2023.11.17.03.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 03:31:36 -0800 (PST)
Message-ID: <ebe24400-39d0-44be-8a25-d69f26e64e64@redhat.com>
Date: Fri, 17 Nov 2023 12:31:36 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
 <80b8c5fe-e81b-4e05-bf21-19351c51d767@redhat.com>
 <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/17/23 12:08, Shyam Sundar S K wrote:
> Adding AMDGPU folks (Alex and Christian) - I had to drop them as the
> changes from amdgpu were moved to PMF driver.
> 
> Hi Hans,
> 
> 
> On 11/17/2023 4:18 PM, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 11/17/23 09:07, Shyam Sundar S K wrote:
>>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>
>>> Add the initial code path for get interface from AMDGPU.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

<snip>

>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 81b1bd356e83..82ee2b1c627f 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -10,6 +10,7 @@
>>>  
>>>  #include <linux/debugfs.h>
>>>  #include <linux/tee_drv.h>
>>> +#include <linux/thermal.h>
>>>  #include <linux/uuid.h>
>>>  #include "pmf.h"
>>>  
>>> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>>  	tee_client_close_context(dev->tee_ctx);
>>>  }
>>>  
>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	*state = backlight_get_brightness(bd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	if (backlight_is_blank(bd))
>>> +		*state = 0;
>>> +	else
>>> +		*state = bd->props.max_brightness;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>>> +};
>>
>> This is still the wrong thing to do. The new PMF code MUST only
>> be a *consumer* of the thermal_cooling_device API.
>>
>> The thermal-cooling device for the backlight itself MUST be
>> registered by the amdgpu driver.
>>
>> I believe that the correct fix for this is to add a new flag to
>> the backlight_properties struct;
>> And then make backlight_device_register() register
>> a thermal_cooling_device for the backlight when this new flag is set.
>>
>> This way we get a nice generic way to use backlight class devices
>> as thermal cooling devices and you can make the amdgpu driver
>> register the thermal cooling device by simply adding the new flag
>> to the backlight_properties struct used in the amdgpu driver.
> 
> Agreed. I am also of the same opinion.

So the change to the AMDGPU driver here would just be setting
this one new flag in the backlight_properties struct.

Alex, Christian, would that be acceptable to you ?


>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>> +{
>>> +	struct amd_pmf_dev *dev = data;
>>> +
>>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>> +		dev->gfx_data.gpu_dev = pdev;
>>> +		return 1; /* Stop walking */
>>> +	}
>>> +
>>> +	return 0; /* Continue walking */
>>> +}
>>> +
>>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>  {
>>>  	int ret;
>>> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>  	amd_pmf_set_dram_addr(dev);
>>>  	amd_pmf_get_bios_buffer(dev);
>>> +
>>>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>  	if (!dev->prev_data)
>>>  		return -ENOMEM;
>>>  
>>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>> +	if (dev->gfx_data.gpu_dev) {
>>> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
>>> +		if (!dev->drm_dev)
>>> +			return -EINVAL;
>>
>> You cannot just call pci_get_drvdata() on a device for which you
>> are not the driver. You have no idea of the lifetime of this device,
>> the driver may unbind and release the memory pci_get_drvdata()
>> points to, leaving this code with a dangling pointer which will
>> crash the kernel the first time you try to use it.
>>
>> Also since you are not the owner you MUST not assume any specific
>> type for this memory, you cannot be sure this actually is of
>> the type drm_device. Basically you MUST not touch another
>> driver's drvdata *at all*.
>>
>> The proper way to fix this would be to add some API to the DRM
>> subsystem to query the information you are looking for form
>> the DRM subsystem.
>>
>> Poking directly inside other driver's internals is NOT acceptable,
>> NACK for this patch.
>>
> 
> I am inline with your remarks, but I could find a way where the
> thermal driver registration, handling the backlight without having the
> changes in the amdgpu driver very tricky.

As mentioned above I think there should be generic thermal cooling
device support added to drivers/video/backlight/backlight.c, then
the amdgpu code just needs to pass a flag when registering
the backlight to enable this.

> Like you said, I am also of the same opinion that PMF driver should
> call the DRM/GPU subsystem APIs (like it does with other subsystems).
> 
> But Christian had concerns on adding all of these into the GPU driver.
> So I had to roll back these into the PMF driver, and hence you see a
> pci_get_drvdata() call.

Ok, so I can see how this AMD PMF code is all kinda special
and how the DRM folks don't want to have to add APIs just for
that. But IMHO calling pci_get_drvdata() on an unowned
device is completely unacceptable.

At a minimum we need life-cycle management for the drm_device
which the PMF code is using, something like:

struct drm_device *drm_device_find(const void *data,
   int (*match)(struct drm_device *dev, const void *data));

which works similar to class_find_device() and returns
a reference to the drm_device for which match has returned 0
(which also stops it from looping over devices).

Combined with a:

void drm_device_put(struct drm_device *dev);

for when the PMF code is done with the device.

This way the PMF code can safely get a reference to drm_device
and release it when it is done. Rather then just getting
some random pointer which may or not actually be a drm_device
and the lifetime of which is not guaranteed in anyway.

E.g. if the PMF driver loads before amdgpu then
pci_get_drvdata() will just return NULL.

And as mentioned if the amdgpu driver gets unbound after
the PMF code has called  pci_get_drvdata() the PMF driver
now has a dangling pointer.

So IMHO adding: drm_device_find() + drm_device_put()
to the DRM core are minimum which is necessary here.

If the PMF code then ends up doing things like
drm_for_each_connector_iter() on the gotten drm_device
referemce so be it. But we must make sure we have
a properly lifecycle managed reference first and
pci_get_drvdata() does not give us that.

> For the sake of simplicity, I can drop patches 13/17 and 14/17 from
> the series and send them separately later.

Yes I think that dropping the GPU related patches for
now would be best.

Regards,

Hans





