Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78472678000
	for <lists+linux-input@lfdr.de>; Mon, 23 Jan 2023 16:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbjAWPiN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Jan 2023 10:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbjAWPiI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Jan 2023 10:38:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD603298CD
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674488238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nrgSGGG2jivQORYVrLOlwmevh4Rgh/EU/neEY/ItRis=;
        b=BH3Ec3nPZlFAW7RgNpe++fmEnbAYLiqBnnN9B1/TmRYRNrdjirXUoOpdqR3ADCfmsASq/I
        tq2l/Z+Ylgnx7VOBqvCCwPavjnN/1mnHjb3ANT79qdeYHvH90LNailNHcHBaRt/ZYjBAn2
        9mhjJL2tQZ+kY6RDao2VwHD7b3+XR84=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-Ce9J67UuPfiNnn1xaSbTNQ-1; Mon, 23 Jan 2023 10:37:17 -0500
X-MC-Unique: Ce9J67UuPfiNnn1xaSbTNQ-1
Received: by mail-ej1-f71.google.com with SMTP id qf20-20020a1709077f1400b0086ec9755517so7975242ejc.15
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 07:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrgSGGG2jivQORYVrLOlwmevh4Rgh/EU/neEY/ItRis=;
        b=Lbf845lgD7L05codFf1RHFxpbbHpN5pOipXbA4mEMXh2zoKOzRWB+Dt+FR7GGwt5VG
         t+aFBuk8PBaKvAHxtxN77DRyceQ/Gq/IvUYkRBoeyDnZeHqS31/9oCmixdNwh2iz9wwN
         erRlKmwAslVQi9bH9Qrv81JBT2SAhC1uIDoW7uUDoyDwPKVtMvyd3zjV45fvcQZn74Mt
         tomqKcuiL/bWCQMsVAGtvJwU6TLHyhvbUV18fTa4Ty9qvAwv+0qnQtbwvgqHFDy8k31s
         BY7kVKXQdp3UOLAGfWWh2+cMACJkFd5XOITGzgJJexmLCoTsyW0f0Fc6tjS/uClSzNTd
         L4GQ==
X-Gm-Message-State: AFqh2kr0UgIIW0d81gqZ8BE3nTK7EValOpS9mDfdgR700lsGqbZ2gZrl
        M39m94TK1Wcen35Wn8MrZlHMlO+ZOByQBtQDvfm2DiCJq92HWAwQWhdO81qy0Zbxu2gbldZh3ld
        b4tskiquTm3ckM0TH7j2MNNM=
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr11987738ejc.10.1674488231732;
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtr1c6/aX5wLHbH7NQWaOi30A9xv9EkJz28AZBsNN6soWEYPWWpSZA9Zkp3Fm+NFpmtrXZwug==
X-Received: by 2002:a17:907:a601:b0:877:a7ec:5ff with SMTP id vt1-20020a170907a60100b00877a7ec05ffmr11987725ejc.10.1674488231560;
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kz22-20020a17090777d600b007c1633cea13sm22618884ejc.12.2023.01.23.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:37:11 -0800 (PST)
Message-ID: <33c497ad-2279-ccf6-016b-52b8e1b4783f@redhat.com>
Date:   Mon, 23 Jan 2023 16:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202223327.690880-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/2/22 23:33, Maximilian Luz wrote:
> We have some new insights into the Serial Hub protocol, obtained through
> reverse engineering. In particular, regarding the command structure. The
> input/output target IDs actually represent source and target IDs of
> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> debug connector, and SurfLink connector).
> 
> This series aims to improve handling of messages with regards to those
> new findings and, mainly, improve clarity of the documentation and usage
> around those fields.
> 
> See the discussion in
> 
>     https://github.com/linux-surface/surface-aggregator-module/issues/64
> 
> for more details.
> 
> There are a couple of standouts:
> 
> - Patch 1 ensures that we only handle commands actually intended for us.
>   It's possible that we receive messages not intended for us when we
>   enable debugging. I've kept it intentionally minimal to simplify
>   backporting. The rest of the series patch 9 focuses more on clarity
>   and documentation, which is probably too much to backport.
> 
> - Patch 8 touches on multiple subsystems. The intention is to enforce
>   proper usage and documentation of target IDs in the SSAM_SDEV() /
>   SSAM_VDEV() macros. As it directly touches those macros I
>   unfortunately can't split it up by subsystem.
> 
> - Patch 9 is a loosely connected cleanup for consistency.
> 
> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> aggregator: Enforce use of target-ID enum in device ID macros") touches
> multiple subsystems, it should be possible to take the whole series
> through the pdx86 tree. The changes in other subsystems are fairly
> limited.

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
> 
> Maximilian Luz (9):
>   platform/surface: aggregator: Ignore command messages not intended for
>     us
>   platform/surface: aggregator: Improve documentation and handling of
>     message target and source IDs
>   platform/surface: aggregator: Add target and source IDs to command
>     trace events
>   platform/surface: aggregator_hub: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: aggregator_tabletsw: Use target-ID enum instead of
>     hard-coding values
>   platform/surface: dtx: Use target-ID enum instead of hard-coding
>     values
>   HID: surface-hid: Use target-ID enum instead of hard-coding values
>   platform/surface: aggregator: Enforce use of target-ID enum in device
>     ID macros
>   platform/surface: aggregator_registry: Fix target-ID of base-hub
> 
>  .../driver-api/surface_aggregator/client.rst  |  4 +-
>  .../driver-api/surface_aggregator/ssh.rst     | 36 ++++-----
>  drivers/hid/surface-hid/surface_hid.c         |  2 +-
>  drivers/hid/surface-hid/surface_kbd.c         |  2 +-
>  .../platform/surface/aggregator/controller.c  | 12 +--
>  .../platform/surface/aggregator/ssh_msgb.h    |  4 +-
>  .../surface/aggregator/ssh_request_layer.c    | 15 ++++
>  drivers/platform/surface/aggregator/trace.h   | 73 +++++++++++++++++--
>  .../platform/surface/surface_aggregator_hub.c |  8 +-
>  .../surface/surface_aggregator_registry.c     |  2 +-
>  .../surface/surface_aggregator_tabletsw.c     | 10 +--
>  drivers/platform/surface/surface_dtx.c        | 20 ++---
>  .../surface/surface_platform_profile.c        |  2 +-
>  drivers/power/supply/surface_battery.c        |  4 +-
>  drivers/power/supply/surface_charger.c        |  2 +-
>  include/linux/surface_aggregator/controller.h |  4 +-
>  include/linux/surface_aggregator/device.h     | 50 ++++++-------
>  include/linux/surface_aggregator/serial_hub.h | 40 ++++++----
>  18 files changed, 191 insertions(+), 99 deletions(-)
> 

