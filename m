Return-Path: <linux-input+bounces-10189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131CA3B7A8
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 10:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0533B6DEA
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F91C726D;
	Wed, 19 Feb 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQarF4aU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA11DE2CD
	for <linux-input@vger.kernel.org>; Wed, 19 Feb 2025 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955478; cv=none; b=YqlYR8ZO6c+rl2dR4BO4nvnJwF9i9xcP5f4ajkd/RF4kxPiNcFkGmYWwJWvS1lVJsJ34KEYhV6D6eCPCM4/oQF04pTciApBWjZpAw4TJ7EJE2p5jy7FlTSZFPnUg0KCgKEjFQFZU35R7A/Dr9cZXtLtA0U4XAxX73yxHob7xxBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955478; c=relaxed/simple;
	bh=BJzX/0RLdVoyJ+fEOmQ+oSr1bfGR+l0Xw2d5e0BjEX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YK5+8Txe2lMVGCNcRv3T/q/X969oCtiay7NPRx1RlFo1B3z1R55m7AH4LGqxzbFGGWW2i56ECSJnFJQ38FRlRBwpr1JS84kFsioovBfVIRpJn8IWkR0NcDKjggd2ZEniKxKBEcf2d7P3IUtfgTC5OludS9HHU6SBd5k49zHtfKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQarF4aU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61967C4CEE6;
	Wed, 19 Feb 2025 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739955477;
	bh=BJzX/0RLdVoyJ+fEOmQ+oSr1bfGR+l0Xw2d5e0BjEX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LQarF4aUu4BTEnG5TET12pypWwObFYXoITHri+zSl1Djuq1JYAEvXezKGnC3KyKTT
	 N/Y+qYmHOuXK2wy1ptL5At/twZoLUYsik9w7jmey6dvh8ycFUQvAU9sWKjhEi/SYV3
	 BjajQQTfMDesoQbutOZayX6E1YArm1pMFwRxsph8OsSLZOiAJLWdHhu8jUzHc9VrXf
	 DqT9j6jQPjB+HHm8jYoeuTRrUOYeFwK6VPAIsyssUI1tVHxhWFkFvrnKKjD5hLTJBp
	 ixcv/iFdbPk/Q0/G9pmtaDzWV6bp5qd6sLHCHW49ZYAGxrKLg4aKeMdhnYpsDKDyTi
	 505NEx2rSGJZA==
Date: Wed, 19 Feb 2025 09:57:55 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ryan McClelland <rymcclel@gmail.com>
cc: linux-input@vger.kernel.org, djogorchock@gmail.com, 
    benjamin.tissoires@redhat.com, linux@emily.st
Subject: Re: [PATCH] HID: nintendo: fix gencon button events map
In-Reply-To: <20250117064923.3811-1-rymcclel@gmail.com>
Message-ID: <4op73pp3-7148-8q75-q7p6-045pn0n89oqr@xreary.bet>
References: <20250117064923.3811-1-rymcclel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Ryan McClelland wrote:

> This fixes the button event map to match the 3-button recommendation
> as well as the redundant 'z' in the button map events for the Sega
> MD/Gen 6 Button.
> 
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 11ac246176ae..839d5bcd72b1 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -457,13 +457,13 @@ static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
>  };
>  
>  static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
> -	{ BTN_A,	JC_BTN_A,	},
> -	{ BTN_B,	JC_BTN_B,	},
> -	{ BTN_C,	JC_BTN_R,	},
> -	{ BTN_X,	JC_BTN_X,	}, /* MD/GEN 6B Only */
> -	{ BTN_Y,	JC_BTN_Y,	}, /* MD/GEN 6B Only */
> -	{ BTN_Z,	JC_BTN_L,	}, /* MD/GEN 6B Only */
> -	{ BTN_SELECT,	JC_BTN_ZR,	},
> +	{ BTN_WEST,	JC_BTN_A,	}, /* A */
> +	{ BTN_SOUTH,	JC_BTN_B,	}, /* B */
> +	{ BTN_EAST,	JC_BTN_R,	}, /* C */
> +	{ BTN_TL,	JC_BTN_X,	}, /* X MD/GEN 6B Only */
> +	{ BTN_NORTH,	JC_BTN_Y,	}, /* Y MD/GEN 6B Only */
> +	{ BTN_TR,	JC_BTN_L,	}, /* Z MD/GEN 6B Only */
> +	{ BTN_SELECT,	JC_BTN_ZR,	}, /* Mode */
>  	{ BTN_START,	JC_BTN_PLUS,	},
>  	{ BTN_MODE,	JC_BTN_HOME,	},
>  	{ BTN_Z,	JC_BTN_CAP,	},

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


