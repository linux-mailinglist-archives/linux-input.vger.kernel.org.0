Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD576E0F8C
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 16:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjDMOEf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 10:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjDMOEd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 10:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107E994
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681394619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U9WcZXRB/fNjvmQiLKkDkQ0ccQ3v7wUVvZ5I0WvhL/I=;
        b=PYCIair16NXMeBjWVl+97HE/p63ZMTIR3YBG8Q3YLJuWi2bh3LThzz1eU137qI/WL7ZcmP
        Gf8l/XO3Va11SVr2wErxVPOJx2awJALkxnBYmCpMUvvJsw/UuxIvwVC94T7XxiiTEmYjnK
        uD70tycEAhVrEMJF/Oy8tnc7/5JgTVs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-igCcF1HQO4av_Q2Pnn6LfQ-1; Thu, 13 Apr 2023 10:03:37 -0400
X-MC-Unique: igCcF1HQO4av_Q2Pnn6LfQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94eabf147c3so26265766b.1
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394616; x=1683986616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9WcZXRB/fNjvmQiLKkDkQ0ccQ3v7wUVvZ5I0WvhL/I=;
        b=BF6XjPX2BlZFe3Abi2Mo2OzHaFWvrjGw9bqQ21JjBiHz5AeFayYXd3ohvuiGcG05ef
         BZLL/n+rsUc1xcFHNCFCjBikYDu/SCgrgnH9wxQNvVGA8l6wR9qdy/Ta3Y62Yr1YIGfC
         YB7EKW4fz7uTcGQ8gtriliM8UEkyRaHgLJ+aFZ8y21JKEMk8UhdQ3PaQL0etQ3noa/TI
         57nzRNs1BBqZYouNKR6u4teRXsHLf91T8F1HKp9EELwVOKDDlQlTgW4iRVINCVlIg4RA
         XBOHOTJIskSzZLZwFSzAzjXB8nF1rweleaXpvd4mC1U+uSAlhwZOJif0vDFBPDsbd1MK
         4WoA==
X-Gm-Message-State: AAQBX9e5gHOihjxHorObypfK4ghu7/+tROGVwhFWHgwdxCAtJNwc1L5/
        3NrljS4OiyCdp4tSCAAEVOIJIV0bSHHnI/Ins0Qps3S/SLhFEvcLK1RfX3+GwplCm+Q+I5Dnedn
        qy61rdUCW8T91W54VazKDLio=
X-Received: by 2002:aa7:cad5:0:b0:506:73bf:c8b with SMTP id l21-20020aa7cad5000000b0050673bf0c8bmr1763491edt.29.1681394616071;
        Thu, 13 Apr 2023 07:03:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/g39CXnLO8B8VCVV6sVX1LYteEIvQ7bLxz1HIww80Ml8OpJDIJjzHT+A/TVV6BI93iMSEKg==
X-Received: by 2002:aa7:cad5:0:b0:506:73bf:c8b with SMTP id l21-20020aa7cad5000000b0050673bf0c8bmr1763471edt.29.1681394615782;
        Thu, 13 Apr 2023 07:03:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090638ca00b0094a44867e0asm1032340ejd.52.2023.04.13.07.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 07:03:35 -0700 (PDT)
Message-ID: <714731d2-de10-8db1-f271-a2a68cb55910@redhat.com>
Date:   Thu, 13 Apr 2023 16:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
References: <20230413093625.71146-1-hdegoede@redhat.com>
 <20230413140148.3cqpylpfwpna5vj5@mail.corp.redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230413140148.3cqpylpfwpna5vj5@mail.corp.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/13/23 16:01, Benjamin Tissoires wrote:
> On Apr 13 2023, Hans de Goede wrote:
>> Hi Benjamin,
>>
>> Here is a v2 of my series to allow using i2c-hid-of on non OF platforms
>> to allow I2C-HID devices which are not enumerated by ACPI to work on ACPI
>> platforms (by manual i2c_client instantiation using i2c_client_id matching).
>>
>> Changes in v2:
>> - As discussed Drop the patches to consolidate all the i2c-hid-of*
>>   drivers into one
>> - Add a comment to the "post-reset-deassert-delay-ms" property reading,
>>   that it is a kernel internal (non public) property used between x86
>>   platform code and the i2c-hid driver.
> 
> The series is:
> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thank you.

> I'd rather have at least Doug test this one before we merge it, but I'll
> be out next week, so you'll have to rely on Jiri to merge it (or wait
> for one week).

Since Doug's devices use the separate specialized drivers and this series
now only touches the generic i2c-hid-of driver I don't think Doug can test
this, or am I missing something ?

Regards,

Hans





>> Hans de Goede (3):
>>   HID: i2c-hid-of: Consistenly use dev local variable in probe()
>>   HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
>>   HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
>>
>>  drivers/hid/i2c-hid/Kconfig      |  6 +++--
>>  drivers/hid/i2c-hid/i2c-hid-of.c | 38 ++++++++++++++++++++++++--------
>>  2 files changed, 33 insertions(+), 11 deletions(-)
>>
>> -- 
>> 2.39.1
>>
> 

