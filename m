Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6C238BAC4
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 02:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbhEUA1n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 20:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbhEUA1m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 20:27:42 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B250AC061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 17:26:19 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y36so8618888ybi.11
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 17:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ChQe5IeIhKGatw5BC3fuQuRrQAWN7AfrS81g1xWvOnI=;
        b=LuWWe1o3MSvTh558YI+poYQtpcLOw10fWBbKk9e1i3gg/nP52WZSFtSQD2S90EL2oO
         rRMlj8QdmPturLVV1pvaPkisP+sZKqp70p5cSoZgbOmWOZEdtBkBMBol0DQxopoPfHqI
         iNglQrvAwwvzMNo9hYLmnHgbjgbEhe/WBhti51id2eayH0Binpv8/6n6tAVRoZxw6F7P
         3Heo+lDYu7AvNixnFjm8YjI9fJDWHRnAu16IGfmRO87MF45XFXwmKee8jkW2A5zomzKQ
         cRgupyjCD/hTUnBwlgxVNfkAYTVwj3BCN0LxHHzFnDHLTEQkrFJhbPxQkl6yfQLZvzy/
         0AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ChQe5IeIhKGatw5BC3fuQuRrQAWN7AfrS81g1xWvOnI=;
        b=l/YIltrjw2d+65Z1MXny+DWPPmUZmWskvHYeJkrexb0nMoj+Y1lYE9QyVxKD3ME2Pg
         GkrD2/5nxhsvtboI1MalpTVrT91HZsmIvvPtn5qHL8v4NH0iIXbwA2W/eMwPLbxs/ZO8
         mKWk0UgSdRwiPswTBB5g8UYYKKsaCs0yjDtsTXp8jC/D+gpNUiACilfA8yTJlAfEAyP1
         GUUbB68WhLbSEFEUxIBTFV2cN4c0TE/Ix6ARtq+LZLmim/GqaqTluWwMjD01so6Bp8mz
         hau95UXLhb5HWqZFWF7lAIj/aFS/U4mtOmEE4+6oAVrV6H6bce2qNABxBgaBc3YfIn+x
         DGeA==
X-Gm-Message-State: AOAM530NrCpVBbhbkBRNYVL/qgRqkqmRrmjm3wPikdbjgWKMH9R9Nx5l
        x6/YjKacA4Ogs9qgWsIZMQfAiVFMyZl2kis+b6c=
X-Google-Smtp-Source: ABdhPJxjJbarFixZgYThjPZAswhB74nDypR+fwZGwHRZ1CXWN7Wbx0xy6x2Janzpjsx7CCrmKzP8IFfPD1PXQal/+4k=
X-Received: by 2002:a05:6902:1002:: with SMTP id w2mr10785525ybt.392.1621556778849;
 Thu, 20 May 2021 17:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210520224715.680919-1-djogorchock@gmail.com>
 <20210520224715.680919-3-djogorchock@gmail.com> <JmOBKlghm4cLX975NtZzvyo0noT7YpLXsF47QOmXgkpcVPDewimvG68AK6ShwTfKbbwSV7KxngcFbec8VaocAwcakJaolv14oUtyu8uwhtg=@protonmail.com>
In-Reply-To: <JmOBKlghm4cLX975NtZzvyo0noT7YpLXsF47QOmXgkpcVPDewimvG68AK6ShwTfKbbwSV7KxngcFbec8VaocAwcakJaolv14oUtyu8uwhtg=@protonmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 20 May 2021 17:26:07 -0700
Message-ID: <CAEc3jaDMkKiHBWx62PKgWhG7sa6aJrAW6xNFk0KHgA7FfLsW_A@mail.gmail.com>
Subject: Re: [PATCH v13 02/15] HID: nintendo: add player led support
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "blaws05@gmail.com" <blaws05@gmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "Roderick.Colenbrander@sony.com" <Roderick.Colenbrander@sony.com>,
        "svv@google.com" <svv@google.com>,
        "s.jegen@gmail.com" <s.jegen@gmail.com>,
        "carmueller@gmail.com" <carmueller@gmail.com>,
        "pgriffais@valvesoftware.com" <pgriffais@valvesoftware.com>,
        "hadess@hadess.net" <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s and Daniel,

I agree with Barnab=C3=A1s in regards to LED naming. Earlier this year for
the new "hid-playstation" driver we ran into issues in regards to the
naming scheme of LEDs moving forward (see some of the archived
threads). I still have to address this for "hid-playstation", but
didn't get to submitting the changes yet due to paternity leave. I did
implement a proof-of-concept, which I can probably clean up over the
next few days.

Basically the LED team would like LEDs to follow the naming scheme
"devicename:color:function" instead of legacy names containing mac
addresses or other strings.

There are 2 issues. One is the "devicename", where there is not
necessarily a clear mapping in particular for device with multiple
functions such as DualShock 4 / DualSense / Joycons. The suggested
name was to use the 'hid device name' something with the bus, device
etcetera numbers in there. I need to check the email thread on what
Benjamin suggested there.

The second issue is the "function" part of the the naming scheme. The
current official naming is like "LED_FUNCTION_DISK" and others as
defined by "include/dt-bindings/leds/common.h". I was proposing to
have a new player type "LED_FUNCTION_PLAYER", which is what the
Nintendo controller would need as well.

I will try to clean up PoC version of my patches and include you on
the thread as well.

Thanks,
Roderick

On Thu, May 20, 2021 at 4:35 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
> please cc the linux-leds mailing list and the appropriate subsystem maint=
ainers
> at least on the relevant patches.
>
>
> 2021. m=C3=A1jus 21., p=C3=A9ntek 0:47 keltez=C3=A9ssel, Daniel J. Ogorch=
ock =C3=ADrta:
>
> > This patch adds led_classdev functionality to the switch controller
> > driver. It adds support for the 4 player LEDs. The Home Button LED stil=
l
> > needs to be supported on the pro controllers and right joy-con.
> >
> > Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> > ---
> >  drivers/hid/Kconfig        |  2 +
> >  drivers/hid/hid-nintendo.c | 95 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 95 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 1f23e84f8bdf3..86a6129d3d89f 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -722,6 +722,8 @@ config HID_MULTITOUCH
> >  config HID_NINTENDO
> >       tristate "Nintendo Joy-Con and Pro Controller support"
> >       depends on HID
> > +     depends on NEW_LEDS
> > +     depends on LEDS_CLASS
> >       help
> >       Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
> >       All controllers support bluetooth, and the Pro Controller also su=
pports
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index b6c0e5e36d8b0..c21682b4a2e62 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/device.h>
> >  #include <linux/hid.h>
> >  #include <linux/input.h>
> > +#include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/spinlock.h>
> >
> > @@ -183,11 +184,13 @@ struct joycon_input_report {
> >  } __packed;
> >
> >  #define JC_MAX_RESP_SIZE     (sizeof(struct joycon_input_report) + 35)
> > +#define JC_NUM_LEDS          4
>
> I think it'd be better if you could guarantee that `JC_NUM_LEDS` and
> size of the `joycon_player_led_names` won't go out of sync. E.g.
> define `JC_NUM_LEDS` in terms of ARRAY_SIZE(), use static_assert(), etc.
>
>
> >
> >  /* Each physical controller is associated with a joycon_ctlr struct */
> >  struct joycon_ctlr {
> >       struct hid_device *hdev;
> >       struct input_dev *input;
> > +     struct led_classdev leds[JC_NUM_LEDS];
> >       enum joycon_ctlr_state ctlr_state;
> >
> >       /* The following members are used for synchronous sends/receives =
*/
> > @@ -553,11 +556,9 @@ static const unsigned int joycon_dpad_inputs_jc[] =
=3D {
> >       BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
> >  };
> >
> > -static DEFINE_MUTEX(joycon_input_num_mutex);
> >  static int joycon_input_create(struct joycon_ctlr *ctlr)
> >  {
> >       struct hid_device *hdev;
> > -     static int input_num =3D 1;
> >       const char *name;
> >       int ret;
> >       int i;
> > @@ -643,6 +644,66 @@ static int joycon_input_create(struct joycon_ctlr =
*ctlr)
> >       if (ret)
> >               return ret;
> >
> > +     return 0;
> > +}
> > +
> > +static int joycon_player_led_brightness_set(struct led_classdev *led,
> > +                                         enum led_brightness brightnes=
s)
> > +{
> > +     struct device *dev =3D led->dev->parent;
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct joycon_ctlr *ctlr;
> > +     int val =3D 0;
> > +     int i;
> > +     int ret;
> > +     int num;
> > +
> > +     ctlr =3D hid_get_drvdata(hdev);
> > +     if (!ctlr) {
> > +             hid_err(hdev, "No controller data\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     /* determine which player led this is */
> > +     for (num =3D 0; num < JC_NUM_LEDS; num++) {
> > +             if (&ctlr->leds[num] =3D=3D led)
> > +                     break;
> > +     }
> > +     if (num >=3D JC_NUM_LEDS)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&ctlr->output_mutex);
> > +     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > +             if (i =3D=3D num)
> > +                     val |=3D brightness << i;
> > +             else
> > +                     val |=3D ctlr->leds[i].brightness << i;
> > +     }
> > +     ret =3D joycon_set_player_leds(ctlr, 0, val);
> > +     mutex_unlock(&ctlr->output_mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static const char * const joycon_player_led_names[] =3D {
> > +     "player1",
> > +     "player2",
> > +     "player3",
> > +     "player4"
>
> Small thing: after non-sentinel values at the end the comma is usually no=
t omitted.
>
>
> > +};
> > +
> > +static DEFINE_MUTEX(joycon_input_num_mutex);
> > +static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
> > +{
> > +     struct hid_device *hdev =3D ctlr->hdev;
> > +     struct device *dev =3D &hdev->dev;
> > +     const char *d_name =3D dev_name(dev);
> > +     struct led_classdev *led;
> > +     char *name;
> > +     int ret =3D 0;
> > +     int i;
> > +     static int input_num =3D 1;
> > +
> >       /* Set the default controller player leds based on controller num=
ber */
> >       mutex_lock(&joycon_input_num_mutex);
> >       mutex_lock(&ctlr->output_mutex);
> > @@ -650,6 +711,29 @@ static int joycon_input_create(struct joycon_ctlr =
*ctlr)
> >       if (ret)
> >               hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", re=
t);
> >       mutex_unlock(&ctlr->output_mutex);
> > +
> > +     /* configure the player LEDs */
> > +     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > +             name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name,
>
> This does not seem to be an appropriate name for an LED class device.
> See Documentation/leds/leds-class.rst.
>
>
> > +                                   joycon_player_led_names[i]);
> > +             if (!name)
> > +                     return -ENOMEM;
> > +
> > +             led =3D &ctlr->leds[i];
> > +             led->name =3D name;
> > +             led->brightness =3D ((i + 1) <=3D input_num) ? LED_ON : L=
ED_OFF;
> > +             led->max_brightness =3D LED_ON;
>
> LED_{ON,OFF,...} constants have been deprecated to the best of my knowled=
ge,
> use integer values as appropriate.
>
>
> > +             led->brightness_set_blocking =3D
> > +                                     joycon_player_led_brightness_set;
> > +             led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> > +
> > +             ret =3D devm_led_classdev_register(&hdev->dev, led);
> > +             if (ret) {
> > +                     hid_err(hdev, "Failed registering %s LED\n", led-=
>name);
> > +                     break;
> > +             }
> > +     }
> > +
> >       if (++input_num > 4)
> >               input_num =3D 1;
> >       mutex_unlock(&joycon_input_num_mutex);
> > @@ -813,6 +897,13 @@ static int nintendo_hid_probe(struct hid_device *h=
dev,
> >
> >       mutex_unlock(&ctlr->output_mutex);
> >
> > +     /* Initialize the leds */
> > +     ret =3D joycon_player_leds_create(ctlr);
> > +     if (ret) {
> > +             hid_err(hdev, "Failed to create leds; ret=3D%d\n", ret);
> > +             goto err_close;
> > +     }
> > +
> >       ret =3D joycon_input_create(ctlr);
> >       if (ret) {
> >               hid_err(hdev, "Failed to create input device; ret=3D%d\n"=
, ret);
> > --
> > 2.31.1
> >
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze
