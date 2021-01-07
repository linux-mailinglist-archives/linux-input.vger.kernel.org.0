Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B39C2ED319
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 15:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbhAGO6F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 09:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbhAGO6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 09:58:05 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AFDC0612F5
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 06:57:25 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id k9so1662407vke.4
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLFWtOkbHa4mZ/H55x5NNNM05DvWjYzoD4cXRXxG/C8=;
        b=WQjDsy8T6OObxHSyjcF1eKq5LTkXMWazfV9mRsGtOem5SA6pX+ZTjv7bzTdZqse+hS
         wvbAEzYqlNRL8GblJs2IA/Z74BoKxJX2d/xLjRl/X4sFpzxkKLdFOtp3TXYQXpsesvxU
         WBbBsSBIs+bwQPa632cXXBbOpoOgJSedindcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLFWtOkbHa4mZ/H55x5NNNM05DvWjYzoD4cXRXxG/C8=;
        b=YjdSyAjEI8/sjelt/qBg3BP/TA7g4GmP4z6btmXdVUXL+umE3UNdcibjoyv6GtM9V5
         1Wisuv2K/ILLDy40+T6NbtdDbXK7/vuEX4ro82YIFlUOl6aa7NO8HW1aycqMVumuEnOD
         9mPRJISaIwo8w2idaSyhRUHhwxnF50OGlBMNG9viWVybFdfXPsC8F6H60FmmKrRuJelO
         TsCE821WmrdOgiUsnJxe+QIMRflQtTqbA/w4Hn/sRerWXouqiZL0CKHjojxLPsTW9HiT
         sYNb+frTI8PTdCDzok5MVbdDNG+V+LVtObfUiiCLQvUO7hy2YMFJ/3iz8dmzRkKXtfcW
         DsPw==
X-Gm-Message-State: AOAM533rTXzemnfSnuHry3uIk9csD0RuFDjV2xpaCp6jDHj5cz8NuqxS
        mAPrhEHl6EMBKpjd8MshoRHkXyvxMDpT7A==
X-Google-Smtp-Source: ABdhPJxA5DBy/pAjOEw7m8Rx7pSca5G556oqekuIhzFbZ/ERAGKy1O5MFcoX6ZiA/fOBpnWxpdwlfw==
X-Received: by 2002:a1f:9888:: with SMTP id a130mr8002859vke.21.1610031444115;
        Thu, 07 Jan 2021 06:57:24 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id p23sm898504vkm.40.2021.01.07.06.57.23
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 06:57:23 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id x26so3777355vsq.1
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 06:57:23 -0800 (PST)
X-Received: by 2002:a67:70c6:: with SMTP id l189mr7089947vsc.34.1610031442604;
 Thu, 07 Jan 2021 06:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20201205004709.3126266-1-swboyd@chromium.org> <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
 <X/ZwRqJFJ9BY4Z3z@google.com>
In-Reply-To: <X/ZwRqJFJ9BY4Z3z@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jan 2021 06:57:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VmNQDSZFT3vaJ64DYyGqoE39uig581ZmaX0s-Y1U_CTw@mail.gmail.com>
Message-ID: <CAD=FV=VmNQDSZFT3vaJ64DYyGqoE39uig581ZmaX0s-Y1U_CTw@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity switch
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Jan 6, 2021 at 6:22 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Doug, Stephen,
>
> On Wed, Jan 06, 2021 at 05:16:10PM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Dec 4, 2020 at 4:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Some cros ECs support a front proximity MKBP event via
> > > 'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' input
> > > event code so it can be reported up to userspace.
> > >
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Benson Leung <bleung@chromium.org>
> > > Cc: Guenter Roeck <groeck@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  drivers/input/keyboard/cros_ec_keyb.c          | 5 +++++
> > >  include/linux/platform_data/cros_ec_commands.h | 1 +
> > >  2 files changed, 6 insertions(+)
> >
> > This seems really straightforward.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Given that it touches a header file owned by the Chrome OS maintainers
> > and a driver owned by input, how should it land?  One maintainer Acks
> > and the other lands?
>
> Sorry about missing this one, however the "front proximity" switch has
> been introduced for the benefit of phone devices, to be emitted when a
> device is raised to user's ear, and I do not think we should be using
> this here.
>
> We have just recently had similar discussion with regard to palm- and
> lap-mode sensors and whether they should be reported over input or IIO
> as true proximity sensors:
>
> https://lore.kernel.org/linux-iio/9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com/
>
> Based on what we are doing for other Chrome OS devices that expose
> proximity sensors (for example trogdor) we have decided that we all
> should be using IIO as it will allow not only on/off, but true proximity
> reporting with potential of implementing smarter policies by userspace.
>
> Because of that we should do the same here and export this as IIO
> proximity sensor as well.

For devices with a true proximity sensor that's exactly what we're
doing.  I've only been involved in the periphery of the discussion,
but as I understand it there are some models of laptop for which we
don't have a true proximity sensor.  On these devices, the EC is in
charge of deciding about proximity based on a number of factors.
Unfortunately, it's not a public bug, but since you're at Google I
think you can look at b/168714440 to find the relevant discussion.
These are the models that Stephen is trying to add support for here...

-Doug
