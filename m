Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9DF26BC31
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 08:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIPGIw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 02:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbgIPGIv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 02:08:51 -0400
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 144082087D;
        Wed, 16 Sep 2020 06:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600236530;
        bh=yq+rh/yidum8ufs/ceMkyfzcJR8SkmGhPc5YlK4pJug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tHgSfo1UbdAD9x6dURfRbzyyfotz9ZBhxm3dW4JLwBxzBD9dHm0P1NyWkaRGPOfI0
         cA2iztOi+qNuXMyFFY0qPD3m3Am5owsuWc6YOrJorFoGmOqxFHLE99lW6/0R5LedMS
         0deYcA0i2gnVQ4unVDdyyT/RjdQ4AriwyNzBYKd4=
Received: by mail-ed1-f46.google.com with SMTP id n22so5060506edt.4;
        Tue, 15 Sep 2020 23:08:50 -0700 (PDT)
X-Gm-Message-State: AOAM533jnA5T4I4a9Kq5Re2cEQYcOuxY+2bA6fCaa7IH9bWkg+EFEoo1
        9mDvI1BUkHV8P+7T4dxZ8H+5LOmmvqg4ikIohMQ=
X-Google-Smtp-Source: ABdhPJxP81HSvrNQp5Kg5be5vASZ61X4kdfIAE4mMNX3H3Ax1gIcvuHBDdEtIIRGjRc/uSg3wZmhVjn1J9yVFQzvCSs=
X-Received: by 2002:a05:6402:1a48:: with SMTP id bf8mr25553137edb.298.1600236528625;
 Tue, 15 Sep 2020 23:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200828145744.3636-1-krzk@kernel.org> <20200828145744.3636-4-krzk@kernel.org>
 <20200916010140.GG1681290@dtor-ws>
In-Reply-To: <20200916010140.GG1681290@dtor-ws>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 16 Sep 2020 08:08:36 +0200
X-Gmail-Original-Message-ID: <CAJKOXPesf1mnt_QC59Bgt27r4Ntu4vowBQCvexmRkASVhuPLEw@mail.gmail.com>
Message-ID: <CAJKOXPesf1mnt_QC59Bgt27r4Ntu4vowBQCvexmRkASVhuPLEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Input: sun4i-ps2 - Fix handling of
 platform_get_irq() error
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 16 Sep 2020 at 03:01, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Aug 28, 2020 at 04:57:44PM +0200, Krzysztof Kozlowski wrote:
> > platform_get_irq() returns -ERRNO on error.  In such case comparison
> > to 0 would pass the check.
> >
> > Fixes: e443631d20f5 ("Input: serio - add support for Alwinner A10/A20 PS/2 controller")
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. None
> > ---
> >  drivers/input/serio/sun4i-ps2.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
> > index a681a2c04e39..7da1ea8741fc 100644
> > --- a/drivers/input/serio/sun4i-ps2.c
> > +++ b/drivers/input/serio/sun4i-ps2.c
> > @@ -265,9 +265,8 @@ static int sun4i_ps2_probe(struct platform_device *pdev)
> >
> >       /* Get IRQ for the device */
> >       irq = platform_get_irq(pdev, 0);
> > -     if (!irq) {
> > -             dev_err(dev, "no IRQ found\n");
> > -             error = -ENXIO;
> > +     if (irq < 0) {
>
> "irq" is unsigned here, so this will not work. I'll change it to use
> drvdat->irq which happens to be signed, and drop "irq" variable.

Yes, thanks. I wonder now why there was no warning of unsigned<0 comparison.

Best regards,
Krzysztof
