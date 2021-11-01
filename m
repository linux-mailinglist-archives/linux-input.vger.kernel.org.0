Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D274419A3
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 11:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbhKAKSh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 06:18:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48259 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230298AbhKAKSg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 06:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635761763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mCyZG2RTX+Vqn9iHYLmuWFAS4VitdnHe0VPkeFY0Tj0=;
        b=BnhwvOttQLGhLynmneYcNvAGj1BN/Ioi9VqPaaGV9ZvvtYboSuXHlX+oY1XYzmWMzwSbhc
        j7s3UIIBdTZRBAHTaeI3Rg9y8UnsvPVccQMFyEryooh7N6dg/tJF/qDJuBIHUWAk3wvPO3
        nV07Y39743w+PALwZKnbbf2bsZ0pQ44=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-041doBgNOc6h41PTdGkYeA-1; Mon, 01 Nov 2021 06:16:00 -0400
X-MC-Unique: 041doBgNOc6h41PTdGkYeA-1
Received: by mail-ed1-f69.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso15169365edj.13
        for <linux-input@vger.kernel.org>; Mon, 01 Nov 2021 03:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mCyZG2RTX+Vqn9iHYLmuWFAS4VitdnHe0VPkeFY0Tj0=;
        b=8PlgS9zc9NK+pFn37heoH+GuX5cbeQ8uDvtAsLxRU/LhiVPIGIF5dFGZHMzE9ytK/o
         no7uHC8My/KU6xnBAQEBONSigTDnUjcSg2pwXoevqa0OD+95Ko0ks2yLc7ew1cJh079I
         bszqykAWRH9eq6TW61XxWihXDMEcahD1McGdY4kru5s7kB/kVAnM59A0KsPnxdKowK4z
         Nt87xyrspTsVOZOXwloApilQwTv80Qm6K8MGNOXuOatLsuiFLwe+skrTgfOTZDNc0d+H
         GQ543FxCC9uCeTBCwv1cOjaAWIN9fhtgZQqQaBTdKGYL4AENW5qXKto0UBr6wJwLCRch
         HfKg==
X-Gm-Message-State: AOAM530U7Y1WDvc36vb6UDT2ojacSaKjS+GALn6c5Y6v+b/INK+9UaJl
        9z7WcqieYHDSe62yr2mjtBB+0h0Gkbd1YHeKsLetukFT0YUMiAu8NlzOZpiF2GkPyh2Un2gTAQX
        20yN6+UztlHlJapDhy/v4wjc=
X-Received: by 2002:a50:da42:: with SMTP id a2mr38031209edk.361.1635761759005;
        Mon, 01 Nov 2021 03:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU/OUE0zeS+pOm1RbkOpVcbgGfbIMkkKuWLruKx39X7M31EAdG5zA4qvYOYAXDgy0IcBtbRg==
X-Received: by 2002:a50:da42:: with SMTP id a2mr38031192edk.361.1635761758856;
        Mon, 01 Nov 2021 03:15:58 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id o5sm2728118edc.25.2021.11.01.03.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:15:58 -0700 (PDT)
Message-ID: <aaca72e9-2c69-c2c2-55cb-8c7790178b53@redhat.com>
Date:   Mon, 1 Nov 2021 11:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] HID: intel-ish-hid: add support for
 MODULE_DEVICE_TABLE()
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <cd712bd7-cce7-58fb-d644-ced4fc0c76b1@redhat.com>
 <091a4bb3-0734-4b58-9417-7ef18fcc385b@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <091a4bb3-0734-4b58-9417-7ef18fcc385b@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/1/21 11:09, Thomas Weißschuh wrote:
> On 2021-11-01 10:58+0100, Hans de Goede wrote:
>> On 10/29/21 17:28, Thomas Weißschuh wrote:
>>> This allows to selectively autoload drivers for ISH devices.
>>> Currently all ISH drivers are loaded for all systems having any ISH
>>> device.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>
>>> ---
>>>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Cc: linux-input@vger.kernel.org
>>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>>> Cc: Jiri Kosina <jkosina@suse.cz>
>>> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Michal Marek <michal.lkml@markovi.net>
>>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>>> ---
>>>  include/linux/mod_devicetable.h   | 13 +++++++++++++
>>>  scripts/mod/devicetable-offsets.c |  3 +++
>>>  scripts/mod/file2alias.c          | 24 ++++++++++++++++++++++++
>>>  3 files changed, 40 insertions(+)
>>>
>>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>>> index ae2e75d15b21..befbf53c4b7c 100644
>>> --- a/include/linux/mod_devicetable.h
>>> +++ b/include/linux/mod_devicetable.h
>>> @@ -895,4 +895,17 @@ struct dfl_device_id {
>>>  	kernel_ulong_t driver_data;
>>>  };
>>>  
>>> +/* ISHTP (Integrated Sensor Hub Transport Protocol) */
>>> +
>>> +#define ISHTP_MODULE_PREFIX	"ishtp:"
>>> +
>>> +/**
>>> + * struct ishtp_device_id - ISHTP device identifier
>>> + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
>>> + * @context: pointer to driver specific data
>>> + */
>>> +struct ishtp_device_id {
>>> +	guid_t guid;
>>
>> The kdoc comment documents a context pointer, but this is missing from the
>> actual struct. Having some sort of driver_data (1) field here would be good IMHO.
> 
> Fine for me.
> 
> I left it out because nothing would be using it at the moment and
> it would have been easy to add when needed.

IMHO having a device_id without a context/driver_data field would be
weird and is likely asking for needless churn in the future, but see
below.

> Do you want me to send a v2 for that or would you add it when merging?
> (Or remove the spurious comment)

As I indicated in my reply to the cover-letter, I believe this series
should be merged through the HID tree, so this is up to the HID maintainers
to decide.

Regards,

Hans


p.s.

Thank you for doing this series I did not realize that the eclite driver
would end up being loaded on all systems where the ISH is used, thank you
for fixing this.

