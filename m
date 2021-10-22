Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43600437417
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 10:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhJVI7E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 04:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33371 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232310AbhJVI7D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 04:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634893006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aQiw+gPwn0Z6GIbDl4DexWcWNq7xOQ4QBTMZ1MgC764=;
        b=fqNmJQ4oi9R4FAQ5q7SO4tzZnUV6a8B5puyvb7iB0c4I7kN1w4zUBhdxCTZm+3r8zbbuTq
        vehkcfI0Ut0ymK4Y8YJUDVRODNRINbHhhARpPH77WtTtA/oL3qfGhG0ihU/DOSrH1+bWPe
        OCSSqs60TA5fTQFsnhtOE9b46W4N7UQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-uk41vxdDOsudgxPqr-Rz1w-1; Fri, 22 Oct 2021 04:56:44 -0400
X-MC-Unique: uk41vxdDOsudgxPqr-Rz1w-1
Received: by mail-ed1-f72.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so3016073edx.15
        for <linux-input@vger.kernel.org>; Fri, 22 Oct 2021 01:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aQiw+gPwn0Z6GIbDl4DexWcWNq7xOQ4QBTMZ1MgC764=;
        b=A9k19pbwa0qash7aliPXerlJNAqDP+litpKR2yWApF+dMT6teFQd3xOVfCA8urdcIg
         mTeTX0YqxoFBCxNgkvpNG3WB1H0+17/LlTbk/PKht3o/N8AejWh3xDALcwqdSMAac1hj
         kvy+hxNtF4k/6cCYcp4Sd9zR6Y/qnXfTq0VaQdCdSG9OlfMCHFQRBU+Eht3fMPLuexJo
         FhhPdBJqQ6A579IalwwEhzFmNlHLoVeDJxH6gH6/TAyCXHt4nYZsrbcmIq18DCwOwib0
         4cPQNt8J1lGDitowog8UvLqI70CEH73sjNA0Phs2xbcnpdHlwR6lIbvXOZP+U64Ti3D9
         oyTw==
X-Gm-Message-State: AOAM532jXTTRHJ6g3/ZvJAxAOEAQDb0ALGEmk4gNE34sqf4oLR+yeqf1
        WjYDmyC8TCI4UYbb6tPkNVQDPMLKj/XVIqrrU35SvrVn9ePLAvJZ2k7KRQFRJ53tT6bVt9Z70SZ
        3a8lyRbW534shNs4Q6/8jHtY=
X-Received: by 2002:aa7:db12:: with SMTP id t18mr10427360eds.79.1634893003269;
        Fri, 22 Oct 2021 01:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaILcf6K4P/VGXm8p6Llu+qLam6tPNL9N50zKF0EDxFczormhsRR4IRbvH2euaJIoofdKFbw==
X-Received: by 2002:aa7:db12:: with SMTP id t18mr10427337eds.79.1634893003062;
        Fri, 22 Oct 2021 01:56:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z4sm4681457edd.46.2021.10.22.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:56:42 -0700 (PDT)
Message-ID: <c1c3b2e2-420c-becf-a46c-0ab963176303@redhat.com>
Date:   Fri, 22 Oct 2021 10:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] platform/surface: aggregator: Add support for Surface
 Laptop Studio
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20211021130904.862610-1-luzmaximilian@gmail.com>
 <1e99ab2b-c5c3-49c9-18c3-1f103c4dbe85@redhat.com>
 <CAO-hwJK_rt9pD5zqnTcDkXxgMjxsXWgzMgrRTJ3xbU4yZ+BAfg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO-hwJK_rt9pD5zqnTcDkXxgMjxsXWgzMgrRTJ3xbU4yZ+BAfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/22/21 08:55, Benjamin Tissoires wrote:
> On Thu, Oct 21, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/21/21 15:09, Maximilian Luz wrote:
>>> This series adds Surface Aggregator Module (SAM) support for the new
>>> Surface Laptop Studio (SLS).
>>>
>>> This is mostly straight-forward addition of devices to the Surface
>>> Aggregator registry, but the Surface HID driver needs a couple of small
>>> changes. Specifically, we need to allow it to probe against SAM devices
>>> with target ID 1 and also need to use the corresponding registry for
>>> those.
>>>
>>> I hope it's okay that I've CCed stable to get these included in v5.14+
>>> stable kernels. The changes are fairly small and enable keyboard and
>>> touchpad on the SLS. Most other things (except touch) should already
>>> work well on the latest stable kernels, so back-porting this series
>>> would make the SLS a usable device on those.
>>
>> Thank you for your patch-series, I've applied the series to my
>> review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
> 
> I was surprised to see you taking this series when the 2 patches I
> received are HID only.
> But it turns out that the patch 1/3 (which I am missing) is actually
> about platform, so it makes sense to have you take the full series.
> The HID changes are relatively small and are not conflicting with
> anything in the HID tree.
> 
> For the HID part:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks I'll add your Ack before moving this for-next and sorry for
not coordinating this before hand.

TBH I completely missed that the 2 other patches where under drivers/hid
since 90% or so of all surface stuff is under drivers/platform/surface
I sorta assumed all patches where for there. My bad, sorry.

(Note to self: Next time not only review the contents of the diff but
also look at the file-paths).

Regards,

Hans


> 
> Cheers,
> Benjamin
> 
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>> Maximilian Luz (3):
>>>   platform/surface: aggregator_registry: Add support for Surface Laptop
>>>     Studio
>>>   HID: surface-hid: Use correct event registry for managing HID events
>>>   HID: surface-hid: Allow driver matching for target ID 1 devices
>>>
>>>  drivers/hid/surface-hid/surface_hid.c         |  4 +-
>>>  .../surface/surface_aggregator_registry.c     | 54 +++++++++++++++++++
>>>  include/linux/surface_aggregator/controller.h |  4 +-
>>>  3 files changed, 58 insertions(+), 4 deletions(-)
>>>
>>
> 

