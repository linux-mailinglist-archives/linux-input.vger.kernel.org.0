Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B433920D6
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 21:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhEZT3W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbhEZT3V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 15:29:21 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CA2C061574;
        Wed, 26 May 2021 12:27:50 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t193so1801029pgb.4;
        Wed, 26 May 2021 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jgFyEOXKnh8oZE9izcWNLKAKmuXy2hvkKvcvU5QJdeA=;
        b=WAu/1lAiAWhIQpzVLGYIynRafwyJME0VnwBhCMkBdkpi9OS6kh0xPzVatJZT9mjOk4
         +7NYDuyqmqDitOrkX5GoLcq9z6YymXtuhx7VVxLLD2H22Z2uprUv19Oa9kG44oBO93Jr
         c/DMDTJX3S1t5DLp8YVl+VhUxcQ9PgKt04nsUK5HVYjRuGbNiGbZZZ04mxbWMYgCqMEN
         gi2GepBTeBHlrjsZyiSHdtjjGnrTdnqMxwX+aAogKgGnUZfaHD1UgJdeuvxlClOYz54u
         104oWpAKsvVA1utiJDEpxK0TlUu9mxj2in0hEwt6pEcFcqDkqsPR1S88Kf79OWu4L5eK
         mfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jgFyEOXKnh8oZE9izcWNLKAKmuXy2hvkKvcvU5QJdeA=;
        b=eA4584tSXC2oWE8wOnZ9Wf/o2uaDvgAuJzn5zHn4tUojgE2pCXsbOOBS0L5Ot1fBDs
         dhpFB7+bnOP8GKxFo5gOi3r5t4KnMt00PwSRvmZXgGGCTgxo1Bg4/MTSIhmu8PTYyCqE
         F/TRcT1I0ZoP8Jlhl4mguDXr3BnxCBBfWNke3e2JhKLf4TxEtiQZrl0QfdCgTgfNgxaI
         4ex9UnfgJhDqS/QhvNk5+0UxOJE/CSFXZK2VYFgJtv2ZOouuOy2FG6GLch1pTRTTMjA6
         32XGnaEz7pZybMfuuAl4nIAnb7U+klMLJ2GeoTu90T+1sTz432M2m/68Igs6fUjr4uIZ
         q90w==
X-Gm-Message-State: AOAM533nyLs7CkR9H0K7Ivg/rlgNqqfd2JgPj0Y3SKs1sU6Wrr/1c8lr
        8G6bLsrprVEmhJsWeoVbJfs=
X-Google-Smtp-Source: ABdhPJz5W/J6TsNIc/PrT8G+AXpnxdsT9S0UrC9hvSVgfvwtbW+oNUVr0h9WQPXbbwtnjKk8P9ZPHg==
X-Received: by 2002:aa7:9f5c:0:b029:2de:a5f0:d73b with SMTP id h28-20020aa79f5c0000b02902dea5f0d73bmr37606176pfr.41.1622057269579;
        Wed, 26 May 2021 12:27:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c104:b5ae:a3c1:6470? ([2001:df0:0:200c:c104:b5ae:a3c1:6470])
        by smtp.gmail.com with ESMTPSA id t7sm47821pju.4.2021.05.26.12.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 12:27:48 -0700 (PDT)
Subject: Re: [PATCH] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20210526070345.31114-1-rdunlap@infradead.org>
 <CAMuHMdXdpzmFMSmM+8z9csZ094O5UG6nmAyTYYb=4TAmyUiSnw@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f8718a4f-8338-ef71-53fa-6e1504156ba0@gmail.com>
Date:   Thu, 27 May 2021 07:27:42 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXdpzmFMSmM+8z9csZ094O5UG6nmAyTYYb=4TAmyUiSnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Geert,

On 26/05/21 7:20 pm, Geert Uytterhoeven wrote:
> Hi Randy,
>
> On Wed, May 26, 2021 at 9:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> MOUSE_ATARI should depend on INPUT_KEYBOARD since ATARI_KBD_CORE
>> depends on INPUT_KEYBOARD. This prevents MOUSE_ATARI from
>> selecting ATARI_KBD_CORE when INPUT_KEYBOARD is not set/enabled.
>>
>> WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
>>    Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
>>    Selected by [y]:
>>    - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
>>
>> Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks for your patch!
>
>> --- linux-next-20210525.orig/drivers/input/mouse/Kconfig
>> +++ linux-next-20210525/drivers/input/mouse/Kconfig
>> @@ -348,6 +348,7 @@ config MOUSE_AMIGA
>>
>>   config MOUSE_ATARI
>>          tristate "Atari mouse"
>> +       depends on INPUT_KEYBOARD
>>          depends on ATARI
>>          select ATARI_KBD_CORE
>>          help
> It looks like arch/m68k/atari/atakeyb.c doesn't use anything from the
> input subsystem, so I think you can move the ATARI_KBD_CORE symbol
> outside the "if INPUT_KEYBOARD" section instead.

Correct - while we're at it, what about moving it to 
arch/m68k/Kconfig.machine?

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
