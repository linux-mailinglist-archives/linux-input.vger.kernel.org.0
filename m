Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FFD647477
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 17:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiLHQj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 11:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLHQj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 11:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CDD4AF0E
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670517541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7cRXDJWcjfeRkRo2+R2+cz6b1HoZXpYfUmYKBkAZh0g=;
        b=UMNVJXiXyP8DvYp3v4je2ucPHe/NVwJXRqqJqCqwbyh5FWEJrLCN7OkI5PMZW0zKr1N/Iw
        GNU/uc15Dx8QLE8BmMcLNRX7LQxH0SMqWsrSbyf1/Cj0TctTydG5qFCIGRAz5ZfhTPoGXa
        mlQnkp24fv60+q6dqvczNeSY5ycb1LA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-8-mQsqr-MiuaOMbi4660Ow-1; Thu, 08 Dec 2022 11:39:00 -0500
X-MC-Unique: 8-mQsqr-MiuaOMbi4660Ow-1
Received: by mail-ed1-f72.google.com with SMTP id f17-20020a056402355100b00466481256f6so1221884edd.19
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 08:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cRXDJWcjfeRkRo2+R2+cz6b1HoZXpYfUmYKBkAZh0g=;
        b=6Kaftik52i1g8y6ow+/4CMeNFGHZjIQ7fCaacyUgqLOpl2vMrGHOhHFW9UQIXL+tJ4
         uDfVYWbQ9Sff1J5j16L3PFpiKexanB5mdVSwoPIwAZmxdx3ZTHlmwZqCNfzmQeSNOiXG
         SerATPAUvDgjrvoEB+I4MQO0lMLP7cHReBwio9e9zPRfEgxANQo9lrUX83+xIJXM3WoW
         tbmU0g6SEsuFjllgJwh8bCPjlKpPSheCQ5aRgm7B4VheoBtZ5GXDdme6GnsRSOv5ETlE
         PjQuThDIgN1Urn7BVqKEMzUsd5+uNLBAM61HWy7DBtdVki5mhkZ4ALpofOtyND1ydwtR
         KGHg==
X-Gm-Message-State: ANoB5pm4IK0EOFQI1mzR8rNNcIb4Oekm24pBSFKoz1Ihy9TpokcrYzjj
        EYVxla9U0OoTm3zLu4zJ64mT+zavMuGt0+EEqKl33yvNePg/soEvyYZNrLSXZava5qHrocnFqhj
        vQkuLM1Eao/jlJSoOA6M8vQw=
X-Received: by 2002:a17:906:524f:b0:7bf:f0e9:4edc with SMTP id y15-20020a170906524f00b007bff0e94edcmr2332663ejm.31.1670517539022;
        Thu, 08 Dec 2022 08:38:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Rd5bxDXePpQ1VGCxZvAg/1rd0WHCMLNUaT3hqs+6IPYP3T/OhXw0KVpYLtdEq5O193tUGEA==
X-Received: by 2002:a17:906:524f:b0:7bf:f0e9:4edc with SMTP id y15-20020a170906524f00b007bff0e94edcmr2332656ejm.31.1670517538859;
        Thu, 08 Dec 2022 08:38:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id bd7-20020a056402206700b0046b847d6a1csm3555506edb.21.2022.12.08.08.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 08:38:58 -0800 (PST)
Message-ID: <dc06357e-2d4d-208f-d59d-c0f8bf4c1843@redhat.com>
Date:   Thu, 8 Dec 2022 17:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
Content-Language: en-US, nl
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
 <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com>
 <CAO-hwJLHzRCJF96gKJwj7zCCPxRLoEw=cQ2w8=yLBOfyZz-c8w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO-hwJLHzRCJF96gKJwj7zCCPxRLoEw=cQ2w8=yLBOfyZz-c8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/8/22 17:24, Benjamin Tissoires wrote:
> On Thu, Dec 8, 2022 at 5:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Maximilian,
>>
>> On 12/2/22 23:33, Maximilian Luz wrote:
>>> We have some new insights into the Serial Hub protocol, obtained through
>>> reverse engineering. In particular, regarding the command structure. The
>>> input/output target IDs actually represent source and target IDs of
>>> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
>>> debug connector, and SurfLink connector).
>>>
>>> This series aims to improve handling of messages with regards to those
>>> new findings and, mainly, improve clarity of the documentation and usage
>>> around those fields.
>>>
>>> See the discussion in
>>>
>>>     https://github.com/linux-surface/surface-aggregator-module/issues/64
>>>
>>> for more details.
>>>
>>> There are a couple of standouts:
>>>
>>> - Patch 1 ensures that we only handle commands actually intended for us.
>>>   It's possible that we receive messages not intended for us when we
>>>   enable debugging. I've kept it intentionally minimal to simplify
>>>   backporting. The rest of the series patch 9 focuses more on clarity
>>>   and documentation, which is probably too much to backport.
>>>
>>> - Patch 8 touches on multiple subsystems. The intention is to enforce
>>>   proper usage and documentation of target IDs in the SSAM_SDEV() /
>>>   SSAM_VDEV() macros. As it directly touches those macros I
>>>   unfortunately can't split it up by subsystem.
>>>
>>> - Patch 9 is a loosely connected cleanup for consistency.
>>
>> Thank you for the patches. Unfortunately I don't have time atm to
>> review this.
>>
>> And the next 2 weeks are the merge window, followed by 2 weeks
>> of christmas vacation.
>>
>> So I'm afraid that I likely won't get around to reviewing
>> this until the week of January 9th.
>>
>>> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
>>> aggregator: Enforce use of target-ID enum in device ID macros") touches
>>> multiple subsystems, it should be possible to take the whole series
>>> through the pdx86 tree. The changes in other subsystems are fairly
>>> limited.
>>
>> I agree that it will be best to take all of this upstream through the
>> pdx86 tree. Sebastian thank you for the ack for patch 8/9.
>>
>> Jiri or Benjamin may we have your ack for merging patch 7/9 + 8/9
>> through the pdx86 tree ?
> 
> I can give you an ack for taking those through your tree, but I can
> not review the patches themselves because I was only CC-ed to those 2,
> and so was linux-input. Given that SSAM_SSH_TID_KIP is not in my
> current tree I assume it comes from this series.
> 
> Anyway, enough ranting :)
> 
> If you think the patches are OK, they are really small concerning the
> HID part, so feel free to take them through your tree Hans.

Thank you.

Regards,

Hans





>>> Maximilian Luz (9):
>>>   platform/surface: aggregator: Ignore command messages not intended for
>>>     us
>>>   platform/surface: aggregator: Improve documentation and handling of
>>>     message target and source IDs
>>>   platform/surface: aggregator: Add target and source IDs to command
>>>     trace events
>>>   platform/surface: aggregator_hub: Use target-ID enum instead of
>>>     hard-coding values
>>>   platform/surface: aggregator_tabletsw: Use target-ID enum instead of
>>>     hard-coding values
>>>   platform/surface: dtx: Use target-ID enum instead of hard-coding
>>>     values
>>>   HID: surface-hid: Use target-ID enum instead of hard-coding values
>>>   platform/surface: aggregator: Enforce use of target-ID enum in device
>>>     ID macros
>>>   platform/surface: aggregator_registry: Fix target-ID of base-hub
>>>
>>>  .../driver-api/surface_aggregator/client.rst  |  4 +-
>>>  .../driver-api/surface_aggregator/ssh.rst     | 36 ++++-----
>>>  drivers/hid/surface-hid/surface_hid.c         |  2 +-
>>>  drivers/hid/surface-hid/surface_kbd.c         |  2 +-
>>>  .../platform/surface/aggregator/controller.c  | 12 +--
>>>  .../platform/surface/aggregator/ssh_msgb.h    |  4 +-
>>>  .../surface/aggregator/ssh_request_layer.c    | 15 ++++
>>>  drivers/platform/surface/aggregator/trace.h   | 73 +++++++++++++++++--
>>>  .../platform/surface/surface_aggregator_hub.c |  8 +-
>>>  .../surface/surface_aggregator_registry.c     |  2 +-
>>>  .../surface/surface_aggregator_tabletsw.c     | 10 +--
>>>  drivers/platform/surface/surface_dtx.c        | 20 ++---
>>>  .../surface/surface_platform_profile.c        |  2 +-
>>>  drivers/power/supply/surface_battery.c        |  4 +-
>>>  drivers/power/supply/surface_charger.c        |  2 +-
>>>  include/linux/surface_aggregator/controller.h |  4 +-
>>>  include/linux/surface_aggregator/device.h     | 50 ++++++-------
>>>  include/linux/surface_aggregator/serial_hub.h | 40 ++++++----
>>>  18 files changed, 191 insertions(+), 99 deletions(-)
>>>
>>
> 

