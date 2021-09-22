Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36A2414588
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 11:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhIVJwJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 05:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234308AbhIVJwH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 05:52:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D0F61100;
        Wed, 22 Sep 2021 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632304237;
        bh=NIsJUyDC6qEpwv8hsqoRowQf1/mP4ZlwAjScq4upEFc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=hH1WX2sV2Ki4xEqNPoUT2f6Vpvrs+6eIk4RERiQXzf91tM53lxbxhZH75pzY7OMlN
         1LkCjhzPcXyYRayZ/bJDKwnIvGHFaxbdQvrKEsjmquP/n0mVj3zn2eGrjOuG9JR/eB
         K/VGF0soh3bEg5ATTU+cw7W3/KU+GTISEH3VQUBgjKbcYfY+MkmRITH3n7r2lT7wut
         DiVQMoyim0cKVfmVYcTtxkEWRHiTmzw3zfTt7D8ipQ6FuUh+ei0tpxKGCzr2OuKvO7
         yOi39VvfDGUvqAbhxbOpPpF9K1PsvP+/9PaD9JG2mEwZNP6lYvrbppgew5v4kkupve
         LHOZTTHHuMqBA==
Date:   Wed, 22 Sep 2021 11:50:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <20210908165539.3102929-3-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 8 Sep 2021, Roderick Colenbrander wrote:

> Player LEDs are commonly found on game controllers from Nintendo and Sony
> to indicate a player ID across a number of LEDs. For example, "Player 2"
> might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> 
> This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indicate
> player LEDs from the kernel. Until now there was no good standard, which
> resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYERx.
> 
> Note: management of Player IDs is left to user space, though a kernel
> driver may pick a default value.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
>  include/dt-bindings/leds/common.h      |  7 +++++++
>  2 files changed, 21 insertions(+)

Pavel, could you please eventually Ack this, so that I can take it 
together with the rest?

Thanks,

-- 
Jiri Kosina
SUSE Labs

