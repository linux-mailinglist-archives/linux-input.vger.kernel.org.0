Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA15EE0224
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 12:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731894AbfJVKdk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 06:33:40 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:44062 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731871AbfJVKdj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 06:33:39 -0400
Received: by mail-yb1-f194.google.com with SMTP id v1so4968996ybo.11;
        Tue, 22 Oct 2019 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uzw8wFWkH5Kyype/kl73JFu2MEfzd8ISu9rdpai/058=;
        b=ixwFe1ny2f7hC+Zoa6Sv7b54jAxJJW0oL8TZnKu93dp/f5keCrQhz/y9Ai6AxUXtO+
         TPZw/QSXb37udzmmSQj3fMwomNoCZESD8f0Qu5jtJJtJwZxjmwf4MtA6uO1dTAoyESPu
         lnZ+IjxmFyN77IRjXERHH8xUhxcGmj5vML6TE8+z5HUnqnuszAx7CvnEIeBSyqz7EJL2
         O0wTByusVCbGJYCGM2feb4UUDidlLrhLxpcEogbDpxSgYwOHg/oA459nfrf2MjHf57xK
         jLqffc06Yp+ntPaL2xS/AdMdBxT7hmz2k4iqOq4GhDd6yAvparpL3UgRZNov8mhs7dBz
         hMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uzw8wFWkH5Kyype/kl73JFu2MEfzd8ISu9rdpai/058=;
        b=rj7HxEPcehwnVDA3UGUwfCpTx68K0TrJ8t17W23IsqNWPljFpE7rnvTgWT4WKpwYJs
         iHyT8mMnjyl+hUHE+6tWqR7PazR337T1tZsAkhVt3I414IojeDAK++X44gQEV4jpWRoJ
         tlohRB1nbMNzRK54G6InUL00XnGrtp58lQFSPMNM7XmbU3GncGxEr9Br5VFYOzhGEITc
         0HZ9m/Xe0cPs9h30tGkY+bcRHGUBAS5dqW/FKGKDNtBtFe1g5eTiyou9nCFymuTJIiN0
         XN/+nwO1LHJZHcSSydsx2m8Ji99xn4kpn7W3OE6ZHp9jhNj+B363M5EwGyX+dYrofSEI
         zi4A==
X-Gm-Message-State: APjAAAWAU7DgfCFWfrmGZllh0etNMQ1U2z03wpHek7f0m5QpCx/3FNph
        /Pf0BeOX+QyJh2RUEOHWBtU2WbTiRlK6QhsuPr8=
X-Google-Smtp-Source: APXvYqxDfo8QEghympNWoAftftw/F8ZqsF8RL9fTFbfnBWwCqFg+cu20VQTkmASjXR1fNeCX0m9T9GykriLxLptPxm0=
X-Received: by 2002:a25:c60a:: with SMTP id k10mr1878910ybf.91.1571740416802;
 Tue, 22 Oct 2019 03:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191021073819.18181-1-candlesea@gmail.com> <CAPnx3XP2MrEZT+BAzW3-Ve9ekzvPzcj6wvzeC8VRHhCyo59XpQ@mail.gmail.com>
 <CAO-hwJ+ObCH_NPJd=Uy5uuVCpGzO7+iCSWnwPkoVt9H+8NHahA@mail.gmail.com>
In-Reply-To: <CAO-hwJ+ObCH_NPJd=Uy5uuVCpGzO7+iCSWnwPkoVt9H+8NHahA@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Tue, 22 Oct 2019 18:33:25 +0800
Message-ID: <CAPnx3XNWrLt8M79amV1Krm7wSj0_N7YawjsO+9krr-sDrcg8bA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: core: check whether usage page item is after
 usage id item
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Tue, Oct 22, 2019 at 5:48 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Candle,
>
> On Mon, Oct 21, 2019 at 9:54 AM Candle Sun <candlesea@gmail.com> wrote:
> >
> > Hi,
> >
> >
> > On Mon, Oct 21, 2019 at 3:38 PM Candle Sun <candlesea@gmail.com> wrote:
> > >
> > > From: Candle Sun <candle.sun@unisoc.com>
> > >
> > > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenati=
on
> > > to Main item") adds support for Usage Page item after Usage ID items
> > > (such as keyboards manufactured by Primax).
> > >
> > > Usage Page concatenation in Main item works well for following report
> > > descriptor patterns:
> > >
> > >     USAGE_PAGE (Keyboard)                   05 07
> > >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> > >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> > >     LOGICAL_MINIMUM (0)                     15 00
> > >     LOGICAL_MAXIMUM (1)                     25 01
> > >     REPORT_SIZE (1)                         75 01
> > >     REPORT_COUNT (8)                        95 08
> > >     INPUT (Data,Var,Abs)                    81 02
> > >
> > > -------------
> > >
> > >     USAGE_MINIMUM (Keyboard LeftControl)    19 E0
> > >     USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
> > >     LOGICAL_MINIMUM (0)                     15 00
> > >     LOGICAL_MAXIMUM (1)                     25 01
> > >     REPORT_SIZE (1)                         75 01
> > >     REPORT_COUNT (8)                        95 08
> > >     USAGE_PAGE (Keyboard)                   05 07
> > >     INPUT (Data,Var,Abs)                    81 02
> > >
> > > But it makes the parser act wrong for the following report
> > > descriptor pattern(such as some Gamepads):
> > >
> > >     USAGE_PAGE (Button)                     05 09
> > >     USAGE (Button 1)                        09 01
> > >     USAGE (Button 2)                        09 02
> > >     USAGE (Button 4)                        09 04
> > >     USAGE (Button 5)                        09 05
> > >     USAGE (Button 7)                        09 07
> > >     USAGE (Button 8)                        09 08
> > >     USAGE (Button 14)                       09 0E
> > >     USAGE (Button 15)                       09 0F
> > >     USAGE (Button 13)                       09 0D
> > >     USAGE_PAGE (Consumer Devices)           05 0C
> > >     USAGE (Back)                            0a 24 02
> > >     USAGE (HomePage)                        0a 23 02
> > >     LOGICAL_MINIMUM (0)                     15 00
> > >     LOGICAL_MAXIMUM (1)                     25 01
> > >     REPORT_SIZE (1)                         75 01
> > >     REPORT_COUNT (11)                       95 0B
> > >     INPUT (Data,Var,Abs)                    81 02
> > >
> > > With Usage Page concatenation in Main item, parser recognizes all the
> > > 11 Usages as consumer keys, it is not the HID device's real intention=
.
> > >
> > > This patch adds usage_page_last to flag whether Usage Page is after
> > > Usage ID items. usage_page_last is false default, it is set as true
> > > once Usage Page item is encountered and is reverted by next Usage ID
> > > item.
> > >
> > > Usage Page concatenation on the currently defined Usage Page will do
> > > firstly in Local parsing when Usage ID items encountered.
> > >
> > > When Main item is parsing, concatenation will do again with last
> > > defined Usage Page if usage_page_last flag is true.
> > >
> > > Signed-off-by: Candle Sun <candle.sun@unisoc.com>
> > > Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
> > > ---
> > > Changes in v3:
> > > - Rework the GET_COMPLETE_USAGE macro as static complete_usage()
> > >   function
> > > - Add some code comments for usage_page_last
> > >
> > > Changes in v2:
> > > - Update patch title
> > > - Add GET_COMPLETE_USAGE macro
> > > - Change the logic of checking whether to concatenate usage page agai=
n
> > >   in main parsing
> > > ---
> > >  drivers/hid/hid-core.c | 42 +++++++++++++++++++++++++++++++++++++---=
--
> > >  include/linux/hid.h    |  1 +
> > >  2 files changed, 38 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 3eaee2c37931..779b7798dae8 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct hid=
_parser *parser, unsigned type)
> > >         return 0; /* we know nothing about this usage type */
> > >  }
> > >
> > > +/*
> > > + * Concatenate usage which defines 16 bits or less with the
> > > + * currently defined usage page to form a 32 bit usage
> > > + */
> > > +
> > > +static void complete_usage(struct hid_parser *parser, unsigned int i=
ndex)
> > > +{
> > > +       parser->local.usage[index] &=3D 0xFFFF;
> > > +       parser->local.usage[index] |=3D
> > > +               (parser->global.usage_page & 0xFFFF) << 16;
> > > +}
> > > +
> > >  /*
> > >   * Add a usage to the temporary parser table.
> > >   */
> > > @@ -221,7 +233,18 @@ static int hid_add_usage(struct hid_parser *pars=
er, unsigned usage, u8 size)
> > >                 hid_err(parser->device, "usage index exceeded\n");
> > >                 return -1;
> > >         }
> > > -       parser->local.usage[parser->local.usage_index] =3D usage;
>
> This broke my CI, and it turns out that installing the patch on an
> actual laptop, the touchpad, touchscreen were not present, nor any HID
> devices plugged in.
>
> Basically, complete_usage() doesn't append the usage, and now we are
> never assigning a usage to any field.
>

So sorry, it is really really a BIG bug, I should be more careful. (=E2=95=
=AF=EF=B9=8F=E2=95=B0)

Candle

> > > +
> > > +       /*
> > > +        * If Usage item only includes usage id, concatenate it with
> > > +        * currently defined usage page and clear usage_page_last fla=
g
> > > +        */
> > > +       if (size <=3D 2) {
> > > +               parser->local.usage_page_last =3D false;
> > > +               complete_usage(parser, parser->local.usage_index);
> > > +       } else {
> > > +               parser->local.usage[parser->local.usage_index] =3D us=
age;
> > > +       }
> > > +
> > >         parser->local.usage_size[parser->local.usage_index] =3D size;
> > >         parser->local.collection_index[parser->local.usage_index] =3D
> > >                 parser->collection_stack_ptr ?
> > > @@ -366,6 +389,8 @@ static int hid_parser_global(struct hid_parser *p=
arser, struct hid_item *item)
> > >
> > >         case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
> > >                 parser->global.usage_page =3D item_udata(item);
> > > +               /* Regard Usage Page is after Usage ID items */
> > > +               parser->local.usage_page_last =3D true;
> > >                 return 0;
> > >
> > >         case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
> > > @@ -543,13 +568,20 @@ static int hid_parser_local(struct hid_parser *=
parser, struct hid_item *item)
> > >   * usage value."
> > >   */
> > >
> > > -static void hid_concatenate_usage_page(struct hid_parser *parser)
> > > +static void hid_concatenate_last_usage_page(struct hid_parser *parse=
r)
> > >  {
> > >         int i;
> > >
> > > +       /*
> > > +        * Concatenate usage page again only on detecting some Usage =
Page
> > > +        * is really after Usage ID items
> > > +        */
> > > +       if (!parser->local.usage_page_last)
> > > +               return;
> > > +
> > >         for (i =3D 0; i < parser->local.usage_index; i++)
> > >                 if (parser->local.usage_size[i] <=3D 2)
> > > -                       parser->local.usage[i] +=3D parser->global.us=
age_page << 16;
> > > +                       complete_usage(parser, i);
> > >  }
> > >
> > >  /*
> > > @@ -561,7 +593,7 @@ static int hid_parser_main(struct hid_parser *par=
ser, struct hid_item *item)
> > >         __u32 data;
> > >         int ret;
> > >
> > > -       hid_concatenate_usage_page(parser);
> > > +       hid_concatenate_last_usage_page(parser);
> > >
> > >         data =3D item_udata(item);
> > >
> > > @@ -772,7 +804,7 @@ static int hid_scan_main(struct hid_parser *parse=
r, struct hid_item *item)
> > >         __u32 data;
> > >         int i;
> > >
> > > -       hid_concatenate_usage_page(parser);
> > > +       hid_concatenate_last_usage_page(parser);
> > >
> > >         data =3D item_udata(item);
> > >
> > > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > > index cd41f209043f..2e0ea2f7ec5c 100644
> > > --- a/include/linux/hid.h
> > > +++ b/include/linux/hid.h
> > > @@ -412,6 +412,7 @@ struct hid_local {
> > >         unsigned usage_minimum;
> > >         unsigned delimiter_depth;
> > >         unsigned delimiter_branch;
> > > +       bool usage_page_last;      /* whether usage page is after usa=
ge id */
> > >  };
> > >
> >
> > Hi Benjamin,
> > Here I still use the usage_page_last flag, not using following method
> > you provided in v2:
> >
> > if ((parser->local.usage[parser->local.usage_index - 1] &
> > HID_USAGE_PAGE) >> 16 =3D=3D usage_page)
> >               return 0;
> >
> > Because last usage maybe one Extended Usage, some logic for checking
> > it should be added.
> > It will make the code obscure. Using one more member in struct
> > hid_local is straightforward
> > and maybe better.
>
>
> Still not convinced by this. Please see below for a less intrusive
> patch, which is also shorter.
>
> ---
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 63fdbf09b044..00ea04fb1be3 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct
> hid_parser *parser, unsigned type)
>      return 0; /* we know nothing about this usage type */
>  }
>
> +/*
> + * Concatenate usage which defines 16 bits or less with the
> + * currently defined usage page to form a 32 bit usage
> + */
> +
> +static void complete_usage(struct hid_parser *parser, unsigned int index=
)
> +{
> +    parser->local.usage[index] &=3D 0xFFFF;
> +    parser->local.usage[index] |=3D
> +        (parser->global.usage_page & 0xFFFF) << 16;
> +}
> +
>  /*
>   * Add a usage to the temporary parser table.
>   */
> @@ -222,6 +234,14 @@ static int hid_add_usage(struct hid_parser
> *parser, unsigned usage, u8 size)
>          return -1;
>      }
>      parser->local.usage[parser->local.usage_index] =3D usage;
> +
> +    /*
> +     * If Usage item only includes usage id, concatenate it with
> +     * currently defined usage page
> +     */
> +    if (size <=3D 2)
> +        complete_usage(parser, parser->local.usage_index);
> +
>      parser->local.usage_size[parser->local.usage_index] =3D size;
>      parser->local.collection_index[parser->local.usage_index] =3D
>          parser->collection_stack_ptr ?
> @@ -546,10 +566,28 @@ static int hid_parser_local(struct hid_parser
> *parser, struct hid_item *item)
>  static void hid_concatenate_usage_page(struct hid_parser *parser)
>  {
>      int i;
> +    uint16_t usage_page, current_page;
>
> -    for (i =3D 0; i < parser->local.usage_index; i++)
> -        if (parser->local.usage_size[i] <=3D 2)
> -            parser->local.usage[i] +=3D parser->global.usage_page << 16;
> +    if (!parser->local.usage_index)
> +        return;
> +
> +    usage_page =3D parser->global.usage_page;
> +
> +    /*
> +     * Concatenate usage page again only if the last declared Usage Page
> +     * has not been already used in the previous Usages
> +     */
> +    for (i =3D parser->local.usage_index - 1; i >=3D 0; i--) {
> +        if (parser->local.usage_size[i] > 2)
> +            /* ignore extended usages */
> +            continue;
> +
> +        current_page =3D parser->local.usage[i] >> 16;
> +        if (current_page =3D=3D usage_page)
> +            break;
> +
> +        complete_usage(parser, i);
> +    }
>  }
>
>  /*
> ---
>
> Isn't that better?
>
> I tested this against
> https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/58,
> which you kindly submitted and it seems to do the job.
>
> Cheers,
> Benjamin
>

OK. I will amend the patch.

Best regards,
Candle
