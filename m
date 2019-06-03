Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F70733A05
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 23:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFCVol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 17:44:41 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37153 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfFCVok (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jun 2019 17:44:40 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E0B35220DB;
        Mon,  3 Jun 2019 17:44:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 03 Jun 2019 17:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=fm3; bh=sJt
        vpQ8YjOpkGpI3jG3o8DzEDik537U+60zTVFQ+ys0=; b=aE8seyUSGyaHXH3+i4L
        oV35I4W9JYM+W1eF+mv30VZxIbltvL8Bd1MMmdR0J17aoNg+dELpu+K7AIbqQBcI
        P97vLuAeP1TrVzmuTTtik6yh+ebSJZxHOv5DvKAlcY3J4DeF20d44lKVYZES1s1s
        Ju0hhhHTh9pDa7aplJy8v06CItpsmSKX67H4Dcr2Od00UUdChG0lJl6kz5X/FwD5
        ONbKePcxq8sxEZMileIH2iOGx0J3Cfb5I2gU3WnBrEm/EK7jATs2HXDIpGVVy3rz
        6ukwL+dY4LTLpqHkrRmJOzPT1MbAQfYmrz4scDzGgdPUUyuhfvMsT3Dd90tL9vk8
        Q3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sJtvpQ
        8YjOpkGpI3jG3o8DzEDik537U+60zTVFQ+ys0=; b=InOlRsv+DslFkm9areGgJf
        VXxVP2+GZcPGLv5m6FarnjJIHyDY8B2A+szwE1JEqaBPzRzv04BYtKnEjOOutZgk
        nUebQ7zmG6XVuNpA7RdcihRt0OtmtkrLUVjpiSOv24yd2v8JZ3F/7ODc2YvPVgfU
        41iA/qc3coFeuO+Z0NfhnJPArNfLWn2UX5Zuqy16E8Eo6NPr2fc/T5YLl8PT8t5u
        g/xSvQkzf7HQ7RbQ7R6KhI5wbyGAf/YqluuS1vH0/SG1xbot0O+gvAWFmTF8ZKVf
        J8x5k3ysTCg5lHPTBVPs+VSGkQs+rBiL9Sew0JyHKv7SzFu6+fRS7bqMsggWkf4A
        ==
X-ME-Sender: <xms:x5T1XIJopwmdDhzQPLrmkPfN7n4i4ltRPERpqqztpuQfiihxe4UqUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefkedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertdervdenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecuffhomhgrihhnpehpvggurhhovhgrnhiivghllhgrrdgtohhmpdhkvghrnhgvlhdr
    ohhrghenucfkphepjedtrddvjedrvdejrddugeelnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehpvggurhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptd
X-ME-Proxy: <xmx:x5T1XFhChO6a-kokg4xZnKUdMTkTmFYDgYvLusqtRJ2xWK_llnScIA>
    <xmx:x5T1XEtE7a9G2Botqh4H1VeDtSlyfNh2v4wmtIdijdPSwWQZT5KfpA>
    <xmx:x5T1XJH4T7Q2vuNMYuKTN7jt3bKxYpxGqxeIDJq3leXqvNujlJML1Q>
    <xmx:x5T1XBKF6ydfyU_2sJe3x1YdwaZWKYeTn5BvO7S8YJazSMVGer7QQQ>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 50875380084;
        Mon,  3 Jun 2019 17:44:39 -0400 (EDT)
Date:   Mon, 3 Jun 2019 17:44:38 -0400
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: hid-logitech-hidpp: detect wireless lightspeed
 devices
Message-ID: <20190603214438.2cnmrx7g2sakjdr4@Fenrir>
References: <20190528162924.32754-1-pedro@pedrovanzella.com>
 <CAO-hwJ+zAvDizJRpykky+D3pf1M1NhFGWztwyA4mJEv8C+nO-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="il23bg2tbeerivkt"
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+zAvDizJRpykky+D3pf1M1NhFGWztwyA4mJEv8C+nO-w@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--il23bg2tbeerivkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/28, Benjamin Tissoires wrote:
> On Tue, May 28, 2019 at 6:30 PM Pedro Vanzella <pedro@pedrovanzella.com> =
wrote:
> >
> > Send a low device index when the device is connected via the lightspeed
> > receiver so that the receiver will pass the message along to the device
> > instead of responding. If we don't do that, we end up thinking it's a
> > hidpp10 device and miss out on all new features available to newer devi=
ces.
> >
> > This will enable correct detection of the following models:
> > G603, GPro, G305, G613, G900 and G903, and possibly others.
>=20
> Thanks for the patch.
Thanks for reviewing it :)

> However, there is already support for this receiver in Linus' tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/hid/hid-logitech-dj.c?id=3Df5fb57a74e88bd1788f57bf77d587c91d4dc9d57
>=20
> With kernel 5.2-rc1, the connected device should already be handled by
> hid-logitech-hidpp :)
Why are the wireless receivers handled by hid-logitech-dj and the wired
mice handled by hid-logitech-hidpp? They are, in the end, all hidpp
devices, and having them all handled by the -hidpp driver with a quirk
class would allow us to check for support for the battery voltage
feature, as it seems to be an either-or scenario here.

- Pedro
>=20
> Cheers,
> Benjamin
>=20
> >
> > Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index 72fc9c0566db..621fce141d9f 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -62,6 +62,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
> >  #define HIDPP_QUIRK_CLASS_K400                 BIT(2)
> >  #define HIDPP_QUIRK_CLASS_G920                 BIT(3)
> >  #define HIDPP_QUIRK_CLASS_K750                 BIT(4)
> > +#define HIDPP_QUIRK_CLASS_LIGHTSPEED           BIT(5)
> >
> >  /* bits 2..20 are reserved for classes */
> >  /* #define HIDPP_QUIRK_CONNECT_EVENTS          BIT(21) disabled */
> > @@ -236,7 +237,11 @@ static int __hidpp_send_report(struct hid_device *=
hdev,
> >          * set the device_index as the receiver, it will be overwritten=
 by
> >          * hid_hw_request if needed
> >          */
> > -       hidpp_report->device_index =3D 0xff;
> > +       if (hidpp->quirks & HIDPP_QUIRK_CLASS_LIGHTSPEED) {
> > +               hidpp_report->device_index =3D 0x01;
> > +       } else {
> > +               hidpp_report->device_index =3D 0xff;
> > +       }
> >
> >         if (hidpp->quirks & HIDPP_QUIRK_FORCE_OUTPUT_REPORTS) {
> >                 ret =3D hid_hw_output_report(hdev, (u8 *)hidpp_report, =
fields_count);
> > @@ -3753,6 +3758,9 @@ static const struct hid_device_id hidpp_devices[]=
 =3D {
> >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
> >         { /* Logitech G900 Gaming Mouse over USB */
> >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
> > +       { /* Logitech Gaming Mice over Lightspeed Receiver */
> > +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC539),
> > +         .driver_data =3D HIDPP_QUIRK_CLASS_LIGHTSPEED },
> >         { /* Logitech G920 Wheel over USB */
> >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH=
_G920_WHEEL),
> >                 .driver_data =3D HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_F=
ORCE_OUTPUT_REPORTS},
> > --
> > 2.21.0
> >

--=20
Pedro Vanzella
pedrovanzella.com
#include <paranoia.h>
Don't Panic

--il23bg2tbeerivkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEXrNKwhI/eDFBCGo3v5huqi4pBxkFAlz1lLUACgkQv5huqi4p
Bxk2IRAAhZ/xJZ8uT7NGw8Ix8cOQJ4kqLzZbTv/jr2a9FAs8y4tj22VBKoo1zNwo
hyQuvToImgP6Tnql+l/SyTWoG14n6GBnmCv2CUy6rNpt7yBlr1w2UuYzIw+bHsN4
DEwjNg0RjM5o5fNHGDUzRz1+WuZDNVDmGYdWeg4PLw1aK3TXbqTQBXaqq5xHZTLx
MF1ZxwGD1+Cyp4gCwn/Rns50/hM9iDg1mUg9L2VrlSkuSHWWhD2WEprovd2fe2xD
ELV/fu88M8Y2SF2HqWD57hQCGnqG0nsRCdcCV7wC7n1mjqvQFIBnPkx5dm2RJYan
ubarZ3Qt/B0F9bfC3S2b74YNCUxFMtm+iWcg+4SI2g4uDCBA64HfJtsL67mb5IbA
q4JW7wyJH83stHNFwFNgWio3q4jmrlEaB06xQ7joeT+w/79Gs/Y0zRWiGLBX3PGT
yZWNojwJU7T3wLwlm/yASFFXmg1HiG2VuQkzJGamsbil1XnEIXxPR1O41zN50cym
IlS4T4ciBfymVhYNOwPpUwxRVLW1EG3aurBurx9QAssKKc9ho4LbnZP5o9xlPowl
TflW78Cr9ga4AJUZZzxW0ptxeqM0HHxYAX1eBfn2MsWnQjW4TI3gw9yOXtQk7sA3
96uiUjrYY3PNzKAhc5x00v4QbtGO7npEnCm9XHedEc/RaVHvilo=
=fbNq
-----END PGP SIGNATURE-----

--il23bg2tbeerivkt--
