Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7676D7B04E8
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 15:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjI0NFU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 09:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbjI0NFT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 09:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47312F5
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695819874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lEJmDoqilpfailDPhLu8gdHLBSybSMtbE9uHTda0p00=;
        b=BGZ2uaYi8wcAA0xXEwYcXSdJw6+ItkEm6S9sBzMP9pvCZMinTfdIhmsyNf+qGH0f8BZkQq
        LEI7APEWalbk2oQ7MWdQSdeJ1Yg8s2xD/0lKxtAEDfhbNI/AV3VCPmvhPyAHONVDJCIULW
        06eTgO41554MSkRaQtfDGP7oMMLjDu4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-XVfxH-a-PFiuDcDvbsnpjw-1; Wed, 27 Sep 2023 09:04:32 -0400
X-MC-Unique: XVfxH-a-PFiuDcDvbsnpjw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2bfb2c81664so164262781fa.3
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 06:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819871; x=1696424671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEJmDoqilpfailDPhLu8gdHLBSybSMtbE9uHTda0p00=;
        b=BxHYRoRzSTEV91OG1qqtwJIkq57g3HLExsdIrS7gs9+civdgWkH0zxbizfFHWKHAhp
         FMhcRETxPsNAwNi8YAapBU8tUSkJJihZDtEaf0qZRCWLPs2EIk2Xy9Xx2OPwSH/b8qbo
         1qLkePzpRuiYYrveU8vu7vK2z30MBxoTVorMo4gQ4A8obc3KhztWFhJGUzyWCjJf359A
         8oZr9dtI5+MDNhUPg2xDceo+psUhj2c3WMUP+TcS0h0pMNzwXSalxjfsO4vRbeFz22HS
         lSa0ZZRcUZUR2dxKqjiUpX+wlWlQuc8ACvmgVavnErWN0ccsQu0wKVz2pzK4/jIzBRGf
         dcUA==
X-Gm-Message-State: AOJu0YzIMLFMN578PpoBRngdcszWo4nLVw4ysNllE1k37AdzWf5OH/T+
        gqr7xS72FwARA8cBm64kiTOC42fQT5a+j/Xvtyk5kqHCXNbyeIfZxnmfIXORftgd46EPtGRLPFh
        SuVRVRcIrbeF3EU5gZIsK/XM=
X-Received: by 2002:a2e:808c:0:b0:2c0:ff6:984f with SMTP id i12-20020a2e808c000000b002c00ff6984fmr1840568ljg.49.1695819871320;
        Wed, 27 Sep 2023 06:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgrWTc1uEZWs0S50u15OrcUTMlN06IqObURZUtSe55BFL3PNrwfzxc97XMvVm/a3mhgZABPg==
X-Received: by 2002:a2e:808c:0:b0:2c0:ff6:984f with SMTP id i12-20020a2e808c000000b002c00ff6984fmr1840547ljg.49.1695819870947;
        Wed, 27 Sep 2023 06:04:30 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906370400b0099bd8c1f67esm9301994ejc.109.2023.09.27.06.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 06:04:30 -0700 (PDT)
Message-ID: <72f7d962-e6ee-274a-74ba-aa68adf5806a@redhat.com>
Date:   Wed, 27 Sep 2023 15:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc:     amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
        linux-input@vger.kernel.org, mario.limonciello@amd.com
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
 <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
 <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI,

On 9/26/23 15:17, Christian König wrote:
> Am 26.09.23 um 14:56 schrieb Hans de Goede:
>> Hi,
>>
>> On 9/26/23 13:24, Shyam Sundar S K wrote:
>>> Hi Hans,
>>>
>>> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>>>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>>>   include/linux/amd-pmf-io.h              |  1 +
>>>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> index 232d11833ddc..5c567bff0548 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>       return 0;
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>> +
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>> This assumes that the backlight is always controller by the amdgpu's
>>>> native backlight driver, but it might e.g. also be handled by
>>>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>>>> nvidia dgpu).
>>> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
>>> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
>>> should be safe, right?
>> Users can pass say acpi_backlight=video and use the acpi_video
>> driver for backlight control instead of the native GPU backlight
>> control.
>>
>>>> For now what should be done here is to call acpi_video_get_backlight_type()
>>>> and then translate the return value from this into a backlight-type:
>>>>
>>>>          acpi_backlight_video        -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_vendor,        -> BACKLIGHT_PLATFORM
>>>>          acpi_backlight_native,        -> BACKLIGHT_RAW
>>>>          acpi_backlight_nvidia_wmi_ec,    -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_apple_gmux,    -> BACKLIGHT_PLATFORM
>>>>
>>> I can add this change in the v2, do you insist on this?
>> Insist is a strong word, but I think that it is a good idea to have
>> this. Evenutally it looks like this code will need to either integrate with
>> the drm drivers lot more; or the drm core needs to export some special
>> hooks for this which the PMF code can then call.
>>
>> Actually thinking more about this, I think that the right thing to do
>> here is make some code register brightness control as a cooling device
>> (which I think is already done in some cases) and then have the PMF
>> code use the cooling-device APIs for this.
>>
>> IMHO that would be a much cleaner solution then this hack.
> 
> Yeah, fully agree with Hans. This looks like a rather extreme hack to me.

Shyam, the cooling device interface is defined in:

include/linux/thermal.h

And then look for cooling_device .

An example of code registering a cooling_device for backlight control is:

drivers/acpi/acpi_video.c

and then specifically the code starting around line 257 with:

video_get_max_state()

until

static const struct thermal_cooling_device_ops video_cooling_ops = {
...

And the code around line 1750 for actually registering the cooling-dev.

To use the cooling_device interface witt amdgpu's native backlight control
you will need to make the amdgpu backlight control register a cooling-device
for this in a similar manner.

Regards,

Hans




> 
> Apart from that what exactly is this thing supposed to do? Prevent overheating by reducing the brightness?
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> Thanks,
>>> Shyam
>>>
>>>> Also I'm worried about probe order here, this code currently assumes
>>>> that the GPU or other backlight driver has loaded before this runs,
>>>> which is not necessarily the case.
>>>>
>>>> I think that if the backlight_device_get_by_type() fails this
>>>> should be retried say every 10 seconds from some delayed workqueue
>>>> for at least a couple of minutes after boot.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>>>> +
>>>>> +    backlight_device_set_brightness(bd, pmf->brightness);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> @@ -73,6 +73,7 @@
>>>>>   #define PMF_POLICY_STT_SKINTEMP_APU                7
>>>>>   #define PMF_POLICY_STT_SKINTEMP_HS2                8
>>>>>   #define PMF_POLICY_SYSTEM_STATE                    9
>>>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                12
>>>>>   #define PMF_POLICY_P3T                        38
>>>>>     /* TA macros */
>>>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>>>   };
>>>>>     struct pmf_action_table {
>>>>> +    unsigned long display_brightness;
>>>>>       enum system_state system_state;
>>>>>       unsigned long spl; /* in mW */
>>>>>       unsigned long sppt; /* in mW */
>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> index 1608996654e8..eefffff83a4c 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>>>       return 0;
>>>>>   }
>>>>>   -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>>   {
>>>>>       u32 val, event = 0;
>>>>> -    int idx;
>>>>> +    int idx, ret;
>>>>>         for (idx = 0; idx < out->actions_count; idx++) {
>>>>>           val = out->actions_list[idx].value;
>>>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>                   dev->prev_data->system_state = 0;
>>>>>               }
>>>>>               break;
>>>>> +
>>>>> +        case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>>>> +            ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>> +            if (ret)
>>>>> +                return ret;
>>>>> +
>>>>> +            dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>>>> +            if (dev->prev_data->display_brightness != val) {
>>>>> +                dev->gfx_data.brightness = val;
>>>>> +                amd_pmf_set_gfx_data(&dev->gfx_data);
>>>>> +                dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>>>> +            }
>>>>> +            break;
>>>>>           }
>>>>>       }
>>>>> +
>>>>> +    return 0;
>>>>>   }
>>>>>     static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>>> index a2d4af231362..ecae387ddaa6 100644
>>>>> --- a/include/linux/amd-pmf-io.h
>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>>>   };
>>>>>     int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>   #endif
> 

