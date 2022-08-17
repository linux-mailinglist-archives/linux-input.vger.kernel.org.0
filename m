Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D785F5973F1
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 18:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240888AbiHQQQB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 12:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241201AbiHQQPp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 12:15:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F166A284F
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 09:14:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id fy5so25409725ejc.3
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason-is.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=iFd/hl8Lmkjh0k4mwcACREd/j+YkFMHuu1M0DrDBTpk=;
        b=WkwjHwf1vSpAXpi37XD5vqNrWmZ7BKwDLemh8kvhjO/e6aM/bWQNcxmcli7fcput0i
         n31F2zvH9lKXWtjQ7Ek6auQe9As7UArDsVKpjQs72yIYG7AEQUSA6OXPXzYne2q6SD9D
         QVHxH+yViNN1rQcs44gxw9SLbUtnLw356rF3bJzCtFAvGYL5hbndIfjrLVMesctEG7VY
         Gkxa4kvcdfMezHDhxkLkD3jeaesPTTJfZ8V+0qGKS6zHJQxBTptIrTkqjNbsW24Eknh9
         8mcyokRUQJjsgoG9y8jpOT2CzEFntYJTadOa0tdZtKxVHRf5D8mj1hJqxUCiFxd0wKYv
         p4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=iFd/hl8Lmkjh0k4mwcACREd/j+YkFMHuu1M0DrDBTpk=;
        b=IS+UlbfLqyD33E8hkn2OX6ho375mufMAEZ9xCh9MJnXYUXm9YrRogSqGSAINJlt8uz
         8faVQ3mJEqBe8VBkkFcxoFk0PAcSe02RWAAh2Xi7xwys5kjtCVToPHf443xnr7RB4tJu
         gNMLqJl3hmyKEbnlEM7Mibk4kGa6eQZx/C9zwOXhhDcy5/ZFywhRK6B4n2nImeLNn8zH
         jEID9qdftDr46xSVDfM2iDfVc8oTOsbMOk3yvQPbVq0am+QB1nbBH4Fo1kGa1IRzafNw
         NncdRVljbzHU3C9ar+Se7D9lCQtN2q//z6tF5tX7ZN6/5AB9g8te0fERmHJ82NuGbPNt
         5S1w==
X-Gm-Message-State: ACgBeo0AvwOnHHPOKEfgDmD7mQeUiK9bRKkOZcnqrS+WHcJWRSYRn11W
        pMRXSLqjSFk2407HAzcCYF12GZMy2f69eJM961J7vg==
X-Google-Smtp-Source: AA6agR4JKYhGh501ePpUu/2Q3O47dnbfc12nbNfkCASFpTx97st7yoF8s03AEMV375BPep3L9LmleQTfxWOdC61p9RY=
X-Received: by 2002:a17:907:2809:b0:730:aaf6:ffde with SMTP id
 eb9-20020a170907280900b00730aaf6ffdemr16873535ejc.44.1660752897251; Wed, 17
 Aug 2022 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220817113247.3530979-1-andri@yngvason.is> <YvzYIm21ZKYpUApA@kroah.com>
In-Reply-To: <YvzYIm21ZKYpUApA@kroah.com>
From:   Andri Yngvason <andri@yngvason.is>
Date:   Wed, 17 Aug 2022 16:14:20 +0000
Message-ID: <CAFNQBQyLtqA+yFDoqREguAK3q7qdKbacju=XKeUDTxsjXfFnJg@mail.gmail.com>
Subject: Re: [PATCH RESEND] HID: multitouch: Add memory barriers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Greg,

mi=C3=B0., 17. =C3=A1g=C3=BA. 2022 kl. 11:59 skrifa=C3=B0i Greg KH <gregkh@=
linuxfoundation.org>:
>
> On Wed, Aug 17, 2022 at 11:32:48AM +0000, Andri Yngvason wrote:
> > This fixes a race with the release-timer by adding acquire/release
> > barrier semantics.
>
> What race?
>

The race is between the release timer and processing of hid input. It
is quite certain that these atomic checks are broken as is because
they're lacking memory barriers and this patch does fix an actual
problem for me.

I must admit that I don't know exactly where the execution reordering
occurs and I haven't checked the generated assembly code, but if you
look at e.g. mt_expired_timeout(), you'll see that there's nothing to
keep the compiler or CPU from hoisting the test_bit() call above the
test_and_set_bit() call.

> >
> > I noticed that contacts were sometimes sticking, even with the "sticky
> > fingers" quirk enabled. This fixes that problem.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > ---
> >  drivers/hid/hid-multitouch.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.=
c
> > index 2e72922e36f5..91a4d3fc30e0 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -1186,7 +1186,7 @@ static void mt_touch_report(struct hid_device *hi=
d,
> >       int contact_count =3D -1;
> >
> >       /* sticky fingers release in progress, abort */
> > -     if (test_and_set_bit(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
> > +     if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))
>
> So this is now a lock?
>
> Why not just use a real lock instead?
>

I don't know. This stuff was introduced in
9609827458c37d7b2c37f2a9255631c603a5004c by Benjamin Tissoires.

Cheers,
Andri
