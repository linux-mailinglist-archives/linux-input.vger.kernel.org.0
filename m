Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E75331EEE0
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 19:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhBRSsd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 13:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50511 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233539AbhBRQs0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 11:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613666820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c8kK7O2XFWT/eVjA2G4ZhQxAThbCihj5vo5giTyH6Us=;
        b=SKpo8kUbcjwpxs2tyBZOmbMKZPHbvaNi5IpBUD0/FE+zzrHThLmBuyb1LGlbcSnhbY1MyG
        Fxh454vil4msNeD0rvyY5Vs6E2gJ0JyhJw0qMcHvj0hACopXMAwjWdyIALjrmm9MghQMqH
        wTl4lBpNKQithrAoMGGLLEKWgU44yb4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-H41_GHN9O3eyGtq_8dRtsg-1; Thu, 18 Feb 2021 11:46:58 -0500
X-MC-Unique: H41_GHN9O3eyGtq_8dRtsg-1
Received: by mail-pf1-f200.google.com with SMTP id 68so1684859pfe.2
        for <linux-input@vger.kernel.org>; Thu, 18 Feb 2021 08:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8kK7O2XFWT/eVjA2G4ZhQxAThbCihj5vo5giTyH6Us=;
        b=kWpJrQAURRTLjRwlahsxU1XUT7DtdMLBomhRZgyWOtCmR1XRIdtC49zKs1/rFepWhC
         OmRYufE1Tcj+YrH5uvEiEo1CkMvrcbX6dJAr1a4cEAFvrvTQWj4da3w4sotLlM024Gvg
         g84IFKgfsN2W424z6iTJ10D2ub6kNIqkg6gCRA1j8LBMzAJuMpbsBM/gWUSdkcoyGu+m
         lTmpbaOU2ihr+wXmBpsA0hxSmqWF2v1cdiIND6gWa1fheLhBqKGcMngDQTNNclaimhnr
         FCYcmehycqF/X0/yUksx0xd3SN36g/0S3GXOr3tfm4W2yoX9+/wDfuHkJt6HV6PipYyA
         SiBg==
X-Gm-Message-State: AOAM532UtPRn4jEyaFyFP+Q5kFPoAlcBPi42CGqOSoUr+8C1iHkYT13x
        sE2MSJxU4VPllUi2ATxNKSIOxHFWUZqDHhe8exBkgCrZm6PxY8OpDQfX9C3sXK60B2+qEMsx5Nj
        O9GeJwkbMiqM64ZzepdlZOXjfT3pWPEh7zAFX0XY=
X-Received: by 2002:a17:90a:990f:: with SMTP id b15mr4895029pjp.56.1613666817736;
        Thu, 18 Feb 2021 08:46:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdyu4WNLMmaqUjN4rAG9EzejD9obPkN/ruOJr8J3NxXuOJi2e6pn17dRuvLTo9jfwYc4G/lM1zpktGFjjSKH8=
X-Received: by 2002:a17:90a:990f:: with SMTP id b15mr4895014pjp.56.1613666817519;
 Thu, 18 Feb 2021 08:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 18 Feb 2021 17:46:46 +0100
Message-ID: <CAO-hwJKEDEDvMcdvSBq3tx_tibEnhFzFm7wq2AQ3SZwgQyfm4Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: playstation: revert LED class exposure
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 17, 2021 at 6:32 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> [sending those patches on behalf of Roderick]
>
> There is a current thread on LED LKML which basically means that
> we have to revert the LED class exposure until things are settled.
>
> I am sending here the full series that will end up in linux-next.
> But with some git magic, the final PR to Linus will not have the
> reverts in it, just the plain patches.
>
> I am queuing in for-5.12/playstation patches 1 to 6 immediately
> (the reverts).
>
> I am also queuing in for-5.12/playstation-v2 patches 7 and 8 on
> top of 51151098d7ab8 immediately. Those 2 patches have already
> been reviewed the usual process.
>
> I am waiting 1 day for others to chime in regarding patches 9 to
> 11 before applying them to for-5.12/playstation-v2. They are
> basically the same patches that were already reviewed on the
> linux-input LKML, but without the LED class bits.

And I just pushed those 3 patches to for-5.12/playstation-v2.

Cheers,
Benjamin

>
> With all that, we should have more room to discuss the exposure
> of the LEDs to userspace through the LED class.
>
> Roderick, I made small adjustments compared to the series you sent
> me privately:
> - added the 2 missing reverts/re-add, so I can have clean merges
>   for our for-next branch,
> - re-ordered the `if (ds->update_rumble)` block in
>   `dualsense_output_worker()` to match was was in linux-next
> - removed an extra new line to match the current linux-next tree.
>
> Cheers,
> Benjamin
>
> Benjamin Tissoires (2):
>   Revert "HID: playstation: fix unused variable in
>     ps_battery_get_property."
>   Revert "HID: playstation: report DualSense hardware and firmware
>     version."
>
> Roderick Colenbrander (9):
>   Revert "HID: playstation: DualSense set LEDs to default player id."
>   Revert "HID: playstation: add DualSense player LEDs support."
>   Revert "HID: playstation: add microphone mute support for DualSense."
>   Revert "HID: playstation: add DualSense lightbar support"
>   HID: playstation: report DualSense hardware and firmware version.
>   HID: playstation: fix unused variable in ps_battery_get_property.
>   HID: playstation: add initial DualSense lightbar support.
>   HID: playstation: add microphone mute support for DualSense.
>   HID: playstation: add DualSense player LED support.
>
>  drivers/hid/Kconfig           |   3 -
>  drivers/hid/hid-playstation.c | 177 +++-------------------------------
>  2 files changed, 12 insertions(+), 168 deletions(-)
>
> --
> 2.29.2
>

