Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D0BD3763
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 04:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfJKCIx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 22:08:53 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:44605 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbfJKCIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 22:08:53 -0400
Received: by mail-yw1-f65.google.com with SMTP id m13so2920197ywa.11;
        Thu, 10 Oct 2019 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+UDvHeSzR+cQN+NCESzbgPs6kNEAeU6+A0qPCmwP+4=;
        b=jh7skuahTXIj/dU+M7x5OCrhhC8cuwaYuQVhZ3m919oAbn6D24G1D+Mk51R9ehS4UB
         2/7PuoXNjqHzTLabnF16vmBtNy4N27rF/z0lvtqVjfS8W9FUFuvAhrifgzaO50lokseK
         bAp6hpo3675v5J2farDkfgQGfZ84nWb0I55cJEoT1U4/E6vIQME2u4TEKDNH885gO7Iu
         2FSeY38zRKom2bN7agL0zcqWqgsLymDNT7wnLDaN6ynyyc0oJ2dCKzNRlZTQdVcUQW3J
         rBEc1h1yXWC5MAMbPx74mfQymOVq6cAum8sYCliz44c7cUoHFXicmjs91EVQYLx27wqO
         ZqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+UDvHeSzR+cQN+NCESzbgPs6kNEAeU6+A0qPCmwP+4=;
        b=kcUTnRDaPwpy8NFzK5JwK9SzNuu9HSv3k8MEcQqMIgMQLK+NnofP44rhaxzdWohgGN
         jj0ZbufZH9J/R/fwW4fAd+PK2y+kn6hFXZEXgUbufV10ImeJgnw/9/vOwJOu/YBxvyr5
         nBAKxoHkW7rxeWcLcPbwRZyezZKORMCxhjlMDS7CyEMDIOa4otKZNIjl6S9AEbmULW7P
         ilrNpw40F/5oy2UxbIqs/qIUvZBYYkIvU6xAs0NKXD8SB1D3rEPGs5Cu490dfoAUi42c
         KSAU4xDKafSf6JNRiUYl4+cIzuqnqrllpX0LZknN+vKhJ2SAwa1wFRHVRykddDwWhAb8
         QAHw==
X-Gm-Message-State: APjAAAUwhSi9EaBh6BMs+XfK1MCY4VfpFAKt5tcGrNorwxMx0Y5Z0AyE
        7aGSk1J/WQqlawK8IUMiXffM6zm0LDKHPsi5nkM=
X-Google-Smtp-Source: APXvYqxz5I+6Yk0tDlHLC+whB9Dtv0NKBhhCu0TlYTT8NcJ4ukDvXVReLRsNTLKeb9ySBfhPAGDjD1D68Zv87mFp4BQ=
X-Received: by 2002:a81:1d4d:: with SMTP id d74mr654393ywd.420.1570759732802;
 Thu, 10 Oct 2019 19:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
 <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de> <nycvar.YFH.7.76.1910091958120.13160@cbobk.fhfr.pm>
 <CAPnx3XNGBw+SKSFA3DhhHFZZ17f54DMfYjKOcqYTb3N-PWGKpw@mail.gmail.com> <CAO-hwJJEcP3AEYfadhEbqzfszawxiQ7E9NAwmxHcK6SH8zzhiQ@mail.gmail.com>
In-Reply-To: <CAO-hwJJEcP3AEYfadhEbqzfszawxiQ7E9NAwmxHcK6SH8zzhiQ@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Fri, 11 Oct 2019 10:08:41 +0800
Message-ID: <CAPnx3XOeJRBsrAamv8o7H_zgnxNfwBX5gsaom_zJHJjewiELSw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        orson.zhai@unisoc.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 8:17 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Oct 10, 2019 at 5:19 AM Candle Sun <candlesea@gmail.com> wrote:
> >
> > On Thu, Oct 10, 2019 at 2:00 AM Jiri Kosina <jikos@kernel.org> wrote:
> > >
> > > On Wed, 9 Oct 2019, Nicolas Saenz Julienne wrote:
> > >
> > > > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > > > index 3eaee2c..3394222 100644
> > > > > --- a/drivers/hid/hid-core.c
> > > > > +++ b/drivers/hid/hid-core.c
> > > > > @@ -35,6 +35,8 @@
> > > > >
> > > > >  #include "hid-ids.h"
> > > > >
> > > > > +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))
> > > >
> > > > Not sure I like the macro. I'd rather have the explicit code. That said, lets
> > > > see what Benjamin has to say.
> > >
> > > Not sure about Benjamin :) but I personally would ask for putting it
> > > somewhere into hid.h as static inline.
> > >
> > > And even if it's for some reason insisted on this staying macro, please at
> > > least put it as close to the place(s) it's being used as possible, in
> > > order to maintain some code sanity.
> > >
> > > Thanks,
> > >
> > > --
> > > Jiri Kosina
> > > SUSE Labs
> > >
> >
> > Thanks Nicolas and Jiri,
> > If macro is not good, I will change it to static function. But the
> > funciton is only used in hid-core.c,
> > maybe placing it into hid.h is not good?
>
> I would rather use a function too (in hid-core.c, as it's not reused
> anywhere else), and we can make it simpler from the caller point of
> view (if I am not mistaken):
> ---
> static void concatenate_usage_page(struct hid_parser *parser, int index)
> {
>     parser->local.usage[index] &= 0xFFFF;
>     parser->local.usage[index] |= (parser->global.usage_page & 0xFFFF) << 16;
> }
>
> // Which can then be called as:
> +       parser->local.usage[parser->local.usage_index] = usage;
> +       if (size <= 2)
> +               concatenate_usage_page(parser, parser->local.usage_index);
> +
>
> // And
>         for (i = 0; i < parser->local.usage_index; i++)
> -               if (parser->local.usage_size[i] <= 2)
> -                       parser->local.usage[i] +=
> parser->global.usage_page << 16;
> +               if (parser->local.usage_size[i] <= 2) {
> +                       concatenate_usage_page(parser, i);
> +               }
>  }
> ---
>
> And now that I have written this, the check on the size could also be
> very well integrated in concatenate_usage_page().
>
> Cheers,
> Benjamin
>

Thanks Benjamin's detailed directions. I will amend the patch.

Candle

> >
> > Regards,
> > Candle
>
