Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A082F14C672
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2020 07:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgA2GW6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jan 2020 01:22:58 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41243 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgA2GW5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jan 2020 01:22:57 -0500
Received: by mail-qt1-f193.google.com with SMTP id l19so6843869qtq.8;
        Tue, 28 Jan 2020 22:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJ/k2FK821XDRXkrfNlUEPq/QjZ8ThsZFVQa9io6VZk=;
        b=PuO81GSGtGc8QqfSBfYzB5wYaUP6vBcHbRUYyX6h3RD3x2AWFMoWfcPFXomOSHmE0w
         k3SMSqFWi/9yBbTdSgvztO554/0qeYMygmZaZ/LXDWAV06R3NsFHJmwSitDFO+r/uuTp
         cHyZJlJ+xT0Dtjawbwx5mEn1CNHeEsoTLu1VqZerrLg7hJ/cnFQfQOvyHqs7p1Nq4mDN
         g8QEzbjxqWK7piSiyJDufnbr3HAk7uvuyFWdQMJUepu0rmtUKk/hbzKsqV1lToPxDsJL
         s7Zvao2R58XaJoY2bMxZV3K4IOspd/0V3sLOQ9TlfkD0cnM1eplST4CtuOWm8UHY5ev6
         gEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJ/k2FK821XDRXkrfNlUEPq/QjZ8ThsZFVQa9io6VZk=;
        b=Yr5FTRBRKwF+GXmxI5+Gc2pJm/38D3WpDJ5k73y90+/TsrtEWd8rWKeWwB4Om27HQk
         tGWQi4xrV30/r5WCk561rA1X1vE4OrHdr4PX+/wQrFAG05IVTK/tUBECYuiOdN7MvVmN
         l4FnMKnlzIqJeRaNarIjQGwabZVf3DMAkmIBMppuGr3/qdAFjTH0RO8fkHeW62HrMNSM
         jyjetbl5jA9paG7uSfNlRvmB9ugSt1Hu9CaghmwSkNwCMUs84XpUQvmytDoln3GQXtKP
         sfrHHBU6kguKQGx1xcZFXYDJ/F9eUhWAHeoswIVGA204xm9xwI5wL4eAZdIF/JvID7xx
         ZBSg==
X-Gm-Message-State: APjAAAX+Pg3te30mC6y3V1K8F+VykRko1jOXWVMzKVsJYYZQdoaXRbZ9
        mPtnv8TvgajiftK3jy7iBSix9rLdsMbWVJIDHUM=
X-Google-Smtp-Source: APXvYqzsmliK5fNonADdmnL4nAJwVNxWZyQmb9A6kbN6JqFElCPPR/oMH027a8GF8ntNvUuDvFNrlh/tzUozT1XkIfs=
X-Received: by 2002:ac8:70d5:: with SMTP id g21mr12342482qtp.46.1580278976402;
 Tue, 28 Jan 2020 22:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
In-Reply-To: <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 28 Jan 2020 22:22:45 -0800
Message-ID: <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Martyn Welch <martyn@welchs.me.uk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 28, 2020 at 10:47 AM Martyn Welch <martyn@welchs.me.uk> wrote:
>
> On Mon, 2020-01-27 at 14:07 -0800, Roderick Colenbrander wrote:
> > Hi Martyn,
> >
> > Thanks for sharing your patch. Though I must say with my Sony hat on,
> > I don't really like supporting clone devices (they hijack our device
> > ids.. etcetera) and we support hid-sony in an official capacity now
> > across various devices. Though thischange  all relates to PS3
> > generation, which is not that important anymore so it shouldn't
> > matter
> > that much.
> >
>
> Hi Roderick,
>
> I can understand that sentiment to a degree, however the hardware
> exists and there are no doubt others like me that don't even own a PS3
> and would just like to be able to use the gamepads they've purchased to
> play games.
>
> Martyn

Let me explain the situation a little bit better from our angle. These
devices exist and from the Linux community perspective of course they
should see some level of support. And as I said since this is PS3
generation I don't have much of a concern.

Where it becomes tricky for any company in our situation is the
support side. We don't know these devices and don't have access to
datasheets or anything, but when such code is in our "official driver"
it means we have to involve them in our QA process and support them in
some manner (kind of legitimizing their existence as well). We now
support this driver in a large capacity (pretty much all mobile
devices will start shipping it) it puts challenges on our partners
(not a big issue since just PS3 right now).

As you can see this creates an awkward situation. I'm sure there other
such devices as well e.g. counterfeit Logitech keyboards, USB serial
adapters and other periperhals with similar challenges. In an ideal
world the support would live in another driver, but since in case of
this "fake" PS3 controller it "share" our product / vendor ids it is
tricky. At this point there is not a strong enough case yet to augment
the "hid-quirks" to do so, but perhaps if it became a serious issue
(e.g. for newer controllers) maybe we need to think of something.

Thanks,
Roderick

>
> > Thanks,
> > Roderick
> >
> > On Sun, Jan 26, 2020 at 12:28 PM Martyn Welch <martyn@welchs.me.uk>
> > wrote:
> > > There seems to be a number of subtly different firmwares for the
> > > Playstation controllers made by "Gasia Co.,Ltd". Whilst such
> > > controllers
> > > are easily detectable when attached via USB that is not always the
> > > case
> > > via Bluetooth. Some controllers are named "PLAYSTATION(R)3
> > > Controller"
> > > where as the official Sony controllers are named
> > > "Sony PLAYSTATION(R)3 Controller", however some versions of
> > > firmware use
> > > the exact name used by the official controllers. The only way I've
> > > been
> > > able to distinguish these versions of the controller (when
> > > connected via
> > > Bluetooth) is that the Bluetooth Class of Device incorrectly
> > > reports the
> > > controller as a keyboard rather than a gamepad. I've so far failed
> > > to work
> > > out how to access this information from a HID driver.
> > >
> > > The Gasia controllers need output reports to be configured in the
> > > same way
> > > as the Shanwan controllers. In order to ensure both types of Gasia
> > > firmware
> > > will work, this patch adds a quirk for those devices it can detect
> > > and
> > > reworks `sixaxis_send_output_report()` to attempt
> > > `hid_hw_output_report()`
> > > should `hid_hw_raw_request()` be known to be the wrong option (as
> > > is the
> > > case with the Shanwan controllers) or fails.
> > >
> > > This has got all the controllers I have working, with the slight
> > > anoyance that the Gasia controllers that don't currently get marked
> > > with
> > > a quirk require the call to `hid_hw_raw_request()` to fail before
> > > the
> > > controller finishes initialising (which adds a significant extra
> > > delay
> > > before the controller is ready).
> > >
> > > This patch is based on the following patch by Conn O'Griofa:
> > >
> > > https://github.com/RetroPie/RetroPie-Setup/pull/2263/commits/017f00f6e15f04b3272ff1abae8742dc4c47b608
> > >
> > > Cc: Conn O'Griofa <connogriofa@gmail.com>
> > > Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
> > > ---
> > >  drivers/hid/hid-sony.c | 31 +++++++++++++++++++++++++------
> > >  1 file changed, 25 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > > index 4c6ed6ef31f1..d1088a85cb59 100644
> > > --- a/drivers/hid/hid-sony.c
> > > +++ b/drivers/hid/hid-sony.c
> > > @@ -56,6 +56,7 @@
> > >  #define NSG_MR5U_REMOTE_BT        BIT(14)
> > >  #define NSG_MR7U_REMOTE_BT        BIT(15)
> > >  #define SHANWAN_GAMEPAD           BIT(16)
> > > +#define GASIA_GAMEPAD             BIT(17)
> > >
> > >  #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB |
> > > SIXAXIS_CONTROLLER_BT)
> > >  #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB |
> > > MOTION_CONTROLLER_BT)
> > > @@ -2067,6 +2068,7 @@ static void sixaxis_send_output_report(struct
> > > sony_sc *sc)
> > >         struct sixaxis_output_report *report =
> > >                 (struct sixaxis_output_report *)sc-
> > > >output_report_dmabuf;
> > >         int n;
> > > +       int ret = -1;
> > >
> > >         /* Initialize the report with default values */
> > >         memcpy(report, &default_report, sizeof(struct
> > > sixaxis_output_report));
> > > @@ -2101,14 +2103,23 @@ static void
> > > sixaxis_send_output_report(struct sony_sc *sc)
> > >                 }
> > >         }
> > >
> > > -       /* SHANWAN controllers require output reports via intr
> > > channel */
> > > -       if (sc->quirks & SHANWAN_GAMEPAD)
> > > -               hid_hw_output_report(sc->hdev, (u8 *)report,
> > > -                               sizeof(struct
> > > sixaxis_output_report));
> > > -       else
> > > -               hid_hw_raw_request(sc->hdev, report->report_id, (u8
> > > *)report,
> > > +       /*
> > > +        * SHANWAN & GASIA controllers require output reports via
> > > intr channel.
> > > +        * Some of the Gasia controllers are basically
> > > indistinguishable from
> > > +        * the official ones and thus try hid_hw_output_report()
> > > should
> > > +        * hid_hw_raw_request() fail.
> > > +        */
> > > +       if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD)))
> > > +               ret = hid_hw_raw_request(sc->hdev, report-
> > > >report_id,
> > > +                               (u8 *)report,
> > >                                 sizeof(struct
> > > sixaxis_output_report),
> > >                                 HID_OUTPUT_REPORT,
> > > HID_REQ_SET_REPORT);
> > > +
> > > +       if (ret >= 0)
> > > +               return;
> >
> > I don't like this pattern so much. We only need this "ret" check for
> > SHANWAN and GASIA. I would just do:
> >
> > if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD))) {
> >     int ret = hid_hw_raw_request(....);
> >     if (ret >= 0)
> >        return;
> > }
> >
> > hid_hw_output_report(....)
> >
> > > +
> > > +       hid_hw_output_report(sc->hdev, (u8 *)report,
> > > +                       sizeof(struct sixaxis_output_report));
> > >  }
> > >
> > >  static void dualshock4_send_output_report(struct sony_sc *sc)
> > > @@ -2833,6 +2844,14 @@ static int sony_probe(struct hid_device
> > > *hdev, const struct hid_device_id *id)
> > >         if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
> > >                 quirks |= SHANWAN_GAMEPAD;
> > >
> > > +       /*
> > > +        * Some Gasia controllers are named "PLAYSTATION(R)3
> > > Controller"
> > > +        * where as the official Sony controllers are named
> > > +        * "Sony PLAYSTATION(R)3 Controller".
> > > +        */
> > > +       if (!strcmp(hdev->name, "PLAYSTATION(R)3 Controller"))
> > > +               quirks |= GASIA_GAMEPAD;
> > > +
> > >         sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
> > >         if (sc == NULL) {
> > >                 hid_err(hdev, "can't alloc sony descriptor\n");
> > > --
> > > 2.20.1
> > >
>
