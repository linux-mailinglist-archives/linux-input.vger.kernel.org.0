Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661F41AFE6A
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 23:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgDSV1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 17:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgDSV1a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 17:27:30 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24353C061A0C
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 14:27:30 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so318389pfx.6
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 14:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/rEjth3Nn+NH387L2IrSHhtbQKwJghgO7qFOBkpiyxY=;
        b=btGVh3me01xbobSGqnQMF68r7z6KlxGGd2q8cV3fqnpTlGsWCGAm5YNOf4qQvUDvSX
         7HEdZ9zM9bEPO0ZQ+6kNkKuAzVS5MFF0JpdTDolH8S+xR7lNhwTlLNvMX66oW9QG9nDi
         CxJosCObc1bJnbLQnbg73RysDWkyDwsZk1Lc5WnT+9tjI9SDBQWY8QgT77DvHK0Hijmn
         n6/kmwKKKqiTU4FuEjPwrCCKkLHLX5c18I/iv7doJmgifNzrTW3lckEYOYqXai5Hz1c6
         iw5F7ptkJM6UnLvkZ0XjihU0lFYd+NzGs4lPKJPlOoEPaH+yMwhJskWA9EI31lKNSrKH
         w2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/rEjth3Nn+NH387L2IrSHhtbQKwJghgO7qFOBkpiyxY=;
        b=to/I9zOdExvbekKItrGxdoTuW3ZrVO/XFsA7xjXY1Irovu0o+NUlKYajr/UJI4m1Zh
         O62AHpyUtMsfdpCqA2sjIlUvZYqtkMCAKpnAp8QhbdrukveCA7o3nOUltJyqSxsjmy2S
         UKaJT/fkp73iL9/dwsN9DW6u65t4VmF6G9kCd8yRPw3cavpjwFw0Z7bgVGU1pRtZ6MXR
         FxMkQQuHGaDPjkoGaIhB3ifEv8sffgiPfjo3NRDROHxY4u9Ntm1NFcTKGGJ7JlnZzI/W
         C+8hm2kV1d68+mRg4UoJXNmqCL77a3VOvlS7Rx+qJO28qJriJVaBraIqj2c0PH5Aae32
         VGQA==
X-Gm-Message-State: AGi0PuZ7i5JlaDkRthw6+VC2KkCFaLDNz3pVB9MI7xBahv7dsWASNQWt
        RteG8ITXyyt6znyC8GW0jY6994IdMFiOHgO6tNM=
X-Google-Smtp-Source: APiQypIJEPOYtBQ0iYTqWTS2gktq0u4JBBJjAgIskMchJK1oSBKcEAqDym97elF+1lTkAladldfXizZGpcrr1QyAmgE=
X-Received: by 2002:a63:5511:: with SMTP id j17mr13100995pgb.4.1587331649509;
 Sun, 19 Apr 2020 14:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <1581410472-3225-2-git-send-email-haibo.chen@nxp.com> <20200310042643.GB192640@dtor-ws>
 <VI1PR04MB504032C19CA8D76AE845AE6A90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
 <20200419181000.GL166864@dtor-ws>
In-Reply-To: <20200419181000.GL166864@dtor-ws>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 00:27:18 +0300
Message-ID: <CAHp75VcXSuechQ0vXatDgVRqQDzred0y9AvGytWvgQtxa8N9vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     BOUGH CHEN <haibo.chen@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 9:10 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Mar 10, 2020 at 07:15:35AM +0000, BOUGH CHEN wrote:
> >
> > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Sent: 2020=E5=B9=B43=E6=9C=8810=E6=97=A5 12:27
> > > To: BOUGH CHEN <haibo.chen@nxp.com>
> > > Cc: linux-input@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > > Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before r=
equest
> > > the line as GPIO
> > >
> > > On Tue, Feb 11, 2020 at 04:41:12PM +0800, haibo.chen@nxp.com wrote:
> > > > From: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > + egalax_free_irq(ts);
> > >
> > > It sounds to me you want simply disable interrupts in suspend. Does n=
ot
> > > calling disable_irq() here suffice?
> >
>
> > Here why I want to disable interrupts here is because in the newest
> > gpio system, if the gpio is request as an irq, it can't be request as
> > a gpio anymore.  In the function egalax_wake_up_device(), we need to
> > request the irq pin as a gpio for a while, generate a signal to wake
> > up the device. So before request the pad as gpio, need first free irq
> > resource.
>
> This seems like a fairly common pattern and I wonder if our GPIO
> overlords can help us here.
>
> Linus, Mika, Andy, would it be possible to have an API that would allow
> driver to temporarily "take over" GPIO that is used for interrupts and
> drive it as output without resorting to freeing and re-acquiring irq?
> I.e. something like gpiod_irq_drive_output_start() and
> gpiod_irq_drive_output_end()?

Shouldn't it be handled by pinctrl states? sleep state / default state / et=
c?


--=20
With Best Regards,
Andy Shevchenko
