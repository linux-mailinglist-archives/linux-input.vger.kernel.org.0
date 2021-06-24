Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0245E3B2FF1
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 15:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFXN2M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 09:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbhFXN2L (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 09:28:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BD5D61074;
        Thu, 24 Jun 2021 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624541152;
        bh=tWunjCgimVyMEhbYavDkqwUe8wS7IKZbRXg1CpFPpm8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=JtxnsM46RYCtgwr57yvp9cVyiQFm6XzvKswX7kXlDTqOEK39IorV0Q1OAcYDtFnBy
         1XjUv8rygdMaykzsy4WicCG4ZIQme2T7g5Ta7tDKYIjAEzRfLDy8lVcv/K/wfSoofW
         YkXLs8soKsmoo4RmRMWVA76BeQCAxn6M+gARtjkdBLQBsI/AH0XtfeTmGGSGLh9DY4
         /eV5wj+5SnxQ41+4/gXXEY5TWjxFmFScLfxBWbZGmIE0cf5Mm8MX5EL4nJcLzbtV0+
         vVEkVi1zXg4j38487J4KjejisspkRmLAN/7lbRyupfWoxuJWTFuLFSIpq1fYdJ0twq
         vnRoyA6s5viDA==
Date:   Thu, 24 Jun 2021 15:25:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <20210602061253.5747-3-roderick@gaikai.com>
Message-ID: <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 1 Jun 2021, Roderick Colenbrander wrote:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
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
>  include/dt-bindings/leds/common.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 52b619d44ba2..94999c250e4d 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -60,6 +60,9 @@
>  #define LED_FUNCTION_MICMUTE "micmute"
>  #define LED_FUNCTION_MUTE "mute"
>  
> +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> +#define LED_FUNCTION_PLAYER "player"
> +
>  /* Miscelleaus functions. Use functions above if you can. */
>  #define LED_FUNCTION_ACTIVITY "activity"
>  #define LED_FUNCTION_ALARM "alarm"

Pavel, can I please get your Ack on this one, so that I can take it with 
the rest of the series?

Thanks,

-- 
Jiri Kosina
SUSE Labs

