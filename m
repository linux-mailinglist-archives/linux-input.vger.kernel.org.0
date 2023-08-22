Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFFE784BC6
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 23:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjHVVHG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 17:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjHVVHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 17:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A9ACF1
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692738377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eozuvkXZf7lt2j4GJR5fEMVPoz5joKAi735jAZphMzo=;
        b=Vrsh0ntw9UDNTvm7I2EJ+VRwN88hm2Mfc6ldba94pc3KYv9gAUKTpx6Mgw+6D3/CmJKyL+
        pBXAE6PzOXJLaUwJPEAOzlVTON7IiDXm6HpCbETW6vHMZ1xOQI8/Aahxe7ql3srifTC2Vn
        DhbhabENSE/1h4EhwBsrhfRXsUhBSoo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-6EMVGalgN3S6aERcnfhhkA-1; Tue, 22 Aug 2023 17:06:16 -0400
X-MC-Unique: 6EMVGalgN3S6aERcnfhhkA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4ff908143acso5269631e87.0
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 14:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692738374; x=1693343174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eozuvkXZf7lt2j4GJR5fEMVPoz5joKAi735jAZphMzo=;
        b=JviPadbY+65tavm1NqTX8TcHcfge94UrSvc1iCglCtFA62XPC7SiR4sc1BOJVF0rIO
         giWoMAiWmiemC6w285JYOSb8WlCdGxHH6PAoxlRgNBx6kuaIf3NALgC0Ib89yYEibLaF
         Y7uuaWTCHLVkU+JOjKcUbRFFI6gGooG72oUf2t/cgePY4sTl0DeL+M8KvIR9qnKZW32v
         5SUOPM+Rd6e8Ov1Wp0TeYRmOH89glykljgF2z9rnZCgBhRI3JbXz1AjLf0ppJ48llvXP
         tQ3XVhP4DQPaGuEaksa9C8X4U9tl6U4K8+3C1syl0zDZ7QrFGs29ZIEBqZkI/XN5nZ38
         TUsw==
X-Gm-Message-State: AOJu0YwTo3Yvo+nnV+1gU8ffnZ+LY1tf1xKspsl4JHM8svCGlqxJKqI3
        JcNdES6oVJn14BRa5Wr0vPPpHJ5ts/orfERrx3EiRX8HLTJjlgSFZIZlhVB6/+pnaQ4I4lQMYiW
        hauA94TJNhg/u/1RxafpI5429b2dWOawuOTy9ldI=
X-Received: by 2002:ac2:55a7:0:b0:500:8fcd:c3b5 with SMTP id y7-20020ac255a7000000b005008fcdc3b5mr1464019lfg.12.1692738374176;
        Tue, 22 Aug 2023 14:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeNyF1wlvbOJcWPDTAWORFiO3zXf51SnVR8DhrtgaVaRfNn3Wuj/OWqV2eXbAGJfYHTm1809Rq9Jm3OA9QzNg=
X-Received: by 2002:ac2:55a7:0:b0:500:8fcd:c3b5 with SMTP id
 y7-20020ac255a7000000b005008fcdc3b5mr1464006lfg.12.1692738373861; Tue, 22 Aug
 2023 14:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhGd8ryUcu2yPC+dFyDKNuVFHxT-=iayG+n2iErotBxgd0FVw@mail.gmail.com>
 <CAKwvOd=p_7gWwBnR_RHUPukkG1A25GQy6iOnX_eih7u65u=oxw@mail.gmail.com>
 <CAO-hwJLio2dWs01VAhCgmub5GVxRU-3RFQifviOL0OTaqj9Ktg@mail.gmail.com> <CAFhGd8qmXD6VN+nuXKtV_Uz14gzY1Kqo7tmOAhgYpTBdCnoJRQ@mail.gmail.com>
In-Reply-To: <CAFhGd8qmXD6VN+nuXKtV_Uz14gzY1Kqo7tmOAhgYpTBdCnoJRQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Aug 2023 23:06:02 +0200
Message-ID: <CAO-hwJJ_ipXwLjyhGC6_4r-uZ-sDbrb_W7um6F2vgws0d-hvTQ@mail.gmail.com>
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

On Tue, Aug 22, 2023 at 10:57=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
>
[...]
> > > > Here's the invocation I am running to build kselftest:
> > > > `$ make LLVM=3D1 ARCH=3Dx86_64 mrproper headers && make LLVM=3D1 AR=
CH=3Dx86_64
> > > > -j128 V=3D1 -C tools/testing/selftests`
> >
> > I think I fixed the same issue in the script I am running to launch
> > those tests in a VM. This was in commit
> > f9abdcc617dad5f14bbc2ebe96ee99f3e6de0c4e (in the v6.5-rc+ series).
> >
> > And in the commit log, I wrote:
> > ```
> > According to commit 01d6c48a828b ("Documentation: kselftest:
> > "make headers" is a prerequisite"), running the kselftests requires
> > to run "make headers" first.
> > ```
> >
> > So my assumption is that you also need to run "make headers" with the
> > proper flags before compiling the selftests themselves (I might be
> > wrong but that's how I read the commit).
>
> In my original email I pasted the invocation I used which includes the
> headers target. What are the "proper flags" in this case?
>

"make LLVM=3D1 ARCH=3Dx86_64 headers" no?

But now I'm starting to wonder if that was not the intent of your
combined "make mrproper headers". I honestly never tried to combine
the 2. It's worth a try to split them I would say.

Cheers,
Benjamin

