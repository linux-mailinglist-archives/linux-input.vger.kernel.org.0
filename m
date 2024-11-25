Return-Path: <linux-input+bounces-8230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B79D8233
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 10:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889F0B2564E
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1457A188907;
	Mon, 25 Nov 2024 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcnKH0mL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wejXUTwt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcnKH0mL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wejXUTwt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942E1531E8;
	Mon, 25 Nov 2024 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526743; cv=none; b=Z+EjWeS2ZmRPqCFtghfSa/uFyaYpLrupNVeH0u7vaIohNYZ1wACSv9k393VQ/Qa78bFf71Eh2sB39iNMqCz4Qp7NxlYdC58YfwvEsNuoe+lICHl+Vg6MWgmWJ1JHHXFp4wMLHAoRKFqB9EUnQ/zpnSFbE9zj5BcjynvGG1FCQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526743; c=relaxed/simple;
	bh=QiFM+0/ZOAy7M6l4R9lhKdN6QQiW2z7Rg9rKAwJN0ic=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpPAKmudocY893dc0gaQghvf6I2zJDwLjjWXs9E+196ciKFJDzCObw0QyUgVFa4OUqmcRse7Hpbd9tYcaQW5EXxQs9y+DuCoPggb7UEKaz+kcvIQ0KmHgGNZeZ7QjUVDdEr/dxyJgNP3g/CYQM+Y19O1i9FgEU44UJucRxeSCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcnKH0mL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wejXUTwt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcnKH0mL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wejXUTwt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AA7D2118E;
	Mon, 25 Nov 2024 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732526739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bj9OKtYG42bRc77SXmclYpOGLIYLUd17B83po2Gx7Q=;
	b=xcnKH0mLeCScA2o0RzlSAPZXeuAoi/7/T+uq5+y7VybDs6JZOmVFJue7LKGHDme2sdNUoW
	WuIzANTWS1iiegeRT37W+ldGKwtcdhRty5AXt2MtUTdzpjGrSCrssBM1joWWXgI9PjPIG3
	fM+bqLuiN8mNgpamhBET6Ta4AKhoZD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732526739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bj9OKtYG42bRc77SXmclYpOGLIYLUd17B83po2Gx7Q=;
	b=wejXUTwtlt9BM7FgdN1/l3D+PotYRK3b12+vG+rHfTN7RjusAlFJO5h/pqL6PGhQKJNfM3
	jMP/CeGYI83/POBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732526739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bj9OKtYG42bRc77SXmclYpOGLIYLUd17B83po2Gx7Q=;
	b=xcnKH0mLeCScA2o0RzlSAPZXeuAoi/7/T+uq5+y7VybDs6JZOmVFJue7LKGHDme2sdNUoW
	WuIzANTWS1iiegeRT37W+ldGKwtcdhRty5AXt2MtUTdzpjGrSCrssBM1joWWXgI9PjPIG3
	fM+bqLuiN8mNgpamhBET6Ta4AKhoZD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732526739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bj9OKtYG42bRc77SXmclYpOGLIYLUd17B83po2Gx7Q=;
	b=wejXUTwtlt9BM7FgdN1/l3D+PotYRK3b12+vG+rHfTN7RjusAlFJO5h/pqL6PGhQKJNfM3
	jMP/CeGYI83/POBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2177E13890;
	Mon, 25 Nov 2024 09:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i3b0BpNCRGctYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 09:25:39 +0000
Date: Mon, 25 Nov 2024 10:25:38 +0100
Message-ID: <87frnfzmul.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
In-Reply-To: <20241124203252.28701-3-linuxhid@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
	<20241124203252.28701-3-linuxhid@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 24 Nov 2024 21:32:41 +0100,
Terry Junge wrote:
> 
> Many Poly/Plantronics headset families name the feature, input,
> and/or output units in a such a way to produce control names
> that are not recognized by user space. As such, the volume and
> mute events do not get routed to the headset's audio controls.
> 
> As an example from a product family:
> 
> The microphone mute control is named
> Headset Microphone Capture Switch
> and the headset volume control is named
> Headset Earphone Playback Volume
> 
> The quirk fixes these to become
> Headset Capture Switch
> Headset Playback Volume
> 
> Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>

Thanks, this description looks much more understandable now.
Meanwhile...

> ---
>  sound/usb/mixer_quirks.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 8bbf070b3676..20d63efd5498 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -4215,6 +4215,37 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
>  	}
>  }
>  
> +static void snd_fix_plt_control_name(struct snd_kcontrol *kctl)
> +{
> +	static const char * const names_to_remove[] = {
> +		"Earphone",
> +		"Microphone",
> +		"Receive",
> +		"Transmit",
> +		NULL
> +	};
> +	const char * const *n2r;
> +	char *dst, *src;
> +	size_t len;
> +
> +	for (n2r = names_to_remove; *n2r; ++n2r) {
> +		dst = strstr(kctl->id.name, *n2r);
> +		if (dst) {
> +			src = dst + strlen(*n2r);
> +			len = strlen(src) + 1;
> +			if ((char *)kctl->id.name != dst && *(dst - 1) == ' ')
> +				--dst;
> +			memmove(dst, src, len);
> +		}
> +	}
> +	if (kctl->id.name[0] == ' ') {
> +		char rcat[sizeof(kctl->id.name)] = { "Headset" };
> +
> +		strlcat(rcat, kctl->id.name, sizeof(rcat));
> +		strscpy(kctl->id.name, rcat, sizeof(kctl->id.name));
> +	}
> +}

... the code itself isn't really trivial (due to the poor string
handling by nature of C language), so it's better to put some brief
comment what this function really does, too.


thanks,

Takashi

