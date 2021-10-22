Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6561F437250
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 08:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhJVG55 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 02:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59425 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229609AbhJVG5x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 02:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634885735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D4K3IjM8CtVk6Qb8Gf7TMbvtmUTbagjvGolace29svY=;
        b=Walif4mdwLgaNu/8UrGeOO6gtxqhTWRNAjW2OvGVPfpwZ5lYNVEzb3sArSU4rdip1v6T49
        fsf8h2O7VW2U12bJmQGFtU4nl8uDpf+H/L9oReTUlEFfkuRdyXJ9qgwot/XrRIf+6sxYX/
        HbU2f7P5MEwNgLV90yUTP2B8qAPqhVM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-ijrG9vkjO2isUxlOaO2MiA-1; Fri, 22 Oct 2021 02:55:33 -0400
X-MC-Unique: ijrG9vkjO2isUxlOaO2MiA-1
Received: by mail-pj1-f70.google.com with SMTP id m2-20020a17090a158200b001a18e07bfc0so1661264pja.2
        for <linux-input@vger.kernel.org>; Thu, 21 Oct 2021 23:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4K3IjM8CtVk6Qb8Gf7TMbvtmUTbagjvGolace29svY=;
        b=bFlmPGbfdy/JxP38AOe58xNe5q/avxXm25CGoZD11QNsR14OICzqn03vXaWNywq7J2
         dG5+BgzlpmD3OAJbp54VOTH8h2Hs2JPRu5Hu6bkZn2TiBIZ63a0OE7fbpA21S3lRSc+j
         omFByxM0F2gapgeOz/kz3fPH4sIX5EqlduGUjWSBqfO9rU/utl5eI/MZriscH0PVHoyX
         7Zywdtk7HxY0rGTsa6P/MAyW72eH+p/Vfyi6Ti4d21NDFBcZMi0I6vFjk99X5stX3kMq
         zy6btymfTIHm6aPJ6IOnvSPCUFoBGuMZi3xie87dWGZsbxD6picyfy6k6hvAemxQ/Xs9
         vnJQ==
X-Gm-Message-State: AOAM531msYlCuadHDaOVfVwWOnnabrVdT3YXBxToYmshroqQY6tTaQ0K
        mrs6q0YXZPbw5LMuZKLpEvzNuMf1dxe4hPMZJoq0pOHTY/mUmo4nZP6iwkXTVElJkUeSRQxuAtK
        Z73W0XfjtqQSGY46/iFB1Z/z+MmDpxklPvMS/zns=
X-Received: by 2002:a63:2cf:: with SMTP id 198mr7990661pgc.274.1634885732719;
        Thu, 21 Oct 2021 23:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnARUwHwDPrChnu/WguWK/0sGuB77XLE1cH+QFRodIm3zNurBgyb+bXHufGsQZSyCuPh0NVC1m29VEsnBrCzo=
X-Received: by 2002:a63:2cf:: with SMTP id 198mr7990651pgc.274.1634885732361;
 Thu, 21 Oct 2021 23:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021130904.862610-1-luzmaximilian@gmail.com> <1e99ab2b-c5c3-49c9-18c3-1f103c4dbe85@redhat.com>
In-Reply-To: <1e99ab2b-c5c3-49c9-18c3-1f103c4dbe85@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 22 Oct 2021 08:55:21 +0200
Message-ID: <CAO-hwJK_rt9pD5zqnTcDkXxgMjxsXWgzMgrRTJ3xbU4yZ+BAfg@mail.gmail.com>
Subject: Re: [PATCH 0/3] platform/surface: aggregator: Add support for Surface
 Laptop Studio
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 21, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/21/21 15:09, Maximilian Luz wrote:
> > This series adds Surface Aggregator Module (SAM) support for the new
> > Surface Laptop Studio (SLS).
> >
> > This is mostly straight-forward addition of devices to the Surface
> > Aggregator registry, but the Surface HID driver needs a couple of small
> > changes. Specifically, we need to allow it to probe against SAM devices
> > with target ID 1 and also need to use the corresponding registry for
> > those.
> >
> > I hope it's okay that I've CCed stable to get these included in v5.14+
> > stable kernels. The changes are fairly small and enable keyboard and
> > touchpad on the SLS. Most other things (except touch) should already
> > work well on the latest stable kernels, so back-porting this series
> > would make the SLS a usable device on those.
>
> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.

I was surprised to see you taking this series when the 2 patches I
received are HID only.
But it turns out that the patch 1/3 (which I am missing) is actually
about platform, so it makes sense to have you take the full series.
The HID changes are relatively small and are not conflicting with
anything in the HID tree.

For the HID part:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>
> Regards,
>
> Hans
>
>
>
> >
> > Maximilian Luz (3):
> >   platform/surface: aggregator_registry: Add support for Surface Laptop
> >     Studio
> >   HID: surface-hid: Use correct event registry for managing HID events
> >   HID: surface-hid: Allow driver matching for target ID 1 devices
> >
> >  drivers/hid/surface-hid/surface_hid.c         |  4 +-
> >  .../surface/surface_aggregator_registry.c     | 54 +++++++++++++++++++
> >  include/linux/surface_aggregator/controller.h |  4 +-
> >  3 files changed, 58 insertions(+), 4 deletions(-)
> >
>

