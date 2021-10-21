Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0110436A9A
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 20:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhJUSgF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 14:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25165 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230020AbhJUSgD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 14:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634841227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R8NRWj30fOIwdXURO/nuW9fLSSQ/mcQoafJ2KYOfKWQ=;
        b=ZOgyUUau73mGj6K42kSY4lgpuM7t2tO71fufgxJ76KvV3tVme55YDN3fl246WL1hC6F+yG
        2wKOqVqLGuuJ3oB/P98Wa7rB/9uG2VNtQiHTDsIi7Fd7lBILnHJJ//Ps5N2jaQXN/oRUzl
        iElO1frac4CmdOPaYvU/OKe+nVC0r5Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-bZxj8SxbPiOjt__wP1jBwQ-1; Thu, 21 Oct 2021 14:33:46 -0400
X-MC-Unique: bZxj8SxbPiOjt__wP1jBwQ-1
Received: by mail-ed1-f72.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso1272795edf.7
        for <linux-input@vger.kernel.org>; Thu, 21 Oct 2021 11:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R8NRWj30fOIwdXURO/nuW9fLSSQ/mcQoafJ2KYOfKWQ=;
        b=hChwjg+XQQ6iTXYe1NvQviZOTqGpw8eviQdSCfannoYQZ0jmWSvoiIyN2N7cwBmvid
         D+ALFv4E/SKd5RmD5+aILOjKNSiAKoTvAEONH2GMl5I6AZEAjqpVOgL+TMb3HhDaxf9k
         m+bVikzJGgL3YGaAzvvX8MPLdhNaEHbaJK1HmiDEIw4YbV4J1rWE4TRdlq/y+kcVaIbV
         iwTpe79R0eVFVi/U9mQ7oef+UPJHxfL4cxgO3I9I01s1uETRPlhw73oLl0LJv85O0DuA
         Eo1cgHPdfeoNgvObbHtJr/dbHH8xahh4pbWZ/HPtCFwW3wx3AZSg2ZpDlEVZOq6y36Z5
         bEwQ==
X-Gm-Message-State: AOAM533mgBOfT6bnTovs/whoqhhYKDSCfNHZ8LAyyxS0lzrmb6Icq7J3
        RT+v7MQj1EQRPz9aRGdz28Pl5z3RJAXa0R6npQ1AwvepJlKASUEPbN6+tyn1zOvXhag3FV+EF/h
        2aKeM6bZB/Qll1iyv9tSL8OU=
X-Received: by 2002:a17:906:68c2:: with SMTP id y2mr9391434ejr.18.1634841225098;
        Thu, 21 Oct 2021 11:33:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknNQQUbRgcsCMUK3RfAdm8Suvp8umEPd+1xlwOxyoSPUMx59PDqppM0w9G26bWiWym3jf2g==
X-Received: by 2002:a17:906:68c2:: with SMTP id y2mr9391419ejr.18.1634841224958;
        Thu, 21 Oct 2021 11:33:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z4sm3756571edd.46.2021.10.21.11.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:33:44 -0700 (PDT)
Message-ID: <1e99ab2b-c5c3-49c9-18c3-1f103c4dbe85@redhat.com>
Date:   Thu, 21 Oct 2021 20:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] platform/surface: aggregator: Add support for Surface
 Laptop Studio
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211021130904.862610-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211021130904.862610-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/21/21 15:09, Maximilian Luz wrote:
> This series adds Surface Aggregator Module (SAM) support for the new
> Surface Laptop Studio (SLS).
> 
> This is mostly straight-forward addition of devices to the Surface
> Aggregator registry, but the Surface HID driver needs a couple of small
> changes. Specifically, we need to allow it to probe against SAM devices
> with target ID 1 and also need to use the corresponding registry for
> those.
> 
> I hope it's okay that I've CCed stable to get these included in v5.14+
> stable kernels. The changes are fairly small and enable keyboard and
> touchpad on the SLS. Most other things (except touch) should already
> work well on the latest stable kernels, so back-porting this series
> would make the SLS a usable device on those.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> Maximilian Luz (3):
>   platform/surface: aggregator_registry: Add support for Surface Laptop
>     Studio
>   HID: surface-hid: Use correct event registry for managing HID events
>   HID: surface-hid: Allow driver matching for target ID 1 devices
> 
>  drivers/hid/surface-hid/surface_hid.c         |  4 +-
>  .../surface/surface_aggregator_registry.c     | 54 +++++++++++++++++++
>  include/linux/surface_aggregator/controller.h |  4 +-
>  3 files changed, 58 insertions(+), 4 deletions(-)
> 

