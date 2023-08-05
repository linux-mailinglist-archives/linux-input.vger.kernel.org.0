Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4248E770FD4
	for <lists+linux-input@lfdr.de>; Sat,  5 Aug 2023 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjHENKR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Aug 2023 09:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjHENKQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Aug 2023 09:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEFDE7
        for <linux-input@vger.kernel.org>; Sat,  5 Aug 2023 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691240969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ehu/P9kMK+ANcrbIAM1h/zk8lNfm0lCws3biHgn8nz4=;
        b=CI0jo9MBKoaQvqrtnuQzaNyo4VYwgHlISi0CzkMczdFqXkqrOx2UHE9kigwAx7CMFWOc9m
        tpy2lrrTG0zefi6t7w1QLhsV7fFoRzsEhohEGD6pYVeoUqVtda91KRRngtaK2s9JqlT1S/
        5+uupAT10759SqDwt7zuiJNNc6vU2E8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-lF_ffTorNYmYFsiQws0DWA-1; Sat, 05 Aug 2023 09:09:28 -0400
X-MC-Unique: lF_ffTorNYmYFsiQws0DWA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99cc32f2ec5so13252166b.1
        for <linux-input@vger.kernel.org>; Sat, 05 Aug 2023 06:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691240967; x=1691845767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehu/P9kMK+ANcrbIAM1h/zk8lNfm0lCws3biHgn8nz4=;
        b=aawWeBBRHniL1Nsez7poefTNCuBb3aXrkRS/lihSF3MPk45GcsW1hk9s7CQm1t9MZ6
         Fc/oVNBMSOQV/31PI2HJ/Wr8z3FE5YcqSF8kMGa22NIedZhZCWMZ5psL/6AIoGpI19mX
         7YFhoIGNfXwOi46vcJpjjKNVpQSsgusIPkZH96aWPC+c/OzNp/e0fHn81IeDB3HloH4I
         9/UEWsoc9RR/+ocYuqidsYtNSQs727zdRhmyDQzXIFOBcmKiQW2K4aC0MgJL8SWm9rUb
         4vFQC/DT2Aut3BxLo1Nmnh2/ytzn7iEVw3QvRSVysvL9SfdJOXFvWaVYSVila5NPGiEa
         VvlQ==
X-Gm-Message-State: AOJu0Yxiw6LMD53CkwbKq/jvTrmZCo7c+Jg7uaRFpqBwjU7AeCBXrrh8
        gAvEnAnFSN0o5bicY78HG1UrTrPFl/Q101QakFEKfqPyR0aHcmpYZnHINCjCTTKr0pQH4jooAsb
        52BPTLCugSfpwzfADibkR0Yw=
X-Received: by 2002:a17:906:cc0f:b0:99b:f03d:de37 with SMTP id ml15-20020a170906cc0f00b0099bf03dde37mr3201762ejb.60.1691240966970;
        Sat, 05 Aug 2023 06:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxTUJ6UfA+ygtRAtwWtx1Jz30S537FK+47etHoPWUHMHvqfERQhu5bImDIb6Ym41ie3dNhlA==
X-Received: by 2002:a17:906:cc0f:b0:99b:f03d:de37 with SMTP id ml15-20020a170906cc0f00b0099bf03dde37mr3201754ejb.60.1691240966704;
        Sat, 05 Aug 2023 06:09:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kg12-20020a17090776ec00b0098951bb4dc3sm2666439ejc.184.2023.08.05.06.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 06:09:25 -0700 (PDT)
Message-ID: <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
Date:   Sat, 5 Aug 2023 15:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
To:     August Wikerfors <git@augustwikerfors.se>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Linux Input Devices <linux-input@vger.kernel.org>,
        ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
        Linux x86 Platform Drivers 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
 <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/4/23 17:26, August Wikerfors wrote:
> On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Lo!
>>
>> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>
>>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>>
>>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
>>
>> That is a AMD Ryzen Laptop. And if that really started from
>> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
>> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
>> Mario. Hence adding him to the list of recipients.
> 
> Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9
> 
> #regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755

We just have received 2 bug reports for Fedora which I believe are also
this issue (not confirmed yet):

https://bugzilla.redhat.com/show_bug.cgi?id=2229165
https://bugzilla.redhat.com/show_bug.cgi?id=2229317

I'm going to create a Fedora 6.4.y test-kernel with a9c4a912b7dc7ff
reverted.

IMHO we really should revert a9c4a912b7dc7ff upstream,
at least for the 6.4.y series where it seems to be doing
more harm then good.

And propably also for 6.5-rc# for now until we figure out
a better solution.

Regards,

Hans


