Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEA83244A5
	for <lists+linux-input@lfdr.de>; Wed, 24 Feb 2021 20:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhBXTbk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 14:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29159 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233626AbhBXTbf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 14:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614195008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mvb1Vob0FiYcp4CbFnU4icF7yDSLNdDFrQdcs0kUWso=;
        b=La7UMG5/aYF/OBJ5pVvAsLC3NohNVA7+kPQBPjlVX6Nx3ftjdD9rDPnED2p4ASi8tadLS1
        ZOahR56TFwZ76O27rR0jrLiJMJoG5NJq9jYFYekcFuQZC1KlEQs7BbQIjhxzvAJaUaXq4O
        72ovbkgn0knVUQh912qhLwM3lWCFMSA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-L4NPiDgROx-JpQ-x9GDKfw-1; Wed, 24 Feb 2021 14:30:06 -0500
X-MC-Unique: L4NPiDgROx-JpQ-x9GDKfw-1
Received: by mail-ej1-f71.google.com with SMTP id gb19so1270842ejc.11
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 11:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mvb1Vob0FiYcp4CbFnU4icF7yDSLNdDFrQdcs0kUWso=;
        b=auCXTqJPiFFHJYzqNu3J9GiiQ0AxvK1KKCxON7u30rjsuGKbhjF3uhwyohc7Yom+Qd
         o6QKreo+OFWG59H403dWoUXBdqmPFyx9A2j6UrrZi+A1vfdkyyvPkbjBLWPPjwY45Qfd
         DAkWgG19+ZfW4DEGIGuocNp8nCBjRos1I95v54ggBMARXvrEMsuphwpeyq6P3+LYx4zn
         ZOwLfgyeyo+KRS4oKRNpsSGDY98AIN+jJ586+TjwlXthCs3qh0+ESi5fwQFzn0HGDThp
         mMicE2oMx+YhC4tSMm7Iaa1Qa3II07gfecovD+Xf1bKZPUcs4aWiT/Skc7QA7ukdNmqn
         w5yg==
X-Gm-Message-State: AOAM533gWSqAoJdH4Qf81Dk/WiD987brUhiGdn4uua6aLR2QRsTYXk3d
        DMMAaiS8LcD9XD40FE1N5gFFSEHX4j8tJQND4UI3P1oJtV24g4yXU6LR7fRtpsc+OH9oN17ETpo
        56RyKu3KDYO7izjFkNyWwv1A=
X-Received: by 2002:aa7:d34e:: with SMTP id m14mr35093362edr.223.1614195004699;
        Wed, 24 Feb 2021 11:30:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2pknHeP1q4Cwv5lflbv12G7cRlOYucd3TZmG6JUHb179bX5K98rrzxFYC4wiKAayx4M03gA==
X-Received: by 2002:aa7:d34e:: with SMTP id m14mr35093345edr.223.1614195004562;
        Wed, 24 Feb 2021 11:30:04 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u17sm2235769edr.0.2021.02.24.11.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 11:30:04 -0800 (PST)
Subject: Re: [PATCH 3/3] AMD_SFH: Add DMI quirk table for BIOS-es which don't
 set the activestatus bits
To:     "Singh, Sandeep" <ssingh1@amd.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org, "\"Shyam-sundar.S-k"@amd.com
References: <20210128121219.6381-1-hdegoede@redhat.com>
 <20210128121219.6381-4-hdegoede@redhat.com>
 <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
 <3a2857a3-f8cb-bc0f-fe41-3bc101b817d7@redhat.com>
 <09f1754a-9299-7b83-5e3f-001c2d6ca6f1@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <01391f5a-eeaa-c560-2c47-2d0579f250ae@redhat.com>
Date:   Wed, 24 Feb 2021 20:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <09f1754a-9299-7b83-5e3f-001c2d6ca6f1@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/23/21 7:24 AM, Singh, Sandeep wrote:
> Hi Hans,
> 
> On 2/22/2021 5:23 PM, Hans de Goede wrote:
>> [CAUTION: External Email]
>>
>> Hi,
>>
>> On 2/15/21 9:24 AM, Shah, Nehal-bakulchandra wrote:
>>> Hi Hans,
>>> On 1/28/2021 5:42 PM, Hans de Goede wrote:
>>>> Some BIOS-es do not initialize the activestatus bits of the AMD_P2C_MSG3
>>>> register. This cause the AMD_SFH driver to not register any sensors even
>>>> though the laptops in question do have sensors.
>>>>
>>>> Add a DMI quirk-table for specifying sensor-mask overrides based on
>>>> DMI match, to make the sensors work OOTB on these laptop models.
>>>>
>>>> BugLink: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D199715&amp;data=04%7C01%7Csandeep.singh%40amd.com%7Cdb4b6cfd7bad4eaa118008d8d7287aca%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637495916161889961%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SJvTzigbw9lshqAdo37bSHeAiXh6%2Bs90lP187Pwx%2B%2BU%3D&amp;reserved=0
>>>> BugLink: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1651886&amp;data=04%7C01%7Csandeep.singh%40amd.com%7Cdb4b6cfd7bad4eaa118008d8d7287aca%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637495916161894939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=iy3BWrCWZsInBhnmeGTgLE3MnP9YuPQspWy8Kwuretw%3D&amp;reserved=0
>>>> Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 24 ++++++++++++++++++++++++
>>>>  1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> index ab0a9443e252..ddecc84fd6f0 100644
>>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>>> @@ -10,6 +10,7 @@
>>>>  #include <linux/bitops.h>
>>>>  #include <linux/delay.h>
>>>>  #include <linux/dma-mapping.h>
>>>> +#include <linux/dmi.h>
>>>>  #include <linux/interrupt.h>
>>>>  #include <linux/io-64-nonatomic-lo-hi.h>
>>>>  #include <linux/module.h>
>>>> @@ -77,11 +78,34 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
>>>>      writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
>>>>  }
>>>>
>>>> +static const struct dmi_system_id dmi_sensor_mask_overrides[] = {
>>>> +    {
>>>> +            .matches = {
>>>> +                    DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-ag0xxx"),
>>>> +            },
>>>> +            .driver_data = (void *)(ACEL_EN | MAGNO_EN),
>>>> +    },
>>>> +    {
>>>> +            .matches = {
>>>> +                    DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 15-cp0xxx"),
>>>> +            },
>>>> +            .driver_data = (void *)(ACEL_EN | MAGNO_EN),
>>>> +    },
>>>> +    { }
>>>> +};
>>>> +
>>>>  int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
>>>>  {
>>>>      int activestatus, num_of_sensors = 0;
>>>> +    const struct dmi_system_id *dmi_id;
>>>>      u32 activecontrolstatus;
>>>>
>>>> +    if (sensor_mask_override == -1) {
>>>> +            dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
>>>> +            if (dmi_id)
>>>> +                    sensor_mask_override = (long)dmi_id->driver_data;
>>>> +    }
>>>> +
>>>>      if (sensor_mask_override >= 0) {
>>>>              activestatus = sensor_mask_override;
>>>>      } else {
>>> Can you please confirm that HP Envy x360  is whether ryzen 4000 (Renior based) series or ryzen 3000 (Raven based) series? As of now current upstream code does not have support for Ryzen 4000 series
>>> for which work is in progress. However, for Ryzen 3000 based series this patch looks fine and thanks for the contribution.
>> Both models added to the dmi_sensor_mask_overrides table here use Raven-Ridge SoCs,
>> they ship with the following CPU options:
>>
>> Ryzen 3 2300U
>> Ryzen 5 2500U
>> Ryzen 7 2700U
>>
>> So I think we should be good to go wrt merging this set.
>>
>> Since this set is basically a bugfix set it would be nice if we can get
>> this merged into one of the 5.12-rc#s.
> 
> Acked-by: Sandeep Singh <sandeep.singh@amd.com>

Is that for just this patch, or the entire series?

Regards,

Hans

