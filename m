Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6492D04C9
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 13:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgLFMcO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 07:32:14 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:21576 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgLFMcO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 07:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607257701;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NdhkBxtn7L94tUEdaXrhYTzEd2GtpsrUba5lNB5ugvI=;
        b=nFMZ9YAv3IjVdPRpckI0Q3rYwQMH6l3Krg+tdWWOI8hDr9jQvkGGrHkJnziAjjm7s0
        q69nefcfYWCrpNq0t1e+1ji4cjH4E1bWLfdtHA8DV7aK5+Lg03FHA4lypNWuyLbRBbLx
        1QAvdpHgxxHs81e4Eda/KIeBfqbeGtwdcMNztoN7juezbitpKRgZDJlj3fmTuBTS/B/R
        J8FxFv2bG7bNH6WvFUl/HDYxon3q5e0WOjZOxvIP9UH1zJrXj19HxKoFYcGdUQFURMO3
        uuNu0rvo010Jdo+M516TK3GwyVzbfColQvspFxy1XQWKzh+mqrko9HigyAthH1yPDSx+
        5r4Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8jxIcnBBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id Z061efwB6CSIZEy
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 6 Dec 2020 13:28:18 +0100 (CET)
Date:   Sun, 6 Dec 2020 13:28:14 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document
 vddio-supply
Message-ID: <X8zOXpJ7fjIlgtnP@gerhold.net>
References: <20201203131242.44397-1-stephan@gerhold.net>
 <20201203131242.44397-2-stephan@gerhold.net>
 <CACRpkdadiyYK5i8+TaLqxjmp4mUJ8eTiyZkgPXp-Qa2+CD8DrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdadiyYK5i8+TaLqxjmp4mUJ8eTiyZkgPXp-Qa2+CD8DrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 06, 2020 at 12:09:50AM +0100, Linus Walleij wrote:
> On Thu, Dec 3, 2020 at 2:13 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> 
> > The Samsung touchkey controllers are often used with external pull-up
> > for the interrupt line and the I2C lines, so we might need to enable
> > a regulator to bring the lines into usable state. Otherwise, this might
> > cause spurious interrupts and reading from I2C will fail.
> >
> > Document support for a "vddio-supply" that is enabled by the tm2-touchkey
> > driver so that the regulator gets enabled when needed.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> > +  vddio-supply:
> > +    description: |
> > +      Optional regulator that provides digital I/O voltage,
> > +      e.g. for pulling up the interrupt line or the I2C pins.
> 
> I think the funny pipe | us only needed when you want something to be
> fixed-width like ASCII art or ASCII tables. But no big deal I suppose.
> 

Actually, the pipe | effectively means that new lines \n will be
preserved in the parsed output, i.e.

  something:
    Hello
    World

means "Hello World", while

  something: |
    Hello
    World

means "Hello\nWorld\n".

In practice I guess it doesn't make much of a difference for these
descriptions. It also doesn't seem to be used very consistently in
existing device tree bindings, so I think it's fine as-is.

Thanks,
Stephan
