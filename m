Return-Path: <linux-input+bounces-6258-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BB96DEBA
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 17:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABD581C24C83
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 15:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD49C19D897;
	Thu,  5 Sep 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8I9pgzf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48AC194A59;
	Thu,  5 Sep 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551191; cv=none; b=bcXrk8hIn8NJtu7pi/MM+h/LKP9atHfUAbzlVPOTxNspv8wHorx2ZDNjFXjeC+5DDZktPtQir2dfP/mQhO4EoUhC6rFBKOMNCl2WGQO0S3HPJMZ1lN7bbXm3ZM/oW6qHOjpUntugMUX86gzEOeEbCr9AnbPh2Me0nswsGC9b/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551191; c=relaxed/simple;
	bh=/OMsoUVSlNzraoZbCnTLHM87gyVpRtMQlNrBQHBKGRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK8hj1ul+pqmnFfFfOZ/P5qDUB3uUllwGPpfWZRLZMh/hOfIfjE9bTfPkejOmZiV4MRe68uhlAcPrpQKgDt95RnIG7yO/DkDezgpEpGKrkV8tkkcrfUMxIUidnijaBIXe77ZK0PtNAvNFXhbs/fY+TEdohQk1NOyj3e9cs4RLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8I9pgzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1336EC4CEC3;
	Thu,  5 Sep 2024 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725551191;
	bh=/OMsoUVSlNzraoZbCnTLHM87gyVpRtMQlNrBQHBKGRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8I9pgzfej3ReAVVTVpyTe4l7I5TKtHEvKE1u4nxDtnchgsK+4INdaIzoUpT1nG1R
	 YPwsw+aTdd32Twb5WR9nkH+7iQqtOZEZH6NABoXz5JvS7B0Z1Nxq1p741p5iwryfTh
	 j4pRv7iTGwCvTaah8mvNE9h5TIPypE2929WMCXvoybELc0cskoBcN/MLYLQ0c+bJMQ
	 AIHUuMO3zGq/x9NL/vdw+oLQj//p0iD5mmVoXqyqhzr0Ule3evhacdoCAHoMPFe+7r
	 lt2yZiB39ChBvzEyXStLmMLI3l872uqFzldESaMy3GGuodcUf9IqnJaegxNSC81cYN
	 WAvEQxKSVt8Ug==
Received: by pali.im (Postfix)
	id 4F0014AB; Thu,  5 Sep 2024 17:46:26 +0200 (CEST)
Date: Thu, 5 Sep 2024 17:46:26 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/24] Input: alps - use guard notation when pausing
 serio port
Message-ID: <20240905154626.kws5h3s5tca2uaqd@pali>
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
 <20240905041732.2034348-4-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905041732.2034348-4-dmitry.torokhov@gmail.com>
User-Agent: NeoMutt/20180716

On Wednesday 04 September 2024 21:17:08 Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that serio ports are resumed in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Looks good for me.
Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/input/mouse/alps.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 4e37fc3f1a9e..0728b5c08f02 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -1585,7 +1585,7 @@ static void alps_flush_packet(struct timer_list *t)
>  	struct alps_data *priv = from_timer(priv, t, timer);
>  	struct psmouse *psmouse = priv->psmouse;
>  
> -	serio_pause_rx(psmouse->ps2dev.serio);
> +	guard(serio_pause_rx)(psmouse->ps2dev.serio);
>  
>  	if (psmouse->pktcnt == psmouse->pktsize) {
>  
> @@ -1605,8 +1605,6 @@ static void alps_flush_packet(struct timer_list *t)
>  		}
>  		psmouse->pktcnt = 0;
>  	}
> -
> -	serio_continue_rx(psmouse->ps2dev.serio);
>  }
>  
>  static psmouse_ret_t alps_process_byte(struct psmouse *psmouse)
> -- 
> 2.46.0.469.g59c65b2a67-goog
> 

