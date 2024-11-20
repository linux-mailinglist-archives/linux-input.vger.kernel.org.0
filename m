Return-Path: <linux-input+bounces-8168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF09D3AAB
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 13:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A8BB2356D
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 12:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655B21A2544;
	Wed, 20 Nov 2024 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KIx0blxU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2F3TC1vO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KIx0blxU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2F3TC1vO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CD172BD5;
	Wed, 20 Nov 2024 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732105445; cv=none; b=aUwiyEFlCqXpLLimcJ0sk7TevXnuGrTNSdCmkOMgEB91VJNqLlna24dpD8POMmbNWiLn/J1HEU7anwGog2FRIQd0YiEphTM6oSM2EueyLcWchLjPRSVPsBakuXxMAM1F8t6cizbtCd7Ojq7ItUb1TnSYcQP9Xl0zZkAqe3wLS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732105445; c=relaxed/simple;
	bh=K5K1Yw+04T/dpRHzJK4zgf/M5dBzfsDcoWJpc0vA5ww=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tF1O2TOmNbwf9uc36E7XkVLr5Q66a/xI3RmofagDNpdOH5etNUbBt4YzjiS1xYPHRAZ5hBbGeiFhfyPNyXYycLer005d/T1H/0tnyF7IFXZ3dR//JwtrQiax/niUcLoL8p9ZsmO+J/eB8tD5NFh4FN54eWqAm66CHqF1wPwoxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KIx0blxU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2F3TC1vO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KIx0blxU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2F3TC1vO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 152892198C;
	Wed, 20 Nov 2024 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732105436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sv1wEwUCRnJgcO3pMn8ORE+/2tjnCkxAdkeEeFOh8so=;
	b=KIx0blxUFL9bJVyktEgCeBFKPKZ4WbAcpLdCS5burmflYn/+j3UQQUJPdMCZORNMVASxRl
	z6OUNXLVsLki1TKHYFUkgAdDiLYnjwXdi//ECfCYp4UAzqfBKz8diRnHW+2+EVKzEuKw/o
	bC3se6JPJ6HJxL0iubkT0Mp+N+OyQhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732105436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sv1wEwUCRnJgcO3pMn8ORE+/2tjnCkxAdkeEeFOh8so=;
	b=2F3TC1vOPjTWOxZJco88LmeS7C4NWtF8RBLcjRWOSrYL+/jkMJ9gOLwH+dEFxhfWvKuFMS
	qS1svuKgbiab3nBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KIx0blxU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2F3TC1vO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732105436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sv1wEwUCRnJgcO3pMn8ORE+/2tjnCkxAdkeEeFOh8so=;
	b=KIx0blxUFL9bJVyktEgCeBFKPKZ4WbAcpLdCS5burmflYn/+j3UQQUJPdMCZORNMVASxRl
	z6OUNXLVsLki1TKHYFUkgAdDiLYnjwXdi//ECfCYp4UAzqfBKz8diRnHW+2+EVKzEuKw/o
	bC3se6JPJ6HJxL0iubkT0Mp+N+OyQhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732105436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sv1wEwUCRnJgcO3pMn8ORE+/2tjnCkxAdkeEeFOh8so=;
	b=2F3TC1vOPjTWOxZJco88LmeS7C4NWtF8RBLcjRWOSrYL+/jkMJ9gOLwH+dEFxhfWvKuFMS
	qS1svuKgbiab3nBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9373137CF;
	Wed, 20 Nov 2024 12:23:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F09UMNvUPWdlCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 12:23:55 +0000
Date: Wed, 20 Nov 2024 13:23:51 +0100
Message-ID: <878qte3xgo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>,
	<pierre-louis.bossart@linux.intel.com>,
	<Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>,
	<robh@kernel.org>,
	<gregkh@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v30 15/30] ASoC: usb: Fetch ASoC card and pcm device information
In-Reply-To: <20241106193413.1730413-16-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-16-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 152892198C
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.com,synopsys.com,suse.com,linuxfoundation.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Wed, 06 Nov 2024 20:33:58 +0100,
Wesley Cheng wrote:
> 
> USB SND needs to know how the USB offload path is being routed.  This would
> allow for applications to open the corresponding sound card and pcm device
> when it wants to take the audio offload path.  This callback should return
> the mapped indexes based on the USB SND device information.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h | 16 ++++++++++++++++
>  sound/soc/soc-usb.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index 587ea07a8cf5..c3d3e8d62ac5 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -36,6 +36,11 @@ struct snd_soc_usb_device {
>   * @list - list head for SND SOC struct list
>   * @component - reference to ASoC component
>   * @connection_status_cb - callback to notify connection events
> + * @update_offload_route_info - callback to fetch mapped ASoC card and pcm
> + *				device pair.  This is unrelated to the concept
> + *				of DAPM route.  The "route" argument carries
> + *				an array used for a kcontrol output and should
> + *				contain two integers, card and pcm device index
>   * @priv_data - driver data
>   **/
>  struct snd_soc_usb {
> @@ -44,6 +49,9 @@ struct snd_soc_usb {
>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>  				    struct snd_soc_usb_device *sdev,
>  				    bool connected);
> +	int (*update_offload_route_info)(struct snd_soc_component *component,
> +					 int card, int pcm, int direction,
> +					 long *route);
>  	void *priv_data;
>  };
>  
> @@ -61,6 +69,8 @@ int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
>  int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
>  				    struct snd_soc_jack *jack);
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route);
>  
>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>  					      void *data);
> @@ -109,6 +119,12 @@ static inline int snd_soc_usb_enable_offload_jack(struct snd_soc_component *comp
>  	return 0;
>  }
>  
> +static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					    int direction, long *route)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct snd_soc_usb *
>  snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
>  {
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index ab914878e101..e56826f1df71 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -145,6 +145,40 @@ int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);
>  
> +/**
> + * snd_soc_usb_update_offload_route - Find active USB offload path
> + * @dev - USB device to get offload status
> + * @card - USB card index
> + * @pcm - USB PCM device index
> + * @direction - playback or capture direction
> + * @route - pointer to route output array
> + *
> + * Fetch the current status for the USB SND card and PCM device indexes
> + * specified.  The "route" argument should be an array of integers being
> + * used for a kcontrol output.  The first element should have the selected
> + * card index, and the second element should have the selected pcm device
> + * index.
> + */
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route)
> +{
> +	struct snd_soc_usb *ctx;
> +	int ret = -EINVAL;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	mutex_lock(&ctx_mutex);
> +	if (ctx && ctx->update_offload_route_info)
> +		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
> +						     direction, route);
> +	mutex_unlock(&ctx_mutex);

The second ctx check is redundant.  And the locking scheme looks
dubious -- as ctx isn't protected by ctx_mutex after its retrieval via
snd_soc_find_usb_ctx(), even if you reacquire ctx_mutex, it may point
to an already released object (in theory).

IOW, for a safer protection, you'd need to cover the whole
find-and-exec procedure via a single ctx_mutex lock action.


thanks,

Takashi

