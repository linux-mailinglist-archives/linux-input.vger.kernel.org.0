Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB178268CEE
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgINNtp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 09:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgINNt0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 09:49:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845CBC06174A;
        Mon, 14 Sep 2020 06:49:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fa1so5608305pjb.0;
        Mon, 14 Sep 2020 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XzOvlX+sP3vsygdyJ38+0fijbYFw1gd5AT6Thqbr//0=;
        b=dh/5ICgu3T4+wVxGpYdipQhDiwWA/rm3mjWf8HfXDtRbPDV18bkCO/d420HeOqvfcJ
         l8gb2w4zTDyWQL8IWyblCxxs3DdqEIgA7vwi+/Qrv+LAdoQsIWpVZFhGQjKWXkUkPv7B
         u4N30A3kTHhHtlbm7usuiCjQGy3Rxx3Ekijo+Nl0fdM2mg343IuVe3I8dDisuQIjMBGp
         kvWKesnrNWvSxSZ5EiGdvpetX3ycax/94yt+rQ93w6/q2cjj7W/m7S9DMHNlVZp8pg7/
         lhGOGV64wEi9JrM65AAfrgVl6pdpDLroQb+n2fTTZ5C9rw/wO8+WxjXluBZ+aolM5g27
         HaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XzOvlX+sP3vsygdyJ38+0fijbYFw1gd5AT6Thqbr//0=;
        b=no/AbjNpihv5z4BcfSQKPF6nNz5Pc9sEdNHJZ3i/l9f/ad1Rcy/Pwx8Kmd2BN3RuLp
         E1eCEvzZCwYaKYAA9DZP+hqmUlPQ/PDKRCWUtTd5j849t/PjgXaGa38xftnIpfPV/2lr
         Z0bkJ6SpTUk6pkVr5rpIUlN+MtlH2V8siEpwug1Pz7uMFvsH7ycHmL7ndAkHn7CqnYKa
         u9MfYf6GPFdLEbaRYM/jX9srolkwFpnUOcYO6rcY5rodxm5Qto3aeikFSf9VhiGtaODr
         7b0VBhYqqPZKp68mo7itmeyY/HGAlDDajizM06Siv7yNEL2abdQH+ze5zj/LKnEknTVf
         GY5A==
X-Gm-Message-State: AOAM532qUQKw8yf56oXnwWnNnsP60v3TKY7m4ONkNMvrVQn9Ok/KgJ23
        /bH3CcBk5I9nfU91Xk6aBVlXPz59qt+l3sQbBOo=
X-Google-Smtp-Source: ABdhPJw3CIu6eBgKUqJsjlWGfutqdQ+FOwipqDCd9UWLDSd9LxDN7vOcj7TdzuqMaiSDYDD9P/6UF69G3JtDRaFa4XY=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr14404428pjr.228.1600091366066;
 Mon, 14 Sep 2020 06:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200912005521.26319-1-jiada_wang@mentor.com> <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
 <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com>
In-Reply-To: <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 16:49:08 +0300
Message-ID: <CAHp75VdTv-uCQue3VU=czZJd4iTG+XBVe2kFtnP+fZ1XQuFbzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 13, 2020 at 3:57 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 13.09.2020 11:43, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ...
> >
> >> +       bool retried =3D false;
>
> > I thought Dmitry wants that to be retry
>
> In the comment to v2 you suggested to negate the condition,

Where? I just checked a few messages before and I found that I asked
the same question: why is negative conditional used instead of
positive.

> hence I
> thought it's YOU who wants it to be retried.

I see. Let's see how it goes with positive conditionals first.


> The "retried" is a very common form among kernel drivers, so it's good
> to me.
>
> >>         u8 buf[2];
> >>         int ret;
> >
> >> -       ret =3D i2c_transfer(client->adapter, xfer, 2);
> >> -       if (ret =3D=3D 2) {
> >> -               ret =3D 0;
> >> -       } else {
> >> -               if (ret >=3D 0)
> >> -                       ret =3D -EIO;
> >> +retry_read:
> >
> >> +       ret =3D i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> >> +       if (ret !=3D ARRAY_SIZE(xfer)) {
> ...> Also why switch from positive to negative conditional?
>
> This will make code less readable because of the goto, and thus, there
> will be two branches for handling of the returned value instead of one +
> goto. Hence this part is good to me as-is.

But it's not the purpose of this patch, right?
Style changes should be really separated from the fix.
And since it's a fix it should have a Fixes tag.

>
> >> +               if (!retried) {
> >> +                       dev_dbg(&client->dev, "i2c retry\n");
> >> +                       msleep(MXT_WAKEUP_TIME);
> >> +                       retried =3D true;
> >> +                       goto retry_read;
> >> +               }
> >> +               ret =3D ret < 0 ? ret : -EIO;
> >>                 dev_err(&client->dev, "%s: i2c transfer failed (%d)\n"=
,
> >>                         __func__, ret);
> >> +               return ret;
> >>         }
> >>
> >> -       return ret;
> >> +       return 0;
> >>  }



--=20
With Best Regards,
Andy Shevchenko
