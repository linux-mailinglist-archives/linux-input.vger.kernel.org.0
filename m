Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77AB9784BE3
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 23:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjHVVPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 17:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjHVVPs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 17:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A07FCF3
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692738901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hs6oRa1P9l1DMZWjuZAZ32JKOWh/7k3h+3CxrjxqedE=;
        b=XTgfUfHJAPjHVOff1Y440uYTuRvlqz6bCed8NxUf1nI4wEcB8VSX35+2j/+Kgv2D+B91tG
        PSH8GDZaB8ftYLqdI2qeQlDBRYXVe5d96IVeSXrOEfCBShvkJeAA129EF0br/0FG/tW5wU
        8M0hK7Io+TBNo6fP9AW2+IXXYaZ4Hrg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-PlxoI9pAMwKXPzVJUpQyyw-1; Tue, 22 Aug 2023 17:14:59 -0400
X-MC-Unique: PlxoI9pAMwKXPzVJUpQyyw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4ff92d9f376so5187433e87.3
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692738898; x=1693343698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hs6oRa1P9l1DMZWjuZAZ32JKOWh/7k3h+3CxrjxqedE=;
        b=Fex21KmqRWcregQcoCfde1ahoxren+6KC4g6P3k6glrAVyoITMNrN4TBftFMEBP08p
         Xat05xFJf0W1u4xxlA42ogPK61Hss2lJ6Vs7yxGLXX+yCNI+OlQODSMhw4DhXURfZPBT
         izC2bUHGrDvgH5/PVKgDiXaPg/1CHumRyjgHOdtTlkZj103P2nYy8tSNlj7Oj4TnxsK0
         q61CiM3GB0xaXW/GhRtIm2qziVmmRLfrj8f27GTGD0BQ5sxEr+DcZriQum3/53MoVwOX
         QeE0QZBC1T8eIEOSLmb/BOnF+PkWbZpth+REEyE0vtvVYDfejFdssNT1FANnA7XFzNKb
         RdPQ==
X-Gm-Message-State: AOJu0YwiWC9RxVuedi5+gHHRALnz3kAPvCksGcabtbRO7WyTCSXgPM7K
        0iZCFmo2orX90V7/2SFvoW9hFgQ2Po3p064ez7oMmDyE1LiAN4KnR4qCYoJteI8scdE/BSkX8rG
        5YPjkchgbik17BbRpPBbVyfHpDejUZ+6iAgfFKeI=
X-Received: by 2002:a05:6512:604:b0:4ff:7998:f67a with SMTP id b4-20020a056512060400b004ff7998f67amr7393422lfe.5.1692738898011;
        Tue, 22 Aug 2023 14:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtUvfKy2U4ilg4d5q5XWEbL3jzNP/hhuRjudpAk/FpKfkvWfx20bkiTJbPpfKskERbtNxA3brJ3DBSoakUv38=
X-Received: by 2002:a05:6512:604:b0:4ff:7998:f67a with SMTP id
 b4-20020a056512060400b004ff7998f67amr7393414lfe.5.1692738897716; Tue, 22 Aug
 2023 14:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhGd8ryUcu2yPC+dFyDKNuVFHxT-=iayG+n2iErotBxgd0FVw@mail.gmail.com>
 <CAKwvOd=p_7gWwBnR_RHUPukkG1A25GQy6iOnX_eih7u65u=oxw@mail.gmail.com>
 <CAO-hwJLio2dWs01VAhCgmub5GVxRU-3RFQifviOL0OTaqj9Ktg@mail.gmail.com>
 <CAFhGd8qmXD6VN+nuXKtV_Uz14gzY1Kqo7tmOAhgYpTBdCnoJRQ@mail.gmail.com> <CAO-hwJJ_ipXwLjyhGC6_4r-uZ-sDbrb_W7um6F2vgws0d-hvTQ@mail.gmail.com>
In-Reply-To: <CAO-hwJJ_ipXwLjyhGC6_4r-uZ-sDbrb_W7um6F2vgws0d-hvTQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Aug 2023 23:14:46 +0200
Message-ID: <CAO-hwJ+DTPXWbpNaBDvCkyAsWZHbeLiBwYo4k93ZW79Jt-HAkg@mail.gmail.com>
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

On Tue, Aug 22, 2023 at 11:06=E2=80=AFPM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Tue, Aug 22, 2023 at 10:57=E2=80=AFPM Justin Stitt <justinstitt@google=
.com> wrote:
> >
> [...]
> > > > > Here's the invocation I am running to build kselftest:
> > > > > `$ make LLVM=3D1 ARCH=3Dx86_64 mrproper headers && make LLVM=3D1 =
ARCH=3Dx86_64
> > > > > -j128 V=3D1 -C tools/testing/selftests`
> > >
> > > I think I fixed the same issue in the script I am running to launch
> > > those tests in a VM. This was in commit
> > > f9abdcc617dad5f14bbc2ebe96ee99f3e6de0c4e (in the v6.5-rc+ series).
> > >
> > > And in the commit log, I wrote:
> > > ```
> > > According to commit 01d6c48a828b ("Documentation: kselftest:
> > > "make headers" is a prerequisite"), running the kselftests requires
> > > to run "make headers" first.
> > > ```
> > >
> > > So my assumption is that you also need to run "make headers" with the
> > > proper flags before compiling the selftests themselves (I might be
> > > wrong but that's how I read the commit).
> >
> > In my original email I pasted the invocation I used which includes the
> > headers target. What are the "proper flags" in this case?
> >
>
> "make LLVM=3D1 ARCH=3Dx86_64 headers" no?
>
> But now I'm starting to wonder if that was not the intent of your
> combined "make mrproper headers". I honestly never tried to combine
> the 2. It's worth a try to split them I would say.

Apologies, I just tested it, and it works (combining the 2).

Which kernel are you trying to test?
I tested your 2 commands on v6.5-rc7 and it just works.

FTR:
$> git checkout v6.5-rc7
$> make LLVM=3D1 ARCH=3Dx86_64 mrproper headers
$> make LLVM=3D1 ARCH=3Dx86_64 -j8 -C tools/testing/selftests TARGETS=3Dhid

->   BINARY   hid_bpf

Cheers,
Benjamin

