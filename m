Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0FA4037CB
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 12:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348787AbhIHKY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 06:24:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348780AbhIHKY4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Sep 2021 06:24:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A85436113D;
        Wed,  8 Sep 2021 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631096629;
        bh=dzN66emlAcx4o31GR92sRPvBYyec2ouhaGkXtWNBEKk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pq6VmDyzF3uY3Ffll5YKJ34FjSJ4QdzDb37i0gpHzo1+t2zPyXpSJAjkKwsiNdTzh
         KyhJAyDuxFCxkgcZD51r+Lh9KWsURVBmz1alf7aBOTgAaZcfqHCSKc8nXXs6hZE3P9
         TELxnxh4J7BOui8xwpdUNZE89m3QiVafh1nyRT5E85AiMF++OeiggU7vAdwoGPZo/P
         ABqHq6SjQagkGhsxVizLIFB232IW99ccVF1emjIByaXZgnxYP/fKbskyAgIH4GARt5
         kds2CUTvcVqMIhDQSXF3xLKVr1333FP59vl8kOcqp4O7kwEyGq6oOmFz9mjejW5d6z
         eK++LGCj3qHyQ==
Date:   Wed, 8 Sep 2021 12:23:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v2 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <20210903161711.GB2209@bug>
Message-ID: <nycvar.YFH.7.76.2109081223210.15944@cbobk.fhfr.pm>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com> <20210901223037.2964665-3-roderick.colenbrander@sony.com> <20210903161711.GB2209@bug>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 3 Sep 2021, Pavel Machek wrote:

> > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > 
> > This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> > player LEDs from the kernel. Until now there was no good standard, which
> > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.
> > 
> > Note: management of Player IDs is left to user space, though a kernel
> > driver may pick a default value.
> > 
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> >  include/dt-bindings/leds/common.h      |  3 +++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> > index 4a8b9dc4bf52..2160382c86be 100644
> > --- a/Documentation/leds/well-known-leds.txt
> > +++ b/Documentation/leds/well-known-leds.txt
> > @@ -16,6 +16,20 @@ but then try the legacy ones, too.
> >  
> >  Notice there's a list of functions in include/dt-bindings/leds/common.h .
> >  
> > +* Gamepads and joysticks
> > +
> > +Game controllers may feature LEDs to indicate a player number. This is commonly
> > +used on game consoles in which multiple controllers can be connected to a system.
> > +The "player LEDs" are then programmed with a pattern to indicate a particular
> > +player. For example, a game controller with 4 LEDs, may be programmed with "x---"
> > +to indicate player 1, "-x--" to indicate player 2 etcetera where "x" means on.
> > +Input drivers can utilize the LED class to expose the individual player LEDs
> > +of a game controller using the function "player".
> 
> Thank you.
> 
> > +Note: tracking and management of Player IDs is the responsibility of user space,
> > +though drivers may pick a default value.
> 
> I'm not sure we want kernel to do that.
> 
> > +Good: "input*:*:player-{1,2,3,4,5}
> 
> This goes to the top.
> 
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -60,6 +60,9 @@
> >  #define LED_FUNCTION_MICMUTE "micmute"
> >  #define LED_FUNCTION_MUTE "mute"
> >  
> > +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> > +#define LED_FUNCTION_PLAYER "player"
> > +
> 
> Let's not add this. For consistency we'd need defines player-1, player-2, ... We don't
> need the define at all.
> 
> I guess this should go through my tree?

Once you provide your Reviewed/Acked-by, I can take it through my tree 
with the rest of the series.

Thanks,

-- 
Jiri Kosina
SUSE Labs

