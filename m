Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8084706E2
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 18:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244452AbhLJRXx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 12:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244435AbhLJRXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 12:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639156814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5DT0ushAH2PAi6m5fciUAZ97SFjS6zQqqbNlqap/c9E=;
        b=caGbJTMzF3GBSqpyGOPF1l6WppVOZYoShxlWBG9WWP2Ap1IwhbDX1qv5Cr6ATgTBUOs8LT
        imHYQ1SPb00mL2DeDE4IlVKfUdcukeeZdZHnuJZTaEM3VI+oGq2InErVDMkSIYNB30/uoM
        zZELps0Au361SYLsEPopjP3UtX828/Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-exM3RWlgMh6pf4EMgGTMAg-1; Fri, 10 Dec 2021 12:20:13 -0500
X-MC-Unique: exM3RWlgMh6pf4EMgGTMAg-1
Received: by mail-wm1-f69.google.com with SMTP id 145-20020a1c0197000000b0032efc3eb9bcso7013598wmb.0
        for <linux-input@vger.kernel.org>; Fri, 10 Dec 2021 09:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5DT0ushAH2PAi6m5fciUAZ97SFjS6zQqqbNlqap/c9E=;
        b=70Fv3fPouwXOakgc3lDYOFoXZU5COaKxLnVglqNC4c5msdfM2ZsVujY0IqVu4ix91w
         uJn+CoUw7nsjIO9lP5/9fY29RBlyKWIo4jDzTQJVC5sJXGp6vHz4E1IGs+iGEJC+LlaK
         F2LHI2SeAurEwgc2rx6TTaL+lr3Z7vDyeX6Qk7zt8Nvlvmy6VSTIsnex1d48zM7a5dmA
         sKKiwvU5xJJFAfZv+ItMM5Ctd0VCaCNM0fulAsaVxDLkuz26EZ03kHx+7bL4AmIn3sYI
         cKLrdw36STBYV8ZknJubJDb2YniBXhVgZ44Heosic18xkdDw94sSmFEuusbmWbZqLVa2
         fWbg==
X-Gm-Message-State: AOAM531rxgJo4EoFn0vdXvdzhK60+9zzpqiJBx+zoV3mLCo3W3PReiD3
        a4E7KfH0L06JfzNGwx0JHMs1ZF6BzGLyeyYJjwKtqfpbjBXIZMxyAAheeV4zJvcAiv+bw4wCHd6
        2THtNJQgnWbvK2m/0eRsbHWg=
X-Received: by 2002:a05:600c:2c4a:: with SMTP id r10mr18492268wmg.125.1639156811740;
        Fri, 10 Dec 2021 09:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNU0JyNH+dua45lgRN5P/61L11UJl1PwoKFRhXY842Ad9HzHHGG3VoAO/m7HCcQpyku0s/zQ==
X-Received: by 2002:a05:600c:2c4a:: with SMTP id r10mr18492242wmg.125.1639156811529;
        Fri, 10 Dec 2021 09:20:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d1sm2857275wrz.92.2021.12.10.09.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 09:20:10 -0800 (PST)
Message-ID: <b970086c-45b9-14e1-8bb8-b39f9e27b69b@redhat.com>
Date:   Fri, 10 Dec 2021 18:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/3] Input: goodix - Use the new soc_intel_is_byt()
 helper
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20211207100754.31155-1-hdegoede@redhat.com>
 <20211207100754.31155-2-hdegoede@redhat.com> <YbG7b59UtF3IeHNv@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YbG7b59UtF3IeHNv@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 12/9/21 09:16, Dmitry Torokhov wrote:
> On Tue, Dec 07, 2021 at 11:07:53AM +0100, Hans de Goede wrote:
>> Use the new soc_intel_is_byt() helper from
>> linux/platform_data/x86/soc.h.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/touchscreen/goodix.c | 18 ++----------------
>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index 828487d9ded5..6e71d5c732af 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/delay.h>
>>  #include <linux/irq.h>
>>  #include <linux/interrupt.h>
>> +#include <linux/platform_data/x86/soc.h>
> 
> This header is not in 5.15 so we need to either wait or you need to land
> thought your tree, hopefully there are no conflicts.

Right, this landed in 5.16-rc1. Since this is just a cleanup waiting
is fine.

I'll re-submit this once 5.16 is out.

Regards,

Hans

