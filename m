Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3795C691
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 03:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfGBBZ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 21:25:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53935 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfGBBZ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 21:25:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so1238648wmj.3;
        Mon, 01 Jul 2019 18:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FuJis1FsSzJytEfl3XmFKS7P3MvBNu+eiPliSkEa/HU=;
        b=BYCBjdTQ3i+/+HmkXUs9eanM8BxiTcLLh7zyiGf5tjK9Ju9odX0Cd9ERMbXPc9TxQl
         SRjIcZNznulUlRzkDs9c+2JeMeWVRwWbb4/z+i6cw6UvFIof2Q4Bq9DMniChbW+/tBKb
         qfs/rT8AoRT71innyVfOXMVlYZ+vLgbJPamUDSIojVVTCXxRMMDC+JL0Shwqvk4scNka
         Co1o2fRPx/P9n5HaGjNQ9A6BwONRVHECQdJswj//HVt0C87ySaQwsJ7fGQI1u2jLjV9A
         tjNCyzdeZNpqLQghDdacJjvustiGbSxIk9OiLvXO42xQRpvsLu2KkBs/XazJ8acr1wni
         7qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FuJis1FsSzJytEfl3XmFKS7P3MvBNu+eiPliSkEa/HU=;
        b=r995w9x2Ta37IH7N7p+Vs7BDXHKwpywYbK3OWOkrpq6gdHzYvFky1m5YbgOvpku7gA
         hgOSoHUN+Sq79U7+/Xw8mzlL7Z1wdHRgTIBJN0+ieQv15fNWS2XX2hSsSDPRzhbmoEM7
         W5dJLG6wrg3xlxA081No7RgmSnVOgD53GJZK7EajL2J/JHGq8JwWV3kLH3ET3+Q1JC6d
         km8LzV+yub6WSjldriSaRBIoo13JvO/uhbgiMShqqFecB9S0JhsHJCjwbipAJ3inIzUs
         SNtuOF3jrsZH72avFBSD2y3qCPW/K8HfN3UFMHqRBsmH7kLu+6Hcdo+LjW/Nsut2wEg2
         offg==
X-Gm-Message-State: APjAAAX+R07lnREohYvDjPAoDPiY20dsgqrXfFbTXzkhUgW0IlxyqDdf
        cKODRid1AARA/AXA4B8EMWI=
X-Google-Smtp-Source: APXvYqwDUuYI/3D8hh9aZzLORdzPRLFcimU8CTYSjgLTcdaAZa2wKa7lrH8rcc4hSK/Ylx0uZiKW7A==
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr1189470wmc.50.1562030753793;
        Mon, 01 Jul 2019 18:25:53 -0700 (PDT)
Received: from [192.168.2.202] (p5487BBD4.dip0.t-ipconnect.de. [84.135.187.212])
        by smtp.gmail.com with ESMTPSA id s12sm957672wmh.34.2019.07.01.18.25.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 18:25:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
To:     Yu Chen <yu.c.chen@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190702003740.75970-1-luzmaximilian@gmail.com>
 <20190702003740.75970-2-luzmaximilian@gmail.com>
 <20190702011443.GA19902@chenyu-office.sh.intel.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <91349d00-e7e2-887b-45e5-4689a401aa2f@gmail.com>
Date:   Tue, 2 Jul 2019 03:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702011443.GA19902@chenyu-office.sh.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/19 3:14 AM, Yu Chen wrote:
> On Tue, Jul 02, 2019 at 02:37:39AM +0200, Maximilian Luz wrote:
>> +/*
>> + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
>> + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
>> + * device by checking for the _DSM method and OEM Platform Revision.
>> + */
>> +static int surface_button_check_MSHW0040(struct acpi_device *dev)
>> +{
>> +	acpi_handle handle = dev->handle;
>> +	union acpi_object *result;
>> +	u64 oem_platform_rev = 0;
>> +
>> +	// get OEM platform revision
>> +	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
>> +					 MSHW0040_DSM_REVISION,
>> +					 MSHW0040_DSM_GET_OMPR,
>> +					 NULL, ACPI_TYPE_INTEGER);
>> +
> Does it mean, only 5th, 6th and newer platforms have OEM platform revision?
> 3rd/4th will get NULL result? Or the opposite?

Correct, from my testing (with limited sample size) and AML code: 5th
and 6th generation devices have a non-zero OEM platform revision,
whereas 3rd and 4th gen. devices do not have any (i.e. result will be
NULL).

>> +	if (result) {
>> +		oem_platform_rev = result->integer.value;
>> +		ACPI_FREE(result);
>> +	}
>> +
>> +	dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
>> +
>> +	return oem_platform_rev == 0 ? 0 : -ENODEV;
> if 3rd/4th do not have this oem rev information while 5th/newer have,
> why the latter returns NODEV(it actually has this info)?

Since we always expect a non-zero platform revision (for 5th/6th gen.),
we can initialize it to zero and use that as "unknown"/"not available".
So if it can not be determined, we return NODEV.

>> +}

Cheers,
Maximilian
