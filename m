Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E69407A04
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhIKRo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhIKRoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:44:55 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BA9C061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:43:43 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id z18so11008205ybg.8
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1+RBtgjy2gp+k0kCaOJsG52kFeKGQEVQM38sm5MoS1M=;
        b=FnhV33su1y0uYYv3oMlZkvRb+5CAsYRLB+Cz106GIDU95iz/XvpDgm49/TiAs4Ko7S
         nuUxJRgl+tL0u8IZwl0Ug6WRwG6t6PcSehdtFLJYpoLwq263Otbse5EfI7kIr6p+gw1H
         5MDtB9zeFyJ8W1YlmIx022vSo4nJoBPlvcyDSMtKScrWWzyp6E+Olek3bEap9Y9psEnj
         k952V837mbj6Mu1UrAGpG3PmSkQJK7g0+hpDSBEvCyz4vV6WWxy0rkNmrk5dqEQ8jMnW
         OQk/bwfEO//p5m+702Xd50Slk1ox3wiJ8w+9f/Gg851Y/eyL24NTUWouBmFp8F5Y41yZ
         2pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1+RBtgjy2gp+k0kCaOJsG52kFeKGQEVQM38sm5MoS1M=;
        b=z15jxY5QIiS8kkqApYxrQIPzIcWxO6Tu9yzksgn7fKNXK/4XGCgIxhUJ5VhoNqmbEA
         HNZkI/k9LpR38ZpPt6BpP2Rw3OqlOlDnfnvUFpY3Z0vHBRa0z67XPVZv8F7QrIY9Gsca
         bkdMnsJAQPwGw3zEkd+q7WpXmwMdnYDr1oWdpBwxBbY8JFwCd7v4nj87yl2dIdcyBFJG
         in1ywt9yPlzFSyrfO3JCakTbrlHzDnHkSCmWhrLZ1PLdjfmiKThXafccvq71isZwaSsU
         q4lpKTiC1OVeAcZryve8jGYQ0g9KYbV+iIA1nQyp86M1xW3+ASda+1iGzxYCzi+5jRmJ
         ROQA==
X-Gm-Message-State: AOAM533wOMPMtCuXdqLy6/ORfWxtYgBnQwubO7OQSictmiL0gioEpBpz
        1L7LIFDynSJt3VcxQX6UV2zyERnA5nNMsWNdGcc=
X-Google-Smtp-Source: ABdhPJwPFYOEKo6SuUcfAB3/q6v9Q8Umh326iO834u9vMuvlLKhzBy5zgVpGMMAux4evFlh5XsLytJd4++V3xrq4fhI=
X-Received: by 2002:a25:1d05:: with SMTP id d5mr4991341ybd.270.1631382222386;
 Sat, 11 Sep 2021 10:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210725032707.440071-1-djogorchock@gmail.com> <YToD0wVxxwukjpXC@google.com>
In-Reply-To: <YToD0wVxxwukjpXC@google.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Sat, 11 Sep 2021 13:43:31 -0400
Message-ID: <CAEVj2t=YxtA7Cx=RdfnyAAQ7UdRxXhp7jPzhsJUC87h7dGy3wA@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] HID: nintendo
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 9, 2021 at 8:53 AM Lee Jones <lee.jones@linaro.org> wrote:
> v14 already. :)
>
> Is this the latest version?
>
> Have there been any review comments?
>
> What are the current plans please?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Hi Lee. I cc'd you on the latest v16 patchset. I think the main
blocker right now is waiting for Roderick's LED definitions patch to
be accepted:
https://patchwork.kernel.org/project/linux-input/patch/20210908165539.31029=
29-3-roderick.colenbrander@sony.com/

- Daniel Ogorchock
