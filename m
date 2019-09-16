Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC573B33C0
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 05:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfIPDgu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 23:36:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45137 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfIPDgt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 23:36:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id q64so21769667ljb.12
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UkbeehaenRMFwzD4RtVp+gl3t0RfSIKxixqD4Aaof8w=;
        b=kH85YD9mPyeTRuGwGOZ1gN4kMOj11Zq/GXQMmWR6A9mvIB57pXuEsJUkOWhgCDntu/
         zZsZLHAYPVDyBgmEgGs6sXQEzdfRO5afswIBdAmD+aQ6DihFvfONfjBtwcMRHSHhmlj7
         edK0TPpN3gGA2HbhltGv127JrqmtCt7Hb1tgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UkbeehaenRMFwzD4RtVp+gl3t0RfSIKxixqD4Aaof8w=;
        b=CIC4LL7csfGnQqy3q3qh57uqdC4ohKNBT//b1E3Uaxd3bfNXbb3ihrERBDL1zIFR3Q
         hMdHeqq4UtGMHL7HcjV0N01EeSj+wlXn+IPNLMm90V35Vodd8VKH1K86VoHS8eJp48Go
         D/yTyMOF8Pe4PZTkPa/uu2lzJuhDzDHr9u/lCQ/Br5sl3V/fjl4yWseM/wOhgfrg4UKu
         jm1G15NvJZRJRVfTHEt9GnI0dBdYL7JydQuvHlI+ukz/iVnR0lpqRTvuNgzWhwB6yR+4
         +nRuVDAJQn+RTJN67mtKyF1Flu1hzY7IMFJOIsMHKGOld8qzq+6EfYVckNFaYpRK6BDt
         JngQ==
X-Gm-Message-State: APjAAAUIsE/pHr00okFTvn9OpThivTH93+FKolgKZokLlxRh1Odu3JZw
        +kvbaRd4VZgrcsPdJaBNDJcKBd3dLOE=
X-Google-Smtp-Source: APXvYqwOKWQQXAN8NZWLSVtG8DE4wWkqPx+7BlDYnmDUi2F1/V4661529eEQv5qGskuNgOPRs8QqtA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr35803335ljk.201.1568605007549;
        Sun, 15 Sep 2019 20:36:47 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id m15sm119995ljg.97.2019.09.15.20.36.46
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2019 20:36:46 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id r22so14936674lfm.1
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 20:36:46 -0700 (PDT)
X-Received: by 2002:ac2:46d2:: with SMTP id p18mr7986062lfo.140.1568605006264;
 Sun, 15 Sep 2019 20:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190913220317.58289-1-dtor@chromium.org> <CANMq1KALGLdZmOgcrrOROU5BXjwnXWSfq6fr85jfRn079JympQ@mail.gmail.com>
In-Reply-To: <CANMq1KALGLdZmOgcrrOROU5BXjwnXWSfq6fr85jfRn079JympQ@mail.gmail.com>
From:   Dmitry Torokhov <dtor@chromium.org>
Date:   Sun, 15 Sep 2019 20:36:34 -0700
X-Gmail-Original-Message-ID: <CAE_wzQ9U-Lu=Uce0jFjec9JMYMhsQZoTuB+xqDpkOdC+Ufq6Ng@mail.gmail.com>
Message-ID: <CAE_wzQ9U-Lu=Uce0jFjec9JMYMhsQZoTuB+xqDpkOdC+Ufq6Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: google: whiskers: more robust tablet mode detection
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 15, 2019 at 8:26 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, Sep 14, 2019 at 6:03 AM Dmitry Torokhov <dtor@chromium.org> wrote:
> >
> > The USB interface may get detected before the platform/EC one, so let's
> > note the state of the base (if we receive event) and use it to correctly
> > initialize the tablet mode switch state.
> >
> > Also let's start the HID interface immediately when probing, this will
> > ensure that we correctly process "base folded" events that may be sent
> > as we initialize the base. Note that this requires us to add a release()
>
> s/release/remove/ ?

You are right.

>
> > function where we stop and close the hardware and switch the LED
> > registration away from devm interface as we need to make sure that we
> > destroy the LED instance before we stop the hardware.
> >
> > Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> > ---
> >  drivers/hid/hid-google-hammer.c | 71 ++++++++++++++++++++++++++-------
> >  1 file changed, 56 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> > index 84f8c127ebdc..4f64f93ddfcb 100644
> > --- a/drivers/hid/hid-google-hammer.c
> > +++ b/drivers/hid/hid-google-hammer.c
> > @@ -208,7 +209,14 @@ static int __cbas_ec_probe(struct platform_device *pdev)
> >                 return error;
> >         }
> >
> > -       input_report_switch(input, SW_TABLET_MODE, !cbas_ec.base_present);
> > +       if (!cbas_ec.base_present)
> > +               cbas_ec.base_folded = false;
>
> I'm not sure to see why this is necessary? The folded base state
> should be in bss and false anyway, and even if it was true, it would
> not change the result of the expression below (!cbas_ec.base_present
> || cbas_ec.base_folded).

To have a more accurate printout generated by the line below. The fact
that it is in bss it not relevant, as I can unbind and rebind the
driver via sysfs, so it could have stale data from the previous run.

>
> > +
> > +       dev_dbg(&pdev->dev, "%s: base: %d, folded: %d\n", __func__,
> > +               cbas_ec.base_present, cbas_ec.base_folded);
> > +
> > +       input_report_switch(input, SW_TABLET_MODE,
> > +                           !cbas_ec.base_present || cbas_ec.base_folded);
> >
> >         cbas_ec_set_input(input);
> >

Thanks,
Dmitry
