Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D88F58B014
	for <lists+linux-input@lfdr.de>; Fri,  5 Aug 2022 20:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240948AbiHESyx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Aug 2022 14:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240307AbiHESyv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Aug 2022 14:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0153183AD
        for <linux-input@vger.kernel.org>; Fri,  5 Aug 2022 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659725690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BDp276yUUX4Aq7Lw1Vcvvjg+TcgvBmhKuGUKBBWce3s=;
        b=JLRcivnKW/0J7aW/St65vfVvltM7LTDkcqDXrnSxEXBKHDkPPJS214rU3Wl/i2N5pE663r
        pg1D+ZN/ghCyFnFc8YxUynTso893b/QWLwKPJ20qGoAiJVle0S3vYFVIg5DNL0RJaId18V
        IgD1Kk0R9nSyIWaIYvHoWDd7j3gotjk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-uGgs4tXnMta7d3_6yqkpBA-1; Fri, 05 Aug 2022 14:54:48 -0400
X-MC-Unique: uGgs4tXnMta7d3_6yqkpBA-1
Received: by mail-ed1-f72.google.com with SMTP id j19-20020a05640211d300b0043ddce5c23aso2069361edw.14
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 11:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BDp276yUUX4Aq7Lw1Vcvvjg+TcgvBmhKuGUKBBWce3s=;
        b=79N7xALPt3ynSu6mvGYgEv5WYJ3x3AmCuxf1BKo0gOHtownSWSLZ33SWypw+4yNdi/
         Zp8gMKzsIf2aswFNTQvLK6JMzvkmt4LEIEdGiMpy5pcanETSIQGy98KZcVXSevkoC+p+
         YiAQJqC0w1F2HVBitC44KOl9TKK/O3/u1vlqfL8qZ6gY/vkpQHvzUYM4ZLUeceauW0ia
         WnIZ0Pw7M0qs/CL4qo9nigpuDgdfxs/581DeCtjtzIDe4FM2Kei9QAT5y0Tfq0z6icxz
         VhvSfNGmP4wtHaQQRBawTqXZUlelqHif7VBHEX5TVyXirDCkGE/qRZykL6aAwth9oJPp
         bAtw==
X-Gm-Message-State: ACgBeo0QnNqL8YdsQlOOe7IhkNkNZIt/zobHgM5qo2wofjq7CEkHFDoC
        Jg8+vYNjHPf5UitvJtAQNdB849+XAWJ1JPCGrKKkpKB/Z3/xO02xDUOBvQd28JPVtJ904gH/49x
        vPN7P7IAdVJ/ajKlVKsTn7DQ=
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id fi16-20020a056402551000b0043a76ffb044mr7952580edb.197.1659725687514;
        Fri, 05 Aug 2022 11:54:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6vSDUmuhy8SNVKrSUvHQBCekrCrZpuX/JqEMaS4y/X5mw8bYCugwAR6VtXtJYgmQagU0KKgw==
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id fi16-20020a056402551000b0043a76ffb044mr7952572edb.197.1659725687344;
        Fri, 05 Aug 2022 11:54:47 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.137.199])
        by smtp.gmail.com with ESMTPSA id u25-20020aa7d999000000b0043bc19efc15sm300898eds.28.2022.08.05.11.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 11:54:46 -0700 (PDT)
Message-ID: <a2d2b61e-87c0-ee39-ea4e-3c575da0a66c@redhat.com>
Date:   Fri, 5 Aug 2022 20:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] i2c: ACPI: Do not check ACPI_FADT_LOW_POWER_S0
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <12042830.O9o76ZdvQC@kreacher>
 <1c7fa65d-47ab-b064-9087-648bcfbf4ab5@amd.com>
 <CAJZ5v0ie7B=GvhbfBsi7Zxu+=YzYKUqvUNs6dNZQfT3CRm=KPg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0ie7B=GvhbfBsi7Zxu+=YzYKUqvUNs6dNZQfT3CRm=KPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/5/22 19:08, Rafael J. Wysocki wrote:
> On Fri, Aug 5, 2022 at 6:59 PM Limonciello, Mario
> <mario.limonciello@amd.com> wrote:
>>
>> On 8/5/2022 11:51, Rafael J. Wysocki wrote:
>>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>
>>> The ACPI_FADT_LOW_POWER_S0 flag merely means that it is better to
>>> use low-power S0 idle on the given platform than S3 (provided that
>>> the latter is supported) and it doesn't preclude using either of
>>> them (which of them will be used depends on the choices made by user
>>> space).
>>>
>>> Because of that, ACPI_FADT_LOW_POWER_S0 is generally not sufficient
>>> for making decisions in device drivers and so i2c_hid_acpi_probe()
>>> should not use it.
>>>
>>> Moreover, Linux always supports suspend-to-idle, so if a given
>>> device can wake up the system from suspend-to-idle, then it can be
>>> marked as wakeup capable unconditionally, so make that happen in
>>> i2c_hid_acpi_probe().
>>>
>>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>
>> +Raul
>> +Hans
>> +KH
>>
>> Raul had a patch that was actually going to just tear out this code
>> entirely:
>> https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/
>>
>> As part of that patch series discussion another suggestion had
>> transpired
>> (https://patchwork.kernel.org/project/linux-input/patch/20211220163823.2.Id022caf53d01112188308520915798f08a33cd3e@changeid/#24681016):
>>
>> ```
>> if ((acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) &&
>>             !adev->flags.power_manageable) {
>>                  device_set_wakeup_capable(dev, true);
>>                  device_set_wakeup_enable(dev, false);
>>          }
>> ```
>>
>> If this is being changed, maybe consider that suggestion to
>> check `adev->flags.power_manageable`.
> 
> Fair enough, I'll send a v2 with this check added.

Re-reading the original thread:
https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/T/#u

The conclusion there was that the :

                 device_set_wakeup_capable(dev, true);
                 device_set_wakeup_enable(dev, false);

Calls should be made conditional on the IRQ being
marked ExclusiveAndWake instead of the ACPI_FADT_LOW_POWER_S0
check.

Regards,

Hans

