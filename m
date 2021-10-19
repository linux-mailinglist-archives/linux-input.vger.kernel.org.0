Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5164A433C57
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 18:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbhJSQfy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 12:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbhJSQfq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 12:35:46 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8671CC06176D
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 09:33:31 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s19so7222875ljj.11
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZrl3rNCE9P70jD6qiniFHF/YEyCALWdICc71cxAkhM=;
        b=X6MgKoCr/uakXpvwF2pgBEwdjr9C+GRi7nwsYTlOjX42lC31DTGEI925RZ4XuWMO94
         0WWK1o/aYyY3bdr+IuCJxpkMR/GDM4DB/6/VOZ8LixacoGtxta6nW6mNvVz3kCbuRAWo
         fU3pkS4ZNFiAL+yoCNLIcqPK0lsf4SxRdSnZYkbwNzY6D1Bq443xnnq2QkQcYgievQ3L
         Qb6hoXTnbTDvPvuGrWJZzFmzYvS0pcO8aGiy9nDTdDb52LQmOMlV3GJF2M61bWUCzQp1
         jdgYp1rwTeSIDxGw7IF4OutSlqWqAvyHFEm7vx2Ia+uFu96fYMyUqZuLcFSrBWvxv0QU
         TjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZrl3rNCE9P70jD6qiniFHF/YEyCALWdICc71cxAkhM=;
        b=dVfHHTWXWcb+kyIeRkXUi287h01Ac69se4SvOe7doD62hspGAagGcYLua/spq+ajyz
         6MUkJR1sbxPZ7XRzzx5rbcNf1gjnJBN5IGmJ2VsEy9bMYilUvqpnNT3/2QhLNSth4e2p
         mJSLqGvq5XJzLBvQzt84mwHnUdqDeJrQwOMdQDvNe0ZlKsaIsD01U0cpXpze/WA0an9l
         TPm56kQjO1u31lcwhOUVRVIjatLr5fxQ7PY5ZO83iaNKM03159d7rb+C1PZnXFs3+2et
         k3355OrXNB43DRb8bQGEs9rRKSd573rU42K6D2h9ANffvK/ThTtBsn96wlWhFiBxJyf/
         PCMQ==
X-Gm-Message-State: AOAM533/Jk7Dj/HBnZaRajrqf+5DOZTr1Z3fi12LXm4LjkbRhb/d16Y4
        HTP1Oi8710Ungw17ntuNmHpv8njE98HugfPTqbc=
X-Google-Smtp-Source: ABdhPJzt7R6nSfYyF6muH3oF65NoB0i1JEXlL4ikVn18qBAgnYH/YNVRI7r2PlmaKXE2nnDORSKy9AREJ7MH/agK53o=
X-Received: by 2002:a05:651c:1541:: with SMTP id y1mr7877745ljp.392.1634661209833;
 Tue, 19 Oct 2021 09:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211008073702.5761-1-alexhenrie24@gmail.com> <nycvar.YFH.7.76.2110191100081.12554@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2110191100081.12554@cbobk.fhfr.pm>
From:   Alex Henrie <alexhenrie24@gmail.com>
Date:   Tue, 19 Oct 2021 10:33:18 -0600
Message-ID: <CAMMLpeSPpkhC40q_wUNQxkyBSyTZtu+LCyfVXjPfm1ByHt52mQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: apple: Rename MAGIC_KEYBOARD_ANSI to MAGIC_KEYBOARD_2015
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        jslaby@suse.cz, juw@posteo.de, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 19, 2021 at 3:00 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 8 Oct 2021, Alex Henrie wrote:
>
> > The ANSI, ISO, and JIS variants of this keyboard all have the same
> > product ID.
>
> The series (with v3 of 3/3) is now in hid.git#for-5.16/apple.

Awesome, thanks!

-Alex
