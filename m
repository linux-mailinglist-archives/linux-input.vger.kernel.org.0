Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC312690B1
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 17:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgINPyT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 11:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgINPvH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 11:51:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E03CC06174A;
        Mon, 14 Sep 2020 08:50:56 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k15so12966843pfc.12;
        Mon, 14 Sep 2020 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NeEIdkUfiAAP9K0el+EdAG4xvlSnbHSg0aEKW4bMslI=;
        b=Lr9oqe/AHxcqpa3/s/uqXOxrKyk1aW7EudKoYxXKorf6b9d0JWkPYC07WQPYCVbwtH
         OMiPMTaw8YqGKmZVSsydJmB/ES/CjemiZFaqcu3E9FcfVOJfVsoof7ebusmb/0nNbuar
         glRVsu4Pa6H8NTrT2hStu6n7Xu6pWMfewapuYXafZTXO+PRdYHzYK4xsyytSYM12o40a
         bBS4VQXEmxY+XyYbcKmkJZIU3E5cEKmY+jkzHA0MoUlidBxOuWZLllzgwMkwTuhuWDPk
         NIw0eaWQY2+BOwsSmiqh3PVSo0XAdLULwsngE8DYCSavZtp8rAyc+CkxePJ0CXdI8N1Y
         FJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NeEIdkUfiAAP9K0el+EdAG4xvlSnbHSg0aEKW4bMslI=;
        b=phZhXPiJaHz4PCelhsqr7OrIsL+nHLuUseiHXF3338wfSxTG454oJwsifFDNMV3mFu
         En0oesFMl67UprNtyNFYkFBvQdAV95wZhDzRrVppXs5jugZdU3GB9SV1XD1AmVhCkX5A
         PURNHLsp7fTCVQrt2/Lh41bQQ1VbX7wVapddrxOZm16uiZN5URC0lnCO0MsH7XvqTTl+
         B0JwdntLKJgI78XE3M4pwwrnplBGG96h+qloytdyUkw/6wSbnMbwrSkjAzCAGANW0jTt
         LtQzyM6GO1L7b5K01T3JThbz4ttf1C9bLcPS0fiA2ZKfxVeqJSHpFplHeyXcGIn/pNO/
         GZyQ==
X-Gm-Message-State: AOAM53119DEhTqwPNDKrIMEiAA1AU7dQgT3+HdLxpOlHsYn9N34Nq6QT
        2zNI4aXUZ0/ZI1o6aG3nyt0FmJcbDjNdWwDnekU=
X-Google-Smtp-Source: ABdhPJyeeqEszby9QyEvsXRu1OdcYUpb9XfNAMGPe89vc12cixaKuFukdfJvJYSCD5MqRtBGHn61qu/a1A1NnB9pJF4=
X-Received: by 2002:a17:902:6bc1:b029:d0:cbe1:e76e with SMTP id
 m1-20020a1709026bc1b02900d0cbe1e76emr15559440plt.21.1600098655867; Mon, 14
 Sep 2020 08:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200912005521.26319-1-jiada_wang@mentor.com> <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
 <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com> <CAHp75VdTv-uCQue3VU=czZJd4iTG+XBVe2kFtnP+fZ1XQuFbzA@mail.gmail.com>
 <137be969-f99a-66e0-ebe4-b86f4be2b5d3@gmail.com>
In-Reply-To: <137be969-f99a-66e0-ebe4-b86f4be2b5d3@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:50:38 +0300
Message-ID: <CAHp75Vfg6=5u1fthsub3xw3dxAKTGPUHfamjK_A2b5hcyw25PA@mail.gmail.com>
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

On Mon, Sep 14, 2020 at 6:26 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 14.09.2020 16:49, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Sep 13, 2020 at 3:57 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:

...

> >>>> +       ret =3D i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer)=
);
> >>>> +       if (ret !=3D ARRAY_SIZE(xfer)) {
> >> ...> Also why switch from positive to negative conditional?
> >>
> >> This will make code less readable because of the goto, and thus, there
> >> will be two branches for handling of the returned value instead of one=
 +
> >> goto. Hence this part is good to me as-is.
> >
> > But it's not the purpose of this patch, right?
> > Style changes should be really separated from the fix.
>
> This should be up to a particular maintainer to decide. Usually nobody
> requires patches to be overly pedantic, this may turn away contributors
> because it feels like an unnecessary bikeshedding.

Let's see what Wolfram thinks about this.

> It's more preferred
> to accept patch as-is if it does right thing and then maintainer could
> modify the patch, making cosmetic changes.

It depends on the maintainer's workflow (which may be different from
maintainer to maintainer).

> > And since it's a fix it should have a Fixes tag.
>
> It shouldn't be a fix, but a new feature because apparently the 1386
> controller wasn't ever intended to be properly supported before this patc=
h.

Thanks for clarification. Indeed in this case no tag is needed.

--=20
With Best Regards,
Andy Shevchenko
