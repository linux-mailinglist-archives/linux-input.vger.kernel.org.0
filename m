Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD071F36C4
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 11:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgFIJQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 05:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbgFIJQZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jun 2020 05:16:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CF5C05BD43
        for <linux-input@vger.kernel.org>; Tue,  9 Jun 2020 02:16:24 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l26so2096368wme.3
        for <linux-input@vger.kernel.org>; Tue, 09 Jun 2020 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FfbXAOslE4oO1BkMpszDDTGNUClGmYL2+gWBN5gZLSs=;
        b=Jj0z9iC0+fozl2AzvFs49MmofLO51Kx8l+VPba8nbuYbtKEafwNiLj3G8GuUzwR101
         Ro0Rdmh3jfRVbGdkIZfUhKo/+kDOK5ggRjCc+6kpTkGBeHA5Fd6RsG9VKJTT6I2R3aXC
         gWdnnGf6RjmJy8LZ/hi8tvigKNjTNld9uRsQFbq6F/sqKJlW8e4Q42E0FW6fA4vkifuc
         CwVY8EPHBCdAJqS8yzDYFfJ9sl4BbTjea/GHLpRjbxZu1r0hyNtpxOF2UAtb6N37OUWq
         YMC/sioG6eanFanwQ4K2ADwTxpxUj/FFLkJCJZkXT4iKUfUYUAePOkX5OeioDTTEGxOu
         JCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FfbXAOslE4oO1BkMpszDDTGNUClGmYL2+gWBN5gZLSs=;
        b=E/AKxMFW+7fj1oKE2SFYrJubG6TNWTdpYeodF18JHCWJvlduZVMxkbDtFm3ous6/Rp
         BwpijkuDJgxbDHVxsLKlCOEzrrqG1gdo9qxwSQ5Na5MC8mffYHLFsN9ZS8Cb0K2WFsVD
         oG4XX3sgTQ6orKu0Eo8vrVvqFh3NCxQFWn5NjetnaBB1tt4kQZT5JYA4UQYCr7HSaJzH
         hRQt1stVQZogxlZDstWaL2O9Be7ufuKcGj6Z57fwAUJINVhPFwAA/4RNjeXz/jISS0hQ
         pBWlBPMtzt7f+o04xOWDvTV5qHtsvYr68vYGUGkn+wx54I4ffyCQffJtWC5dDacePvEe
         ggTg==
X-Gm-Message-State: AOAM5317lQyEVHUHIWEN6KW7amh5R8FDyllUdveh6JDpmIsN0sUqlKN7
        HiCbnyg2LcC/pQG7sQzuX51Vgfd4aCmeoZCU83I=
X-Google-Smtp-Source: ABdhPJzYMmTPl70TyLs7KG15m1R/OxZnTLtuWkBXGZgzg4K5CVyB48NAA/cLwdrfQYOks+H0niKxz/xP9XsN3QVaXoQ=
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr3195938wmi.185.1591694181687;
 Tue, 09 Jun 2020 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <CADyDSO5=fN=yw0kZQDpEgrbYXO-PCHDVcYbTk9n1X5XKFef+cA@mail.gmail.com> <CANFaMLFFqGi__011BFEL485X91LOw6rxTGynRyNDPD5JVr5c_g@mail.gmail.com>
In-Reply-To: <CANFaMLFFqGi__011BFEL485X91LOw6rxTGynRyNDPD5JVr5c_g@mail.gmail.com>
From:   Daniel Morse <daniel.morse@gmail.com>
Date:   Tue, 9 Jun 2020 10:16:09 +0100
Message-ID: <CANFaMLHGUHgV6xL1kCYj7Uy2GhdJp=og6Rb0sL=2d-Uihkf2ag@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Just wanted to check in and see if there was anything else I needed to
do to this patch before it gets merged?

--Daniel

On Mon, 1 Jun 2020 at 10:46, Daniel Morse <dmorse@speedfox.co.uk> wrote:
>
> On Mon, 1 Jun 2020 at 08:27, David Rheinsberg
> <david.rheinsberg@gmail.com> wrote:
> >
> > Hi
> >
> > On Sat, 30 May 2020 at 17:04, Daniel Morse <dmorse@speedfox.co.uk> wrote:
> > >
> > > The controllers from the Super Nintendo Classic Edition (AKA the SNES
> > > Mini) appear as a Classic Controller Pro when connected to a Wii
> > > Remote. All the buttons work as the same, with the d-pad being mapped
> > > the same as the d-pad on the Classic Controller Pro. This differs from
> > > the behaviour of most controllers with d-pads and no analogue sticks,
> > > where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
> > > for up and down. This patch adds an option to the hid-wiimote module
> > > to make the Super Nintendo Classic Controller behave this way.
> > >
> > > The patch has been tested with a Super Nintendo Classic Controller
> > > plugged into a Wii Remote in both with the option both enabled and
> > > disabled. When enabled the d-pad acts as the analogue control, and
> > > when disabled it acts as it did before the patch was applied. This
> > > patch has not been tested with e Wii Classic Controller (either the
> > > original or the pro version) as I do not have one of these
> > > controllers.
> > >
> > > Although I have not tested it with these controllers, I think it is
> > > likely this patch will also work with the NES Classic Edition
> > > Controllers.
> > >
> > > Changes from V1 to V2
> > > * 3 if statements to control the behaviour, one to make the d-pad
> > > register as button presses when the behaviour is disabled, and 2 to
> > > make it act as an analog stick when enabled (once for each of the
> > > motion plus states)
> > > * the values for lx and ly are calculated and then passed to
> > > input_report_abs() in one place, rather then calling
> > > input_report_abs() from different places depending on how the values
> > > are determined.
> > > * using an array to map from button presses to analog value.
> > > * reduced the values used to indicate the position of the analog stick
> > >
> > > Changes from V3 to V3
> > > * Moved the definition of dpad_as_analog in hid-wiimote.h
> > > * Renamed the dpad_as_analog vaiable to wiimote_dpad_as_analog
> > > * changed digital_to_analog from an __s8 to static const s8
> > > * Removed the unnecessary braces when getting values from digital_to_analog
> > >
> > > Note: I have also attached a patch file to this final version in
> > > addition to the code in the body because gmail web client keeps
> > > turning the tabs into spaces.
> > >
> > > Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> > > Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>
> > >
> > > From 8909feec10fda919d1ec46c95418d63ac52ee41f Mon Sep 17 00:00:00 2001
> > > From: Speedfox <speedfox@speedfox.co.uk>
> > > Date: Tue, 26 May 2020 02:55:50 +0100
> > > Subject: [PATCH] Added option to make d-pad analog
> > >
> > > Updates from code review
> > > ---
> >
> > You can put comments below these 3 dashes^^. There seems to be some
> > email-header in the commit message above, and the changes between
> > versions can also be put outside of the commit message. Some
> > subsystems keep it in the commit-message, though. Maybe Jiri can strip
> > that when applying? The `Signed-off-by`-etc lines are usually last in
> > the commit-message. I don't mind either way.
>
> Since it's probably best that Jiri applies the patch from the
> attachment which I included to get around gmail's inability to use
> tabs, I think it'll be easiest to let him strip out that superfluous
> email header when he does that rather than me sending another version
> of the patch.
>
> >
> > Anyway, thanks for the patch, looks all good!
> > David
>
>
> Thanks again for reviewing my patch.
>
> --Daniel
