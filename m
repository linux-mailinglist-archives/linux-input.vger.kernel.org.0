Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C09252F89
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 15:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbgHZNUa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 09:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730234AbgHZNU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 09:20:27 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A01C061574
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 06:20:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d2so975068lfj.1
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJaGDmLdJPKjfGDHcMr3rAoHEtfMcI6VkY/+OxwCTgU=;
        b=s4+NeaHWp0oVp3osI2v8nKxJ4O782LZXreBuPNIXh29TnbrWrfzF4jTHIakForMeWe
         5/Y/g28qM5Y4iobiJF8QzZNTWviNL3Y8QFVBpUdXdIVTNELNvJ8PjQ7vacQMKf4MSomp
         +ODKJbfbO84yR0MWbK6RzktW/33Je6aG45+f3HR6fgN8BxieYs+C6yr3bzsCzodBpHDO
         hFPgQ80uSkBmfrTeTo7G+hO6W90QLTMxN7izEsIMZ2nYZZI1Rk8eqkP8wls13q5rhqS8
         BDNKD1K6BcLtso8PycdAr4GBd0kzK22Ns+BQzmOSx1zSHGj9CSpeSfxQG0RwU+hUwgjS
         LRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJaGDmLdJPKjfGDHcMr3rAoHEtfMcI6VkY/+OxwCTgU=;
        b=fv7Q2ALtsxdvhhO+9lrTA3L/WA5Zn67Rnwx4cmyE0uKVEAZqTooo5tF63xL2754qjH
         9+lITcHUgdEhZTg+mn9HgM54k7pwaQIj//N5IIOZuYEIJbEGPMqxfKkAJTfQZ65QPMJu
         U/mG9kN/st4U7cJQsrudyb1cc5gob+J1BYMsm8RU2dYFtm9zf55xkqB588oGwsCiT1dC
         sJxMOf67H7q0xhm4ZmD0yW1jD8L2p5h24hUFTYBjTrOk43miUTxlFeFRWrqgoEu4FeX0
         8/T2Zd7bCWidDD5tPv0AtraRzdhIua5MDMOMVCcu/y6g/TTlEiifiX+c42F4zQ1Wd6jQ
         C+Ew==
X-Gm-Message-State: AOAM530HWWeUA0VuLTziBEDBJ52j51D+YLnu1TIWlDjF6iDBX269o4tc
        MX5f/4dh5Uo1qch29en39dQLT0F0w4jJAaMbmyLAww==
X-Google-Smtp-Source: ABdhPJwcxRypNe38mdDqDyeXgPOKYKdbtPZNViVMl/pVUiJT/Ls+QrrC85z1HrEyQe7k8mgLyqmgY0bt6tFsP40+YKQ=
X-Received: by 2002:a05:6512:1044:: with SMTP id c4mr7342603lfb.77.1598448025255;
 Wed, 26 Aug 2020 06:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20171124093045.5961-1-linus.walleij@linaro.org> <20171125233324.afdt4netamvkrkm2@dtor-ws>
In-Reply-To: <20171125233324.afdt4netamvkrkm2@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Aug 2020 15:20:14 +0200
Message-ID: <CACRpkdb6kt8Bb0FnPoixw97R9oktK9h3uTS7JfdxoCKfLo4yhA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Make gpio_keys accept board descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sun, Nov 26, 2017 at 12:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Nov 24, 2017 at 10:30:40AM +0100, Linus Walleij wrote:

> > The goal I'm working toward is to rid the kernel of the global
> > GPIO numberspace.
> >
> > This means GPIO lines should be references by the local offset
> > on the GPIO chip.
> >
> > This patch set starts to move gpio_keys toward using GPIO
> > look-up tables instead of global GPIO numbers to find their
> > GPIOs.
> >
> > As an example I did (I think) the necessary patches to
> > convert DaVinci and i.MX to use this. There are several users
> > also x86 platform devices.
(...)
> I think this is a worthy goal, but I wonder if we could get static GPIO
> descriptors work with fwnode_get_named_gpiod() so we could retire the
> platform data parsing altogether. We'd need to extend static device
> properties to have notion of children though.

Do we have this now? I've looked at Heikki's et al work
on software nodes but I cannot see whether we are there now.

We have fwnode_create_software_node() and friends, but
I haven't seen if this can be used with input and GPIO descriptors
are still a bit on the side. I can create a lot of properties but
not really add a descriptor table as a software node as far as
I can tell. I'm also a bit lost on whether it will be possible
to get there sadly :/

Yours,
Linus Walleij
