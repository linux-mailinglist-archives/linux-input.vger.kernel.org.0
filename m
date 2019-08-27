Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326669DEF0
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 09:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfH0HnA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 03:43:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36584 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfH0HnA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 03:43:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id u15so17527965ljl.3
        for <linux-input@vger.kernel.org>; Tue, 27 Aug 2019 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DbaQN5lQG5PhayNJm6ofuK4UBXmTcy1tI10d3jvgHCU=;
        b=A6eWBMhHhLQjZxk0QZVj1/zy6hsxB6T9+koUgWtRrGfFHhRAinL2GFgmFw3eqYfzIy
         4LPQ4K8BjydZGt4cCEAuFHtf7AgHOEZ4zBPnxUf1IorkwshlPrmPLr6BmI0aos/dhDFo
         u5ClpEPLp2+/pvdPCOF+Q32817xbmc0SpN1J9CMj01595p1t39y8wGUbZao1edH1yPbj
         QXfUyhkDlLPbnNnIVDDxT63K7Xf/tAMHiPKD0xk1LPHcH9A6Uq96LG4uObZrMTNcLl6H
         fqIj23OrqRFi/Yrj4SUuuOuXWe8P82DHUSb2A87eiMYfV3bAaPFIN1z10DdKrB23FxvM
         PcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DbaQN5lQG5PhayNJm6ofuK4UBXmTcy1tI10d3jvgHCU=;
        b=r9kEvkWwqYJN5vHDb1/s7FwXLq/iamHwJ6lo/z5BattWwGc/5qvNvvS8b2qsQkp5L8
         4rbjuU1bLesI3u1X/pybJDmmxgqkwdok2xq+pYPrTFvtOGqKoTscC9C87lKIpvrMxsV0
         78OJ9vt9vw/PS5ays7pkkPohquUI3P+5KgWXDyiRZ4D37vsRf631JmXv7cM9RJZIpWQY
         FHiZzP+kfESRg5cqVlQ1dYwKgimzv1CCxNpaIJNz7b/4nBG3OWj/OccW239gfGHzWqGe
         1k1VoT7+NoD5c/wDDSiqgJS6QCpfwqZrrCfhY8ZRtm39tm3Dja75Ck69S9nGeMgP/FfR
         6K9Q==
X-Gm-Message-State: APjAAAVKTg5ni1b0X6gNGLl9U7W2bF3ZfaaxM6wP/6UIS6m1e8uUen1o
        qlQF/WONt+A3j0XKnOhXAzE3Gwewpc5zwrnbzrn9pQ==
X-Google-Smtp-Source: APXvYqzheeGJyqRkncJ2J0YcY4zURcDf5exuFHynMcmTIs31SslHtjb2DBsUHTeshcC0qadJggmKkGlpScdKw+hMgdw=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr13161238ljo.69.1566891778138;
 Tue, 27 Aug 2019 00:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190823071021.5598-1-linus.walleij@linaro.org> <20190826220022.GA7663@dtor-ws>
In-Reply-To: <20190826220022.GA7663@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Aug 2019 09:42:46 +0200
Message-ID: <CACRpkdbv8yVP==WDo-wBgotyvnPhApTCD2x7oamCHBQKuNp3RQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 27, 2019 at 12:00 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> >  Optional properties:
> >  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> > -  The penirq pin goes to low when the panel is touched.
> > +  The penirq pin goes to low when the panel is touched, so make sure to tag
> > +  the GPIO line with GPIO_ACTIVE_LOW.
>
> I think this is too strong. I am sure that one can come up with a way to
> connect the attention signal though polarity inverter and then one would
> have to specify GPIO_ACTIVE_HIGH in the DT.

Yeah this is something that has been discussed recently as
Harish is suggesting to add an actual inverter to the device
tree model. As the description of reality in the device tree is
incomplete, these flags, which should nominally be consumer
flags and indicate the behavior of the consumer, becomes
a panacea for solving shortcomings in the device tree model.

I am in favor of introducing explicit inverters in device tree,
as it makes the descriptions more consistent: e.g. regulators
are consumer oriented, they even model rails to make things
very clear on where a voltage applies, whereas GPIO polarity
is defined as "trial-and-error until whatever makes the system
run" more or less.

> Can we say:
>
> The penirq pin goes to low when the panel is touched, so GPIO line
> should normally be tagged with GPIO_ACTIVE_LOW.

Sure, this is not the place for hashing out DT design issues,
can you fix when applying or should I send a new version?

Yours,
Linus Walleij
