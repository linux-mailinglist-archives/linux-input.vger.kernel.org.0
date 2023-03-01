Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF60E6A725F
	for <lists+linux-input@lfdr.de>; Wed,  1 Mar 2023 18:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCARxb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Mar 2023 12:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjCARxa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Mar 2023 12:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4614393C
        for <linux-input@vger.kernel.org>; Wed,  1 Mar 2023 09:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677693163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MsKaRV2UPDWx2k2al9TAoU24E6i1+owMfMqzm296OnU=;
        b=HtBjhuyunDevA1kobcQ/aiWbRFFUWE7LhEeru0KfLTN0A9rbNm1mhl1+wg1o2DgE5awRFS
        ZPFUjdtHDGm/W9Rzg4LVKSGgqDe5B1rd1BvKCRQb7H4ToARGwhXiYNNsGxwjBH6n9qmbWr
        RkTtbtUjCHb0ryT5SLuVVlQeJfr0Ie0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446--4nFGYWQN6S8Ue9t77Qg3g-1; Wed, 01 Mar 2023 12:52:41 -0500
X-MC-Unique: -4nFGYWQN6S8Ue9t77Qg3g-1
Received: by mail-ed1-f69.google.com with SMTP id cy28-20020a0564021c9c00b004acc6cf6322so20075969edb.18
        for <linux-input@vger.kernel.org>; Wed, 01 Mar 2023 09:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsKaRV2UPDWx2k2al9TAoU24E6i1+owMfMqzm296OnU=;
        b=0ho6mffzNm0i5OGn28kDqxsWbPHi4MAiMGO9G5X7OnYBkC1R/GWlCOYid75F12Ngvj
         2iHboFxLF8eeWNPburZKmaU9MssO1Pui+5nQavFCr0Yyee+d2uYc8q2baTet1JrhTb8/
         pleP0Iueh+PbtyGXLuGqFKmpnBvIxtltcMoJtp0rCN2IVV4PGUQO0I21rVQ0VWOoHLBZ
         B1xtudl/iMG3TLJFVkBu50KlvSOXSmmB3jWwiiuJAtI4rJ2+sayakGTtMq6dBKk9Pqze
         3p9lWgpweUsbPZ5tIeJCWrmR7IzY+zDWeKyWmA9hrgMOJi5+rA1bjn4Qv479BHV1byMQ
         aOzw==
X-Gm-Message-State: AO0yUKX2dludSaDXY5eTQuPwFrJlwD84wVj9M6TZ5QV+s59mLOU06qCy
        8iafThCmDgLQBtXIBOt1zhf8vrJUjZl6afPWf/hMTC5aHOesVXEXA/YFRKA5+FstU9RkLIhbYTX
        VfwGfbzDjDPN4wEGGMvdZREo=
X-Received: by 2002:a17:906:4e4d:b0:88f:13f0:4565 with SMTP id g13-20020a1709064e4d00b0088f13f04565mr6276464ejw.69.1677693160745;
        Wed, 01 Mar 2023 09:52:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+GCeQl5p8Xm/KzbL2VBHC/SNevHflvEi0Rs1DGggBZ+oLYige539zOJVI+NB0PHroq5kVelg==
X-Received: by 2002:a17:906:4e4d:b0:88f:13f0:4565 with SMTP id g13-20020a1709064e4d00b0088f13f04565mr6276449ejw.69.1677693160427;
        Wed, 01 Mar 2023 09:52:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gg4-20020a170906e28400b008b1779ba3c1sm6060831ejb.115.2023.03.01.09.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:52:39 -0800 (PST)
Message-ID: <423ab967-502d-7edc-81f6-019ed2ca6d5e@redhat.com>
Date:   Wed, 1 Mar 2023 18:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/2] Fix "Input: i8042 - add TUXEDO devices to i8042
 quirk tables for partial fix"
Content-Language: en-US, nl
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, swboyd@chromium.org,
        gregkh@linuxfoundation.org, mkorpershoek@baylibre.com,
        chenhuacai@kernel.org, wsa+renesas@sang-engineering.com,
        tiwai@suse.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230227185907.569154-1-wse@tuxedocomputers.com>
 <192c2eab-3b57-8a09-dfd7-5720b2b419b8@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <192c2eab-3b57-8a09-dfd7-5720b2b419b8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/1/23 17:57, Werner Sembach wrote:
> 
> Am 27.02.23 um 19:59 schrieb Werner Sembach:
>> This is a continuation of
>> https://lore.kernel.org/linux-input/20220708161005.1251929-3-wse@tuxedocomputers.com/
>>
>> That fix did fix the keyboard not responding at all sometimes after resume,
>> but at the price of it being laggy for some time after boot. Additionally
>> setting atkbd.reset removes that lag.
>>
>> This patch comes in 2 parts: The first one adds a quirk to atkbd to set
>> atkbd.reset and the second one then applies that and the i8042 quirks to
>> the affected devices.
>>
>>
> Somehow, for my testing last week these patches seemed work, but now i still see occasional laggy keyboard after boot. So sadly the atkbd_reset quirk didn't fix the issue after all.

Ok, well I guess that also resolves the discussion about trying to avoid
the duplicate DMI table entries.

FWIW I did not realize that the other quirk was in another module and
I don't have a good answer how to solve this in a way that avoids
adding the DMI matches twice.

Regards,

Hans

