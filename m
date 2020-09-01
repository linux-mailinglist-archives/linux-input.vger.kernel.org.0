Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67351258CCF
	for <lists+linux-input@lfdr.de>; Tue,  1 Sep 2020 12:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgIAKal (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Sep 2020 06:30:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47902 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726140AbgIAKag (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Sep 2020 06:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598956234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7xp2NgyNQRcqEmc4bjcRafZrnamtozJTDGfd/4vpEMs=;
        b=Dbei0obFThJStEbRrupRvrG0iSXQ2jtd+jvrfKampJVC9hPXAVBa4UZOdPqlmlqIF16f8l
        Akn/3XX+q51Cz1HqSVvm2EiSZULi4yEW9winsv7dHq8dJ4SUvF8lsSh8WM9LInQldru2UW
        onHbaHW2Otw90cfkwAelqItiqjS+rJo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-zIAAlduqP2qhpOqUxmsnig-1; Tue, 01 Sep 2020 06:30:32 -0400
X-MC-Unique: zIAAlduqP2qhpOqUxmsnig-1
Received: by mail-pf1-f198.google.com with SMTP id d3so379090pfh.17
        for <linux-input@vger.kernel.org>; Tue, 01 Sep 2020 03:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7xp2NgyNQRcqEmc4bjcRafZrnamtozJTDGfd/4vpEMs=;
        b=TEUfYGQM5tVEm+hsHXq2L5zOcU/10wNV1JFNvzoutbq0prQy8mWuoaLqR25XjdwS6Q
         qRFW2m0xx7biY29FidWF2o5XdhxJWMzI8+zOpFPzSFowAfq4Dr7eFyUOAD0Uef5iP5+7
         Erxk0eELm3HtDqEjV25ISytbT4xWoqVrZa1+SKmZAEHJbItCGyPhyf6w01TGqnVAtS7b
         i0gFYTwP5y/H5MdAeUbgo5BTrIln7MX4apPqHA5OivdBq19bjJwkahupcQqScIpU05P1
         8JZad7imF5B+rbzmncNw1htRM+fx4HjBBe3si1ffwOuz/q2Gj9UoYLyLIMuRtqaiMMn6
         wqLw==
X-Gm-Message-State: AOAM5306TtN5Ua8yrltpAl0flTzwTtrHiF0iuB4sWDSl78LDT5uOKD5p
        Vi6bxeDTFEE4uOcBp5JFMjMIA1xCPCcRiVWbwVDltpbCvkMjwqJrUPzAau32dYtx/CYXx99M3Gs
        +ILPvynIptwJ9iPzjL9rwaaq0V3v8UfrMeB/9L6Q=
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr925072pja.56.1598956231701;
        Tue, 01 Sep 2020 03:30:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztegbyjmEoed7odzziHs1Pf33M/uulBUGEeSZWeyMhPsGb0MYk/NwzotrRqoye5+bB6v4yoAlXvoViSIAm25E=
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr925057pja.56.1598956231473;
 Tue, 01 Sep 2020 03:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200826134658.1046338-1-maz@kernel.org> <nycvar.YFH.7.76.2008271132050.27422@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2008271132050.27422@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 1 Sep 2020 12:30:20 +0200
Message-ID: <CAO-hwJLUk0eO0GC2WQf=iimTOL4JWak96t1z0Zskfv-G_+MGNA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: Sanitize event code and type when mapping input
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 11:33 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 26 Aug 2020, Marc Zyngier wrote:
>
> > When calling into hid_map_usage(), the passed event code is
> > blindly stored as is, even if it doesn't fit in the associated bitmap.
> >
> > This event code can come from a variety of sources, including devices
> > masquerading as input devices, only a bit more "programmable".
> >
> > Instead of taking the event code at face value, check that it actually
> > fits the corresponding bitmap, and if it doesn't:
> > - spit out a warning so that we know which device is acting up
> > - NULLify the bitmap pointer so that we catch unexpected uses
> >
> > Code paths that can make use of untrusted inputs can now check
> > that the mapping was indeed correct and bail out if not.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> > * From v1:
> >   - Dropped the input.c changes, and turned hid_map_usage() into
> >     the validation primitive.
> >   - Handle mapping failures in hidinput_configure_usage() and
> >     mt_touch_input_mapping() (on top of hid_map_usage_clear() which
> >     was already handled)
>
> Benjamin, could you please run this through your regression testing
> machinery?
>
> It's a non-trivial core change, at the same time I'd like not to postpone
> it for 5.10 due to its nature.

OK, just passed the v4 to the testsuite, and this seems good. It won't
break touchscreens nor keyboards/mice that needed to be added in the
past.

So this is a go for me.

Cheers,
Benjamin

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

