Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AA2D4866
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 21:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbfJKT0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 15:26:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52110 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728915AbfJKT0G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 15:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570821965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cpiu7s7hf2nZP0WQJjeZFG1TgT08vZqZIEI3ha/hazE=;
        b=C1fId8FIlXbEHv1L+7W+bkoE0V0nu5bYzCkSrAvt9ZqNmqXLT9FUp4qRGFPmup68g6+tzO
        +inbSet0+lmmxGfgmrPZSIerf3M2sxCficpIctj3adW8UWdHUwoyUHKstGU6ATbzKYg5pn
        HjMDxYZbBbUNB3KiPVL8uuENukJODWc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-0i8ZAr6gPu6ncU09PIFaeQ-1; Fri, 11 Oct 2019 15:26:03 -0400
Received: by mail-qk1-f197.google.com with SMTP id r17so9917302qkm.16
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 12:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vm9hCEgalMjdO3brVzGiAiZDpN4MX984R0GN6bPTIZw=;
        b=pLOVDWfOI7ZDGKqMFBp5umH6FHXdcovjVAsSsUJChY8FHpe4un7gTcd0PcV8Cl1ohU
         IsfJ3g+pCn8NDyO2KHSek4dW+V/c5AgNvoyawLkTpHlqme+5I6LGHd/Pk87L8bKUlTN+
         w54BVm9e8hIk30kARJnOkxezXb67/hfD6iGM3MhxzxUUDr+vp2Dsy9CFHYdEAfs+2W2/
         91s97DLPflh84p0MWdnUHPYan9slel53XG9cawJCBTwg3sVpCUyTkyQsOp5KQHFzPEIE
         w7BkDWwCeJwoEnuA82ntFFjiuaUic+pp6/DPa1lLdtSlMWl1plmxBtelh6ZUDlumeJLI
         +nwg==
X-Gm-Message-State: APjAAAXPdpc0ST3Tf7rQLxU7y/8CJSfU9vhkL/BReFNSRHqAY/qxftpK
        7i/OZ0MO/GiK6N5hjMd5A7qYhVP7H2dmsF85RTwLVKKayAMFV6JUl0wpoKkqho3RJkswrIztyh+
        FGToQNdgnOmGt58vAf5lIqendGUtJeEfzB6R8rcE=
X-Received: by 2002:a37:50a:: with SMTP id 10mr16739709qkf.27.1570821963356;
        Fri, 11 Oct 2019 12:26:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx05uDRWS0FZ6McnRw0wvRkHDnrcgb/JBgJnFKj/FIi/+KaVzrBJ5aRpM86Ax1WNWr/Vjw1XePH4a8Ny4dxnhM=
X-Received: by 2002:a37:50a:: with SMTP id 10mr16739692qkf.27.1570821963111;
 Fri, 11 Oct 2019 12:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191007051240.4410-1-andrew.smirnov@gmail.com>
 <20191007051240.4410-2-andrew.smirnov@gmail.com> <CAO-hwJ+jPGa5Z7=Lopsc23m8UOqGWB0=tN+DcotykseAPM7_7w@mail.gmail.com>
 <20191011182617.GE229325@dtor-ws>
In-Reply-To: <20191011182617.GE229325@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 21:25:52 +0200
Message-ID: <CAO-hwJLH6SMkLb1kZGj1E+BUHJ+ZsE1n+d=xeJgsvTCjHH1Wzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: logitech-hidpp: use devres to manage FF private data
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Bazely <sambazley@fastmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: 0i8ZAr6gPu6ncU09PIFaeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 8:26 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Oct 11, 2019 at 04:52:04PM +0200, Benjamin Tissoires wrote:
> > Hi Andrey,
> >
> > On Mon, Oct 7, 2019 at 7:13 AM Andrey Smirnov <andrew.smirnov@gmail.com=
> wrote:
> > >
> > > To simplify resource management in commit that follows as well as to
> > > save a couple of extra kfree()s and simplify hidpp_ff_deinit() switch
> > > driver code to use devres to manage the life-cycle of FF private data=
.
> > >
> > > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > > Cc: Jiri Kosina <jikos@kernel.org>
> > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > Cc: Sam Bazely <sambazley@fastmail.com>
> > > Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> > > Cc: Austin Palmer <austinp@valvesoftware.com>
> > > Cc: linux-input@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: stable@vger.kernel.org
> >
> > This patch doesn't seem to fix any error, is there a reason to send it
> > to stable? (besides as a dependency of the rest of the series).
> >
> > > ---
> > >  drivers/hid/hid-logitech-hidpp.c | 53 +++++++++++++++++-------------=
--
> > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logit=
ech-hidpp.c
> > > index 0179f7ed77e5..58eb928224e5 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -2079,6 +2079,11 @@ static void hidpp_ff_destroy(struct ff_device =
*ff)
> > >         struct hidpp_ff_private_data *data =3D ff->private;
> > >
> > >         kfree(data->effect_ids);
> >
> > Is there any reasons we can not also devm alloc data->effect_ids?
> >
> > > +       /*
> > > +        * Set private to NULL to prevent input_ff_destroy() from
> > > +        * freeing our devres allocated memory
> >
> > Ouch. There is something wrong here: input_ff_destroy() calls
> > kfree(ff->private), when the data has not been allocated by
> > input_ff_create(). This seems to lack a little bit of symmetry.
>
> Yeah, ff and ff-memless essentially take over the private data assigned
> to them. They were done before devm and the lifetime of the "private"
> data pieces was tied to the lifetime of the input device to simplify
> error handling and teardown.

Yeah, that stealing of the pointer is not good :)
But OTOH, it helps

>
> Maybe we should clean it up a bit... I'm open to suggestions.

The problem I had when doing the review was that there is no easy way
to have a "devm_input_ff_create_()", because the way it's built is
already "devres-compatible": the destroy gets called by input core.

So I don't have a good answer to simplify in a transparent manner
without breaking the API.

>
> In this case maybe best way is to get rid of hidpp_ff_destroy() and not
> set ff->private and rely on devm to free the buffers. One can get to
> device private data from ff methods via input_get_drvdata() since they
> all (except destroy) are passed input device pointer.

Sounds like a good idea. However, it seems there might be a race when
removing the workqueue:
the workqueue gets deleted in hidpp_remove, when the input node will
be freed by devres, so after the call of hidpp_remove.

So we should probably keep hidpp_ff_destroy() to clean up the ff bits,
and instead move the content of hidpp_ff_deinit() into
hidpp_ff_destroy() so we ensure proper ordering.

Andrey, note that ensuring the workqueue gets freed after the call of
input_destroy_device is something that should definitively go into
stable as this is a potential race problem.

Cheers,
Benjamin

