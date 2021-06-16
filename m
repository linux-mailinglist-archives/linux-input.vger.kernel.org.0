Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3393AA2A4
	for <lists+linux-input@lfdr.de>; Wed, 16 Jun 2021 19:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFPRwT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Jun 2021 13:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23597 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231386AbhFPRwS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Jun 2021 13:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623865811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=gcyc3iBASawdTGBuNCY+tD5E8CIAEC4OyXKa42R9YJje9huX/xi0g/XLZnObae9V+T89Fr
        mYLd/IDRDICvdOkdh65jcCqkNlefCdzEWEmV8G6mlhUZb4Bn7jl5s4VNesO5W4qzisVKKz
        rZSUy4gGxDJDZ1HLgCM9HWNE4vsAcgM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-2jqLRab-NzKUvm4zxADidA-1; Wed, 16 Jun 2021 13:50:10 -0400
X-MC-Unique: 2jqLRab-NzKUvm4zxADidA-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso97194edd.12
        for <linux-input@vger.kernel.org>; Wed, 16 Jun 2021 10:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=ZEx6ZDzk8kbEkYRgbF8gzK2ar8FN17IiILDmctr4uPNTAov/geG0VrvKVLKHzCsecN
         0TIvc13B99Oqbzc0TIw2TEMtW+e12Pp8sXW8IFKJ5uw3s8wpng1tWBBSz9St3gKmn3/z
         c/bi2XSEYlgsEu1w6VUWdgf2n562UQ8b3EURLfFnvRuzS3XYc55wNL2XbeRg1Es2zzhT
         0IoqP4fN2he6r6baBW8W2MMl7Ga5AmM42St+uKcKbrMCm+IiZltCsu5XF/+UG0A19f19
         8F6WlL/X28f87886BWQXRFDF1KL5RDcHimbApqDSLaP0ObLwpe4J8AuD+JZRNEWrQZk/
         kNUw==
X-Gm-Message-State: AOAM530a36SBK0ShqGvpnN4HOVDNVuG77+4OlsaZEU8zMRwJgLTxHc3W
        oYW7u4UBrVql6QN4k9OnIlcQgxjUcTb4FHD3wlfLt4zAYp/v1O8CkR4hawYREaZoor3yuWqN9j1
        LLk2HN+kuaN4IdnvzzM0uCr4eiyvOXN16EbL5+er9MEZduvxppO0ThfOMJdYARY8tswaYN7f53F
        E=
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057030edw.217.1623865808788;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPVQRfLVZ6xrhMEJJgDbjLbUmkGN3zjTjUbkoi+Hf7VGNx/AgCRErmc8Bbn1LonQqtQfB8hg==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057007edw.217.1623865808581;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id au11sm2089496ejc.88.2021.06.16.10.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
Date:   Wed, 16 Jun 2021 19:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/16/21 7:20 PM, Enrico Weigelt, metux IT consult wrote:
> On 16.06.21 17:56, leo60228 wrote:
>>> Can you please tell a bit more what these LEDs are actually used for ?
>>> Do they have some names or symbols ? Are they also controlled by
>>> something else (e.g. numlock or shiftlock leds)
>>
>> They're used for the keyboard backlight. This functionality is pretty common on gaming laptops.
> 
> hmm, keyboard backlight ... don't we already have something for that
> in input subsys ? I believe that some lone LEDs aren't the right subsys
> for those stuff.

Actually the standardized userspace API for exporting keyboard backlights
is using the LED class sysfs API, e.g.:

cat /sys/class/leds/tpacpi\:\:kbd_backlight/brightnes

And the same for Dell and other kbd backlights, also the upower
daemon even has code for dealing with kbd-backlights:
https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/up-kbd-backlight.c
exporting them over its dbus API so that non-root users can
control them.

Basically using the LED class for kbd-backlight functionality
basically is the defacto standard under Linux, so exposing this
through the LED class is definitely the right thing to do.

Since these are zones however, we probably wat to avoid the
kbd_backlight suffix of the name, otherwise upower will
pick the first device it enumerates and control that, while
leaving the other zones alone, which is not what we want.

Regards,

Hans

