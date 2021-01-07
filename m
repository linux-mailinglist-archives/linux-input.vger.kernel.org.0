Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3059B2EE65C
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 20:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbhAGTrc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 14:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbhAGTrc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 14:47:32 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7CCC0612F5;
        Thu,  7 Jan 2021 11:46:51 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c12so4497988pfo.10;
        Thu, 07 Jan 2021 11:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FNyC6Er0Vf4MXtGvepy8MWknjFic90Vra4nSpDA+ySM=;
        b=cYlKdSRxDfqNct6chKWDD4JxtLM74AW1ToY48zAt16UVfHQf73dIX1f3+2U6YFXRXX
         90v6CbqliO9389WSX9lUHcA6y3T015uMf7IantNUUtiDAxFuTYWahyxrbsGhTueJ8oKF
         xLFU9VvXSe37zYL0+KG2kit+H3Co/+nGaso/C3Bf06LPrWE4vTQW2JALqisi5uVKBrqN
         odCNycPhtaUloXE6b7oTMd/g4M0RiFnhbVw8BCzxA7RHjVEWBwootQIagxXu8Bp3ince
         INCUofq/f0oewqv/kPcb7wB83Qi22GH0FNBJ1/wM9IUwJVq5vSKPAlAKOVaa71FVPNVQ
         nolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FNyC6Er0Vf4MXtGvepy8MWknjFic90Vra4nSpDA+ySM=;
        b=d0xNkEuBjUNP5RV7zq5a16f5qnxmTArqAHqZBS85aN2i/Qx26k9tC9BLb2fplh6lBh
         8Zm86H8l2NBtXB1TDVhut8CvJaO1PqYUTXFsEeN1iRe4Ocwforc2sWhuw95t330+Sf3z
         ZmPmP4lh1oVGZxUhgFaS3DG32I6QaRAosjbkhlMMYFkC+cGVZkjgJ09ySFKmx3dM12oe
         J4Zi7ADVhlLcAKmNj3oJ3i0arug83xrKc0Nl1pR4N62IKAKw3oF627bcgCqvME99w+7d
         WOxRXbkeWGCoS+L9QGBDNbQhrUQuA9DIlcTJ1Z0WR6yBtiuaCLiXi6CVhC5eloisxMne
         gWOQ==
X-Gm-Message-State: AOAM532zQ5Qqsj2Ce8cimRHrq1dwno0Lllonm1JdwSMXbHatzlgnr+Of
        5UUmFc6KO0k/OxTglQPJI9o=
X-Google-Smtp-Source: ABdhPJxb1V7TISf3W0nWDSfzyUGQWMB3x3UDgN92bCoR9Furw8Vxe9ggYQvwGbQ/DmpnQ6ykodB4ag==
X-Received: by 2002:a65:6659:: with SMTP id z25mr3434957pgv.427.1610048811180;
        Thu, 07 Jan 2021 11:46:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s21sm6888579pga.12.2021.01.07.11.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 11:46:50 -0800 (PST)
Date:   Thu, 7 Jan 2021 11:46:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity
 switch
Message-ID: <X/dlKKeAHU/Ab+VD@google.com>
References: <20201205004709.3126266-1-swboyd@chromium.org>
 <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
 <X/ZwRqJFJ9BY4Z3z@google.com>
 <CAD=FV=VmNQDSZFT3vaJ64DYyGqoE39uig581ZmaX0s-Y1U_CTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VmNQDSZFT3vaJ64DYyGqoE39uig581ZmaX0s-Y1U_CTw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 07, 2021 at 06:57:10AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jan 6, 2021 at 6:22 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Doug, Stephen,
> >
> > On Wed, Jan 06, 2021 at 05:16:10PM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Fri, Dec 4, 2020 at 4:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Some cros ECs support a front proximity MKBP event via
> > > > 'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' input
> > > > event code so it can be reported up to userspace.
> > > >
> > > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Cc: Benson Leung <bleung@chromium.org>
> > > > Cc: Guenter Roeck <groeck@chromium.org>
> > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > ---
> > > >  drivers/input/keyboard/cros_ec_keyb.c          | 5 +++++
> > > >  include/linux/platform_data/cros_ec_commands.h | 1 +
> > > >  2 files changed, 6 insertions(+)
> > >
> > > This seems really straightforward.
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Given that it touches a header file owned by the Chrome OS maintainers
> > > and a driver owned by input, how should it land?  One maintainer Acks
> > > and the other lands?
> >
> > Sorry about missing this one, however the "front proximity" switch has
> > been introduced for the benefit of phone devices, to be emitted when a
> > device is raised to user's ear, and I do not think we should be using
> > this here.
> >
> > We have just recently had similar discussion with regard to palm- and
> > lap-mode sensors and whether they should be reported over input or IIO
> > as true proximity sensors:
> >
> > https://lore.kernel.org/linux-iio/9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com/
> >
> > Based on what we are doing for other Chrome OS devices that expose
> > proximity sensors (for example trogdor) we have decided that we all
> > should be using IIO as it will allow not only on/off, but true proximity
> > reporting with potential of implementing smarter policies by userspace.
> >
> > Because of that we should do the same here and export this as IIO
> > proximity sensor as well.
> 
> For devices with a true proximity sensor that's exactly what we're
> doing.  I've only been involved in the periphery of the discussion,
> but as I understand it there are some models of laptop for which we
> don't have a true proximity sensor.  On these devices, the EC is in
> charge of deciding about proximity based on a number of factors.

Yes, I understand that on some devices the proximity sensors are not
true sensors but rather on/off signals, potentially derived from a
multitude of sources. However there is still a benefit in exposing them
as IIO proximity devices with limited reporting representing
[near, infinity] range/values. This will mean that userspace needs to
monitor only one set of devices (IIO) instead of both IIO and input, and
will not require constantly expanding EV_SW set to account for
ever-growing number of proximity sensors (lap, palm, general presence,
etc).

Thanks.

-- 
Dmitry
