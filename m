Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D385B14C023
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 19:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgA1Srj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 13:47:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52452 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1Srj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 13:47:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so3674126wmc.2;
        Tue, 28 Jan 2020 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qSJ/h1Ikq35TvZ00fDv1k5SM14HPUn/bGuFvLfj1lcs=;
        b=cFSAFa0KAsaP+yXkD181W0csEzJ9/G3eWpp/ruo8FD7VlCA8jcK7hsm53cRNVHqS6s
         8/YADHwheq5QGH282ZN01UknKe9DkzK84jX/igA+s5dC8XFX8oW0BqRdBMx/UQkRDmQj
         0TbOOcMCDgCi0vD+h6mGpvvKI4D5F31x46wxEkqGfWz6fBaF5gVG+Gi9nYVZy+DqTdvk
         0sRUmpRgbXfAOGg3Rm0gVMoHv8WIrG0O4XKfAflEpzkzmodgb+2X4XttB/x+csoKOwk7
         66RoyqX58E8XIiAxt0EQqLMp6wO+PCLoFWasxVDAQgDYDYz+PFKeRjlmZJqu5tCXKFX8
         EtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:message-id:subject:from:to:cc:date
         :in-reply-to:references:user-agent:mime-version
         :content-transfer-encoding;
        bh=qSJ/h1Ikq35TvZ00fDv1k5SM14HPUn/bGuFvLfj1lcs=;
        b=Gzfl8NocLTrqfVMsGnHJlJAQ5mVmQvU0NomaXjtCPtB3z+bjO6+wAs/lrDvTFaUlEO
         AEte7SPTtBOCdSrERnOVPbAwh9qz+MDxck9KNqXD4OUIhJar2+awi1Eyw2u1LN1k24zq
         Hz0Fh+Vc33H2GhoXoXmbVBOdvaW0nMBia07lsSnReJ6yPkCjuEQto8RuCrKfh6K8dkTL
         R7dP+iKWBh7TIkzZPilIS/tfPxg0NyEkwokzzhXrwPBRFN9VBlQwL51DdMQmq3t/e7+X
         s/muOBPEGq1iWvUHOK2riOKUw7UvBbcfGDI2qTSed1CAWv2QwQG0cTbqSwmTQEzBFCPM
         R+Ug==
X-Gm-Message-State: APjAAAXkFgAkQGMtsIGfzSaeA8zvrHo2Pbng4O6oXbIyqYhATk0ON/m0
        +LPOcnAIqUJBQQcwyNjrOWk=
X-Google-Smtp-Source: APXvYqz9hRSBDQv75fSFb8n8Oy4W45DC3zLcG8J2Ly3nH1X700788C4/WDGyDIMB5mHPt37S3tsTnw==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr6980106wmc.168.1580237256418;
        Tue, 28 Jan 2020 10:47:36 -0800 (PST)
Received: from broadband.bt.com ([2a00:23c5:582:9d00:2d93:25f:7679:a491])
        by smtp.gmail.com with ESMTPSA id f1sm3857743wmc.45.2020.01.28.10.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 10:47:35 -0800 (PST)
Message-ID: <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
From:   Martyn Welch <martyn@welchs.me.uk>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Conn O'Griofa <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Date:   Tue, 28 Jan 2020 18:47:35 +0000
In-Reply-To: <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
References: <20200126194513.6359-1-martyn@welchs.me.uk>
         <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-01-27 at 14:07 -0800, Roderick Colenbrander wrote:
> Hi Martyn,
> 
> Thanks for sharing your patch. Though I must say with my Sony hat on,
> I don't really like supporting clone devices (they hijack our device
> ids.. etcetera) and we support hid-sony in an official capacity now
> across various devices. Though thischange  all relates to PS3
> generation, which is not that important anymore so it shouldn't
> matter
> that much.
> 

Hi Roderick,

I can understand that sentiment to a degree, however the hardware
exists and there are no doubt others like me that don't even own a PS3
and would just like to be able to use the gamepads they've purchased to
play games.

Martyn 

> Thanks,
> Roderick
> 
> On Sun, Jan 26, 2020 at 12:28 PM Martyn Welch <martyn@welchs.me.uk>
> wrote:
> > There seems to be a number of subtly different firmwares for the
> > Playstation controllers made by "Gasia Co.,Ltd". Whilst such
> > controllers
> > are easily detectable when attached via USB that is not always the
> > case
> > via Bluetooth. Some controllers are named "PLAYSTATION(R)3
> > Controller"
> > where as the official Sony controllers are named
> > "Sony PLAYSTATION(R)3 Controller", however some versions of
> > firmware use
> > the exact name used by the official controllers. The only way I've
> > been
> > able to distinguish these versions of the controller (when
> > connected via
> > Bluetooth) is that the Bluetooth Class of Device incorrectly
> > reports the
> > controller as a keyboard rather than a gamepad. I've so far failed
> > to work
> > out how to access this information from a HID driver.
> > 
> > The Gasia controllers need output reports to be configured in the
> > same way
> > as the Shanwan controllers. In order to ensure both types of Gasia
> > firmware
> > will work, this patch adds a quirk for those devices it can detect
> > and
> > reworks `sixaxis_send_output_report()` to attempt
> > `hid_hw_output_report()`
> > should `hid_hw_raw_request()` be known to be the wrong option (as
> > is the
> > case with the Shanwan controllers) or fails.
> > 
> > This has got all the controllers I have working, with the slight
> > anoyance that the Gasia controllers that don't currently get marked
> > with
> > a quirk require the call to `hid_hw_raw_request()` to fail before
> > the
> > controller finishes initialising (which adds a significant extra
> > delay
> > before the controller is ready).
> > 
> > This patch is based on the following patch by Conn O'Griofa:
> > 
> > https://github.com/RetroPie/RetroPie-Setup/pull/2263/commits/017f00f6e15f04b3272ff1abae8742dc4c47b608
> > 
> > Cc: Conn O'Griofa <connogriofa@gmail.com>
> > Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
> > ---
> >  drivers/hid/hid-sony.c | 31 +++++++++++++++++++++++++------
> >  1 file changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > index 4c6ed6ef31f1..d1088a85cb59 100644
> > --- a/drivers/hid/hid-sony.c
> > +++ b/drivers/hid/hid-sony.c
> > @@ -56,6 +56,7 @@
> >  #define NSG_MR5U_REMOTE_BT        BIT(14)
> >  #define NSG_MR7U_REMOTE_BT        BIT(15)
> >  #define SHANWAN_GAMEPAD           BIT(16)
> > +#define GASIA_GAMEPAD             BIT(17)
> > 
> >  #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB |
> > SIXAXIS_CONTROLLER_BT)
> >  #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB |
> > MOTION_CONTROLLER_BT)
> > @@ -2067,6 +2068,7 @@ static void sixaxis_send_output_report(struct
> > sony_sc *sc)
> >         struct sixaxis_output_report *report =
> >                 (struct sixaxis_output_report *)sc-
> > >output_report_dmabuf;
> >         int n;
> > +       int ret = -1;
> > 
> >         /* Initialize the report with default values */
> >         memcpy(report, &default_report, sizeof(struct
> > sixaxis_output_report));
> > @@ -2101,14 +2103,23 @@ static void
> > sixaxis_send_output_report(struct sony_sc *sc)
> >                 }
> >         }
> > 
> > -       /* SHANWAN controllers require output reports via intr
> > channel */
> > -       if (sc->quirks & SHANWAN_GAMEPAD)
> > -               hid_hw_output_report(sc->hdev, (u8 *)report,
> > -                               sizeof(struct
> > sixaxis_output_report));
> > -       else
> > -               hid_hw_raw_request(sc->hdev, report->report_id, (u8
> > *)report,
> > +       /*
> > +        * SHANWAN & GASIA controllers require output reports via
> > intr channel.
> > +        * Some of the Gasia controllers are basically
> > indistinguishable from
> > +        * the official ones and thus try hid_hw_output_report()
> > should
> > +        * hid_hw_raw_request() fail.
> > +        */
> > +       if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD)))
> > +               ret = hid_hw_raw_request(sc->hdev, report-
> > >report_id,
> > +                               (u8 *)report,
> >                                 sizeof(struct
> > sixaxis_output_report),
> >                                 HID_OUTPUT_REPORT,
> > HID_REQ_SET_REPORT);
> > +
> > +       if (ret >= 0)
> > +               return;
> 
> I don't like this pattern so much. We only need this "ret" check for
> SHANWAN and GASIA. I would just do:
> 
> if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD))) {
>     int ret = hid_hw_raw_request(....);
>     if (ret >= 0)
>        return;
> }
> 
> hid_hw_output_report(....)
> 
> > +
> > +       hid_hw_output_report(sc->hdev, (u8 *)report,
> > +                       sizeof(struct sixaxis_output_report));
> >  }
> > 
> >  static void dualshock4_send_output_report(struct sony_sc *sc)
> > @@ -2833,6 +2844,14 @@ static int sony_probe(struct hid_device
> > *hdev, const struct hid_device_id *id)
> >         if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
> >                 quirks |= SHANWAN_GAMEPAD;
> > 
> > +       /*
> > +        * Some Gasia controllers are named "PLAYSTATION(R)3
> > Controller"
> > +        * where as the official Sony controllers are named
> > +        * "Sony PLAYSTATION(R)3 Controller".
> > +        */
> > +       if (!strcmp(hdev->name, "PLAYSTATION(R)3 Controller"))
> > +               quirks |= GASIA_GAMEPAD;
> > +
> >         sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
> >         if (sc == NULL) {
> >                 hid_err(hdev, "can't alloc sony descriptor\n");
> > --
> > 2.20.1
> > 

