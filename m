Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98571894CB
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 05:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgCREOU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 00:14:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32969 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgCREOU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 00:14:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id f13so25459275ljp.0
        for <linux-input@vger.kernel.org>; Tue, 17 Mar 2020 21:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/obraN1SGaQ6mLxyFlzIrUAecf3VT6Rwyx5YV7cbUg=;
        b=KJYSB5KQSCWdKk0SRfwsVmAAgs7REVyWaPtD+hkuOjXT4PTGLdjWgxveUGwelaE8Yx
         5ShH2C69tW46xM2VTjlBzAwK8taV1EYJCz5mngIfq8hwIodze4WmcShdSaYUd41+QRu0
         3zMV3pG3t7136f5/bGoWeEdz7sppPWCGPvxgUe9dJmoyDDXfDeuzbFUvJkEcZ+PajgxF
         j8n8vuvMPrOy0OhpDy51A+3+QeL2faCVBAl7RV8mUEMQRvb+TbngaE82BhP7G0oTUe0E
         MC/tIw7Wv5th/jpzJysIouIGvXNi/RLj42rHiaqYlt+LXplbidCWA/ohige92d3GdR5x
         5Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/obraN1SGaQ6mLxyFlzIrUAecf3VT6Rwyx5YV7cbUg=;
        b=E1FoXLODTO4cX6XmxFwTNYLQIuDfhIsv46Gmf4I3kOV5soXk1+b/LYNx+A0YK3PlHg
         FXbkou5pHpqy/iA+OmpZ6yb3J8ynkq0dH8Kuu1ML34Lji1v/eZB/s7rssUtpbwovspfm
         9bQxBOD8VT/cnnRE1n6XqF6jeCRxr917ef4bQpY02AnO2ODAf+aTPvijiDMvNWLCqRzL
         oMvc9DQdYMhRwV9DgfsEMtGYASHBXVQHv3FBQC9kEFxI4jM5RPG+hXandt3zK9Yp6e1t
         hHsmhn0AWIgkPYEjFYh3VCtahoUgHlCNSTwpjO2C689ezYQFR4sJ8yPiC3kCNZ2xPg+N
         NvYQ==
X-Gm-Message-State: ANhLgQ0yh3RZZ7hk+1lAafUaDqHifwgnIxAaT7pE+8D4xp9oM1CYVD63
        oP09d9CFmOLtd3BPaK4HWsWqu+EhHbuwfhtPQGDNwQ==
X-Google-Smtp-Source: ADFU+vs3w1MtglbrX9HNFnIjYGZodV1bI9U6f5/pahfYPYm68XML/4fCApJIz8C+VE6L2r0rwvUwa8+nutu6OJTBDzI=
X-Received: by 2002:a2e:908f:: with SMTP id l15mr1096585ljg.120.1584504857757;
 Tue, 17 Mar 2020 21:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200313180333.75011-1-rajatja@google.com> <20200318035618.GG192640@dtor-ws>
 <CACK8Z6HXTDWteq1iVAHqw4irsWHGvAaS3apwNCicxGNreMncHg@mail.gmail.com>
In-Reply-To: <CACK8Z6HXTDWteq1iVAHqw4irsWHGvAaS3apwNCicxGNreMncHg@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 17 Mar 2020 21:13:41 -0700
Message-ID: <CACK8Z6E1wML3TC5_AajbgbvBP1uekuQ33UovSSVvB6huyT-HaQ@mail.gmail.com>
Subject: Re: [PATCH v3] Input: Allocate keycode for "Selective Screenshot" key
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Harry Cutts <hcutts@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 17, 2020 at 9:12 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Tue, Mar 17, 2020 at 8:56 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Mar 13, 2020 at 11:03:33AM -0700, Rajat Jain wrote:
> > > New chromeos keyboards have a "snip" key that is basically a selective
> > > screenshot (allows a user to select an area of screen to be copied).
> > > Allocate a keycode for it.
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> >
> > Applied, thank you.
>
> I just noticed that I had by mistake used KEY_SELECTIVE_SNAPSHOT
> instead of intended KEY_SELECTIVE_SCREENSHOT in the commit message. My
> apologies. Can you please fix the commit message if not already
> pushed. Otherwise I can send a follow up patch if you'd like.

Arghhh..... please disregard. I was looking at the wrong place. The
patch was correct. No need to do anything.

Thanks! :-)

Best Regards,

Rajat


>
> Thanks & Best Regards,
>
> Rajat
>
> >
> > > ---
> > > v3: Rename KEY_SNIP to KEY_SELECTIVE_SNAPSHOT
> > > V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.
> > >
> > >  include/uapi/linux/input-event-codes.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > > index 0f1db1cccc3fd..c4dbe2ee9c098 100644
> > > --- a/include/uapi/linux/input-event-codes.h
> > > +++ b/include/uapi/linux/input-event-codes.h
> > > @@ -652,6 +652,8 @@
> > >  /* Electronic privacy screen control */
> > >  #define KEY_PRIVACY_SCREEN_TOGGLE    0x279
> > >
> > > +#define KEY_SELECTIVE_SCREENSHOT     0x280
> > > +
> > >  /*
> > >   * Some keyboards have keys which do not have a defined meaning, these keys
> > >   * are intended to be programmed / bound to macros by the user. For most
> > > --
> > > 2.25.1.481.gfbce0eb801-goog
> > >
> >
> > --
> > Dmitry
