Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC1B1CB879
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 21:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgEHTl3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 15:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726817AbgEHTl3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 May 2020 15:41:29 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB26C05BD09
        for <linux-input@vger.kernel.org>; Fri,  8 May 2020 12:41:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b26so2346827lfa.5
        for <linux-input@vger.kernel.org>; Fri, 08 May 2020 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4LTBtkW42ncc3xQ7z7L3UptQlNLannjQiNWN85xz6s=;
        b=PJyrvR/+6sIkZyAcKbhumskZG8NDstC0NjMWeWUa2gXrnapzGgrIUDv//WNM52ITv6
         3Kgui9JoHsNvLQmzlOxVY1ZmU8LYVhjSAybWTonwvajI5Jg7mU7xhWVST6veGrCtgetF
         5BAO33H/r1llfRPVsarse3bYf+Rg1HyVgxe4+u6FUlHGFy8BJh/U3lY8olz8RyIEeNGN
         YZtn/yWuBKm3I/we0P8dnTRtpDU09oZBfP8rijonMrG4WEUiymNlOtNmdoVhtw+xUjQj
         sR28pIYVmKqUYIQSMbVOXahn1Xez2Sgerb/+VPH7g+Tij5QkxyHn0/XbomfIiTZUv+8W
         XrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4LTBtkW42ncc3xQ7z7L3UptQlNLannjQiNWN85xz6s=;
        b=rb17ytvptlckkbTGRu5JKH8RV7MiZX1Fexhljsi+phnazqnz2gdYdKPgYa7JnbZBx5
         Q/pi8x3lppaUBuEr7v0DeXdB4aNwHBjQiW2QI+7+N7HBDmxQLBBl6OjfWwzAqmQt3/rG
         J8T92TlgRmbauqaZdFT8obEEQy8FFP+5CW98NkkQGege+YJKNshbFQAZZ87txTgduhi9
         279kD1e5VfPm70G0ejMJRfIfqHFgOczBivqc619uVUIff2hIlioRT7ZLEDQbC+woK3Ir
         76H+EGJpA/KT5Fry+qyFJfZCBe/7cZsnrZeiqUdqxLPiX7RGqmsLov8iA2Y/biI0s5mI
         yjqw==
X-Gm-Message-State: AOAM531h79h9H26R9zgQ8erso87uxs2Xh4SsphWyut/4DoEET3yhbw5H
        ekOFvtFDEfuC7LDUr+TvbhqcZXI/QX44aDQwl2uDLw==
X-Google-Smtp-Source: ABdhPJzAjAstldzlrJ0KZee1gVua53zcjm+vjwc4UDwqEaPy842LDceP7toVn6P/HY7LTJK+cY0zCyMDWr1qXY8xY0g=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2921938lfi.47.1588966884749;
 Fri, 08 May 2020 12:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200503172206.13782-1-xc-racer2@live.ca> <BN6PR04MB0660B420EFA83668BBF4F315A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CACRpkdb3kG=7SQg8RGh1F=8=_mivV6p_zxpodFT=M-f3PmiyYQ@mail.gmail.com>
 <BN6PR04MB0660BA0E181869F866594E98A3A50@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200507042318.GD89269@dtor-ws> <BN6PR04MB0660FB7E230C514608743560A3A20@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660FB7E230C514608743560A3A20@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 8 May 2020 21:41:13 +0200
Message-ID: <CACRpkdaZtwVva0sqYgkyPzZNTTJRF3GjFUjhG0wDiOFqJHfniw@mail.gmail.com>
Subject: Re: [PATCH 2/5] input: misc: bma150: Conditionally disable bma023 support
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 8, 2020 at 5:57 PM Jonathan Bakker <xc-racer2@live.ca> wrote:

> It looks to me like the preferred method would be to also add IIO support for
> smb380/bma150, add the exclusive Kconfig entries, and leave the input
> driver in place.  Does this work for everyone?

That's my preferred solution for sure, so go for it if I have a say.

Yours,
Linus Walleij
