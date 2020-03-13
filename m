Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B854184DD8
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 18:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMRrO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 13:47:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38849 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgCMRrO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 13:47:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id w1so11508995ljh.5
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Jz7ElaYl4G5s8tjf4//nL9X+feX8dgn1YasReBhmLU=;
        b=DldLXFndSEJ23oNy6e2XGqNLYP7/80RxYvYEF6XuiZV7j6joGGBRiD2/yFukHE4LGn
         Kbj8dD8fsioQ99dJZwruHJJK6NhcOgpj8pTGLSIfN2VP5TZoo9M1NZ70kuXD6tg6zXVe
         f8Edjdza72ITuxxTT7jYRYpq+LS2JhTyc6fZRRHnXVGGmW9xY2rW1LWH4U3X94sbjNkR
         TBKOMAgLNKYhW6mZZ6CfdU4+lproXFuUgI8svNgHwppmr9iD6jkuX6GfVjqH6kreeyxb
         udIxsI3pBEsvPbrdAXnXCSC50aEHAMRFgWtf16vVGuTt+U6WoNbJH1dZGNpXiyReUmNk
         xuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Jz7ElaYl4G5s8tjf4//nL9X+feX8dgn1YasReBhmLU=;
        b=CJRAtguKqoxdBSdscYrzPWj73iWwLCl0Il55kPvr0hvl+sBQq1caA2fUVmTBCK1A2v
         pUeEiG+LyaYkn9T019ZDlBP9U1ahWktHTYApQibFSU71PaOpoQWJIgvFnb6EPaPPXmAD
         Z4piFXUWIqxNK1VbYOgp88D8src3ba6NkiHmalqRlZqDS4DIndeS+NN5TMLTbJYIFwkr
         4bVIybgKtpL2WrDHY4Dma2SAsheUtg5bgZTU57R90X0WEzBiWrDbLdPoIecd1UAlvuhx
         kDTH3Um9a2bobkp0V3ydQhVkOb65zU61X/SlBRx3ovQgA+Vva2N0cHPMq/+WCfjqZsnw
         xK6w==
X-Gm-Message-State: ANhLgQ0l05vFG9yiGJ7zF9jUfOIheUZNsqcc7Fps87UB8n3IDa3kVlxi
        Q/+ImXTqlSH9Aj+taag03HSxdJ2yIhhkfrmz8A+nhQ==
X-Google-Smtp-Source: ADFU+vvbkq5f57Bek8364CZzVT+B//0Fq1cl6ZcqshvVZgQvozTnMpnTAMPH5tUC4q6Yb2li5IH5x6L7q2h1S0V211c=
X-Received: by 2002:a05:651c:1b5:: with SMTP id c21mr3138597ljn.174.1584121631812;
 Fri, 13 Mar 2020 10:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200304002137.83630-1-rajatja@google.com> <CA+jURcsGvKbQi0bUs1BtAa7RC0NmtKBS=qtEzYWv=pUBqenmgQ@mail.gmail.com>
In-Reply-To: <CA+jURcsGvKbQi0bUs1BtAa7RC0NmtKBS=qtEzYWv=pUBqenmgQ@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Fri, 13 Mar 2020 10:46:33 -0700
Message-ID: <CACK8Z6F1d=X22==rZLdBPWp2i-N6WDKXXhr4Qa5OdpmMaj+1BA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Allocate keycode for SNIP key
To:     Harry Cutts <hcutts@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 12, 2020 at 1:31 PM Harry Cutts <hcutts@chromium.org> wrote:
>
> On Tue, 3 Mar 2020 at 16:21, Rajat Jain <rajatja@google.com> wrote:
> >
> > New chromeos keyboards have a "snip" key that is basically a selective
> > screenshot (allows a user to select an area of screen to be copied).
> > Allocate a keyvode for it.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.
> >
> >  include/uapi/linux/input-event-codes.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 0f1db1cccc3fd..08c8572891efb 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -652,6 +652,9 @@
> >  /* Electronic privacy screen control */
> >  #define KEY_PRIVACY_SCREEN_TOGGLE      0x279
> >
> > +/* Selective Screenshot */
> > +#define KEY_SNIP                        0x280
> > +
>
> It's not very obvious to me what KEY_SNIP represents, without the
> comment above. Maybe you could call it something like
> KEY_SELECTIVE_SCREENSHOT, so that its purpose is more apparent to
> someone seeing it in use.

Sure, I do not have any preference, so I will change this to
KEY_SELECTIVE_SCREENSHOT.

Thanks,

Rajat

>
> Harry Cutts
> Chrome OS Touch/Input team
>
> >  /*
> >   * Some keyboards have keys which do not have a defined meaning, these keys
> >   * are intended to be programmed / bound to macros by the user. For most
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
