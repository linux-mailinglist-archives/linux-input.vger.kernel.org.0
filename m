Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1901EA12E
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgFAJqc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jun 2020 05:46:32 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:41480 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgFAJqb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jun 2020 05:46:31 -0400
Received: by mail-ed1-f52.google.com with SMTP id ce8so666105edb.8
        for <linux-input@vger.kernel.org>; Mon, 01 Jun 2020 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5SdNebRWb0eqGSPOmp4SHITORCQs0yRLVDgcjJ7dgHg=;
        b=ajzi5gCmLnwknr3LxFPckHLtA0VyboEyKxqYfpPZJHLoCsm9Ld/n8tD9TX3DitZr5A
         w3OTxyApdKkV8Z+MBcFi1iAwAfo0rpQgMjZobOjUQC9oLd+zzMuyssCFav/VyBM/O2rR
         qQR6Gq4oruNk8qjPrJ8/WxS0jY46hrWSYQBmJ9gp44JW/F43QuD8l57/CZoWMf5rfazx
         EsDzW3ZgBiU1rpqPVL83uY/vyuw43iur/Yfxu9th1n3NlwrkAF7bJYfYsug6pusjmSL8
         Jivj//S/Xm/iewiNtNLUEi9JmeQQB/59z0j+5033CCDrTzCq4rhqcDC+m4DaURtq51op
         4rkA==
X-Gm-Message-State: AOAM532JKuutBVxdGCZnlMUNxXNfW5gne+cmfxCIkTrap1/Wop2BxYkt
        cVOsfYIPa1otQa7/c7fAyjE8CFW9WCk=
X-Google-Smtp-Source: ABdhPJx7Qz9w1oqsvErMjUJ10iZ8OgLvbKeUU7ZCcHwu3tuXrXmpj3cDIdpMgvRmdeoNy87aCmdCBg==
X-Received: by 2002:a50:9547:: with SMTP id v7mr21902955eda.78.1591004788651;
        Mon, 01 Jun 2020 02:46:28 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id dd7sm15983761edb.19.2020.06.01.02.46.28
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 02:46:28 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id p5so4878271wrw.9
        for <linux-input@vger.kernel.org>; Mon, 01 Jun 2020 02:46:28 -0700 (PDT)
X-Received: by 2002:a5d:5351:: with SMTP id t17mr6793858wrv.287.1591004787868;
 Mon, 01 Jun 2020 02:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <CADyDSO5=fN=yw0kZQDpEgrbYXO-PCHDVcYbTk9n1X5XKFef+cA@mail.gmail.com>
In-Reply-To: <CADyDSO5=fN=yw0kZQDpEgrbYXO-PCHDVcYbTk9n1X5XKFef+cA@mail.gmail.com>
From:   Daniel Morse <dmorse@speedfox.co.uk>
Date:   Mon, 1 Jun 2020 10:46:16 +0100
X-Gmail-Original-Message-ID: <CANFaMLFFqGi__011BFEL485X91LOw6rxTGynRyNDPD5JVr5c_g@mail.gmail.com>
Message-ID: <CANFaMLFFqGi__011BFEL485X91LOw6rxTGynRyNDPD5JVr5c_g@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 1 Jun 2020 at 08:27, David Rheinsberg
<david.rheinsberg@gmail.com> wrote:
>
> Hi
>
> On Sat, 30 May 2020 at 17:04, Daniel Morse <dmorse@speedfox.co.uk> wrote:
> >
> > The controllers from the Super Nintendo Classic Edition (AKA the SNES
> > Mini) appear as a Classic Controller Pro when connected to a Wii
> > Remote. All the buttons work as the same, with the d-pad being mapped
> > the same as the d-pad on the Classic Controller Pro. This differs from
> > the behaviour of most controllers with d-pads and no analogue sticks,
> > where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
> > for up and down. This patch adds an option to the hid-wiimote module
> > to make the Super Nintendo Classic Controller behave this way.
> >
> > The patch has been tested with a Super Nintendo Classic Controller
> > plugged into a Wii Remote in both with the option both enabled and
> > disabled. When enabled the d-pad acts as the analogue control, and
> > when disabled it acts as it did before the patch was applied. This
> > patch has not been tested with e Wii Classic Controller (either the
> > original or the pro version) as I do not have one of these
> > controllers.
> >
> > Although I have not tested it with these controllers, I think it is
> > likely this patch will also work with the NES Classic Edition
> > Controllers.
> >
> > Changes from V1 to V2
> > * 3 if statements to control the behaviour, one to make the d-pad
> > register as button presses when the behaviour is disabled, and 2 to
> > make it act as an analog stick when enabled (once for each of the
> > motion plus states)
> > * the values for lx and ly are calculated and then passed to
> > input_report_abs() in one place, rather then calling
> > input_report_abs() from different places depending on how the values
> > are determined.
> > * using an array to map from button presses to analog value.
> > * reduced the values used to indicate the position of the analog stick
> >
> > Changes from V3 to V3
> > * Moved the definition of dpad_as_analog in hid-wiimote.h
> > * Renamed the dpad_as_analog vaiable to wiimote_dpad_as_analog
> > * changed digital_to_analog from an __s8 to static const s8
> > * Removed the unnecessary braces when getting values from digital_to_analog
> >
> > Note: I have also attached a patch file to this final version in
> > addition to the code in the body because gmail web client keeps
> > turning the tabs into spaces.
> >
> > Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> > Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>
> >
> > From 8909feec10fda919d1ec46c95418d63ac52ee41f Mon Sep 17 00:00:00 2001
> > From: Speedfox <speedfox@speedfox.co.uk>
> > Date: Tue, 26 May 2020 02:55:50 +0100
> > Subject: [PATCH] Added option to make d-pad analog
> >
> > Updates from code review
> > ---
>
> You can put comments below these 3 dashes^^. There seems to be some
> email-header in the commit message above, and the changes between
> versions can also be put outside of the commit message. Some
> subsystems keep it in the commit-message, though. Maybe Jiri can strip
> that when applying? The `Signed-off-by`-etc lines are usually last in
> the commit-message. I don't mind either way.

Since it's probably best that Jiri applies the patch from the
attachment which I included to get around gmail's inability to use
tabs, I think it'll be easiest to let him strip out that superfluous
email header when he does that rather than me sending another version
of the patch.

>
> Anyway, thanks for the patch, looks all good!
> David


Thanks again for reviewing my patch.

--Daniel
