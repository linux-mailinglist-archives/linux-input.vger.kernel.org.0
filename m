Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A081B784C25
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 23:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjHVVhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 17:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjHVVhY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 17:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774C8CDF
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692740196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tBQOgMQJRUbh9wxMdCk/gDJiess5vlOHWyyr/sOqAOQ=;
        b=MiV+QQwhrgRaBR3tZU1Nz7HRLcjm+sS1HZ7b7bkD4uI2kRnV2g71Z+58oRD1bpaN7Jlrdh
        wvCfs89kMXhljz/XgXKZ33/uPKlwDcfRM7JJwMLQVaWlKASRBZ11n3GFDhDchxL+NV+2Qp
        3r9vIn948gBEl+cur4Ti0i+ciM5uL60=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-mCq17ii-PvOA2QI0p-qtgg-1; Tue, 22 Aug 2023 17:36:35 -0400
X-MC-Unique: mCq17ii-PvOA2QI0p-qtgg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4ff908143acso5292030e87.0
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692740192; x=1693344992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBQOgMQJRUbh9wxMdCk/gDJiess5vlOHWyyr/sOqAOQ=;
        b=eeHUgPsplVfDFaMTNUePlWKzUJqA0keW7fr9SBatx98u8ujjda8bs38dXEWIq4SHTt
         /cTZlDluhgQ5o0ixPyj7msAFSdmgDfk+ZHlmVCl4Ppz1ovq3fLoebugekGRiXkcloxzE
         Zz3VqvbYVxVuDRUatDkN8vhyNMuInCylRejutTk2NQa4o0IrOmfQuBrcVjlLKgqGm8P6
         K/wHXd8LSc/KPR+JaU6kvkWYpNcG49jHXOI+ogE0o4SitlzXppMBV98B1+Xf8hrd1KpN
         eiqOWVlem596po/qIkDur0KPhjPNpf1i3NNLPgpvdfUs90ETIMHlVsqIVcn1B0NZnvQ5
         q8Wg==
X-Gm-Message-State: AOJu0Yx1EQUviGsf0HRBW1xrm9Uw3DBmU8Np/FGWhSmsw5ie7s8T5IsH
        BNqV12rGONNAB80si6Pd43FOTzbJMoLDphEilQpHnKAyQ9uZaIqVE4OEGvjKWjzw0n1IO5NWCjO
        vPw7KaPx4DiApwGzBxU06YwG94s8XrVZhYZ1ddl0=
X-Received: by 2002:a05:6512:33c1:b0:4f8:4512:c846 with SMTP id d1-20020a05651233c100b004f84512c846mr9307248lfg.49.1692740192230;
        Tue, 22 Aug 2023 14:36:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKm2GBxDVov1JaqkcKK8hb+vMJnaCM7rzDbVkGmJZmxaKGyfikCiUZjMDnWq5P6ApdJCEktBHclzVh3N/ERMw=
X-Received: by 2002:a05:6512:33c1:b0:4f8:4512:c846 with SMTP id
 d1-20020a05651233c100b004f84512c846mr9307220lfg.49.1692740191838; Tue, 22 Aug
 2023 14:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhGd8ryUcu2yPC+dFyDKNuVFHxT-=iayG+n2iErotBxgd0FVw@mail.gmail.com>
 <CAKwvOd=p_7gWwBnR_RHUPukkG1A25GQy6iOnX_eih7u65u=oxw@mail.gmail.com>
 <CAO-hwJLio2dWs01VAhCgmub5GVxRU-3RFQifviOL0OTaqj9Ktg@mail.gmail.com>
 <CAFhGd8qmXD6VN+nuXKtV_Uz14gzY1Kqo7tmOAhgYpTBdCnoJRQ@mail.gmail.com>
 <CAO-hwJJ_ipXwLjyhGC6_4r-uZ-sDbrb_W7um6F2vgws0d-hvTQ@mail.gmail.com>
 <CAO-hwJ+DTPXWbpNaBDvCkyAsWZHbeLiBwYo4k93ZW79Jt-HAkg@mail.gmail.com> <CAFhGd8pVjUPpukHxxbQCEnmgDUqy-tgBa7POkmgrYyFXVRAMEw@mail.gmail.com>
In-Reply-To: <CAFhGd8pVjUPpukHxxbQCEnmgDUqy-tgBa7POkmgrYyFXVRAMEw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Aug 2023 23:36:20 +0200
Message-ID: <CAO-hwJJntQTzcJH5nf9RM1bVWGVW1kb28rJ3tgew1AEH00PmJQ@mail.gmail.com>
Subject: Re: selftests: hid: trouble building with clang due to missing header
To:     Justin Stitt <justinstitt@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 22, 2023 at 11:26=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
>
> On Tue, Aug 22, 2023 at 2:15=E2=80=AFPM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, Aug 22, 2023 at 11:06=E2=80=AFPM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Tue, Aug 22, 2023 at 10:57=E2=80=AFPM Justin Stitt <justinstitt@go=
ogle.com> wrote:
> > > >
> > > [...]
> > > > > > > Here's the invocation I am running to build kselftest:
> > > > > > > `$ make LLVM=3D1 ARCH=3Dx86_64 mrproper headers && make LLVM=
=3D1 ARCH=3Dx86_64
> > > > > > > -j128 V=3D1 -C tools/testing/selftests`
> > > > >
> > > > > I think I fixed the same issue in the script I am running to laun=
ch
> > > > > those tests in a VM. This was in commit
> > > > > f9abdcc617dad5f14bbc2ebe96ee99f3e6de0c4e (in the v6.5-rc+ series)=
.
> > > > >
> > > > > And in the commit log, I wrote:
> > > > > ```
> > > > > According to commit 01d6c48a828b ("Documentation: kselftest:
> > > > > "make headers" is a prerequisite"), running the kselftests requir=
es
> > > > > to run "make headers" first.
> > > > > ```
> > > > >
> > > > > So my assumption is that you also need to run "make headers" with=
 the
> > > > > proper flags before compiling the selftests themselves (I might b=
e
> > > > > wrong but that's how I read the commit).
> > > >
> > > > In my original email I pasted the invocation I used which includes =
the
> > > > headers target. What are the "proper flags" in this case?
> > > >
> > >
> > > "make LLVM=3D1 ARCH=3Dx86_64 headers" no?
> > >
> > > But now I'm starting to wonder if that was not the intent of your
> > > combined "make mrproper headers". I honestly never tried to combine
> > > the 2. It's worth a try to split them I would say.
> >
> > Apologies, I just tested it, and it works (combining the 2).
> >
> > Which kernel are you trying to test?
> > I tested your 2 commands on v6.5-rc7 and it just works.
>
> I'm also on v6.5-rc7 (706a741595047797872e669b3101429ab8d378ef)
>
> I ran these exact commands:
> |    $ make mrproper
> |    $ make LLVM=3D1 ARCH=3Dx86_64 headers
> |    $ make LLVM=3D1 ARCH=3Dx86_64 -j128 -C tools/testing/selftests
> TARGETS=3Dhid &> out
>
> and here's the contents of `out` (still warnings/errors):
> https://gist.github.com/JustinStitt/d0c30180a2a2e046c32d5f0ce5f59c6d
>
> I have a feeling I'm doing something fundamentally incorrectly. Any ideas=
?

Sigh... there is a high chance my Makefile is not correct and uses the
installed headers (I was running the exact same commands, but on a
v6.4-rc7+ kernel).

But sorry, it will have to wait for tomorrow if you want me to have a
look at it. It's 11:35 PM here, and I need to go to bed

Cheers,
Benjamin

>
> To be clear, I can build the Kernel itself just fine across many
> configs and architectures. I have, at the very least, the dependencies
> required to accomplish that.
>
> >
> > FTR:
> > $> git checkout v6.5-rc7
> > $> make LLVM=3D1 ARCH=3Dx86_64 mrproper headers
> > $> make LLVM=3D1 ARCH=3Dx86_64 -j8 -C tools/testing/selftests TARGETS=
=3Dhid
> >
> > ->   BINARY   hid_bpf
> >
> > Cheers,
> > Benjamin
> >
>

