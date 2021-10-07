Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4FD425127
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 12:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240901AbhJGKgf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 06:36:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240800AbhJGKgf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Oct 2021 06:36:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAC3560FC3;
        Thu,  7 Oct 2021 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633602881;
        bh=MVPgDHbdovmxcfBI9Np0VFQrOn1fPFM7Bwk8pO2lUt0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KefUlNdpKurJoP70oh5WQ9kWgz0K0/u+twOUWO9v/qxzEDM4yF/0zlvQ4ZJhEOMsX
         qDtm5O0vLfVqvbDQ94NoeohzYDWPGclap4HeJyuI/7duQqb/B0QXgs1tsvi4S+C40d
         hOtmmJ9wTcf0laNOiZCxB3udKcW0lKF32KluJpO0gJyBPlOzd72dzzVkeSsm6tyP/8
         fDVSSHOU7AIdSNl2buPD0SHx+lp5oxs0KhkohOtYJlWV+XrgWh5QW4UtB3YRZQL6yH
         kdxVNpdMWKHH22GmYfihDMZuSJPCfflr3pFRnezPnrfqGO0oNyYMffxzQrTirI9dlw
         dd4SkW/p0EjLw==
Date:   Thu, 7 Oct 2021 12:34:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
cc:     Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2110071233480.29107@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz>
 <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 27 Sep 2021, Roderick Colenbrander wrote:

> > > > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > > > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > > > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > > >
> > > > This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indicate
> > > > player LEDs from the kernel. Until now there was no good standard, which
> > > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > > > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYERx.
> > > >
> > > > Note: management of Player IDs is left to user space, though a kernel
> > > > driver may pick a default value.
> > > >
> > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > > ---
> > > >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> > > >  include/dt-bindings/leds/common.h      |  7 +++++++
> > > >  2 files changed, 21 insertions(+)
> > >
> > > Pavel, could you please eventually Ack this, so that I can take it
> > > together with the rest?
> >
> > I'm willing to take Documentation/leds/well-known-leds.txt part
> > through LED tree.
> >
> > I don't like the common.h change; either avoid the define or put it
> > into your local header.
> 
> If the LED_FUNCTION_PLAYER* defines don't belong in common with the
> other LED_FUNCTION* ones, where should it go? The hid-nintendo driver
> intends to use the same defines, so defining it local to each driver
> isn't right. Not sure if there is a great place in the input system
> either (you would then have to move scrolllock and all those other LED
> definitions too.)

Pavel, ping please? This has been lingering really for a bit too long.

Thanks,

-- 
Jiri Kosina
SUSE Labs

