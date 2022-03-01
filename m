Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953F14C899F
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 11:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiCAKsd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 05:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiCAKsd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 05:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 641DE13F93
        for <linux-input@vger.kernel.org>; Tue,  1 Mar 2022 02:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646131671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nOka4DQJ7If5xZGztMeGdSWsKIflF/zHURoLap75QEE=;
        b=evk3cvnA4J6e0+FElxcFVN2LITb3CTzIJj2KDrozjPq3wZAxCX6xoTyMEXQIB1ULXyNqYm
        3wyFmGxeKtUUi6gMNxPmjvBjw4XZAwDHMPKLYrlIrs9iV5fNu5VQ5PYn5U3sInZbCgMAa/
        8wsUhw+Nj0rVq11ksVcRFfqYKxvPS0s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-GgNiN0RfP4-d9L8XmoAsFA-1; Tue, 01 Mar 2022 05:47:48 -0500
X-MC-Unique: GgNiN0RfP4-d9L8XmoAsFA-1
Received: by mail-ed1-f72.google.com with SMTP id l24-20020a056402231800b00410f19a3103so7585580eda.5
        for <linux-input@vger.kernel.org>; Tue, 01 Mar 2022 02:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nOka4DQJ7If5xZGztMeGdSWsKIflF/zHURoLap75QEE=;
        b=OkYkRJklzSBUYFRVlWzyookLNAJc4elw5IJRs1XLRPQFzf9T+LJ28tskIS7G9tfw7q
         4jKXZ3kK7LNoX4zhsUzo8CuQqsiQOeWBTUWc8xKt2MNH0Y76pgnDKJvWT8YzMY62OJFk
         dRizxsj0GDQvHe34m9N9gabSjUVC6V7/ez2KhaquK4n7JN3gfNZ7NpVEBZHhBxvflb0w
         QmT6JHOxh7ln6MJJ2+zwWGctA7azME0PYeV4Tmmx62bK+/pwpVgvEBlieYqpo6xpzJop
         msd2OLpQ75+4ONey+9s/6DKJwJ6d/L9LvrLkwtRU/8xlQl8i8Tv8Ndo3SUUDavFFizt9
         7LQQ==
X-Gm-Message-State: AOAM531yI9t7VpUf0hDHTa9m9jKgHvv5p6VIrt2Osy8GDlVrvKJjyIqU
        abGMCaMf+YG/9/GGuI39kTLX1+OBBRc0M+wUU7kbiBPMXeuTUQhpfTxFSXGr+jCsxrI4JYHf6JR
        AjtkwwIQceVX4OaWv0++8Z4Y=
X-Received: by 2002:a17:906:3a41:b0:6ce:374d:adfa with SMTP id a1-20020a1709063a4100b006ce374dadfamr8301887ejf.199.1646131666456;
        Tue, 01 Mar 2022 02:47:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5+7iMW+aXHNmpuwCtPG4YBakppTmnmqF0HCZxbrZhp0xZ16mey1EjcCzh+exIWr5Kk+zetw==
X-Received: by 2002:a17:906:3a41:b0:6ce:374d:adfa with SMTP id a1-20020a1709063a4100b006ce374dadfamr8301827ejf.199.1646131665040;
        Tue, 01 Mar 2022 02:47:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id n2-20020aa7c682000000b00415322c6363sm432254edq.66.2022.03.01.02.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 02:47:44 -0800 (PST)
Message-ID: <212c1e2c-81f2-f92e-a5ad-ec84218e3c3f@redhat.com>
Date:   Tue, 1 Mar 2022 11:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Input: goodix - Workaround Cherry Trail devices with a
 bogus ACPI Interrupt() resource
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20220228111613.363336-1-hdegoede@redhat.com>
 <Yh3Fh5PLPu91CKqn@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yh3Fh5PLPu91CKqn@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 3/1/22 08:04, Dmitry Torokhov wrote:
> On Mon, Feb 28, 2022 at 12:16:13PM +0100, Hans de Goede wrote:
>> ACPI/x86 devices with a Cherry Trail SoC should have a GpioInt + a regular
>> GPIO ACPI resource in their ACPI tables.
>>
>> Some CHT devices have a bug, where the also is bogus Interrupt resource
>> (likely copied from a previous Bay Trail based generation of the device).
>>
>> The i2c-core-acpi code will assign the bogus, non-working, Interrupt
>> resource to client->irq. Add a workaround to fix this up.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2043960
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Applied (for 5.17), thank you.

Thank you!

Unrelated question (now that I have your attention) may I have your
Acked-by for merging the (small) drivers/input/misc/soc_button_array.c
of this series:

https://lore.kernel.org/linux-input/20220224110241.9613-1-hdegoede@redhat.com/

see:

https://lore.kernel.org/linux-input/20220224110241.9613-2-hdegoede@redhat.com/

Through the drivers/platform/x86 tree ?

(so that we can keep the series together) 

Regards,

Hans



