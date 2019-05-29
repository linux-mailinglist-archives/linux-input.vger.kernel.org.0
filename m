Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657312DD8E
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 14:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE2M4K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 29 May 2019 08:56:10 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:37701 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfE2M4I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 08:56:08 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="30800343"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 29 May 2019 20:56:01 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(76388:0:AUTH_RELAY)
        (envelope-from <kt.liao@emc.com.tw>); Wed, 29 May 2019 20:56:02 +0800 (CST)
Received: from 192.168.33.46
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(119321:0:AUTH_LOGIN)
        (envelope-from <kt.liao@emc.com.tw>); Wed, 29 May 2019 20:56:01 +0800 (CST)
From:   =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
To:     "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Sean O'Brien'" <seobrien@chromium.org>,
        "'Peter Hutterer'" <peter.hutterer@who-t.net>
Cc:     "'Harry Cutts'" <hcutts@chromium.org>,
        "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Aaron Ma'" <aaron.ma@canonical.com>,
        "'Hans de Goede'" <hdegoede@redhat.com>,
        "'open list:HID CORE LAYER'" <linux-input@vger.kernel.org>,
        "'lkml'" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com> <20190521132712.2818-9-benjamin.tissoires@redhat.com> <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com> <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw> <20190528012101.GA193221@dtor-ws> <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com> <CAOOzhkq+vD034Q2FKB2ryR7Q9nY=iQjdrREuihkZTaVcg+E_Xg@mail.gmail.com> <CAO-hwJ+9tnmvD-K3_Ksesdvag1aNbLB7eJxb9ZKb7kM24unqQQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+9tnmvD-K3_Ksesdvag1aNbLB7eJxb9ZKb7kM24unqQQ@mail.gmail.com>
Subject: RE: [PATCH v2 08/10] Input: elan_i2c - export true width/height
Date:   Wed, 29 May 2019 20:55:59 +0800
Message-ID: <010301d5161d$dd201e70$97605b50$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQMBv+jJqV7WAwqWtnh8gdestIYR9QKF0mzQAgyUPwcBn6xZvAHvf1DVAJRhBqgB1CL43gKA7XSwo8BdoKA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcOTIwNzNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0xYTk1ZDkwZS04MjExLTExZTktYjRlZS01YzUxNGY0NmFhNDVcYW1lLXRlc3RcMWE5NWQ5MTAtODIxMS0xMWU5LWI0ZWUtNWM1MTRmNDZhYTQ1Ym9keS50eHQiIHN6PSI3MjE4IiB0PSIxMzIwMzYwODE1OTQwNjE3NDUiIGg9IlVSMzgxRFhOcXdFd3QwNHZXR283U0RhUkJyTT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



-----Original Message-----
From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com] 
Sent: Wednesday, May 29, 2019 3:17 PM
To: Sean O'Brien; Peter Hutterer
Cc: Harry Cutts; Dmitry Torokhov; 廖崇榮; Rob Herring; Aaron Ma; Hans de Goede; open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height

On Wed, May 29, 2019 at 2:12 AM Sean O'Brien <seobrien@chromium.org> wrote:
>
> We do still use a maxed out major axis as a signal for a palm in the 
> touchscreen logic, but I'm not too concerned because if that axis is 
> maxed out, the contact should probably be treated as a palm anyway...
>
> I'm more concerned with this affecting our gesture detection for 
> touchpad. It looks like this change would cause all contacts to 
> reported as some percentage bigger than they are currently. Can you 
> give me an idea of how big that percentage is?

On the P52, I currently have:
[  +0.000009] max:    (3045,1731) drivers/input/mouse/elan_i2c_core.c:428
[  +0.000003] traces: (24,14) drivers/input/mouse/elan_i2c_core.c:429

-> with the computation done in the kernel:
width_ratio: 126
height_ratio: 123

For my average finger, the reported traces are between 4 and 6:
With the ETP_FWIDTH_REDUCE:
Major between 144 to 216
Minor between 132 to 198

Without:
Major between 504 to 756
Minor between 492 to 738

So a rough augmentation of 350%

For the Synaptics devices (over SMBus), they send the raw value of the traces, so you will get a major/minor between 2 to 5. Max on these axes is 15, so we should get the same percentage of value comparing to the range.

Elan's vendor report contains such information, which indicate how many trace are touched by finger/palm
		mk_x = (finger_data[3] & 0x0f); 
		mk_y = (finger_data[3] >> 4);
Do we need to use mk_* for major/minor for keeping it consistent with other vendor?
But this modification will impact Chromebook's usability and Chrome test suite.



Which is why libinput has a database of which device reports which pressure/major/minor ranges as otherwise the values are just impossible to understand.

Cheers,
Benjamin



>
> On Tue, May 28, 2019 at 11:13 AM Harry Cutts <hcutts@chromium.org> wrote:
> >
> > On Mon, 27 May 2019 at 18:21, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Benjamin, KT,
> > >
> > > On Mon, May 27, 2019 at 11:55:01AM +0800, 廖崇榮 wrote:
> > > > Hi
> > > >
> > > > -----Original Message-----
> > > > From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> > > > Sent: Friday, May 24, 2019 5:37 PM
> > > > To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de 
> > > > Goede
> > > > Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> > > > Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true 
> > > > width/height
> > > >
> > > > On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > > > >
> > > > > The width/height is actually in the same unit than X and Y. So 
> > > > > we should not tamper the data, but just set the proper 
> > > > > resolution, so that userspace can correctly detect which touch is a palm or a finger.
> > > > >
> > > > > Signed-off-by: Benjamin Tissoires 
> > > > > <benjamin.tissoires@redhat.com>
> > > > >
> > > > > --
> > > > >
> > > > > new in v2
> > > > > ---
> > > > >  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
> > > > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > > > > b/drivers/input/mouse/elan_i2c_core.c
> > > > > index 7ff044c6cd11..6f4feedb7765 100644
> > > > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > > > @@ -45,7 +45,6 @@
> > > > >  #define DRIVER_NAME            "elan_i2c"
> > > > >  #define ELAN_VENDOR_ID         0x04f3
> > > > >  #define ETP_MAX_PRESSURE       255
> > > > > -#define ETP_FWIDTH_REDUCE      90
> > > > >  #define ETP_FINGER_WIDTH       15
> > > > >  #define ETP_RETRY_COUNT                3
> > > > >
> > > > > @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
> > > > >                         return;
> > > > >                 }
> > > > >
> > > > > -               /*
> > > > > -                * To avoid treating large finger as palm, let's reduce the
> > > > > -                * width x and y per trace.
> > > > > -                */
> > > > > -               area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
> > > > > -               area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
> > > > > +               area_x = mk_x * data->width_x;
> > > > > +               area_y = mk_y * data->width_y;
> > > > >
> > > > >                 major = max(area_x, area_y);
> > > > >                 minor = min(area_x, area_y); @@ -1123,8 
> > > > > +1118,10 @@ static int elan_setup_input_device(struct elan_tp_data *data)
> > > > >                              ETP_MAX_PRESSURE, 0, 0);
> > > > >         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
> > > > >                              ETP_FINGER_WIDTH * max_width, 0, 
> > > > > 0);
> > > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, 
> > > > > + data->x_res);
> > > > >         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
> > > > >                              ETP_FINGER_WIDTH * min_width, 0, 
> > > > > 0);
> > > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, 
> > > > > + data->y_res);
> > > >
> > > > I had a chat with Peter on Wednesday, and he mentioned that this is dangerous as Major/Minor are max/min of the width and height. And given that we might have 2 different resolutions, we would need to do some computation in the kernel to ensure the data is correct with respect to the resolution.
> > > >
> > > > TL;DR: I don't think we should export the resolution there :(
> > > >
> > > > KT, should I drop the patch entirely, or is there a strong argument for keeping the ETP_FWIDTH_REDUCE around?
> > > > I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE existed.
> > > > Our FW team know nothing about ETP_FWIDTH_REDUCE ether.
> > > >
> > > > The only side effect will happen on Chromebook because such computation have stayed in ChromeOS' kernel for four years.
> > > > Chrome's finger/palm threshold may be different from other Linux distribution.
> > > > We will discuss it with Google once the patch picked by chrome and cause something wrong.
> > >
> > > Chrome has logic that contact with maximum major/minor is treated 
> > > as a palm, so here the driver (which originally came from Chrome 
> > > OS) artificially reduces the contact size to ensure that palm 
> > > rejection logic does not trigger.
> > >
> > > I'm adding Harry to confirm whether we are still using this logic 
> > > and to see if we can adjust it to be something else.
> >
> > I'm not very familiar with our touchpad code, so adding Sean 
> > O'Brien, who is.

