Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49417E52B0
	for <lists+linux-input@lfdr.de>; Wed,  8 Nov 2023 10:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjKHJf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Nov 2023 04:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjKHJf4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Nov 2023 04:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1F61B1
        for <linux-input@vger.kernel.org>; Wed,  8 Nov 2023 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699436107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M+MRVaoubCsfZL2xAOUYnuM3Xqs25BNegkvVAxeKkpQ=;
        b=Y0HVQgs8tjNCq5XQ0zH3RumnbdNvt5EjojVfLgTGkiH6YV3lrMtK0BciN1tNoYMIYAS6rX
        xvPJx6je5yXZYiIrOYfcgNsXmQMaunXliN0tHkMQtTkU4sKzts/rhY+l9d3Rwqq8Cq02uk
        TD27N9S1Km2XoY3zEE+cfDIc74BJGYI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-a6Q8nrjCO02XNJHv5hTJFQ-1; Wed, 08 Nov 2023 04:35:05 -0500
X-MC-Unique: a6Q8nrjCO02XNJHv5hTJFQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9dd89e2ce17so366772466b.0
        for <linux-input@vger.kernel.org>; Wed, 08 Nov 2023 01:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699436104; x=1700040904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+MRVaoubCsfZL2xAOUYnuM3Xqs25BNegkvVAxeKkpQ=;
        b=aOu23NPdtduuKewqEdhlkPCIVgLW1huLCRhMDmizqgOCGjvoxt5A6qcrtydN16aWjc
         tXGqT92q/1+7+EGvQGxgEiwP5BmbUtV4EhfOJYhDL+Q5bHiJF/azkLqF8s/LN7e8Vkvj
         SE3gKGcAvYQPcLGJu93GW2/A7urtNpJo1/LXlgOubNB0NLU4bGicZbxvBgmNZSFUHT0k
         Hxv+oZTEUvjm/7hEUS71VzO+4nJwURw+5iceRkina2SQynzUc8ZzEClpIbzBMXoqEYu2
         +yCEjH0mxTo1B0KTbdjELpPwStJVyg8rxDNs5DMt+36fM7TtLXTEc5gD40OMPFNOOFAB
         Vw3Q==
X-Gm-Message-State: AOJu0YzNsNM7g1a+toGhDQsPoK/1ObDcgDuVAG0O0sZ+hdY/DC5QBBf6
        Msv4CFrJRbXXCtoAR6gFKAFqHvNlJRLjScX078Qo3MCW++vKAncnMha6zSAjxk6iRi7Llg/0kpl
        8MId+vWFHAezDaFfn7YY1DsBdUAQ4W+JyGXmNQeo=
X-Received: by 2002:a17:907:d1f:b0:9e2:af56:c375 with SMTP id gn31-20020a1709070d1f00b009e2af56c375mr978698ejc.52.1699436104719;
        Wed, 08 Nov 2023 01:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZZprx1+rT4HrMuiEotWLpZSzqUWjQ82jb9o/I+V6JpuyK+TuW+mRyd2O+u8rJk89XZKOhv/kJ9IaM7i/zvUM=
X-Received: by 2002:a17:907:d1f:b0:9e2:af56:c375 with SMTP id
 gn31-20020a1709070d1f00b009e2af56c375mr978685ejc.52.1699436104435; Wed, 08
 Nov 2023 01:35:04 -0800 (PST)
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <20231103200524.53930-1-ostapyshyn@sra.uni-hannover.de> <bokQB3BK040-4fGy8tNfZrdM2mNmWxZud9O-KMmYqOkfa1JTC1ocUjoAzCEpPsbsAvY5qb5TcSP6XsQLaja2XO0gapOcsZyeVdCvq6T31qA=@protonmail.com>
 <CAO-hwJLpKTb9yxvxaPDLZkF9kDF8u2VRJUf9yiQd+neOyxPeug@mail.gmail.com>
 <eb8e22f3-77dc-4923-a7ba-e237ee226edb@sra.uni-hannover.de>
 <CAO-hwJKVwZK00yZFjuyyR9Xt4Y2-r8eLJNZfnyeopHxoZQ0eGA@mail.gmail.com>
 <20231108062306.33f5dcd0@dryade> <CAO-hwJK_xp1A=dEOV-2v3KJAf0bRLDWNcrFQeBpgEuxT-qSBnw@mail.gmail.com>
 <ZUtTpKyP0oxWhnn8@fedora>
In-Reply-To: <ZUtTpKyP0oxWhnn8@fedora>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Nov 2023 10:34:52 +0100
Message-ID: <CAO-hwJLjtjdr2gtrOWJFPZ-38YzKB8XfhDKWf_2jUPeiaP3EcA@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Eric GOUYER <folays@gmail.com>,
        Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>,
        David Revoy <davidrevoy@protonmail.com>, jkosina@suse.cz,
        jason.gerecke@wacom.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 8, 2023 at 10:23=E2=80=AFAM Jos=C3=A9 Exp=C3=B3sito <jose.expos=
ito89@gmail.com> wrote:
>
> Hi Benjamin,
>
> On Wed, Nov 08, 2023 at 10:04:30AM +0100, Benjamin Tissoires wrote:
[...]
> >
> > >
> > > So, the behavior probably breaks the specs, but sincerely I'm happy t=
o
> > > have the "eraser" button independent of the "rubber eraser", which
> > > makes the stylus a somewhat 4-buttons stylus (tip, button1, button2,
> > > rubber), and I would like to keep this.
> >
> > Yes, and I'd like to keep it that way, even if 6.6 and 6.5.8
> > apparently broke it.
> >
> > So, to me:
> > - 276e14e6c3993317257e1787e93b7166fbc30905 is wrong: this is a
> > firmware bug (reporting invert through eraser) and should not be
> > tackled at the generic level, thus it should be reverted
> > - both of these tablets are forwarding the useful information, but not
> > correctly, which confuses the kernel
> > - I should now be able to write regression tests
> > - I should be able to provide HID-BPF fixes for those tablets so that
> > we can keep them working with or without
> > 276e14e6c3993317257e1787e93b7166fbc30905
> > reverted (hopefully)
> > - problem is I still don't have the mechanics to integrate the HID-BPF
> > fixes directly in the kernel tree, so maybe I'll have to write a
> > driver for XP-Pen while these internals are set (it shouldn't
> > interfere with the HID-BPF out of the tree).
>
> I already added support for a few XP-Pen devices on the UCLogic driver
> and I was planning to start working on this one during the weekend in
> my DIGImend fork (to simplify testing).
>
> Let me know if you prefer to add it yourself or if you want me to ping
> you in the DIGImend discussion.
>

So far, I really have to work on this now. It's a good use case for
HID-BPF and it's a regression that I'd like to be fixed ASAP.
I'd appreciate any reviews :)

Also, good to know that I can probably piggyback on hid-uclogic for
fixing those 2 devices in the kernel.

Cheers,
Benjamin

