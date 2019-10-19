Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D254DD614
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2019 03:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfJSB7g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 21:59:36 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:53161 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfJSB7g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 21:59:36 -0400
Date:   Sat, 19 Oct 2019 01:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571450372;
        bh=zQWVAXWLYp9EvFOfLtaotaB5R/JfQb5AnLhmiAorc78=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=bc4c74LhxwrRUAFlqIHALaF763By4U5gTv8Y1WPbE+5Ucek/WT2yw2Nisj834LOCH
         UujMWtU/087YczsrfQB9S/NkVK+sqFr98rkP8Tnq7cLIYUdJeINinl90GG8itrKKbA
         ybUnPllkXp1XIlxYWDofhdc79eVMZ43shdoJ7oQk=
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v6 1/2] HID: logitech: Add MX Master over Bluetooth
Message-ID: <_ctOOBM46unM-iL5c36pEP4zeFE8_8KbMqOYERMCDjbAqRkn8S5i8ZVOGegxOgWcyvc9YzCqQT6yITRG8h6YXaELI-KMIrgMFWfFONmusXg=@protonmail.com>
In-Reply-To: <CAO-hwJJ18L3nDMQ_OqCZPyA+FFk3QsnbY=dYSNkELWzTSAnQLA@mail.gmail.com>
References: <ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com>
 <CAO-hwJJ18L3nDMQ_OqCZPyA+FFk3QsnbY=dYSNkELWzTSAnQLA@mail.gmail.com>
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

On Friday, October 18, 2019 11:36 AM, Benjamin Tissoires <benjamin.tissoire=
s@redhat.com> wrote:

> Hi Mazin,
>
> On Mon, Oct 14, 2019 at 8:36 PM Mazin Rezk mnrzk@protonmail.com wrote:
>
> > This patch adds support for the MX Master (b01e and b012) and also adds
> > foundational code for other Bluetooth LE HID++ devices to be added.
> > Some devices do not support short reports and thus have a quirk
> > (HIDPP_QUIRK_MISSING_SHORT_REPORTS) that forces short reports to be sen=
t as
> > long reports. Since all Bluetooth LE HID++ devices seem to act this way=
,
> > HIDPP_QUIRK_CLASS_BLUETOOTH_LE aliases this quirk.
> > To allow for some space for future quirks, I changed the comment that
> > defines the bits reserved for classes from 2...20 to 2..15.
> >
> > Signed-off-by: Mazin Rezk mnrzk@protonmail.com
> >
> > -----------------------------------------------
> >
> > drivers/hid/hid-logitech-hidpp.c | 24 +++++++++++++++++++++++-
> > 1 file changed, 23 insertions(+), 1 deletion(-)
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index 0179f7ed77e5..997b1056850a 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -59,7 +59,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
> > #define HIDPP_QUIRK_CLASS_G920 BIT(3)
> > #define HIDPP_QUIRK_CLASS_K750 BIT(4)
> > -/* bits 2..20 are reserved for classes /
> > +/ bits 2..15 are reserved for classes /
> > +#define HIDPP_QUIRK_MISSING_SHORT_REPORTS BIT(20)
> > / #define HIDPP_QUIRK_CONNECT_EVENTS BIT(21) disabled */#define HIDPP_Q=
UIRK_WTP_PHYSICAL_BUTTONS BIT(22)
> > #define HIDPP_QUIRK_NO_HIDINPUT BIT(23)
> > @@ -81,6 +82,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
> > HIDPP_QUIRK_HI_RES_SCROLL_X2120 | \
> > HIDPP_QUIRK_HI_RES_SCROLL_X2121)
> > +#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPOR=
TS
> > +
> > #define HIDPP_QUIRK_DELAYED_INIT HIDPP_QUIRK_NO_HIDINPUT
> > #define HIDPP_CAPABILITY_HIDPP10_BATTERY BIT(0)
> > @@ -340,6 +343,12 @@ static int hidpp_send_rap_command_sync(struct hidp=
p_device *hidpp_dev,
> > struct hidpp_report *message;
> > int ret, max_count;
> >
> > -         /* Force long reports on devices that do not support short re=
ports */
> >
> >
> > -         if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
> >
> >
> > -             report_id =3D=3D REPORT_ID_HIDPP_SHORT)
> >
> >
> > -                 report_id =3D REPORT_ID_HIDPP_LONG;
> >
> >
>
> Wouldn't it be faster to just store which report needs to be put here
> in struct hidpp_device?
>
> > -
> > -         switch (report_id) {
> >           case REPORT_ID_HIDPP_SHORT:
> >                   max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
> >
> >
> >
> > @@ -3482,6 +3491,12 @@ static bool hidpp_validate_report(struct hid_dev=
ice *hdev, int id,
> > static bool hidpp_validate_device(struct hid_device *hdev)
> > {
> >
> > -         struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> >
> >
> > -         /* Skip the short report check if the device does not support=
 it */
> >
> >
> > -         if (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)
> >
> >
> > -                 return hidpp_validate_report(hdev, REPORT_ID_HIDPP_LO=
NG,
> >
> >
> > -                                              HIDPP_REPORT_LONG_LENGTH=
, false);
> >
> >
> > -
>
> I just merged Andrey's report detection, which means you will need to
> update this hunk:
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=3Df=
or-5.4/upstream-fixes&id=3D905d754c53a522aacf806ea1d3e7c929148c1910
>
> The good thing, is that now you can simply auto-detect if the short
> report is missing. If the returned report_length is null, you know
> that the report is missing (and thus you can remember to set the
> quirk/which report id is needed).
>
> Cheers,
> Benjamin

Thank you, I'll try to rework this patch based on the changes introduced in
that commit.

Thanks,
Mazin

>
> >         return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
> >                                      HIDPP_REPORT_SHORT_LENGTH, false) =
&&
> >                hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> >
> >
> > @@ -3773,6 +3788,13 @@ static const struct hid_device_id hidpp_devices[=
] =3D {
> > { /* MX5500 keyboard over Bluetooth */
> > HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
> > .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> >
> > -         { /* MX Master mouse over Bluetooth */
> >
> >
> > -           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> >
> >
> > -           .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
> >
> >
> > -                          HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> >
> >
> > -         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> >
> >
> > -           .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
> >
> >
> > -                          HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> >           {}
> >
> >
> >
> > };
> > --
> > 2.23.0


