Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D0731CF6D
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 18:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhBPRov (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 12:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhBPRob (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 12:44:31 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B18AC061574;
        Tue, 16 Feb 2021 09:43:48 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 839EF140B88;
        Tue, 16 Feb 2021 18:43:46 +0100 (CET)
Date:   Tue, 16 Feb 2021 18:43:46 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs
 support.
Message-ID: <20210216184346.2bf5b47f@nic.cz>
In-Reply-To: <CAO-hwJ+WPacFxvT=88mq2osES=JYQ3-yQWf6mEZO67ZymGw-vg@mail.gmail.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-4-roderick@gaikai.com>
        <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com>
        <20210216013337.284220cf@nic.cz>
        <CANndSKke4zGn2T6jC4xYtguAjixZ7n5Rf9SSY3knEhvwJ1cLyQ@mail.gmail.com>
        <20210216033744.123b9acd@nic.cz>
        <CAO-hwJ+WPacFxvT=88mq2osES=JYQ3-yQWf6mEZO67ZymGw-vg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Feb 2021 18:19:49 +0100
Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 3:37 AM Marek Behun <marek.behun@nic.cz> wrote:
> >
> > On Mon, 15 Feb 2021 17:11:14 -0800
> > Roderick Colenbrander <roderick@gaikai.com> wrote:
> >  
> > > On Mon, Feb 15, 2021 at 4:33 PM Marek Behun <marek.behun@nic.cz> wrote:  
> > > >
> > > > On Mon, 15 Feb 2021 15:00:30 -0800
> > > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > > >  
> > > > > What is the desired naming for these player LEDs? There is not an
> > > > > officially designed function based on DT bindings. So far they used
> > > > > "playstation::mac::ledX". When changing the naming scheme towards
> > > > > "hid" and removing MAC, they would be: "hid%d::led1" etcetera.  
> > > >
> > > > Hi,
> > > >
> > > > there is one more thing I forgot to mention in the LED name schema:
> > > >   devicename:color:function-functionEnumerator
> > > >
> > > > So LED core can for example compose a names in the format:
> > > >   switch0:green:lan-1
> > > >   switch0:green:lan-2
> > > >   switch0:green:lan-3
> > > >   switch0:green:lan-4
> > > >
> > > > In your case I think the most appropriate name would be something like
> > > >   hid0:color:indicator-1
> > > >   hid0:color:indicator-2
> > > >   ...  
> > >
> > > I am trying to think if indicator is clear enough. Currently devices
> > > use a mixture of names, which is obviously bad (wiimote uses p1-p4 at
> > > the end, sony uses sony1-4 for DualShock 3, hid-nintendo uses
> > > player1-4). I would at least like new drivers to standardize. In
> > > particular in Android frameworks we have a need to map these LEDs back
> > > to the Java InputDevice. Finding the LEDs has been quite painful so
> > > far.  
> >
> > Thinking about it more, function "player" should theoretically be
> > reasonable. Maybe we should try sending a patch for review, adding this
> > funciton to include/dt-bindings/leds/common.h, and see what others
> > think of it...  
> 
> FWIW, I am not sure 'player' would be a good fit here. I personally
> preferred "indicator".
> My reasons are because those LEDs are basically a matrix of LEDs, and
> are supposed to be read as a whole. For player 1, you would light up
> the 3rd LED only. And for player 2, you would light up LEDS #2 and #4.
> 
> So I would say that in this particular case, "player" would lead to
> confusion because users would want to set player 1 on the controller
> and would have to talk to the "player-3" LED.
> 
> If we keep the more generic "indicator", the one-to-one mapping is
> removed, and it's clearer that userspace needs an adaptor to convert
> "players" into "indicator".
> 
> For the older controllers with a dedicated "player" LED, like the PS3
> and the Wiimote, "player" would make sense, yes.

OK, in that case "indicator" is more reasonable. But all this means that
this should simply be discussed more on LED mailing list. We need to
wait till other people express their opinions.

Marek
