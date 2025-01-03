Return-Path: <linux-input+bounces-8879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D9A00BB0
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 16:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717C716448D
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830211F9423;
	Fri,  3 Jan 2025 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XCrOlBQ3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ETzxkI0i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XCrOlBQ3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ETzxkI0i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124517BA3;
	Fri,  3 Jan 2025 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735919490; cv=none; b=dMO5L1PRhNFo45gUcWbPo9Y85CFbmXsaoqjS+fDKezR+cjhCGXVuFRZjeY5tQQuQpnjY+HxAXH0uES0eMx4jMp0N75S/BOHdndqknTnj7FiK6Z0UbZe4TXC2hg9X04fEg9Higb7WSErurrHzmYe9n9nvkUjFaf5I9jp81Das3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735919490; c=relaxed/simple;
	bh=HL/G1FtXucxVilrL9TxuqUwzkLdhAPjyKG+76ZsXqlw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkMOmqMwuCssqYOL/JwKNnOmJShd7wAa97QKsxltj1j1B88MANahYc9eXNLW9GdRktzgdnfQMkxrpPIhvTzDXAF/fDRQWxDN7bgstx4ndCnzTow6yrqPH9qHxSdBEBZOhJtTYAhFDrU3iB8dAGbHp8W9Qdx/EYUH01QIUn3hftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XCrOlBQ3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ETzxkI0i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XCrOlBQ3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ETzxkI0i; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 836B52115C;
	Fri,  3 Jan 2025 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735919486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GKJ6kmWOF5r0iHdj3ab7fYzuDgpVCfERWtIJESAtMg=;
	b=XCrOlBQ39MXDbGQUbaQGwPFYIXDxrkvMtPp2W/e56g3G+OIpdsPmOWvjpJ7YG9r95XS1L/
	JmR1BntCkJx/++KbLEdojImjeYwwO9rwAf8G3NG2biLM+TIN0frxR/rHwr3n2nTLLYybWa
	J8OFWJpCIlees7yENtv8bUAOibhlX9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735919486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GKJ6kmWOF5r0iHdj3ab7fYzuDgpVCfERWtIJESAtMg=;
	b=ETzxkI0i5yUzQndQeWmzISw3RbfLk5F3JN3Ycx4LVlQwWS5H/gI69djC1JgopjrTYORZ7O
	Vaix/T4cU9bIb/Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XCrOlBQ3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ETzxkI0i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735919486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GKJ6kmWOF5r0iHdj3ab7fYzuDgpVCfERWtIJESAtMg=;
	b=XCrOlBQ39MXDbGQUbaQGwPFYIXDxrkvMtPp2W/e56g3G+OIpdsPmOWvjpJ7YG9r95XS1L/
	JmR1BntCkJx/++KbLEdojImjeYwwO9rwAf8G3NG2biLM+TIN0frxR/rHwr3n2nTLLYybWa
	J8OFWJpCIlees7yENtv8bUAOibhlX9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735919486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GKJ6kmWOF5r0iHdj3ab7fYzuDgpVCfERWtIJESAtMg=;
	b=ETzxkI0i5yUzQndQeWmzISw3RbfLk5F3JN3Ycx4LVlQwWS5H/gI69djC1JgopjrTYORZ7O
	Vaix/T4cU9bIb/Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42FAB13418;
	Fri,  3 Jan 2025 15:51:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ae2MDn4HeGdCcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jan 2025 15:51:26 +0000
Date: Fri, 03 Jan 2025 16:51:25 +0100
Message-ID: <87msg7zyiq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wade Wang <wade.wang@hp.com>
Cc: jikos@kernel.org,
	tiwai@suse.com,
	bentiss@kernel.org,
	perex@perex.cz,
	linuxhid@cosmicgizmosystems.com,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
In-Reply-To: <20241224065636.1870713-2-wade.wang@hp.com>
References: <20241224065636.1870713-1-wade.wang@hp.com>
	<20241224065636.1870713-2-wade.wang@hp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 836B52115C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 24 Dec 2024 07:56:36 +0100,
Wade Wang wrote:
> 
> From: Terry Junge <linuxhid@cosmicgizmosystems.com>
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
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2: Add comments, usb_audio_dbg() calls, fix leading space case
> 
>  sound/usb/mixer_quirks.c | 66 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 23fcd680167d..5728c03dc49f 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -4216,6 +4216,67 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
>  	}
>  }
>  
> +/*
> + * Some Plantronics headsets have control names that don't meet ALSA naming
> + * standards. This function removes nonstandard source names. By the time
> + * this function is called the control name will look like one of these:
> + * "source names Playback Volume"
> + * "source names Playback Switch"
> + * "source names Capture Volume"
> + * "source names Capture Switch"
> + * First it scans through the list and removes any found name(s) by moving the
> + * remaining string and its null terminator over the found name and its leading
> + * space, if it has one.
> + * Second, if all source names were removed, it puts back "Headset"
> + * otherwise removes a leading space, if there is one.
> + */
> +static void snd_fix_plt_control_name(struct usb_mixer_interface *mixer,
> +				     struct snd_kcontrol *kctl)
> +{
> +	/* no variant of "Sidetone" should be added to this list */
> +	static const char * const names_to_remove[] = {
> +		"Earphone",
> +		"Microphone",
> +		"Receive",
> +		"Transmit",
> +		NULL
> +	};
> +	const char * const *n2r;
> +	char *dst, *src, *last = NULL;
> +	size_t len = 0;
> +
> +	for (n2r = names_to_remove; *n2r; ++n2r) {
> +		dst = strstr(kctl->id.name, *n2r);
> +		if (dst) {
> +			usb_audio_dbg(mixer->chip, "found %s in %s\n",
> +					*n2r, kctl->id.name);
> +			src = dst + strlen(*n2r);
> +			len = strlen(src) + 1;
> +			if ((char *)kctl->id.name != dst && *(dst - 1) == ' ')
> +				--dst;
> +			last = memmove(dst, src, len);
> +			usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
> +		}
> +	}
> +	if (!len) {
> +		usb_audio_dbg(mixer->chip, "no change in %s\n", kctl->id.name);
> +		return;
> +	}
> +	if (len <= sizeof " Playback Volume" && (char *)kctl->id.name == last) {
> +		char rcat[sizeof(kctl->id.name)] = { "Headset" };
> +
> +		strlcat(rcat, kctl->id.name, sizeof(rcat));
> +		strscpy(kctl->id.name, rcat, sizeof(kctl->id.name));
> +		usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
> +	} else if (kctl->id.name[0] == ' ') {
> +		dst = kctl->id.name;
> +		src = dst + 1;
> +		len = strlen(src) + 1;
> +		memmove(dst, src, len);
> +		usb_audio_dbg(mixer->chip, "now %s\n", kctl->id.name);
> +	}
> +}

Thanks to your updated comments, it's a bit better understandable
now.  However, IMO, it's still too complex than needed.

Basically what we want is to make those kctl names just like "Headset
Playback Switch" from the original "Earphone Headset Playback Switch".
If so, a simpler code would be something like:

static void fix_plantronics_control_name(struct usb_mixer_interface *mixer,
					 struct snd_kcontrol *kctl)
{
	static const char * const prefix_to_match[] = {
		"Headset", "Earphone", "Microphone", "Receive", "Transmit"
	};
	static const char * const suffix[] = {
		"Playback Volume", "Playback Switch",
		"Capture Volume", "Capture Switch"
	};
	int i;
	
	for (i = 0; i < ARRAY_SIZE(prefix_to_match); i++) {
		if (strstr(kctl->id.name, prefix_to_match[i]))
			break;
	}
	if (i >= ARRAY_SIZE(prefix_to_match))
		return;

	for (i = 0; i < ARRAY_SIZE(suffix); i++) {
		if (strstr(kctl->id.name, suffix[i])) {
			usb_audio_dbg(mixer->chip, "fix kctl name %s\n",
				      kctl->id.name);
			sprintf(kctl->id.name, "Headset %s", suffix[i]);
			return;
		}
	}
}


One may put a space around the word if we want to make sure that it's
a separated word, but I hope you get the idea by the example above.
This is no hot code path and it runs only once at probe, so the code
readability and understandability are much more important than
efficiency, after all.


thanks,

Takashi

