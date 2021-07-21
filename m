Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B1C3D16E3
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 21:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhGUSeF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 14:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhGUSeF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 14:34:05 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AF4C061575
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 12:14:40 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id o19so2030285vsn.3
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4wcFqfNjxtmQAlSjGMglM6L9n0o57X7aGjmu5s8Pxuo=;
        b=im24KTMzv2cxWCUviPpIcU47n4j6DEhaaUFymXrcb7x0NxaVs0uhdHxynJdg7caMQG
         mwHgN1hwx6mCNZKNh4uKgXSS5pUfYd9GKefF9YQMSMH9wX9EA+yug+dc020Z+0aNX+ip
         V3fL8iKVAepj1Hf3xv3z+UqNJptzP/yxrhKSsKC2c7iQBfajrVYkmXIhJ/waai0wFNbZ
         RZvfcMfdhROtEngL16KGGSciXJB3IwrvxhqoUfpXO2MvZ4i6KWdvJ/iDhrSfu/TexYTF
         0pUXxJkYyuQaCbYRrcF2y/JLnBjqZI5cdhSwjjK/08f6IwMs7TTT6Q3eCH2y3i9PVY0v
         S+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wcFqfNjxtmQAlSjGMglM6L9n0o57X7aGjmu5s8Pxuo=;
        b=RG2f2YLIAobyG9/Lku+EzRo9ar5MAhAogG9f1D384TD0gwjx5i0+suLAtHGgh6NZ7U
         a2iEXCeDQi7hqHwJjuycXygjs+fvcnJSqhegKqBfBIAudR+GmLGG/iUYmEPomjWrF+kU
         TGEAODTl2ACDIWqmi5ekbn9+zZJA9Q6lYWT/wgSgW9lM3Rwz9WWLwBe4TVx2IPPE1nSN
         Z8OzlLZD63Z90F13PhOLI9jPyuoiU+xhbScQJfeRn69ft/WJ7DT7thOLBCoUIbg7lAma
         9MiVShEq6+ZT3lPDlGhBVWBHvkDp+0Smq54/P+qeWoBuKmTNHsHYdqDw4ULdsqwPsX6V
         +rQQ==
X-Gm-Message-State: AOAM531Dwn06NhYiuSu+3BxAAIS+RZrbfdgE2HyQ7CXC4Qq4d9P+VVyF
        rePnCjpiF+kSSYsM8LlFOIdTvghWzTIkTQMTqG4=
X-Google-Smtp-Source: ABdhPJztxaupb/RlwHFi3ceZHc5KVmqussEy1T+qn33EexdT9Jw8wYN8hkPxKXA5GmroBIJl1Sn4nUfR3xXq0ZW2VDk=
X-Received: by 2002:a67:2204:: with SMTP id i4mr16190718vsi.46.1626894879483;
 Wed, 21 Jul 2021 12:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
 <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com> <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
In-Reply-To: <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 21 Jul 2021 12:14:27 -0700
Message-ID: <CAKdAkRT=O5f7=bCOKUea0LDQnEUtV8Mu0yMbQNTcoB+7Q_3GNA@mail.gmail.com>
Subject: Re: Elantech touchpad not working on mainline kernels
To:     Hans Schultz <hans.schultz@webspeed.dk>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 21, 2021 at 11:09 AM Hans Schultz <hans.schultz@webspeed.dk> wrote:
>
> On Wed, 2021-07-21 at 10:48 -0700, Dmitry Torokhov wrote:
> > Hi Hans,
> >
> > On Sun, May 30, 2021 at 2:12 AM Hans Schultz <
> > hans.schultz@webspeed.dk> wrote:
> > >
> > > Hello,
> > > I have a problem getting my Elantech touchpad to work with the
> > > mainline
> > > kernels, and I need some assistance with the code to resolve the
> > > problem.
> > > The kernels that have tried are 5.9.11 and 5.11.11.
> > >
> > > With boot parameters i8042.notimeout i8042.nomux, the touchpad is
> > > detected but does not work. There is absolutely no response from it
> > > with any hid modules loaded.
> > >
> > > It is reported and seen working on a Lubuntu distro (bionic kernel)
> > > when inserting the i2c_hid module. The insertion of the i2c_hid
> > > module
> > > pulls in the hid_multitouch module when it works, no boot parameters
> > > necessary.
> > > In the case where it does not work, insering the i2c_hid module does
> > > not pull in the hid_multitouch module.
> > >
> > > I have the bionic kernel code, but I have not as of yet been able to
> > > detect what makes it work in contrast to the kernel.org kernels.
> > >
> > > This I think should lead to a kernel patch.
> >
> > There is not much to go on with. What is the hardware, your kernel
> > .config, dmesg from unsuccessful boot? If you have logs from the
> > working kernel that would help too.
> >
> > Thanks.
> >
>
> The best info I have on the hardware is from Xorg log with the working
> Lubuntu kernel:
> [ 130.980] (II) Loading /usr/lib/xorg/modules/input/synaptics_drv.so
> [ 130.982] (II) Module synaptics: vendor="X.Org Foundation"
> [ 130.982] (II) Using input driver 'synaptics' for '0X45 0X4C 0X41 0:00
> 04F3:308C Touchpad'
>
> I might be able to get the kernel messages when inserting the working
> module, but I think it will not tell much more.

OK, if you say so. Then the only suggestion I have is to verify that
your kernel config enables all necessary options for your hardware.
I'd double check if you have Designware I2C controller enabled, ACPI
LPSS, etc.

> To me it is clearly a code issue as the working kernel pulls in
> hid_multitouch when inserting i2c_hid, while the non-working does not.
>
> All kernels I have tried up to now from kernel.org do not work. The
> latest being 5.13.4.

Thanks.

-- 
Dmitry
