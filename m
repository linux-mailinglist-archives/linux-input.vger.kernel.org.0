Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16005C21EB
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 15:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731265AbfI3NZB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 09:25:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:52818 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728214AbfI3NZB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 09:25:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E1014AC81;
        Mon, 30 Sep 2019 13:24:58 +0000 (UTC)
Message-ID: <ead91241ad2bba8db120d0a5e583184b5cfb22a1.camel@suse.de>
Subject: Re: [PATCH] HID: core: add usage_page_preceding flag for
 hid_concatenate_usage_page()
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Candle Sun <candlesea@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, chunyan.zhang@unisoc.com,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Date:   Mon, 30 Sep 2019 15:24:57 +0200
In-Reply-To: <CAO-hwJLrQTp7qeMpQvF7429a0qisAe-=zLFRtY79ajhLtusdRg@mail.gmail.com>
References: <1569830949-10771-1-git-send-email-candlesea@gmail.com>
         <CAO-hwJLrQTp7qeMpQvF7429a0qisAe-=zLFRtY79ajhLtusdRg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-x3TYOl9kQALXdVOQfPp6"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-x3TYOl9kQALXdVOQfPp6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 11:36 +0200, Benjamin Tissoires wrote:
> Hi,
>=20
> [also addingg Nicolas, the author of 58e75155009c]

Thanks!

>=20
> On Mon, Sep 30, 2019 at 10:10 AM Candle Sun <candlesea@gmail.com> wrote:
> > From: Candle Sun <candle.sun@unisoc.com>
> >=20
> > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > to Main item") adds support for Usage Page item following Usage items
> > (such as keyboards manufactured by Primax).
> >=20
> > Usage Page concatenation in Main item works well for following report
> > descriptor patterns:
> >=20
> >     USAGE_PAGE (Keyboard)                   05 07
> >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (8)                        95 08
> >     INPUT (Data,Var,Abs)                    81 02
> >=20
> > -------------
> >=20
> >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (8)                        95 08
> >     USAGE_PAGE (Keyboard)                   05 07
> >     INPUT (Data,Var,Abs)                    81 02
> >=20
> > But it makes the parser act wrong for the following report
> > descriptor pattern(such as some Gamepads):
> >=20
> >     USAGE_PAGE (Button)                     05 09
> >     USAGE (Button 1)                        09 01
> >     USAGE (Button 2)                        09 02
> >     USAGE (Button 4)                        09 04
> >     USAGE (Button 5)                        09 05
> >     USAGE (Button 7)                        09 07
> >     USAGE (Button 8)                        09 08
> >     USAGE (Button 14)                       09 0E
> >     USAGE (Button 15)                       09 0F
> >     USAGE (Button 13)                       09 0D
> >     USAGE_PAGE (Consumer Devices)           05 0C
> >     USAGE (Back)                            0a 24 02
> >     USAGE (HomePage)                        0a 23 02
> >     LOGICAL_MINIMUM (0)                     15 00
> >     LOGICAL_MAXIMUM (1)                     25 01
> >     REPORT_SIZE (1)                         75 01
> >     REPORT_COUNT (11)                       95 0B
> >     INPUT (Data,Var,Abs)                    81 02
> >=20
> > With Usage Page concatenation in Main item, parser recognizes all the
> > 11 Usages as consumer keys, it is not the HID device's real intention.
> >=20
> > This patch adds usage_page_preceding flag to detect the third pattern.
> > Usage Page concatenation is done in both Local and Main parsing.
> > If usage_page_preceding equals 3(the third pattern encountered),
> > hid_concatenate_usage_page() is jumped.
>=20
> For anything core related (and especially the parsing), I am trying to
> enforce having regression tests.
> See https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/37
> for the one related to 58e75155009c.
>=20
> So I would like to have a similar-ish MR adding the matching tests so
> I know we won't break this in the future.
>=20
> Few other comments in the code:
>=20
> > Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> > Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> > ---
> >  drivers/hid/hid-core.c | 21 +++++++++++++++++++--
> >  include/linux/hid.h    |  1 +
> >  2 files changed, 20 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c..043a232 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -221,7 +221,15 @@ static int hid_add_usage(struct hid_parser *parser=
,
> > unsigned usage, u8 size)
> >                 hid_err(parser->device, "usage index exceeded\n");
> >                 return -1;
> >         }
> > -       parser->local.usage[parser->local.usage_index] =3D usage;
> > +       if (!parser->local.usage_index && parser->global.usage_page)
>=20
> parser->global.usage_page is never reset, so unless I am misreading,
> it will always be set to a value except for the very first elements.
> I am just raising this in case you rely on global.usage_page being
> null in your algorithm.
>=20
> > +               parser->local.usage_page_preceding =3D 1;
> > +       if (parser->local.usage_page_preceding =3D=3D 2)
> > +               parser->local.usage_page_preceding =3D 3;
>=20
> Can't we use an enum at least for those 1, 2, 3 values?
> Unless you are counting the previous items, in which we should rename
> the field .usage_page_preceding with something more explicit IMO.
>=20
>=20
> > +       if (size <=3D 2 && parser->global.usage_page)
> > +               parser->local.usage[parser->local.usage_index] =3D
> > +                       (usage & 0xffff) + (parser->global.usage_page <=
<
> > 16);
>=20
> we could use a function as this assignment is also reused in
> hid_concatenate_usage_page()
>=20
> > +       else
> > +               parser->local.usage[parser->local.usage_index] =3D usag=
e;
> >         parser->local.usage_size[parser->local.usage_index] =3D size;
> >         parser->local.collection_index[parser->local.usage_index] =3D
> >                 parser->collection_stack_ptr ?
> > @@ -366,6 +374,8 @@ static int hid_parser_global(struct hid_parser *par=
ser,
> > struct hid_item *item)
> >=20
> >         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> >                 parser->global.usage_page =3D item_udata(item);
> > +               if (parser->local.usage_page_preceding =3D=3D 1)
> > +                       parser->local.usage_page_preceding =3D 2;
> >                 return 0;
> >=20
> >         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > @@ -547,9 +557,16 @@ static void hid_concatenate_usage_page(struct
> > hid_parser *parser)
> >  {
> >         int i;
> >=20
> > +       if (parser->local.usage_page_preceding =3D=3D 3) {
> > +               dbg_hid("Using preceding usage page for final usage\n")=
;
> > +               return;
> > +       }
> > +
> >         for (i =3D 0; i < parser->local.usage_index; i++)
> >                 if (parser->local.usage_size[i] <=3D 2)
> > -                       parser->local.usage[i] +=3D parser->global.usag=
e_page
> > << 16;
> > +                       parser->local.usage[i] =3D
> > +                               (parser->global.usage_page << 16)
> > +                               + (parser->local.usage[i] & 0xffff);
>=20
> I find the whole logic really hard to follow. I'm not saying you are
> wrong, but if it's hard to get the concepts behind the various states
> and this will make it really prone to future errors.
>=20
> I wonder if we should not:
> - store the current usage page in the current local item as they come in
> - then in hid_concatenate_usage_page() iterate over the usages in
> reverse order. We should be able to detect if the last usage page was
> given for the whole previous range (i.e. not assigned to any local
> usage) or if it has already been given to a local usage, meaning we
> should just keep things as it is.

I agree this would be simpler to understand. All this would also fix:
https://lkml.org/lkml/2019/6/14/468

I suggest we agree on a rule of thumb and add it as a code comment. My take=
 on
it would be:

"Usage pages are always concatenated upon parsing a local usage. If a usage
page is defined after the local usages ennumeration, we concatenate this us=
age
page with all the local usages.

This excludes the case were a usage page is set in between the local usages
and then another usage page is set just before the main item. That said I d=
oubt
we'll ever see that one, as it makes no sense. FWIW we could still detect i=
t.

Just my two cents,
regards,
Nicolas


--=-x3TYOl9kQALXdVOQfPp6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2SAikACgkQlfZmHno8
x/7joAf/Sv7mW7YXcc4bnFvFMyotC625VYMI8OTger5MkbmN7HHOPSIQP1Dw7fsi
WF5VkW7zI4axGy9AKYLihpn0pjAuMxJYtC4mPm5YUhQaiN2BtD+CdOKD7+spz89Q
8/Tcb8SBXoevGa+Tgk40Q7spvLq57/yNycBgF02vSDpF1G0W7cv2wj078JZDgnoH
sZWQ+ounxaMQQNoPgiq/2cuDSq8+b02QXX7H2Geh98zwh2DnVQTV03VMm1MI64/p
vILE99vid6pABXcHz/UpiTBhmC2aL77sdsUBG9t1M1lcpyyarAHpK2r1EanehK4M
d9kdrBYsyu4RA6Wq5vVIf2x3hN9OHg==
=NZuG
-----END PGP SIGNATURE-----

--=-x3TYOl9kQALXdVOQfPp6--

