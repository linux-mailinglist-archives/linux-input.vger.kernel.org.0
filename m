Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CB5400312
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 18:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236552AbhICQSQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 12:18:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53298 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhICQSN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 12:18:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9EDC41C0B87; Fri,  3 Sep 2021 18:17:12 +0200 (CEST)
Date:   Fri, 3 Sep 2021 18:17:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v2 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
Message-ID: <20210903161711.GB2209@bug>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
 <20210901223037.2964665-3-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901223037.2964665-3-roderick.colenbrander@sony.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> Player LEDs are commonly found on game controllers from Nintendo and Sony
> to indicate a player ID across a number of LEDs. For example, "Player 2"
> might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> 
> This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> player LEDs from the kernel. Until now there was no good standard, which
> resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.
> 
> Note: management of Player IDs is left to user space, though a kernel
> driver may pick a default value.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
>  include/dt-bindings/leds/common.h      |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> index 4a8b9dc4bf52..2160382c86be 100644
> --- a/Documentation/leds/well-known-leds.txt
> +++ b/Documentation/leds/well-known-leds.txt
> @@ -16,6 +16,20 @@ but then try the legacy ones, too.
>  
>  Notice there's a list of functions in include/dt-bindings/leds/common.h .
>  
> +* Gamepads and joysticks
> +
> +Game controllers may feature LEDs to indicate a player number. This is commonly
> +used on game consoles in which multiple controllers can be connected to a system.
> +The "player LEDs" are then programmed with a pattern to indicate a particular
> +player. For example, a game controller with 4 LEDs, may be programmed with "x---"
> +to indicate player 1, "-x--" to indicate player 2 etcetera where "x" means on.
> +Input drivers can utilize the LED class to expose the individual player LEDs
> +of a game controller using the function "player".

Thank you.

> +Note: tracking and management of Player IDs is the responsibility of user space,
> +though drivers may pick a default value.

I'm not sure we want kernel to do that.

> +Good: "input*:*:player-{1,2,3,4,5}

This goes to the top.

> +++ b/include/dt-bindings/leds/common.h
> @@ -60,6 +60,9 @@
>  #define LED_FUNCTION_MICMUTE "micmute"
>  #define LED_FUNCTION_MUTE "mute"
>  
> +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> +#define LED_FUNCTION_PLAYER "player"
> +

Let's not add this. For consistency we'd need defines player-1, player-2, ... We don't
need the define at all.

I guess this should go through my tree?

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
