Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DEACD8E7
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfJFT2b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 15:28:31 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:37942 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfJFT2b (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Oct 2019 15:28:31 -0400
Date:   Sun, 06 Oct 2019 19:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570390107;
        bh=eLr2asDOZk0DHpyA351fyD4ZW2RIKecuZeCi+fGozT8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=YhMvNFLa0sNMU76BXyAoObOhT65D8+TiMi/yxdZen7HCkPxMU1VKsowOHvSl7L+v+
         2QebtJqQUVzKv2MwVSKs7djoDMJXvpF/j25X3bTkmFLsDGdEcI6UMru28EfoDffQgA
         FJcmi/FwLWlvvoP2afQnNwVY+GoDjeMoTE4mSXek=
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v3 1/4] HID: logitech: Add MX Mice over Bluetooth
Message-ID: <QMxjGmunHBsFEzGT_Rvct9Js9waw864G7YEo0Mbwq26LiPSHToudSLe6NYOT52Dh2OaIN3UtroKbyPR_I-_H347ThvaNilMWXAR_ggKmX9E=@protonmail.com>
In-Reply-To: <c440435a1fb8a04a9fca83f17b7cc1ebb95bcc44.camel@archlinux.org>
References: <l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com>
 <c440435a1fb8a04a9fca83f17b7cc1ebb95bcc44.camel@archlinux.org>
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

On Sunday, October 6, 2019 11:07 AM, Filipe La=C3=ADns <lains@archlinux.org=
> wrote:

> On Sun, 2019-10-06 at 01:04 +0000, Mazin Rezk wrote:
>
> > This patch adds support for several MX mice over Bluetooth. The device =
IDs
> > have been copied from the libratbag device database and their features
> > have been based on their DJ device counterparts.
> >
> > Signed-off-by: Mazin Rezk mnrzk@protonmail.com
> >
> > -----------------------------------------------
> >
> > drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
> > 1 file changed, 18 insertions(+)
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index 0179f7ed77e5..85fd0c17cc2f 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -3773,6 +3773,24 @@ static const struct hid_device_id hidpp_devices[=
] =3D {
> > { /* MX5500 keyboard over Bluetooth */
> > HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
> > .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> >
> > -   { /* MX Anywhere 2 mouse over Bluetooth */
> > -   HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { /* MX Anywhere 2S mouse over Bluetooth */
> > -   HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { /* MX Master mouse over Bluetooth */
> > -   HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > -   { /* MX Master 2S mouse over Bluetooth */
> > -   HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> > -   .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >     {}
> >     };
> >
> >
> > --
> > 2.23.0
>
> I think you should only add the mice you tested. We are not sure if
> this devices actually do work properly with the current stack. I will
> try to test some devices after Tuesday.
>
> Filipe La=C3=ADns

I have only really been able to test this patch on the MX Master (0xb01e).
However, I suspect that many of the added devices work in a similar way.
I could completely remove the devices I have not tested but I feel like it
would be better if we somehow kept track of what devices have been tested.

