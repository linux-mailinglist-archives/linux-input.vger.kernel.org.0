Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD77D2916
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 14:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733253AbfJJMRE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 08:17:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55562 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1733209AbfJJMRE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 08:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570709823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2lHnonVw5Ni2BwUYIttHCnA3w1EKUNdv1m01q4IzX5U=;
        b=VpDzw34EZhXIdrzShkbNYd+OYq9eTMleGrKZN7FrpHCcY8vjhS1PWo0KXQ76AXNPxZBmK/
        cPZoiIHxCa/TVP5F34D+XE0bbxnFAcVDtbmrKsBuK+clSS5WOi4QuKLLmjNkIP/PUFpM+p
        w2oA6/sIalvqW+yihtmWO5890Jwzca8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-DKbymDlTPj2aOwhIClLEpg-1; Thu, 10 Oct 2019 08:16:59 -0400
Received: by mail-qt1-f199.google.com with SMTP id z12so5570891qtn.3
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2019 05:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s7inn7T78nlvJNzw0gTQf4L+rcqUs2LyvXLi2sC3zEA=;
        b=ZrwPpr3g4sie0zncVpABeZL8ZbtHc5qFItYRxr+Wf9Z6wJsvrY+VqzCBF/FewLkEgJ
         nJRfdLwPAxwTvspvciADX/luMkHgfd10tjUxLw27BHjcIU+tsFBTC+sMgpeqXV7JalGL
         cyeidw0L7r7L/7ozyVArraf/lso3RRx5kvhUxBhwSUQnGs1RZyZAHPYeR7mB7DH1EszP
         1H2QxJHPhSN4ijwaV0bXR/4drYzmySE618IAuLkjIdwL/cIcP6Rsd1fthScEc3sDH0E3
         iHlIIHqu5ogZYIN8F5is8RKnjc+SjXCwYtaVYzVHCyyDLUDwRbDv15Th7lIbrhtPLbXw
         7JFg==
X-Gm-Message-State: APjAAAXxcZ7Pon2P+YvCcaF43EB2jcXC4JtV9sv6vgd9UVvmySw188aJ
        /lR9zVn9An9eXKKu/zxjdP/4sS4hxunl9PKrinVgB2mk2HzUBdk0Ne/UcLECMlCBxWtsppT0s93
        jM+z0OsSMs0ShyuPZtsxVGZFeFOsqWrbUKdtsorU=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr9928770qtm.294.1570709819501;
        Thu, 10 Oct 2019 05:16:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRkW7AdvFDNqnvMgNQJTqUWcVFbQOfXSi/TrYiTpHKIad141T1gbycryZ8x/yjN9sQ4mymdPUrbnyPAAJdWq0=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr9928733qtm.294.1570709819174;
 Thu, 10 Oct 2019 05:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
 <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de> <nycvar.YFH.7.76.1910091958120.13160@cbobk.fhfr.pm>
 <CAPnx3XNGBw+SKSFA3DhhHFZZ17f54DMfYjKOcqYTb3N-PWGKpw@mail.gmail.com>
In-Reply-To: <CAPnx3XNGBw+SKSFA3DhhHFZZ17f54DMfYjKOcqYTb3N-PWGKpw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 10 Oct 2019 14:16:47 +0200
Message-ID: <CAO-hwJJEcP3AEYfadhEbqzfszawxiQ7E9NAwmxHcK6SH8zzhiQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
To:     Candle Sun <candlesea@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        orson.zhai@unisoc.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
X-MC-Unique: DKbymDlTPj2aOwhIClLEpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 5:19 AM Candle Sun <candlesea@gmail.com> wrote:
>
> On Thu, Oct 10, 2019 at 2:00 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Wed, 9 Oct 2019, Nicolas Saenz Julienne wrote:
> >
> > > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > > index 3eaee2c..3394222 100644
> > > > --- a/drivers/hid/hid-core.c
> > > > +++ b/drivers/hid/hid-core.c
> > > > @@ -35,6 +35,8 @@
> > > >
> > > >  #include "hid-ids.h"
> > > >
> > > > +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xf=
fff))
> > >
> > > Not sure I like the macro. I'd rather have the explicit code. That sa=
id, lets
> > > see what Benjamin has to say.
> >
> > Not sure about Benjamin :) but I personally would ask for putting it
> > somewhere into hid.h as static inline.
> >
> > And even if it's for some reason insisted on this staying macro, please=
 at
> > least put it as close to the place(s) it's being used as possible, in
> > order to maintain some code sanity.
> >
> > Thanks,
> >
> > --
> > Jiri Kosina
> > SUSE Labs
> >
>
> Thanks Nicolas and Jiri,
> If macro is not good, I will change it to static function. But the
> funciton is only used in hid-core.c,
> maybe placing it into hid.h is not good?

I would rather use a function too (in hid-core.c, as it's not reused
anywhere else), and we can make it simpler from the caller point of
view (if I am not mistaken):
---
static void concatenate_usage_page(struct hid_parser *parser, int index)
{
    parser->local.usage[index] &=3D 0xFFFF;
    parser->local.usage[index] |=3D (parser->global.usage_page & 0xFFFF) <<=
 16;
}

// Which can then be called as:
+       parser->local.usage[parser->local.usage_index] =3D usage;
+       if (size <=3D 2)
+               concatenate_usage_page(parser, parser->local.usage_index);
+

// And
        for (i =3D 0; i < parser->local.usage_index; i++)
-               if (parser->local.usage_size[i] <=3D 2)
-                       parser->local.usage[i] +=3D
parser->global.usage_page << 16;
+               if (parser->local.usage_size[i] <=3D 2) {
+                       concatenate_usage_page(parser, i);
+               }
 }
---

And now that I have written this, the check on the size could also be
very well integrated in concatenate_usage_page().

Cheers,
Benjamin

>
> Regards,
> Candle

