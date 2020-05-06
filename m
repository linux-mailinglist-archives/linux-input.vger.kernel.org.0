Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F4B1C70D1
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 14:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgEFMvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 08:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728172AbgEFMvS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 08:51:18 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DE4C061A0F
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 05:51:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l19so2184150lje.10
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COqQCzJ4auJxawCeL75BevJEbAnSN1myQOD2Q4QlS6o=;
        b=aUP/Sxk2re3PRk+ECqewTQ+F6wOEpuHPLfG7pOjR67sNQWZCZXm7Pfzn/ZAYrBQSbY
         HVhJOF8T1bwfgCt/z4GB6Ow72DCwp+iAHjSoprUUYF5vtKSY8Cy5Xl4kJdlz2Hn/zH5o
         4C3uG3jkQiChJm4nW6t0LQ5NEH4t3yE246s/ohqdudan45YcDTTSmK71uwDs+nHhvsvW
         Y5igS6gapbGHcIHtefdk9vrArC3GRfr+RqBbTaLOzZxsy1IWVjbepibeT/Lb4UK0thrP
         y5pz35U+/XWr9Bm+eiGtlMLF/XRlRGyQ/eEX64km/9WDAVpPOMdw+gSlGnegG2NrgeXY
         E2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COqQCzJ4auJxawCeL75BevJEbAnSN1myQOD2Q4QlS6o=;
        b=ZnNeb/9FYJKLwqLHfTNLHOFmMga2Gg2XQ5mVKQ56fbQ7QpAozqaQF3wTdQqIsqBnIz
         9rG8KK69eWZ84XLkDXkss9UVPBUkOFi3CiKsSJiBF/FdsYstxOvozFYGo6xO/c1mLQlk
         EVdfFqehuw79mmAXEG6q6t0wLjdyj6jMR+PixOVBuZvvGmf/BlsvbvRCR7L7/IJ6j182
         mTNadXjyqoKNnhnz5SXFdTq9jroh29NcLrnHQLzn/+XdoEosbOq8jyBmloxNbAj+v4th
         Hr/Y/9jKTKDv8/Sw5Y4vFPgow6ZidYkN0w18q6OvvEF/qp5vc3xErmJx6gts7kdui6TT
         9CBw==
X-Gm-Message-State: AGi0PuZhrQY9VlDSD+8oikC8yUoBL5qIBz2B/UMre6BLu4n9rpv/+whY
        MvfYu/PGMMfl0gnMQP6WV3CPE8r3bTOD5jnsuXD+1w==
X-Google-Smtp-Source: APiQypImbwPouCSTKAxAbrKj370TdmOTHAg/3XPenrNSIG2xSYlnZPNpgYrCuSMEoTyq02M+FrCmk94OR5vDtNs6eq8=
X-Received: by 2002:a2e:81d5:: with SMTP id s21mr4764927ljg.258.1588769476101;
 Wed, 06 May 2020 05:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200503172206.13782-1-xc-racer2@live.ca> <BN6PR04MB0660C583D9538853C8296398A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660C583D9538853C8296398A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 May 2020 14:51:04 +0200
Message-ID: <CACRpkdasEU0ao0OZBoeQ9x5Efe8tFwtpkLMOU_=Xn639anJxbA@mail.gmail.com>
Subject: Re: [PATCH 5/5] iio: accel: bma180: Add support for bma023
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

> The bma023 chip is similar enough to the bma180 and bma25x that the
> same driver can support all of them.  The biggest differences are
> the lack of a temperature channel and no low power but still working
> mode.
>
> The bma150 is a close relative of the bma023, but it does have a
> temperature channel so support is not added for it.
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
