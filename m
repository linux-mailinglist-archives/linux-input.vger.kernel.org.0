Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B753CF5A8
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 10:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhGTHU4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 03:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53573 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229726AbhGTHU4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 03:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626768094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LTrV5RbVeDNyG1pYgWpiiRkaajyN4AH34gq6Sc1Ja5U=;
        b=NnU2ZAi7Fgxdq1HPF8do9QLB25YnmCnNYvVftLS/Zw6RvH/lizgAfEvds++Jy7YiLXW1EL
        P4RtDsN9QAlyHWY26MJtDEsDGeR4eLE67jvgKr5hjqaV2IhxkuWzkKREEsNWZYZLG8eCti
        A9Yet7Zfi1+LfEfoQSCTY8nyxI53cdg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-D5Ab2zogM_eBavctZJ1FHA-1; Tue, 20 Jul 2021 04:01:32 -0400
X-MC-Unique: D5Ab2zogM_eBavctZJ1FHA-1
Received: by mail-pl1-f199.google.com with SMTP id w19-20020a1709027b93b029012b8f96f53eso1180193pll.8
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 01:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LTrV5RbVeDNyG1pYgWpiiRkaajyN4AH34gq6Sc1Ja5U=;
        b=eQErpS16f67dcNBpPfxeeox2FyzYVy5gp2N7pWwBQuBUjKk9LNwFg8nPt9Bf09lOoD
         XktdmtRbI+jYHnAYuXgsuB25wty4rFG/Jbjl8BVIXcckcewuszUtoYYBUuvHgm/dq1ev
         jQuRx4g0UJHCbs0DYs485LLOTAvEMK5/7+1hYfQ66BUiV0us0tJEDG0RzqKlitIaUyQ+
         BD5qDzyIh8ZSIrZCX5LLFAInIH8qunQHaBGMnZQT/IaiP7ojWnw46xDI+xm8SnCFGww2
         G+87jax/uXsvnyD+DpVeocfvzi/LPRRIVB1CjYBGbZjithS4RVvhDwWmfzRgqXVbpnn7
         EwhQ==
X-Gm-Message-State: AOAM531tewWHNyBEkCJevXg07By8eYrNBBQtmRzb2aDiBuSuolNfgSXg
        KG3qM0ocJqkSy5pTYthLNUnONPaN2ih+GObCJJwTMmrlUUbOZvw7MT+ouMpK6YUD+WLLTNsFzzl
        gxo4tauyjEB67uoWAcDcnh5OJkC7c9bTgPXaYc8k=
X-Received: by 2002:aa7:9687:0:b029:337:3b49:df24 with SMTP id f7-20020aa796870000b02903373b49df24mr21001794pfk.35.1626768091698;
        Tue, 20 Jul 2021 01:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/lz7xyoR5XNVuKo5OpMeCS8ZcA7bhLmy40KWtYzX4iPv/i5bUyo43tpWf+jLShuoE3NzooQDIy9RWJTynEGk=
X-Received: by 2002:aa7:9687:0:b029:337:3b49:df24 with SMTP id
 f7-20020aa796870000b02903373b49df24mr21001779pfk.35.1626768091519; Tue, 20
 Jul 2021 01:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
 <nycvar.YFH.7.76.2107152150060.8253@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2107152150060.8253@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Jul 2021 10:01:20 +0200
Message-ID: <CAO-hwJJp-qg0pRZNk1PKhha6S=Zd2_r1UDjZUgm9Yq0MFL69MQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: goodix: Tie the reset line to true state
 of the regulator
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 15, 2021 at 9:50 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 25 Jun 2021, Douglas Anderson wrote:
>
> > The regulator for the touchscreen could be:
> > * A dedicated regulator just for the touchscreen.
> > * A regulator shared with something else in the system.
> > * An always-on regulator.
> >
> > How we want the "reset" line to behave depends a bit on which of those
> > three cases we're in. Currently the code is written with the
> > assumption that it has a dedicated regulator, but that's not really
> > guaranteed to be the case.
> >
> > The problem we run into is that if we leave the touchscreen powered on
> > (because someone else is requesting the regulator or it's an always-on
> > regulator) and we assert reset then we apparently burn an extra 67 mW
> > of power. That's not great.
> >
> > Let's instead tie the control of the reset line to the true state of
> > the regulator as reported by regulator notifiers. If we have an
> > always-on regulator our notifier will never be called. If we have a
> > shared regulator then our notifier will be called when the touchscreen
> > is truly turned on or truly turned off.
> >
> > Using notifiers like this nicely handles all the cases without
> > resorting to hacks like pretending that there is no "reset" GPIO if we
> > have an always-on regulator.
> >
> > NOTE: if the regulator is on a shared line it's still possible that
> > things could be a little off. Specifically, this case is not handled
> > even after this patch:
> > 1. Suspend goodix (send "sleep", goodix stops requesting regulator on)
> > 2. Other regulator user turns off (regulator fully turns off).
> > 3. Goodix driver gets notified and asserts reset.
> > 4. Other regulator user turns on.
> > 5. Goodix driver gets notified and deasserts reset.
> > 6. Nobody resumes goodix.
> >
> > With that set of steps we'll have reset deasserted but we will have
> > lost the results of the I2C_HID_PWR_SLEEP from the suspend path. That
> > means we might be in higher power than we could be even if the goodix
> > driver thinks things are suspended. Presumably, however, we're still
> > in better shape than if we were asserting "reset" the whole time. If
> > somehow the above situation is actually affecting someone and we want
> > to do better we can deal with it when we have a real use case.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Applied, thanks Doug.

Thanks Jiri for taking this one in.

FWIW, I am really glad Doug made the effort of splitting i2c-hid-core
and i2c-hid-goodix, because this is the kind of patch that would have
been a nightmare to make it generic :)

Cheers,
Benjamin

>
> --
> Jiri Kosina
> SUSE Labs
>

