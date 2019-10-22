Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412A7E0A58
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 19:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbfJVRQx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 13:16:53 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:31521 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730658AbfJVRQw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 13:16:52 -0400
Date:   Tue, 22 Oct 2019 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571764607;
        bh=RgAmevJJ1qewaLeg/leiJzsVk2HdOJ+IKFqOdpfGz6U=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=tlZcCGJ7+W3I/BSSnuRSnrjZLTISv0g0mwES0rqy5n3Go0WxVIyrb3AdIQ2OXASEf
         keIzsAStniqfBzZjcyU4rM0s224GNSFHx2RtKDEi/l//2ZtamN319VRtfguPkvZwHO
         FxA2d+N1Smd9plLyIYotG/AppwSLh4oZYg0hSdOA=
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v7 1/3] HID: logitech-hidpp: Support translations from short to long reports
Message-ID: <Sv9QmUty0l3Mfamc_yPNDn845NI5FtXorIvBK_ZUmnvwZliG3XxY4oHzKPXyqveCnhS5qUU52upJfccI07L2AEyVy75wA-7D4ZbE3Fz3U9s=@protonmail.com>
In-Reply-To: <CAO-hwJKmZX8MksRvXC=iyG_eaDxmr3N4tRM_moACxX1aNYSokg@mail.gmail.com>
References: <rzUqln0ASGmn_QTpqCkke6UzMFQDj2H7fIngMOxQwtiX52PkWc_BbxkGy4XcIm7kaVcQHwAYhO7ITZoMotLSHw_2WZre9_QJBDhXoMPTLsw=@protonmail.com>
 <CAO-hwJKmZX8MksRvXC=iyG_eaDxmr3N4tRM_moACxX1aNYSokg@mail.gmail.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday, October 22, 2019 6:15 AM, Benjamin Tissoires <benjamin.tissoire=
s@redhat.com> wrote:

> Hi Mazin,
>
> On Sun, Oct 20, 2019 at 6:41 AM Mazin Rezk mnrzk@protonmail.com wrote:
>
> > This patch allows short reports to be translated into long reports.
> > hidpp_validate_device now returns a u8 instead of a bool which represen=
ts
> > the supported reports. The corresponding bits (i.e.
> > HIDPP_REPORT_*_SUPPORTED) are set if an HID++ report is supported.
> > If a short report is being sent and the device does not support it, it =
is
> > instead sent as a long report.
> > Thanks,
> > Mazin
> >
> > Signed-off-by: Mazin Rezk mnrzk@protonmail.com
> >
> > -----------------------------------------------
>
> Yep, I like this patch much better.
>
> I also tested the 0xb012 MX Master, and it now works like a charm :)
>
> nitpick: can you squash the next patch into this one? Because to be
> useful, this patch really need one or 2 supported devices.

I'll do that in v8 but I'm just going to wait until this patch is tested
more so I can see what other changes I need to make before the patch is
finalised.

Thanks,
Mazin

>
> Cheers,
> Benjamin
>
> > drivers/hid/hid-logitech-hidpp.c | 25 +++++++++++++++++++------
> > 1 file changed, 19 insertions(+), 6 deletions(-)
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index e9bba282f9c1..ee604b17514f 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -49,6 +49,10 @@ MODULE_PARM_DESC(disable_tap_to_click,
> > #define HIDPP_REPORT_LONG_LENGTH 20
> > #define HIDPP_REPORT_VERY_LONG_MAX_LENGTH 64
> > +#define HIDPP_REPORT_SHORT_SUPPORTED BIT(0)
> > +#define HIDPP_REPORT_LONG_SUPPORTED BIT(1)
> > +#define HIDPP_REPORT_VERY_LONG_SUPPORTED BIT(2)
> > +
> > #define HIDPP_SUB_ID_CONSUMER_VENDOR_KEYS 0x03
> > #define HIDPP_SUB_ID_ROLLER 0x05
> > #define HIDPP_SUB_ID_MOUSE_EXTRA_BTNS 0x06
> > @@ -183,6 +187,7 @@ struct hidpp_device {
> >
> >         unsigned long quirks;
> >         unsigned long capabilities;
> >
> >
> > -         u8 supported_reports;
> >
> >           struct hidpp_battery battery;
> >           struct hidpp_scroll_counter vertical_wheel_counter;
> >
> >
> >
> > @@ -340,6 +345,11 @@ static int hidpp_send_rap_command_sync(struct hidp=
p_device *hidpp_dev,
> > struct hidpp_report *message;
> > int ret, max_count;
> >
> > -         /* Send as long report if short reports are not supported. */
> >
> >
> > -         if (report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
> >
> >
> > -             !(hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPO=
RTED))
> >
> >
> > -                 report_id =3D REPORT_ID_HIDPP_LONG;
> >
> >
> > -         switch (report_id) {
> >           case REPORT_ID_HIDPP_SHORT:
> >                   max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
> >
> >
> >
> > @@ -3458,10 +3468,11 @@ static int hidpp_get_report_length(struct hid_d=
evice *hdev, int id)
> > return report->field[0]->report_count + 1;
> > }
> > -static bool hidpp_validate_device(struct hid_device *hdev)
> > +static u8 hidpp_validate_device(struct hid_device *hdev)
> > {
> > struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> >
> > -         int id, report_length, supported_reports =3D 0;
> >
> >
> >
> > -         int id, report_length;
> >
> >
> > -         u8 supported_reports =3D 0;
> >
> >           id =3D REPORT_ID_HIDPP_SHORT;
> >           report_length =3D hidpp_get_report_length(hdev, id);
> >
> >
> >
> > @@ -3469,7 +3480,7 @@ static bool hidpp_validate_device(struct hid_devi=
ce *hdev)
> > if (report_length < HIDPP_REPORT_SHORT_LENGTH)
> > goto bad_device;
> >
> > -                 supported_reports++;
> >
> >
> >
> > -                 supported_reports |=3D HIDPP_REPORT_SHORT_SUPPORTED;
> >           }
> >
> >           id =3D REPORT_ID_HIDPP_LONG;
> >
> >
> >
> > @@ -3478,7 +3489,7 @@ static bool hidpp_validate_device(struct hid_devi=
ce *hdev)
> > if (report_length < HIDPP_REPORT_LONG_LENGTH)
> > goto bad_device;
> >
> > -                 supported_reports++;
> >
> >
> >
> > -                 supported_reports |=3D HIDPP_REPORT_LONG_SUPPORTED;
> >           }
> >
> >           id =3D REPORT_ID_HIDPP_VERY_LONG;
> >
> >
> >
> > @@ -3488,7 +3499,7 @@ static bool hidpp_validate_device(struct hid_devi=
ce *hdev)
> > report_length > HIDPP_REPORT_VERY_LONG_MAX_LENGTH)
> > goto bad_device;
> >
> > -                 supported_reports++;
> >
> >
> >
> > -                 supported_reports |=3D HIDPP_REPORT_VERY_LONG_SUPPORT=
ED;
> >                   hidpp->very_long_report_length =3D report_length;
> >           }
> >
> >
> >
> > @@ -3536,7 +3547,9 @@ static int hidpp_probe(struct hid_device *hdev, c=
onst struct hid_device_id id)
> > /* Make sure the device is HID++ capable, otherwise treat as generic HI=
D
> > */
> >
> > -         if (!hidpp_validate_device(hdev)) {
> >
> >
> >
> > -         hidpp->supported_reports =3D hidpp_validate_device(hdev);
> >
> >
> > -
> > -         if (!hidpp->supported_reports) {
> >                   hid_set_drvdata(hdev, NULL);
> >                   devm_kfree(&hdev->dev, hidpp);
> >                   return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> >
> >
> >
> > --
> > 2.23.0
