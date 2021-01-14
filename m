Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA22F69D3
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 19:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbhANSoa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 13:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbhANSoa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 13:44:30 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72CAC0613C1;
        Thu, 14 Jan 2021 10:43:49 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id q4so3359945plr.7;
        Thu, 14 Jan 2021 10:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4iP5X9CtkAiw+NO5UyJX7a2+Jw4YMkpaZBzsSINV02c=;
        b=OVVbX2E7nbmrINYjP2T0gYQWEd+KRnEIZ3vC5thneJre3j1ZolTUDmI2ZL/rI0ZcwP
         zwQjB/GBSBSGmNPc9m7G0Pdxju4RWR4oSqH5ZJ0miIlyu8tlJM+zoD/2v4fwp/F2SnwA
         gmbBnyBUraQX5P35foCAxW9StnjSjAGjB0cinvtOO74lNnOuQAM8SaySok0sI9s+yZjZ
         a1oid31n2zV+KtkPGAlcxXENB8NViCzVXif/QRyzkr8aDtjufsy1l2CxC66hQ0Z5CHrp
         UXopKYb6zVcbeiYnesmhyParag4hPsD1uP05izssAmHSMMlVlkRpCWE5dJyhE00rz83t
         nOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4iP5X9CtkAiw+NO5UyJX7a2+Jw4YMkpaZBzsSINV02c=;
        b=MFe9LKludoWq0KPpy+XHaToKkEj9EdPcpcCQgKGSRn0nwIhBwYk6/pJSkWmEGLDMGh
         8wvU8WFD5O57KgJgp5w2dVYxsxBe3Th2EM9OzzbTCn09Z+XgNM6T9MJ9XM4+0F7mCJ7N
         8gECJIwShf77xeSkpMpTIQRBg+CsYrSJrP+NQQMTs/aBGMSJPx6sUtHS+KtwapNcgGkU
         THgB78/hgdHB2YLHqJaob4OlHgHCsMLm66GodDERHIh4f6LHzxU5ZB7BsFSjMdvCqraq
         94kohQnQEQsil/npStk1QAiegEvYm4TzQdWgwNPeeb3y87jNTjpOHBMVe4IJzFhHt13L
         lXAA==
X-Gm-Message-State: AOAM533HusCBoynfu2jiVzwrzUP8VCw1cX5ft8nOF7uMFh0Dm2frcCrY
        p2maxdqOGeFx/hgAaWTR9EM=
X-Google-Smtp-Source: ABdhPJy6eguagOv37xUEQKBPjIQ4ZXsxAbBFkj9QmE2oQFJtPaclhelQ1pJFhIja95ZMSvNe2fwbOQ==
X-Received: by 2002:a17:90a:e00f:: with SMTP id u15mr2304027pjy.130.1610649829294;
        Thu, 14 Jan 2021 10:43:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w2sm6012270pfj.110.2021.01.14.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 10:43:47 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:43:45 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Sean O'Brien <seobrien@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
Message-ID: <YACQ4aPfH8y+9gkK@google.com>
References: <X//jjawwbm8FxbQU@google.com>
 <CAO-hwJK5QxxX26hFiVfQr2EfnwdZSEB2paCsZBbX58iPxJvfww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJK5QxxX26hFiVfQr2EfnwdZSEB2paCsZBbX58iPxJvfww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Thu, Jan 14, 2021 at 10:23:02AM +0100, Benjamin Tissoires wrote:
> Hi Dmitry,
> 
> On Thu, Jan 14, 2021 at 7:24 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > A typical USB keyboard usually splits its keys into several reports:
> >
> > - one for the basic alphanumeric keys, modifier keys, F<n> keys, six pack
> >   keys and keypad. This report's application is normally listed as
> >   GenericDesktop.Keyboard
> > - a GenericDesktop.SystemControl report for the system control keys, such
> >   as power and sleep
> > - Consumer.ConsumerControl report for multimedia (forward, rewind,
> >   play/pause, mute, etc) and other extended keys.
> > - additional output, vendor specific, and feature reports
> >
> > Splitting each report into a separate input device is wasteful and even
> > hurts userspace as it makes it harder to determine the true capabilities
> > (set of available keys) of a keyboard, so let's adjust application
> > matching to merge system control and consumer control reports with
> > keyboard report, if one has already been processed.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/hid-input.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index f797659cb9d9..df45d8d07dc2 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -1851,6 +1851,16 @@ static struct hid_input *hidinput_match_application(struct hid_report *report)
> >         list_for_each_entry(hidinput, &hid->inputs, list) {
> >                 if (hidinput->application == report->application)
> >                         return hidinput;
> > +
> > +               /*
> > +                * Keep SystemControl and ConsumerControl applications together
> > +                * with the main keyboard, if present.
> > +                */
> > +               if ((report->application == HID_GD_SYSTEM_CONTROL ||
> > +                    report->application == HID_CP_CONSUMER_CONTROL) &&
> > +                   hidinput->application == HID_GD_KEYBOARD) {
> 
> I am not fundamentally against the patch, but I think that if the
> device exposes first a HID_CP_CONSUMER_CONTROL and then a
> HID_GD_KEYBOARD we will end up with 2 different input nodes. We likely
> need to "convert" HID_GD_SYSTEM_CONTROL and HID_CP_CONSUMER_CONTROL to
> HID_GD_KEYBOARD when creating the hidinput.

While it is technically possible that consumer control or system control
comes first, before main keyboard report, in reality all keyboards that
I have seen so far have the main keyboard report first, so I opted not
to handle the uncommon case to keep the code simple.

I could add the above as a comment, and we could wait to see if there
are devices that are exceptions to the common practice, or I can go and
try to implement the conversion if you feel it is required. Please let
me know.

Note that we will still end up with 2+ input nodes if a device uses
several USB interfaces, but we can't really do much about such cases
(well, short of having a specialized driver claiming additional
interfaces while probing the first one, but that is really outside of
scope of this patch).

Thanks!

-- 
Dmitry
