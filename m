Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA38D647428
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 17:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiLHQZN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 11:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiLHQZM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 11:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8587945ECA
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670516658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DOVvOqJbqLIZ2AhZtG8cGPrhcnZ2LRyU5svGNQICX+U=;
        b=JfuORu6XlatX5EiCKvnRxDtS5fi7iIrNlMREkwzeWqA94lXo+jovymZcAzHKVwd6F4Tlo3
        UJfMGc4e2vG4+VrhY5PNo2RIK8GXahEApsdlfSy9TRj2W9Nh4wbsTF/NXEB1WvDfMEGauo
        HVJ8TPPJ55Xa3XcNf9CnVBF0ZNyRVMk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-WMFNcvTBNkqBHpWeCgPFvA-1; Thu, 08 Dec 2022 11:24:17 -0500
X-MC-Unique: WMFNcvTBNkqBHpWeCgPFvA-1
Received: by mail-il1-f198.google.com with SMTP id n15-20020a056e021baf00b0030387c2e1d3so1733423ili.5
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 08:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOVvOqJbqLIZ2AhZtG8cGPrhcnZ2LRyU5svGNQICX+U=;
        b=EKiEgflNXGR1RyxjWbnDnk2lSQHMoI43V8sKvnxeyD8NIedhABL57dxRAHLHFEXUEG
         sNGhhQAfp5Cld/wr0De76a7tkE6/gNqMQ2fjk9XjNNxRI+ZfuFT82RDXukDELbGzFXfg
         S4a2mhBW7Uu+EBB4QXPLHTmDKbBME7MaL92lruTjqWCBvnV3xD02hEdYsorJvSRQ2rKC
         4/yuempfvfFH0Hucl3EtwZc5l3QtflPjjSekhFmKOeW52J3i1PLz8Of1D9SwbeAmjFiG
         L1s/LLYG92zG4ZtrXgBccnWI7bZcr3lr2aeP/NwB+dvnxViqWQSuYmMphMavBjbYMmAW
         Ur0g==
X-Gm-Message-State: ANoB5plSPk4+zwlcFwqUtqVIMi8goa0ULMRHoy48z57VNqfUMG3LijdI
        +flw4zB/H5bV5B/jPWWtFxMyJUb6Jx0SOOde6OfA2DKXLWXpZYrpQIn58FXM2qkMP+w022fb/mf
        ZWWC38C4VT+mNyO2g+ECUM5xU72u5tBR9ldi1UnY=
X-Received: by 2002:a92:da48:0:b0:302:ebf5:a7ae with SMTP id p8-20020a92da48000000b00302ebf5a7aemr32196411ilq.34.1670516656857;
        Thu, 08 Dec 2022 08:24:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Udv+66R4PY489KYK6uqupbMm3pq26p9nW3CFM8lXhyRn0ECXJZkRltfUaVhLCYBfeqsKfZB0RTc8vTPJrYHk=
X-Received: by 2002:a92:da48:0:b0:302:ebf5:a7ae with SMTP id
 p8-20020a92da48000000b00302ebf5a7aemr32196398ilq.34.1670516656630; Thu, 08
 Dec 2022 08:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20221202223327.690880-1-luzmaximilian@gmail.com> <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com>
In-Reply-To: <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 8 Dec 2022 17:24:05 +0100
Message-ID: <CAO-hwJLHzRCJF96gKJwj7zCCPxRLoEw=cQ2w8=yLBOfyZz-c8w@mail.gmail.com>
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 8, 2022 at 5:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Maximilian,
>
> On 12/2/22 23:33, Maximilian Luz wrote:
> > We have some new insights into the Serial Hub protocol, obtained through
> > reverse engineering. In particular, regarding the command structure. The
> > input/output target IDs actually represent source and target IDs of
> > (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> > debug connector, and SurfLink connector).
> >
> > This series aims to improve handling of messages with regards to those
> > new findings and, mainly, improve clarity of the documentation and usage
> > around those fields.
> >
> > See the discussion in
> >
> >     https://github.com/linux-surface/surface-aggregator-module/issues/64
> >
> > for more details.
> >
> > There are a couple of standouts:
> >
> > - Patch 1 ensures that we only handle commands actually intended for us.
> >   It's possible that we receive messages not intended for us when we
> >   enable debugging. I've kept it intentionally minimal to simplify
> >   backporting. The rest of the series patch 9 focuses more on clarity
> >   and documentation, which is probably too much to backport.
> >
> > - Patch 8 touches on multiple subsystems. The intention is to enforce
> >   proper usage and documentation of target IDs in the SSAM_SDEV() /
> >   SSAM_VDEV() macros. As it directly touches those macros I
> >   unfortunately can't split it up by subsystem.
> >
> > - Patch 9 is a loosely connected cleanup for consistency.
>
> Thank you for the patches. Unfortunately I don't have time atm to
> review this.
>
> And the next 2 weeks are the merge window, followed by 2 weeks
> of christmas vacation.
>
> So I'm afraid that I likely won't get around to reviewing
> this until the week of January 9th.
>
> > Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> > aggregator: Enforce use of target-ID enum in device ID macros") touches
> > multiple subsystems, it should be possible to take the whole series
> > through the pdx86 tree. The changes in other subsystems are fairly
> > limited.
>
> I agree that it will be best to take all of this upstream through the
> pdx86 tree. Sebastian thank you for the ack for patch 8/9.
>
> Jiri or Benjamin may we have your ack for merging patch 7/9 + 8/9
> through the pdx86 tree ?

I can give you an ack for taking those through your tree, but I can
not review the patches themselves because I was only CC-ed to those 2,
and so was linux-input. Given that SSAM_SSH_TID_KIP is not in my
current tree I assume it comes from this series.

Anyway, enough ranting :)

If you think the patches are OK, they are really small concerning the
HID part, so feel free to take them through your tree Hans.

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
>
> > Maximilian Luz (9):
> >   platform/surface: aggregator: Ignore command messages not intended for
> >     us
> >   platform/surface: aggregator: Improve documentation and handling of
> >     message target and source IDs
> >   platform/surface: aggregator: Add target and source IDs to command
> >     trace events
> >   platform/surface: aggregator_hub: Use target-ID enum instead of
> >     hard-coding values
> >   platform/surface: aggregator_tabletsw: Use target-ID enum instead of
> >     hard-coding values
> >   platform/surface: dtx: Use target-ID enum instead of hard-coding
> >     values
> >   HID: surface-hid: Use target-ID enum instead of hard-coding values
> >   platform/surface: aggregator: Enforce use of target-ID enum in device
> >     ID macros
> >   platform/surface: aggregator_registry: Fix target-ID of base-hub
> >
> >  .../driver-api/surface_aggregator/client.rst  |  4 +-
> >  .../driver-api/surface_aggregator/ssh.rst     | 36 ++++-----
> >  drivers/hid/surface-hid/surface_hid.c         |  2 +-
> >  drivers/hid/surface-hid/surface_kbd.c         |  2 +-
> >  .../platform/surface/aggregator/controller.c  | 12 +--
> >  .../platform/surface/aggregator/ssh_msgb.h    |  4 +-
> >  .../surface/aggregator/ssh_request_layer.c    | 15 ++++
> >  drivers/platform/surface/aggregator/trace.h   | 73 +++++++++++++++++--
> >  .../platform/surface/surface_aggregator_hub.c |  8 +-
> >  .../surface/surface_aggregator_registry.c     |  2 +-
> >  .../surface/surface_aggregator_tabletsw.c     | 10 +--
> >  drivers/platform/surface/surface_dtx.c        | 20 ++---
> >  .../surface/surface_platform_profile.c        |  2 +-
> >  drivers/power/supply/surface_battery.c        |  4 +-
> >  drivers/power/supply/surface_charger.c        |  2 +-
> >  include/linux/surface_aggregator/controller.h |  4 +-
> >  include/linux/surface_aggregator/device.h     | 50 ++++++-------
> >  include/linux/surface_aggregator/serial_hub.h | 40 ++++++----
> >  18 files changed, 191 insertions(+), 99 deletions(-)
> >
>

