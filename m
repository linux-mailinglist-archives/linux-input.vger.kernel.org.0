Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E074FD14BF
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 19:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfJIRBx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 13:01:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:32960 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730546AbfJIRBx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Oct 2019 13:01:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9B4DDAFBF;
        Wed,  9 Oct 2019 17:01:50 +0000 (UTC)
Message-ID: <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Candle Sun <candlesea@gmail.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Date:   Wed, 09 Oct 2019 19:01:26 +0200
In-Reply-To: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+cgRzwSHq0mjN6hyjB+b"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-+cgRzwSHq0mjN6hyjB+b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-10-09 at 20:53 +0800, Candle Sun wrote:
> From: Candle Sun <candle.sun@unisoc.com>
>=20
> Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> to Main item") adds support for Usage Page item after Usage ID items
> (such as keyboards manufactured by Primax).
>=20
> Usage Page concatenation in Main item works well for following report
> descriptor patterns:
>=20
>     USAGE_PAGE (Keyboard)                   05 07
>     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
>     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (8)                        95 08
>     INPUT (Data,Var,Abs)                    81 02
>=20
> -------------
>=20
>     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
>     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (8)                        95 08
>     USAGE_PAGE (Keyboard)                   05 07
>     INPUT (Data,Var,Abs)                    81 02
>=20
> But it makes the parser act wrong for the following report
> descriptor pattern(such as some Gamepads):
>=20
>     USAGE_PAGE (Button)                     05 09
>     USAGE (Button 1)                        09 01
>     USAGE (Button 2)                        09 02
>     USAGE (Button 4)                        09 04
>     USAGE (Button 5)                        09 05
>     USAGE (Button 7)                        09 07
>     USAGE (Button 8)                        09 08
>     USAGE (Button 14)                       09 0E
>     USAGE (Button 15)                       09 0F
>     USAGE (Button 13)                       09 0D
>     USAGE_PAGE (Consumer Devices)           05 0C
>     USAGE (Back)                            0a 24 02
>     USAGE (HomePage)                        0a 23 02
>     LOGICAL_MINIMUM (0)                     15 00
>     LOGICAL_MAXIMUM (1)                     25 01
>     REPORT_SIZE (1)                         75 01
>     REPORT_COUNT (11)                       95 0B
>     INPUT (Data,Var,Abs)                    81 02
>=20
> With Usage Page concatenation in Main item, parser recognizes all the
> 11 Usages as consumer keys, it is not the HID device's real intention.
>=20
> This patch adds usage_page_last to flag whether Usage Page is after
> Usage ID items. usage_page_last is false default, it is set as true
> once Usage Page item is encountered and is reverted by next Usage ID
> item.
>=20
> Usage Page concatenation on the currently defined Usage Page will do
> firstly in Local parsing when Usage ID items encountered.
>=20
> When Main item is parsing, concatenation will do again with last
> defined Usage Page if usage_page_last flag is true.

Functionally I think this is the right approach. Sadly I don't have access =
to
any  Primax device anymore so I can't test it. But I suggest you update
hid-tools' parser and add a new unit test to verify we aren't missing anyth=
ing.

You can base your code on this:

https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/37/commits

> Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> ---
> Changes in v2:
> - Update patch title
> - Add GET_COMPLETE_USAGE macro
> - Change the logic of checking whether to concatenate usage page again
>   in main parsing
> ---
>  drivers/hid/hid-core.c | 31 +++++++++++++++++++++++++------
>  include/linux/hid.h    |  1 +
>  2 files changed, 26 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 3eaee2c..3394222 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -35,6 +35,8 @@
> =20
>  #include "hid-ids.h"
> =20
> +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))

Not sure I like the macro. I'd rather have the explicit code. That said, le=
ts
see what Benjamin has to say.

> +
>  /*
>   * Version Information
>   */
> @@ -221,7 +223,15 @@ static int hid_add_usage(struct hid_parser *parser,
> unsigned usage, u8 size)
>  		hid_err(parser->device, "usage index exceeded\n");
>  		return -1;
>  	}
> -	parser->local.usage[parser->local.usage_index] =3D usage;
> +
> +	if (size <=3D 2) {
> +		parser->local.usage_page_last =3D false;
> +		parser->local.usage[parser->local.usage_index] =3D
> +			GET_COMPLETE_USAGE(parser->global.usage_page, usage);
> +	} else {
> +		parser->local.usage[parser->local.usage_index] =3D usage;
> +	}
> +
>  	parser->local.usage_size[parser->local.usage_index] =3D size;
>  	parser->local.collection_index[parser->local.usage_index] =3D
>  		parser->collection_stack_ptr ?
> @@ -366,6 +376,7 @@ static int hid_parser_global(struct hid_parser *parse=
r,
> struct hid_item *item)
> =20
>  	case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
>  		parser->global.usage_page =3D item_udata(item);
> +		parser->local.usage_page_last =3D true;
>  		return 0;
> =20
>  	case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> @@ -543,13 +554,21 @@ static int hid_parser_local(struct hid_parser *pars=
er,
> struct hid_item *item)
>   * usage value."
>   */

I'd expand the comment above to further explain what we're doing here.

> =20
> -static void hid_concatenate_usage_page(struct hid_parser *parser)
> +static void hid_concatenate_last_usage_page(struct hid_parser *parser)
>  {
>  	int i;
> +	unsigned int usage;
> +	unsigned int usage_page =3D parser->global.usage_page;
> +
> +	if (!parser->local.usage_page_last)
> +		return;
> =20
>  	for (i =3D 0; i < parser->local.usage_index; i++)

Technically correct but it's preferred if you use braces here.

> -		if (parser->local.usage_size[i] <=3D 2)
> -			parser->local.usage[i] +=3D parser->global.usage_page <<
> 16;
> +		if (parser->local.usage_size[i] <=3D 2) {
> +			usage =3D parser->local.usage[i];
> +			parser->local.usage[i] =3D
> +				GET_COMPLETE_USAGE(usage_page, usage);
> +		}
>  }
> =20
>  /*
> @@ -561,7 +580,7 @@ static int hid_parser_main(struct hid_parser *parser,
> struct hid_item *item)
>  	__u32 data;
>  	int ret;
> =20
> -	hid_concatenate_usage_page(parser);
> +	hid_concatenate_last_usage_page(parser);
> =20
>  	data =3D item_udata(item);
> =20
> @@ -772,7 +791,7 @@ static int hid_scan_main(struct hid_parser *parser, s=
truct
> hid_item *item)
>  	__u32 data;
>  	int i;
> =20
> -	hid_concatenate_usage_page(parser);
> +	hid_concatenate_last_usage_page(parser);
> =20
>  	data =3D item_udata(item);
> =20
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index cd41f20..2e0ea2f7 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -412,6 +412,7 @@ struct hid_local {
>  	unsigned usage_minimum;
>  	unsigned delimiter_depth;
>  	unsigned delimiter_branch;
> +	bool usage_page_last;      /* whether usage page is after usage id */
>  };
> =20
>  /*

Regards,
Nicolas


--=-+cgRzwSHq0mjN6hyjB+b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2eEmYACgkQlfZmHno8
x/78WAf/VdRG9KkWWsJBI1HnxULNw7ZULq4MQ+4PrC+qXn8u5dxxfMLpNxGwRQvN
FBBqrjXfDvcZDqUE2kqOTOqAnbs2mheNejQCY33L7wSYwWPKzDlejZDAF6lH1Bsv
a3QfRf9oV2iRDvxR4WZKtoLTm/SeX/VaMOvjQUX4JgxsQzeCkxCRY4GXqQrXrU/s
YzJBCYDs9SNnfamnkcZOnfnd/LGLA8VBbHE5krpdcV3ivgOv3oZ1OUkBzrz8GSnu
0VR0T5oGhy3pXHfcXH08eKZE1j2zhhscqNYGtkECZHphq8eAqUDQ7tCBfrILs2Ty
HY4HB+i+ZDtjDkE/e48W3vix5yGoJQ==
=TRI3
-----END PGP SIGNATURE-----

--=-+cgRzwSHq0mjN6hyjB+b--

