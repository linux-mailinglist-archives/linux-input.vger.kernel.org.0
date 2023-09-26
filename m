Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBF37AED67
	for <lists+linux-input@lfdr.de>; Tue, 26 Sep 2023 14:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjIZM5d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Sep 2023 08:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbjIZM51 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Sep 2023 08:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885AE116
        for <linux-input@vger.kernel.org>; Tue, 26 Sep 2023 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695732995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UkUBWVUpOckdloB7nvyn6S4lYeiAg6HkW3tcCGhfEaA=;
        b=eTk3Dvxve77oYaQnNu6F/KhSwPoz02ayv4QP5tqVECFcuiKaAxuObw4E31f/AzOnO3U+GA
        Q45D4kcF5inKIGh/SklsrtHBPDaLU2keHXozmYCC2HERvEykyoxw8VbltCKs3J3TwnEalA
        dI8eiJtBm8uijPTK97FhOIVb/no05ko=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-WTExyrrdMKuMEzH40pznmA-1; Tue, 26 Sep 2023 08:56:32 -0400
X-MC-Unique: WTExyrrdMKuMEzH40pznmA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9adb6dd9e94so729002366b.2
        for <linux-input@vger.kernel.org>; Tue, 26 Sep 2023 05:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695732991; x=1696337791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkUBWVUpOckdloB7nvyn6S4lYeiAg6HkW3tcCGhfEaA=;
        b=Ua07U9ABqpkBKhZixCmmy5yF2iZ8yU2VpnDJwCcUz1r0kmEcijxbd1V4Ua3A4YKp23
         2FCGLM1++ZUi2mIIdqCQP+l8qrzz8NJAKJ0R0l85nROuIV32BdNhsh7SLurMUOg8OYVD
         NcsCJjzFe0RnKhDDWA27ExS/qGfx9dUdgF9Zq6Jho0vBrULMVttMe9Jy71n2c4zGgmNf
         jOzJDrr1bMdlbwNUnB764m86voOHz+Xe+3mWqD4m6QUb61nnFVQFwRyzXdeMq9jZ/cNw
         wwBfrTsvJuJBW28MV4tDrKASEGVKQ8MVES4mVvaY+flITWc89SCgWhI08vodq2wKZkeL
         L/nQ==
X-Gm-Message-State: AOJu0YyVK5qGN9IOxlqTZx+Hd1NYmOriQ4TuDD1cygfv2Jm5AJKK/6bA
        bbzLmxQE6OCxQDoInMXY9tTS3hJKnswUF4qcfp1R5qmnNxJBJmcOVlOMPzyUTJgav7x/bxgiBpS
        ny0/lWWaXl9izkT2D4PwmmBs=
X-Received: by 2002:a17:906:5182:b0:9ae:7088:6e5d with SMTP id y2-20020a170906518200b009ae70886e5dmr8609854ejk.3.1695732991318;
        Tue, 26 Sep 2023 05:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlKMkjWc/6E/rOck6ptJGST/s1rC6uMsZziOzioVqLhJ/fEha6iiUPqIHhbUDWGuzvICiu2w==
X-Received: by 2002:a17:906:5182:b0:9ae:7088:6e5d with SMTP id y2-20020a170906518200b009ae70886e5dmr8609829ejk.3.1695732990967;
        Tue, 26 Sep 2023 05:56:30 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.247])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090616c200b0099d45ed589csm7672502ejd.125.2023.09.26.05.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 05:56:30 -0700 (PDT)
Message-ID: <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
Date:   Tue, 26 Sep 2023 14:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/26/23 13:24, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>  include/linux/amd-pmf-io.h              |  1 +
>>>  4 files changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> index 232d11833ddc..5c567bff0548 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>  	return 0;
>>>  }
>>>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>> +
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>> +{
>>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (!(adev->flags & AMD_IS_APU)) {
>>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>
>> This assumes that the backlight is always controller by the amdgpu's
>> native backlight driver, but it might e.g. also be handled by
>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>> nvidia dgpu).
> 
> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
> should be safe, right?

Users can pass say acpi_backlight=video and use the acpi_video
driver for backlight control instead of the native GPU backlight
control.

> 
>>
>> For now what should be done here is to call acpi_video_get_backlight_type()
>> and then translate the return value from this into a backlight-type:
>>
>>         acpi_backlight_video		-> BACKLIGHT_FIRMWARE
>>         acpi_backlight_vendor,		-> BACKLIGHT_PLATFORM
>>         acpi_backlight_native,		-> BACKLIGHT_RAW
>>         acpi_backlight_nvidia_wmi_ec,	-> BACKLIGHT_FIRMWARE
>>         acpi_backlight_apple_gmux,	-> BACKLIGHT_PLATFORM
>>
> 
> I can add this change in the v2, do you insist on this?

Insist is a strong word, but I think that it is a good idea to have
this. Evenutally it looks like this code will need to either integrate with
the drm drivers lot more; or the drm core needs to export some special
hooks for this which the PMF code can then call.

Actually thinking more about this, I think that the right thing to do
here is make some code register brightness control as a cooling device
(which I think is already done in some cases) and then have the PMF
code use the cooling-device APIs for this.

IMHO that would be a much cleaner solution then this hack.

Regards,

Hans



> 
> Thanks,
> Shyam
> 
>> Also I'm worried about probe order here, this code currently assumes
>> that the GPU or other backlight driver has loaded before this runs,
>> which is not necessarily the case.
>>
>> I think that if the backlight_device_get_by_type() fails this
>> should be retried say every 10 seconds from some delayed workqueue
>> for at least a couple of minutes after boot.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> +
>>> +	backlight_device_set_brightness(bd, pmf->brightness);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -73,6 +73,7 @@
>>>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>>>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>>>  #define PMF_POLICY_SYSTEM_STATE					9
>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>>>  #define PMF_POLICY_P3T						38
>>>  
>>>  /* TA macros */
>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>  };
>>>  
>>>  struct pmf_action_table {
>>> +	unsigned long display_brightness;
>>>  	enum system_state system_state;
>>>  	unsigned long spl; /* in mW */
>>>  	unsigned long sppt; /* in mW */
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 1608996654e8..eefffff83a4c 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>  	return 0;
>>>  }
>>>  
>>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>  {
>>>  	u32 val, event = 0;
>>> -	int idx;
>>> +	int idx, ret;
>>>  
>>>  	for (idx = 0; idx < out->actions_count; idx++) {
>>>  		val = out->actions_list[idx].value;
>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>  				dev->prev_data->system_state = 0;
>>>  			}
>>>  			break;
>>> +
>>> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>> +			if (dev->prev_data->display_brightness != val) {
>>> +				dev->gfx_data.brightness = val;
>>> +				amd_pmf_set_gfx_data(&dev->gfx_data);
>>> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>> +			}
>>> +			break;
>>>  		}
>>>  	}
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>> index a2d4af231362..ecae387ddaa6 100644
>>> --- a/include/linux/amd-pmf-io.h
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>  };
>>>  
>>>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>  #endif
>>
> 

