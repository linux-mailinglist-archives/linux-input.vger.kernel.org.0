Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F16324840
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 08:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfEUGnq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 02:43:46 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44785 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfEUGnm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 02:43:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id f24so19200749qtk.11
        for <linux-input@vger.kernel.org>; Mon, 20 May 2019 23:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gro6bYpyJjEyBjnoN8cxKbYz7QpgKEPbeHJeHV938fM=;
        b=JBu2ZcuGSRvMcEYw1OLTE+rxZxOivCGnTPCZwcLB6VuJ9bJQolN+VPycd4JZav4L9g
         wMplvmgCUuVVrv3DbuaTpW3AC4TC+b1ndyAoZmK5VNiqa68d21SZqqeKMIgUJSzwHKoV
         78ZrvJQl0ox4+10AOaT4MCHHfRfioDgz8vnZJjhKegGJzTvvak/8AFTxtVrXwmSQqjix
         lN6SEmGssFLcygrYfUgrsZwrmMI578f9XRiQNryNifT9EDBt2UYILAzMVrX8rwKAZ4sk
         YYENSdVPf/TJsdTeerZoHK3IElAQAyX8O6XPXMj0q0p21CK4GDQ/blhKM483H3UC20xY
         uFhA==
X-Gm-Message-State: APjAAAUptyZr+83xRPZ2hncmArkiyiYqTisUJABcYzTPdOQbucY9nNOA
        mnv5RmyrCTJcvI96+pA4AU9DnpOBWYcTjAg3tTTEYw==
X-Google-Smtp-Source: APXvYqxXn1go1qbpDCG2yWak7kaOv1RYHlLtQD7wJZmZnmwbmMBNnw+06Lou9G3h+HjhnOOY/oD7Ff7vM7mbiHjnR+o=
X-Received: by 2002:ac8:875:: with SMTP id x50mr65243976qth.345.1558421021479;
 Mon, 20 May 2019 23:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190519072711.2592-1-aaron.ma@canonical.com> <20190521051053.GD183429@dtor-ws>
In-Reply-To: <20190521051053.GD183429@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 21 May 2019 08:43:29 +0200
Message-ID: <CAO-hwJ+edn3SD8Z=yc1gOWRsA8_=uPTAHc18PkDhV2y7ackTPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: elantech - enable middle button support on 2 ThinkPads
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
Cc:     Aaron Ma <aaron.ma@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, May 21, 2019 at 7:11 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Aaron,
>
> On Sun, May 19, 2019 at 03:27:10PM +0800, Aaron Ma wrote:
> > Adding 2 new touchpad PNPIDs to enable middle button support.
>
> Could you add their names in the comments please?
>
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  drivers/input/mouse/elantech.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> > index a7f8b1614559..530142b5a115 100644
> > --- a/drivers/input/mouse/elantech.c
> > +++ b/drivers/input/mouse/elantech.c
> > @@ -1189,6 +1189,8 @@ static const char * const middle_button_pnp_ids[] = {
> >       "LEN2132", /* ThinkPad P52 */
> >       "LEN2133", /* ThinkPad P72 w/ NFC */
> >       "LEN2134", /* ThinkPad P72 */
> > +     "LEN0407",

AFAICT, this one is the Lenovo P53.
However, having a whitelist of new models is not going to scale IMO.

I was thinking at submitting a patch to enable middle button
unconditionally, but then I realized that libinput disables middle
click emulation on touchpads with an actual physical middle button.

And this morning I just realized that we might have a better chance at
this if we consider the new models to have the physical middle button.
I know LEN0407 attempts to bind over SMBus, so I would think we can
reduce the set of whitelist by just checking for
ETP_NEW_IC_SMBUS_HOST_NOTIFY (patch coming in).

Cheers,
Benjamin

> > +     "LEN0408",
>
> These should come first - I'd like to keep the list sorted
> alphabetically.
>
> >       NULL
> >  };
> >
> > --
> > 2.17.1
> >
>
> Thanks.
>
> --
> Dmitry
