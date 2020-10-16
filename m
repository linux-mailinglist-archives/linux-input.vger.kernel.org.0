Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC082903E5
	for <lists+linux-input@lfdr.de>; Fri, 16 Oct 2020 13:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405369AbgJPLQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Oct 2020 07:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56206 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405358AbgJPLQY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Oct 2020 07:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602846982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x10tOVtolquaTARTsDJ6mze3Z1Z5YmBSGNWKhKgumKQ=;
        b=RYzzM0ro6syeg+C5MFbuNvfppoMcsnjKgbDgmuGfKCihSUc/0vBCh5iYRFIq79EmeZy4CE
        cO47yxvfp4+fThFO4nxOeqkPUyBd9aZQAdfNfQOFo8r+ps0r+HY0wE+FWUbyLUXzYhTH9G
        XqbR4ogibT9auLmDG9BAWFYQcLLucvc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-c6NoOX1mPiap9vSSDPe1OA-1; Fri, 16 Oct 2020 07:16:21 -0400
X-MC-Unique: c6NoOX1mPiap9vSSDPe1OA-1
Received: by mail-ed1-f71.google.com with SMTP id u12so843581edi.17
        for <linux-input@vger.kernel.org>; Fri, 16 Oct 2020 04:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x10tOVtolquaTARTsDJ6mze3Z1Z5YmBSGNWKhKgumKQ=;
        b=BubiNXitw+02CBo9cMaK8Z1qxYn3vDCXO96Xry2DJYFXj0slreUE3FCtPmTpgxnywF
         CKImj1xVXVd39wXsnpYN+m2nNrbhsXBywYuvv5VBvlGUWFmy2WPzWtEN66Tqf3boGU4D
         deoGpsRcf4JABFRkGJdME94l/aZkKvCtMeR09x/k5wnZUQ/qfsmFTrLFQMvi3siuvJ5k
         LPIbD2ZpD9ci8g2T2sVqbqGU4ty0tX0cOHF4dC7ClSk43U+CiQY64+Zi0EXTVAf//n/7
         lVNmNKM1b20mML1G/mQQuotQGtHL00zvOyLOv4DH2ytzKE3dFe15m5F5MrDLT3VbGIDL
         REdQ==
X-Gm-Message-State: AOAM530fUXjGK2QC6ajHtJW/y3lfvM4Ds90dGvwRxwYZDk63jxSFrSLL
        ZY8i2KXx7poc0W4zPJvIpnRDGCFhQ5WP49o7xxrGB3Sysx+WZsHm/yc+10BY77gIYrdTTvXybOZ
        SL8rkTT6bSmaXsUaEqC1uFEU=
X-Received: by 2002:aa7:dd11:: with SMTP id i17mr3223328edv.188.1602846979883;
        Fri, 16 Oct 2020 04:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuvprMrV+hqnX1T0y5+3fN1JRilnar9FML+MPU44c3eibJhR0OodM6ROgP40nhJisPLOe+tg==
X-Received: by 2002:aa7:dd11:: with SMTP id i17mr3223308edv.188.1602846979647;
        Fri, 16 Oct 2020 04:16:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a31sm1169521ede.32.2020.10.16.04.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 04:16:18 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
To:     Jiri Kosina <jikos@kernel.org>,
        Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     linux-i2c@vger.kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hn.chen@weidahitech.com, jarkko.nikula@linux.intel.com,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
        vicamo.yang@canonical.com, wsa@kernel.org
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b29e577e-7c10-1e28-ef01-22b00a9734e5@redhat.com>
Date:   Fri, 16 Oct 2020 13:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 9/22/20 11:19 AM, Jiri Kosina wrote:
> On Wed, 16 Sep 2020, Sultan Alsawaf wrote:
> 
>> From: Sultan Alsawaf <sultan@kerneltoast.com>
>>
>> This is a fixed resubmission of "[PATCH 0/2] i2c-hid: Save power by reducing i2c
>> xfers with block reads". That original patchset did not have enough fixes for
>> the designware i2c adapter's I2C_M_RECV_LEN feature, which is documented
>> extensively in the original email thread.
>>
>> Here is the original cover letter, which still applies:
>> "I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putting my
>> finger on the touchpad would increase my system's power consumption by 4W, which
>> is quite considerable. Resting my finger on the touchpad would generate roughly
>> 4000 i2c irqs per second, or roughly 20 i2c irqs per touchpad irq.
>>
>> Upon closer inspection, I noticed that the i2c-hid driver would always transfer
>> the maximum report size over i2c (which is 60 bytes for my touchpad), but all of
>> my touchpad's normal touch events are only 32 bytes long according to the length
>> byte contained in the buffer sequence.
>>
>> Therefore, I was able to save about 2W of power by passing the I2C_M_RECV_LEN
>> flag in i2c-hid, which says to look for the payload length in the first byte of
>> the transfer buffer and adjust the i2c transaction accordingly. The only problem
>> though is that my i2c controller's driver allows bytes other than the first one
>> to be used to retrieve the payload length, which is incorrect according to the
>> SMBus spec, and would break my i2c-hid change since not *all* of the reports
>> from my touchpad are conforming SMBus block reads.
>>
>> This patchset fixes the I2C_M_RECV_LEN behavior in the designware i2c driver and
>> modifies i2c-hid to use I2C_M_RECV_LEN to save quite a bit of power. Even if the
>> peripheral controlled by i2c-hid doesn't support block reads, the i2c controller
>> drivers should cope with this and proceed with the i2c transfer using the
>> original requested length."
>>
>> Sultan
>>
>> Sultan Alsawaf (4):
>>   i2c: designware: Fix transfer failures for invalid SMBus block reads
>>   i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
>>   i2c: designware: Allow SMBus block reads up to 255 bytes in length
>>   HID: i2c-hid: Use block reads when possible to save power
>>
>>  drivers/hid/i2c-hid/i2c-hid-core.c         |  5 ++++-
>>  drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
>>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> Hans, Benjamin, could you please give this patchset some smoke-testing? It 
> looks good to me, but I'd like it to get some testing from your testing 
> machinery before merging.

Sorry for being slow to respond to this. I have not gotten around to testing
this, but I saw another email that this breaks things on at least AMD
platforms, so I guess that this is on hold for now ?

Regards,

Hans

