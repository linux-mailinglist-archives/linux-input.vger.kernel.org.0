Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8414742B0
	for <lists+linux-input@lfdr.de>; Tue, 14 Dec 2021 13:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhLNMfU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Dec 2021 07:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49300 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230023AbhLNMfT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Dec 2021 07:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639485319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eCh4MHjQp9/xMhPn2z2AjgxZWr0pd98DD/ZJs0f8zxI=;
        b=DNQy7HexrqgIhqBO0lepua3F0H8X+/mdqwd6PjNqRFR2ROcPW9C4wSPQ0lf4JmypDbwY1x
        D+GxD17mQJ3FUIXaqTThKoQN0uMLHTR+qk+XxNcOIwxrUjlw3Xu6sDm0u1nnpSU11/EdWN
        pgOxuZMa+UbXtkmohiQDPtnwr5C8vjg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-gX6tDPOxMjix_6r27kZ_aw-1; Tue, 14 Dec 2021 07:35:18 -0500
X-MC-Unique: gX6tDPOxMjix_6r27kZ_aw-1
Received: by mail-pf1-f200.google.com with SMTP id f205-20020a6238d6000000b004b89e57592fso65815pfa.23
        for <linux-input@vger.kernel.org>; Tue, 14 Dec 2021 04:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCh4MHjQp9/xMhPn2z2AjgxZWr0pd98DD/ZJs0f8zxI=;
        b=yvzPMRxni642zxZ6y1XBJXCRAzoYgBsxvvpp+xqqudeHBy2HImxX+yKOOeP96CGUtL
         xBnQxETVaIz4AJWBeZsAAdmD3csibyEIc1bb9Sw60Xh5I/nTgvfhLQXb0R6gvM+76ves
         erIVNaGP9DFHLKsvyqJtmYPDcUdi5Nwl+V/YyY9ayYBHBK3Zm7hAZRPp9yp7IZxY1GAl
         4b1+vCamegPGhDzMLSS4xq8qiBI35k2d1XrnmdzwnRTIRTckWnkWYh9+SnYbghUJNuD5
         88wI3eSI/6qV+oT3Xjl+a3bt44Lsf+D6bxTkXr/BpYIsYsQwXblegL1tjIghT151nRbk
         4UBw==
X-Gm-Message-State: AOAM531u/R27/mdClIB/oussqWXUxxOiIG6+098vlMNtVMglEEcZpbm9
        gbDOGmRPhPRpESe/UGosFRCT9ltVWOuSlXZDk1kLwXIkfD2Mr5KU9SI+79DjfBjElLBk5OZfzdH
        nkMCHTmAJi/IkvIjg5IL96twtMYKhqmVl7/nBTxs=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id e7-20020a17090301c700b00141e630130cmr5223637plh.80.1639485317121;
        Tue, 14 Dec 2021 04:35:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG97RuWcRodmvGUwMyfU2EldJClytLlJnu7NAsGfOHT19l5haIctqoLfzZ/8CJOspEEy5+UG6HfORaUidEF74=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id
 e7-20020a17090301c700b00141e630130cmr5223610plh.80.1639485316871; Tue, 14 Dec
 2021 04:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20211210111138.1248187-1-tero.kristo@linux.intel.com>
 <20211210111138.1248187-3-tero.kristo@linux.intel.com> <c8854f9b-8200-ee10-fe83-77a776ddff95@redhat.com>
 <fb99885c-a9ff-d3e7-ce72-a123cadcd9da@linux.intel.com>
In-Reply-To: <fb99885c-a9ff-d3e7-ce72-a123cadcd9da@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Dec 2021 13:35:06 +0100
Message-ID: <CAO-hwJKk55uDCaEr5MVZCUc1p215a3kZqq5zi3oE3fhED7Yavg@mail.gmail.com>
Subject: Re: [PATCHv4 2/5] HID: hid-input: Add suffix also for HID_DG_PEN
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 10, 2021 at 6:51 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
>
> On 10/12/2021 18:21, Benjamin Tissoires wrote:
> >
> >
> > On Fri, Dec 10, 2021 at 12:12 PM Tero Kristo
> > <tero.kristo@linux.intel.com> wrote:
> >>
> >> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> >>
> >> This and HID_DG_STYLUS are pretty much the same thing so add suffix for
> >> HID_DG_PEN too. This makes the input device name look better.
> >>
> >> While doing this, remove the suffix override from hid-multitouch, as it
> >> is now handled by hid-input. Also, the suffix override done by
> >> hid-multitouch was wrong, as it mapped HID_DG_PEN => "Stylus" and
> >> HID_DG_STYLUS => "Pen".
> >
> > FWIW, I was thinking at the following:
> > ---
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 837585f4e673..fe0da7bf24a9 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -1775,6 +1775,15 @@ static struct hid_input
> > *hidinput_allocate(struct hid_device *hid,
> >                         suffix = "Mouse";
> >                         break;
> >                 case HID_DG_PEN:
> > +                       /*
> > +                        * yes, there is an issue here:
> > +                        *  DG_PEN -> "Stylus"
> > +                        *  DG_STYLUS -> "Pen"
> > +                        * But changing this now means users with
> > config snippets
> > +                        * will have to change it and the test suite
> > will not be happy.
> > +                        */
> > +                       suffix = "Stylus";
> > +                       break;
> >                 case HID_DG_STYLUS:
> >                         suffix = "Pen";
> >                         break;
> > ---
> >
> > Because the current patch breaks the test suite.
>
> Ah I see, do you want me to re-post in this form?

Nah, no need for a repost. I fixed the patch locally and pushed to
for-5.17/core.

Cheers,
Benjamin

>
> -Tero
>
> >
> > Cheers,
> > Benjamin
> >
> >>
> >> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >> Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
> >> ---
> >>  drivers/hid/hid-input.c      | 1 +
> >>  drivers/hid/hid-multitouch.c | 3 ---
> >>  2 files changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> >> index ad718ceb8af3..78205e445652 100644
> >> --- a/drivers/hid/hid-input.c
> >> +++ b/drivers/hid/hid-input.c
> >> @@ -1741,6 +1741,7 @@ static struct hid_input
> >> *hidinput_allocate(struct hid_device *hid,
> >>                 case HID_GD_MOUSE:
> >>                         suffix = "Mouse";
> >>                         break;
> >> +               case HID_DG_PEN:
> >>                 case HID_DG_STYLUS:
> >>                         suffix = "Pen";
> >>                         break;
> >> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> >> index 082376a6cb3d..99eabfb4145b 100644
> >> --- a/drivers/hid/hid-multitouch.c
> >> +++ b/drivers/hid/hid-multitouch.c
> >> @@ -1606,9 +1606,6 @@ static int mt_input_configured(struct
> >> hid_device *hdev, struct hid_input *hi)
> >>         case HID_DG_STYLUS:
> >>                 /* force BTN_STYLUS to allow tablet matching in udev */
> >>                 __set_bit(BTN_STYLUS, hi->input->keybit);
> >> -               fallthrough;
> >> -       case HID_DG_PEN:
> >> -               suffix = "Stylus";
> >>                 break;
> >>         default:
> >>                 suffix = "UNKNOWN";
> >> --
> >> 2.25.1
> >>
> >
>

