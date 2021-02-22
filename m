Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D4E32157E
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 12:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBVLzK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 06:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26233 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229961AbhBVLzB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 06:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613994812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SW+iK//wSwnNfq6ZKI00CExMVFEjzySm0gMQkEr0wAs=;
        b=M9asvCJgPHRyTks90UTPl2m7ovzzs9VNr0GaDoe06w1B10zPlB9WQvOE24YO2rUYcWm8IP
        bTxFPHU6c6xFdmQskqCTIwvjFtJA7f4URsn+uYBeY0GK2CzOAA3Pc62KGdwAhNc2qwZj/i
        HNy3bE+IzmKkMZTvLgEjdbuavrTWts8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Ep07EzU-NmyxjMc0ZZypmw-1; Mon, 22 Feb 2021 06:53:30 -0500
X-MC-Unique: Ep07EzU-NmyxjMc0ZZypmw-1
Received: by mail-ed1-f69.google.com with SMTP id j10so6839188edv.5
        for <linux-input@vger.kernel.org>; Mon, 22 Feb 2021 03:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SW+iK//wSwnNfq6ZKI00CExMVFEjzySm0gMQkEr0wAs=;
        b=bj8u4Bqfk/X/r7G1EueC1Mw1sLlFuDc7UqiRe8hYvWUIejK/1l2q+aXD/czoHMeLVR
         iLs1RDNnwjXfgRa5iOe5TCeCBS3pzGvAsOjNYgUudTuImBqL98Cro0kRF03TnJZQFGzb
         thjzCzrqGUdJd+1QOphGAZccveTuxfYxh+3WcPx9GQRWyUeko1AHKmXFc7GBeWFbxwED
         ImEHHqlxnjphk/q7cqrIL6vGQsvRZ2ZAHXPmiyQOaOwilS1nH5+JMfCABaO8KWdvkWZF
         Ta7NfsFiUNknLy6gBN3F2A+VNoS5dDglIlSii0y4pfprfDoWonCrspXFl7BpbfAYslQJ
         RzgQ==
X-Gm-Message-State: AOAM532cQOdJusgr/8qciJx5fRxiBtH/2LsWlTTl01ce2Hzttz+OCIjl
        QWNHw1ThHTtLVsOKwGNSCeL497wPciGu1JRfTPOUPMPuJ/MtScu5P5sMH+lTZgUFe+im8HTtAMT
        U6je5PWRzRvorFQ7hXtTe1+0=
X-Received: by 2002:a05:6402:1155:: with SMTP id g21mr22077201edw.279.1613994809679;
        Mon, 22 Feb 2021 03:53:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx208VFUu1zVuMXFcwrHV3aAKp8/rLQPhJwVWERBw7oUa6qJHnHZ5gcCKJ1DyqW7LNhwYGYYw==
X-Received: by 2002:a05:6402:1155:: with SMTP id g21mr22077191edw.279.1613994809552;
        Mon, 22 Feb 2021 03:53:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z13sm11655555edc.73.2021.02.22.03.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 03:53:29 -0800 (PST)
Subject: Re: [PATCH 3/3] AMD_SFH: Add DMI quirk table for BIOS-es which don't
 set the activestatus bits
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org, "Shyam-sundar.S-k\""@amd.com
References: <20210128121219.6381-1-hdegoede@redhat.com>
 <20210128121219.6381-4-hdegoede@redhat.com>
 <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3a2857a3-f8cb-bc0f-fe41-3bc101b817d7@redhat.com>
Date:   Mon, 22 Feb 2021 12:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eac9fd4c-f3ea-1127-a59d-aaa01ca8e0bc@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/15/21 9:24 AM, Shah, Nehal-bakulchandra wrote:
> Hi Hans,
> On 1/28/2021 5:42 PM, Hans de Goede wrote:
>> Some BIOS-es do not initialize the activestatus bits of the AMD_P2C_MSG3
>> register. This cause the AMD_SFH driver to not register any sensors even
>> though the laptops in question do have sensors.
>>
>> Add a DMI quirk-table for specifying sensor-mask overrides based on
>> DMI match, to make the sensors work OOTB on these laptop models.
>>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199715
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1651886
>> Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> index ab0a9443e252..ddecc84fd6f0 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/bitops.h>
>>  #include <linux/delay.h>
>>  #include <linux/dma-mapping.h>
>> +#include <linux/dmi.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/io-64-nonatomic-lo-hi.h>
>>  #include <linux/module.h>
>> @@ -77,11 +78,34 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
>>  	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
>>  }
>>  
>> +static const struct dmi_system_id dmi_sensor_mask_overrides[] = {
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-ag0xxx"),
>> +		},
>> +		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 15-cp0xxx"),
>> +		},
>> +		.driver_data = (void *)(ACEL_EN | MAGNO_EN),
>> +	},
>> +	{ }
>> +};
>> +
>>  int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
>>  {
>>  	int activestatus, num_of_sensors = 0;
>> +	const struct dmi_system_id *dmi_id;
>>  	u32 activecontrolstatus;
>>  
>> +	if (sensor_mask_override == -1) {
>> +		dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
>> +		if (dmi_id)
>> +			sensor_mask_override = (long)dmi_id->driver_data;
>> +	}
>> +
>>  	if (sensor_mask_override >= 0) {
>>  		activestatus = sensor_mask_override;
>>  	} else {
> Can you please confirm that HP Envy x360  is whether ryzen 4000 (Renior based) series or ryzen 3000 (Raven based) series? As of now current upstream code does not have support for Ryzen 4000 series
> for which work is in progress. However, for Ryzen 3000 based series this patch looks fine and thanks for the contribution.

Both models added to the dmi_sensor_mask_overrides table here use Raven-Ridge SoCs,
they ship with the following CPU options:

Ryzen 3 2300U
Ryzen 5 2500U
Ryzen 7 2700U

So I think we should be good to go wrt merging this set.

Since this set is basically a bugfix set it would be nice if we can get
this merged into one of the 5.12-rc#s.

Regards,

Hans

