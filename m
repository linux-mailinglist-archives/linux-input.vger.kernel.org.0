Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08DC1C70A8
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 14:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgEFMqe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 08:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728531AbgEFMqd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 08:46:33 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2008FC061A0F
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 05:46:33 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l19so2167333lje.10
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6I5B71LB2tx8NkY3iMd5afhpiClRHsfBP+XO7hQfwQ0=;
        b=TI0vfp3TRQ+fo+Ftt8w28gJvS8/Fx92njAumbEuZ9+grZMLXauPna5er/RZoObVc1H
         8Id0Pn99SUAm7ROLJA7nYVUVW3Sr9eNJzc69Hv0k9QTpWdz7pwg1n7StSrZWqOFa+Swa
         vtPpIXsB+ye2J3WWvl2WAbXhy28q0nWi+vklvYn3bX++b8G/qKfm8v0z8My5r7qLiKS5
         sZfKqEOgunIYs9qjCjI4KQOTHbVR4Fbux34GFW2xCkO3xZY+tXkMNrgeZsAmniLNt+r5
         tBiVyTwgHeK9PYqHI8NoWXxTjFTrf6BExXtiXHUsC2zi2le0W2Kz9Fq//m2aq4cRpQr9
         l5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6I5B71LB2tx8NkY3iMd5afhpiClRHsfBP+XO7hQfwQ0=;
        b=GX+FJ1oUroW4uP1VtJR1C2kYai5VtW7SajCGSb2pi4A1UpwLZbSYYcx+pmxqHwYTmu
         IUUpMQTEgiu98RbGmmqHKoVhNmlqieFbGkfjuu3io8QIBMCUy4RDKiuFdw4W34R2AOH1
         ZlhtrElwLohbdIPGZX9Y8WXCt87G1OnoOrSgyLED1uwyv1KvQSBRbcPECC4AGbME+xg7
         t8U/nQGf2v122akAbKpbBpwwEvGjsBDxnCvTL6PCiQt0ogq9jhCOzOb/jEivfGOxWcqX
         kEBizfk6YC3Rw2pmwGHPYZKgEWiCX1tCMyJxDVLW46j5e6OOF4FYw58LuRm3MuKY/sDu
         ayHw==
X-Gm-Message-State: AGi0Pua4RZ/ZyvawGi90g8GGdDQ0x9LsSR82fNUBeHurvfsrFllrB89V
        AtAq1SaHoeZ7IzeoHg20SR7hlWvN0sFN8GP8awD4pA==
X-Google-Smtp-Source: APiQypKjSNXNsOwm10b3OBfJycZDQ2nv5L9JVoyA1mI806Vv9L519kB9NbY3ozJ7XHzgJ+kpouOaXHhCmwG2pl4nGkY=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr4713852ljq.125.1588769191594;
 Wed, 06 May 2020 05:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200503172206.13782-1-xc-racer2@live.ca> <BN6PR04MB0660B420EFA83668BBF4F315A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660B420EFA83668BBF4F315A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 May 2020 14:46:20 +0200
Message-ID: <CACRpkdb3kG=7SQg8RGh1F=8=_mivV6p_zxpodFT=M-f3PmiyYQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] input: misc: bma150: Conditionally disable bma023 support
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 3, 2020 at 7:22 PM Jonathan Bakker <xc-racer2@live.ca> wrote:

> The bma180 IIO driver has been extended for support for bma023.
> However, this could cause conflicts with this driver.  Since some
> setups may depend upon the evdev setup, disable support in this
> driver for the bma023 only when the IIO driver is being built.
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

I would just fix this with KConfig instead, like add mutually
exclusive depends on these two drivers.

Set this input driver as:
depends on BMA180=n

And the IIO driver as:
depends on INPUT_BMA150=n

It's a rough measure but this input driver should anyway
go away.

Yours,
Linus Walleij
