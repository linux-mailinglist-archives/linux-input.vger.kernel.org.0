Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14918647584
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 19:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiLHS0s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 13:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiLHS0r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 13:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5ED8B1A1
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670523952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+1VVUcW2d/r4TNKwvpnKWV11TO1c/pvTjCV/IvxcjRo=;
        b=bDaKKiYUThiSyvLczpdv6vWHVVEki1k/CNUulEaqtfpjLtj+hkSLWAx16j3CuLNBcTuSzI
        FJ39aVhpDKDri3fFPqoNZYJZBASPz0VY6Ru1PDdCsg9rkrJa173N2ws44YqouOIE4cDD4/
        Olb0jQjfrFB1aLy1Lzbu+3+gBODZiTo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-CP95HdbuNe2NddDBY8tOqQ-1; Thu, 08 Dec 2022 13:25:48 -0500
X-MC-Unique: CP95HdbuNe2NddDBY8tOqQ-1
Received: by mail-il1-f197.google.com with SMTP id g4-20020a92cda4000000b00301ff06da14so2057070ild.11
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 10:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1VVUcW2d/r4TNKwvpnKWV11TO1c/pvTjCV/IvxcjRo=;
        b=dLAASEVXmZARjrKK0kJORR7krCqngtmKxbYlExhrQgbYrzD52bt/ETpFJ6oQVWy82x
         1WG1iO17e70TmyLddMxEz+Y9Nu7kP0ZUULLzTEgZsUfmij6yLzGxNO8DtoaZRkmRq+HF
         HEPPsAnLAjGCbQhKHimeVqlvd8S55wxROXRVt9EFq+ufC9KDDhFBl8hZtf8JIYmJAA2d
         ETAXLK3MC3dFxqsGTzTKZd6BeFYGKwmnbtiv+fnjn90bjOB4bABscxoZPtqUrUsXU2ER
         HQDv5u82JfmiasO15XGABNdqCJh22f+O1yTzHtPMqQe5N7J656XC+gnYVj7+d+m+Xf11
         myxA==
X-Gm-Message-State: ANoB5pn95obfOKq4zaGOe3KDGP4t/2Cdc9Ak8gx7hFwzqX/Ncr3sPK4N
        j4AX9o6s7Mu7NGdeMQqaDHCuKgKlm0c2GzJcSE7d3zIR7YddFN4nN/cJtiXcg29SbvV7F/hlQxj
        GxALgiXbZWG/w4dpFYUc2qY0hWef7k5z9uRa8qD4=
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id h23-20020a02c737000000b003751c5f3127mr35668691jao.251.1670523948073;
        Thu, 08 Dec 2022 10:25:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XCBcc0cLWH0jfXhA5ZbFHiNTG82whiCD4Mw1h1hz6rEL64t1cqCthrqMh8k4p9AolzPHI251n+gp0C6VYXbE=
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id
 h23-20020a02c737000000b003751c5f3127mr35668682jao.251.1670523947849; Thu, 08
 Dec 2022 10:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
 <c09c9cef-14ac-2ab3-5e01-13189823a053@redhat.com> <CAO-hwJLHzRCJF96gKJwj7zCCPxRLoEw=cQ2w8=yLBOfyZz-c8w@mail.gmail.com>
 <304bce39-2ece-863c-33b3-b432685faa2d@gmail.com>
In-Reply-To: <304bce39-2ece-863c-33b3-b432685faa2d@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 8 Dec 2022 19:25:36 +0100
Message-ID: <CAO-hwJJ3MLvSeEkqdT_aj6kHLWzk2sVNRVsaeyfk4VpTdzK5Gw@mail.gmail.com>
Subject: Re: [PATCH 0/9] platform/surface: aggregator: Improve target/source
 handling in SSH messages
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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

On Thu, Dec 8, 2022 at 5:49 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> On 12/8/22 17:24, Benjamin Tissoires wrote:
> > On Thu, Dec 8, 2022 at 5:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Maximilian,
> >>
> >> On 12/2/22 23:33, Maximilian Luz wrote:
> >>> We have some new insights into the Serial Hub protocol, obtained through
> >>> reverse engineering. In particular, regarding the command structure. The
> >>> input/output target IDs actually represent source and target IDs of
> >>> (what looks like) physical entities (specifically: host, SAM EC, KIP EC,
> >>> debug connector, and SurfLink connector).
> >>>
> >>> This series aims to improve handling of messages with regards to those
> >>> new findings and, mainly, improve clarity of the documentation and usage
> >>> around those fields.
> >>>
> >>> See the discussion in
> >>>
> >>>      https://github.com/linux-surface/surface-aggregator-module/issues/64
> >>>
> >>> for more details.
> >>>
> >>> There are a couple of standouts:
> >>>
> >>> - Patch 1 ensures that we only handle commands actually intended for us.
> >>>    It's possible that we receive messages not intended for us when we
> >>>    enable debugging. I've kept it intentionally minimal to simplify
> >>>    backporting. The rest of the series patch 9 focuses more on clarity
> >>>    and documentation, which is probably too much to backport.
> >>>
> >>> - Patch 8 touches on multiple subsystems. The intention is to enforce
> >>>    proper usage and documentation of target IDs in the SSAM_SDEV() /
> >>>    SSAM_VDEV() macros. As it directly touches those macros I
> >>>    unfortunately can't split it up by subsystem.
> >>>
> >>> - Patch 9 is a loosely connected cleanup for consistency.
> >>
> >> Thank you for the patches. Unfortunately I don't have time atm to
> >> review this.
> >>
> >> And the next 2 weeks are the merge window, followed by 2 weeks
> >> of christmas vacation.
> >>
> >> So I'm afraid that I likely won't get around to reviewing
> >> this until the week of January 9th.
> >>
> >>> Hans, Jiri, Benjamin, Sebastian: While patch 8 ("platform/surface:
> >>> aggregator: Enforce use of target-ID enum in device ID macros") touches
> >>> multiple subsystems, it should be possible to take the whole series
> >>> through the pdx86 tree. The changes in other subsystems are fairly
> >>> limited.
> >>
> >> I agree that it will be best to take all of this upstream through the
> >> pdx86 tree. Sebastian thank you for the ack for patch 8/9.
> >>
> >> Jiri or Benjamin may we have your ack for merging patch 7/9 + 8/9
> >> through the pdx86 tree ?
> >
> > I can give you an ack for taking those through your tree, but I can
> > not review the patches themselves because I was only CC-ed to those 2,
> > and so was linux-input. Given that SSAM_SSH_TID_KIP is not in my
> > current tree I assume it comes from this series.
> >
> > Anyway, enough ranting :)
>
> Apologies for that. I should have included you in the CC on at least
> patch 2 as well, which introduces this symbol.

No need to apologize. There is a tight balance between not annoying
people with too many emails and then having those people wanting to
have all of the series :)

I have enough trust in Hans to know that when he reviewed the series,
he did it correctly.

>
> FWIW, here's the patchwork link to this series:
>
>    https://patchwork.kernel.org/project/platform-driver-x86/list/?series=701392

thanks!

Cheers,
Benjamin

