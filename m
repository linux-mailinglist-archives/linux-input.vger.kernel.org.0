Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BDB42C77B
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 19:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhJMRWn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 13:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJMRWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 13:22:43 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84A7C061570;
        Wed, 13 Oct 2021 10:20:39 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id u32so8130142ybd.9;
        Wed, 13 Oct 2021 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCiHp6h+qDHKpj2Nxs3uzbS2y3KcQ/s+935tqz//0OQ=;
        b=Fq/Q+b4pKQcXXauODM1bbeRqRQsn7mVY5ghi1hnIG4bDwkc9TCKYfCD0g3UdBlIGw5
         RIna2L/Zd/XDlWIxyJHMP616QD+zD3ViOdj+5/feRInLsemecZPxDM/DEq4vj0XPuI+F
         QaDQ/fRhyWoMBxlEvZ/2L3ATW5QMQgd3KAyrj/c6HM4VCJzBv/pxb5pY/EITbRnxDUFP
         T0/CQ0IORp2Qq/Bpvti3FXt8Xonq1hTjn+GRRfcOI6m6w7GhtFif9oEMfG+vbS93F7lN
         8NxUU+MdwnFD+BH1az26FyDFx2IjnblRUGY8sjGE+o2yPTdcqMsw7JGiKsjBPf8c+EcY
         y3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCiHp6h+qDHKpj2Nxs3uzbS2y3KcQ/s+935tqz//0OQ=;
        b=M+UNYLHxlEeb3sQJtqHaWWGTO/nW//SZAaGFkrVPhw0IXt8QqQAILC/xXhIkPMUps/
         5jS8z4FUWqyOsbjhjnygIP33bF26mfnJ8QhbYzk2gJFTkOJ/pIa8DDaVmlDo7FtXI5fD
         OSKzaGAJ570WW4RS6gfnGj/h2TLFSbmD2HwBECD5zvoCNgYyHvPjVuLaXOtB5zMkdBrb
         O878CTPl9/+Xx7agZo09OAoVTUNeJvNRuj3cT1PJXAfWzvU3cLblNqtFfLg8lk33KshS
         m/sZDYqbCSii5kmFccH8+1gE3YFJjWrizv7NDFAeGNODam6LEC0CYVj/kIUc0E+izwKT
         6hpg==
X-Gm-Message-State: AOAM533A3y5yccOxDGbkiFcOn7ldRUh76T4hnwb4zLtQztCptFMsiq33
        YRxWn7unV6LC6cCJiyvO60Z8VarndQh83Lv2frs=
X-Google-Smtp-Source: ABdhPJy1oBNfbNWOHAzEy83z36nZOzwN+cmdPCyi93SR8g8zmcdrXOYTgbsgdKbWgxdT4qf92btO+IMAy/PJoF2Dh1c=
X-Received: by 2002:a25:afcf:: with SMTP id d15mr631298ybj.320.1634145639082;
 Wed, 13 Oct 2021 10:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
 <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
 <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd>
In-Reply-To: <20211013074849.GA10172@amd>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 13 Oct 2021 10:20:27 -0700
Message-ID: <CAEc3jaB5e41e_cDDy7=sXTG4oJZ2nDJwx5hLQtN71TdyYdP3hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 12:48 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > > > > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > > > > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > > > >
> > > > > This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indicate
> > > > > player LEDs from the kernel. Until now there was no good standard, which
> > > > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > > > > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYERx.
> > > > >
> > > > > Note: management of Player IDs is left to user space, though a kernel
> > > > > driver may pick a default value.
> > > > >
> > > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > > > ---
> > > > >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> > > > >  include/dt-bindings/leds/common.h      |  7 +++++++
> > > > >  2 files changed, 21 insertions(+)
> > > >
> > > > Pavel, could you please eventually Ack this, so that I can take it
> > > > together with the rest?
> > >
> > > I'm willing to take Documentation/leds/well-known-leds.txt part
> > > through LED tree.
> > >
> > > I don't like the common.h change; either avoid the define or put it
> > > into your local header.
> >
> > If the LED_FUNCTION_PLAYER* defines don't belong in common with the
> > other LED_FUNCTION* ones, where should it go? The hid-nintendo driver
> > intends to use the same defines, so defining it local to each driver
> > isn't right. Not sure if there is a great place in the input system
> > either (you would then have to move scrolllock and all those other LED
> > definitions too.)
>
> Ok, so let's put it in the common place. I'll take this patch through
> LED tree if you resubmit it. You still may want to use local defines
> so you can apply the other patches without waiting.
>

Thanks for your reply. If we want to decouple the series between LEDs
and HID, I don't mind. Not sure what is preferred by Benjamin/Jiri
either a temporary local define (#ifndef LED_FUNCTION_PLAYER1 #define
LED_FUNCTION_PLAYER1 "player-1"..) or just temporary hard coding the
string. Neither is that nice. It is only a few lines of code, so since
defines are the long-term way maybe a local define is okay.

> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
