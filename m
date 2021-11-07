Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F4344713A
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 03:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhKGCi0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Nov 2021 22:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234067AbhKGCiZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Nov 2021 22:38:25 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A980AC061570;
        Sat,  6 Nov 2021 19:35:43 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id h133so6494645vke.10;
        Sat, 06 Nov 2021 19:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uWa1Lsx79Z+kAknz0IEDMrRD29Py/rUGOZWi/wk1Psc=;
        b=Pn9GrtnmQCuBgr5FH6P6A7+6V3V27jI1pXejjQ8ryvITvEjwdkhv9XVLOz+0RI9Iuu
         S61SJTNw13xlF9a+XLQFyAKmNA3soKV1HbusqORNdDklZ/ck6sT7BSUgFBjRXp7lyX/R
         80WZJbrzy6LRF4IC6ZGhQr+eTWbzAv2EJaI/kL+v1s9wIvCzgD9QQerMEnXq2iQo5+Fx
         E4Al3VvoffMjxTTiIph7Hu5YXDQhQfV7Qr9oA6uae+mIF5aNxfBPJWyZJ/mlmMVjB+CT
         gSDqrkmG53mNphMnd+z6zsPGo1IrxbMk1CJxysvUpvXftURIaC7pgsiJOQETiDvskjeT
         l6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uWa1Lsx79Z+kAknz0IEDMrRD29Py/rUGOZWi/wk1Psc=;
        b=4ya6bLjtyRYq9XkpMI1PQq9+ATkyL+bcthR9qxJaSrOk+NJn9jdnRr4INf+72z6P+6
         bmmVzn8X7bRo4m51jX31FQqu0xSwPyiyJUH8+YgEoPu5UgEdv9HckQJdD0bSvhynDkVN
         ebz5VGunq5pMiar3y0dY1GOqnqmudL1hyxHGoc1kOAsFSV4tu8sIJlsWDsr5dKLEi0l4
         6/MWYt5HTxWJQyy50qzxgADfCliAnHgefyjzRqfxhCN/+cI+1CvLl/jLgg7GlF72OtyT
         LAFlolPhYVmuTscWemyu9eBBy5eWEY0SZoKX7CfB96m66erenC8wO9GUVDXKL5cscEez
         kUtg==
X-Gm-Message-State: AOAM530rd992bbhJ2us7AYerFMNk3SsEdRMimUnx0WoL+l42CaCkBKig
        p2O7pGYtxpFitbsGnyQl9zFIOG2sU2SQiNaBY9aS7pMg
X-Google-Smtp-Source: ABdhPJzHkOQIhqwjGk46e308holh2gpEyM29nG9istOzTkQuRXBYodgWpeDI0fnhp420kuWr5JTQio3kfWzzYLIk/E8=
X-Received: by 2002:a05:6122:989:: with SMTP id g9mr64339469vkd.2.1636252542717;
 Sat, 06 Nov 2021 19:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211008222327.9324-1-angiolucci@gmail.com> <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
 <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com>
 <YYWoRW9NRC58zQ9w@google.com> <CALawNGBookRkFSGdGJrW1hboJ8kpsPj_rwAkNXQ3mU32oDv-sA@mail.gmail.com>
 <YYc1I8aTLxd0FOE2@google.com>
In-Reply-To: <YYc1I8aTLxd0FOE2@google.com>
From:   =?UTF-8?Q?Vin=C3=ADcius_Reis?= <itsme.vreis@gmail.com>
Date:   Sat, 6 Nov 2021 23:35:32 -0300
Message-ID: <CALawNGDtzNBgJyc6Ammbp_-5n0EBamXQG84r_FC8WtN9QzFS=g@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to KEY_SCREENLOCK
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Em s=C3=A1b., 6 de nov. de 2021 =C3=A0s 23:08, Dmitry Torokhov
<dmitry.torokhov@gmail.com> escreveu:
>
> Hi Vin=C3=ADcius,
>
> On Sat, Nov 06, 2021 at 08:48:29PM -0300, Vin=C3=ADcius Reis wrote:
> > Hi Dmitry,
> >
> > Thanks for explaining this a little bit more, I've got the point: The c=
urrent
> > key code triggered by the kernel is correct, the real issue is the lack=
 of
> > support for that particular code by current desktop environments.
> >
> > I'm new to contributing to the Linux kernel; the proper way to rollback
> > this would be by me just sending a revert patch to the respective
> > maintainer?
>
> Has the patch been accepted? I'd wait for Jiri or Benjamin to chime in
> as to what they want to do.
>
> Thanks.
>
> --
> Dmitry

Hi Dmitry,

Yes, it was applied two weeks ago. Okay, I will do that.

Thanks again,
Vin=C3=ADcius.
