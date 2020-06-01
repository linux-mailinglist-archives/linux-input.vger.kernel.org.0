Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68341E9F35
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 09:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgFAH1m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jun 2020 03:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgFAH1m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jun 2020 03:27:42 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4F8C061A0E
        for <linux-input@vger.kernel.org>; Mon,  1 Jun 2020 00:27:42 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id r2so5920887ioo.4
        for <linux-input@vger.kernel.org>; Mon, 01 Jun 2020 00:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bkz/BiQqXfpvJOed5ljrOrFIvPxTJF5V9WqZjJzYqnA=;
        b=hND9o9tomHGuMzJVb843sDSPDMUaAVQn3TJuhkyvL+kvhfB6Hkg/4Yk8ZOR8OaELHF
         T9wydd0m5bMaznCdWzCd54WAh64ogtMT8TIaW0rgj6/5dO9YsO89F3wzXPzwcjljwBXR
         qZMRNSPudlnh86y9A6qOG514g5eGmJgyXD/fHiEUWbeEH9uLzU0Q8ijJ1aj44Ul+lnGl
         ZR1G3i9p/pNo6uI+c8zYoAX+zwn8PsCE/noBuobRUXKwZM5R7NhsR7gH20jtonzbDjGQ
         k9QFXfhAwtTBc9oyT8s9+SIWszLtbAgCRX+NMsH5gdOJq+RUtBqnYSM0ffF7LvK2r7cg
         spZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bkz/BiQqXfpvJOed5ljrOrFIvPxTJF5V9WqZjJzYqnA=;
        b=o7X0nyZ9284Vwhs8MCUS1PVZrC+VM7IeRQ/oRiv2Fop0uarluXIECCoJOTSvz9SiIM
         Z3Ak3NepBW8Yf6j/w03J6rUmxgGSUJE7YDhb+lX3cQHvSPMgKyIwCIcAVxo1EDKa/X3K
         Q8SXWEFmUJ+QGkYyakOAqrz1v5Gt+DuNGxLppamPXCaeWbCvS5tmgUoXNWtAuYuoTiPC
         DYwxfk62L88mSaO4NsgKPkdvdIBAE3JqVtxVRQgqLpaT+ZQCQU/u8hO5PtNUMwrt3PSl
         B6Vxesi8w+njAe6V2rdOGjPIK4lCwcgGFY90TOW0J6SUezGsFvHLMO9JtLgo6/N2eMWU
         UpZw==
X-Gm-Message-State: AOAM5313yT+TMaA2+hn2FvK+ugfES5aabZmdyf7T6rXfERn3mCzkO1Q5
        5T+90gfBf+lQ47vKus6IHUw1N0oSVydFNb0XOzchSI7z
X-Google-Smtp-Source: ABdhPJy6iZD6JMCkAmUmgFYj868IpLi4jgdbxG43Ph0roiXf2XyaCHCHYNcNeL+MvmFx0K1ZSYdrXjvLfbu6o6YtQzo=
X-Received: by 2002:a05:6638:290:: with SMTP id c16mr19782769jaq.34.1590996461361;
 Mon, 01 Jun 2020 00:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
In-Reply-To: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Mon, 1 Jun 2020 09:27:30 +0200
Message-ID: <CADyDSO5=fN=yw0kZQDpEgrbYXO-PCHDVcYbTk9n1X5XKFef+cA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     Daniel Morse <dmorse@speedfox.co.uk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Sat, 30 May 2020 at 17:04, Daniel Morse <dmorse@speedfox.co.uk> wrote:
>
> The controllers from the Super Nintendo Classic Edition (AKA the SNES
> Mini) appear as a Classic Controller Pro when connected to a Wii
> Remote. All the buttons work as the same, with the d-pad being mapped
> the same as the d-pad on the Classic Controller Pro. This differs from
> the behaviour of most controllers with d-pads and no analogue sticks,
> where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
> for up and down. This patch adds an option to the hid-wiimote module
> to make the Super Nintendo Classic Controller behave this way.
>
> The patch has been tested with a Super Nintendo Classic Controller
> plugged into a Wii Remote in both with the option both enabled and
> disabled. When enabled the d-pad acts as the analogue control, and
> when disabled it acts as it did before the patch was applied. This
> patch has not been tested with e Wii Classic Controller (either the
> original or the pro version) as I do not have one of these
> controllers.
>
> Although I have not tested it with these controllers, I think it is
> likely this patch will also work with the NES Classic Edition
> Controllers.
>
> Changes from V1 to V2
> * 3 if statements to control the behaviour, one to make the d-pad
> register as button presses when the behaviour is disabled, and 2 to
> make it act as an analog stick when enabled (once for each of the
> motion plus states)
> * the values for lx and ly are calculated and then passed to
> input_report_abs() in one place, rather then calling
> input_report_abs() from different places depending on how the values
> are determined.
> * using an array to map from button presses to analog value.
> * reduced the values used to indicate the position of the analog stick
>
> Changes from V3 to V3
> * Moved the definition of dpad_as_analog in hid-wiimote.h
> * Renamed the dpad_as_analog vaiable to wiimote_dpad_as_analog
> * changed digital_to_analog from an __s8 to static const s8
> * Removed the unnecessary braces when getting values from digital_to_analog
>
> Note: I have also attached a patch file to this final version in
> addition to the code in the body because gmail web client keeps
> turning the tabs into spaces.
>
> Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>
>
> From 8909feec10fda919d1ec46c95418d63ac52ee41f Mon Sep 17 00:00:00 2001
> From: Speedfox <speedfox@speedfox.co.uk>
> Date: Tue, 26 May 2020 02:55:50 +0100
> Subject: [PATCH] Added option to make d-pad analog
>
> Updates from code review
> ---

You can put comments below these 3 dashes^^. There seems to be some
email-header in the commit message above, and the changes between
versions can also be put outside of the commit message. Some
subsystems keep it in the commit-message, though. Maybe Jiri can strip
that when applying? The `Signed-off-by`-etc lines are usually last in
the commit-message. I don't mind either way.

Anyway, thanks for the patch, looks all good!
David
