Return-Path: <linux-input+bounces-8166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA79D3A60
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 13:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73561F235B1
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 12:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18891A76BC;
	Wed, 20 Nov 2024 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hf6U86dD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHmQJVBp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hf6U86dD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHmQJVBp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B21A2860;
	Wed, 20 Nov 2024 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104749; cv=none; b=NrMscFeIdzipSBt6O/snnf7hAgMSY3m59dRv/hf2SYQ0zTm0YTP/W0lA4wsdbSJWU7D7vROmdYsxBBISjs06Cqgx5sfaxC4fb70i1rz3mR5+7j/yIchy59UcvEOH5yx/AswUxzq36Obtqz/SV01s7Zd9mkpKlVqmJ9HGib9af8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104749; c=relaxed/simple;
	bh=CtyKnT+o7kJjavwuHvYqtJpTZbv+JH0QKqxclaLtMWU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmjxyTKkGTIJEHZMMmaSr87XM82/8D9ocexI+o0GDqRokpoXF2kHfGIeFJxyBz5b5HaJN1PZCIVk1EbSIVhsgfwviyOjnVyrxtMf6/3Wt13CHkCQlC1emCGOo+QClhldo6BPttypAK0UYudFgZh/0L8ac+n9qXJjs2Ais/+VU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hf6U86dD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lHmQJVBp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hf6U86dD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lHmQJVBp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9B922129F;
	Wed, 20 Nov 2024 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732104744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=270pIDz0vudLZWI+24aPJWabWowll6BUVQLqj24BdFo=;
	b=Hf6U86dDKl7gD6CTCq9esCidXSgktKUKg8Jl1ISOYpMqwk1toNMA6uZWU9Rn5vJckM7ppr
	soGa+c75ya41+ccTMdss85I08cKD4Gc6eYBElLiZYkDHa8+pQKsO98gvofn6q79xpqVx9F
	pKMHktrSQW19GhVtQCJqW5XeKo1m3FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732104744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=270pIDz0vudLZWI+24aPJWabWowll6BUVQLqj24BdFo=;
	b=lHmQJVBpfVOsrSk9xTGEC7iFBQVRvz3ifqacYJBVBMm8t7M+atEhZeRlEmcDJM46oCPcGw
	NrVR+5VnpCxUd4Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hf6U86dD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lHmQJVBp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732104744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=270pIDz0vudLZWI+24aPJWabWowll6BUVQLqj24BdFo=;
	b=Hf6U86dDKl7gD6CTCq9esCidXSgktKUKg8Jl1ISOYpMqwk1toNMA6uZWU9Rn5vJckM7ppr
	soGa+c75ya41+ccTMdss85I08cKD4Gc6eYBElLiZYkDHa8+pQKsO98gvofn6q79xpqVx9F
	pKMHktrSQW19GhVtQCJqW5XeKo1m3FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732104744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=270pIDz0vudLZWI+24aPJWabWowll6BUVQLqj24BdFo=;
	b=lHmQJVBpfVOsrSk9xTGEC7iFBQVRvz3ifqacYJBVBMm8t7M+atEhZeRlEmcDJM46oCPcGw
	NrVR+5VnpCxUd4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDCE6137CF;
	Wed, 20 Nov 2024 12:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4W2hMSfSPWfKBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 12:12:23 +0000
Date: Wed, 20 Nov 2024 13:12:19 +0100
Message-ID: <87bjya3xzw.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
In-Reply-To: <20241106193413.1730413-29-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-29-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A9B922129F
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.com,synopsys.com,suse.com,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,quicinc.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Wed, 06 Nov 2024 20:34:11 +0100,
Wesley Cheng wrote:
> 
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.
> 
> It is expected for the USB SND offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> -1, -1 (range -1->255)
> 
> This example signifies that there is no mapped ASoC path available for the
> USB SND device.
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> 0, 0 (range -1->255)
> 
> This example signifies that the offload path is available over ASoC sound
> card index#0 and PCM device#0.
> 
> The USB offload kcontrol will be added in addition to the existing
> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> the USB audio device specific parameters are still valid and expected to be
> used.  These parameters are not mirrored to the ASoC subsystem.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

IIRC, this representation of kcontrol was one argued issue; Pierre
expressed the concern about the complexity of the kcontrol.
I didn't follow exactly, but did we get consensus?

Apart from that: the Kconfig defition below ...

> +config SND_USB_OFFLOAD_MIXER
> +	tristate "USB Audio Offload mixer control"
> +	help
> +	 Say Y to enable the USB audio offloading mixer controls.  This
> +	 exposes an USB offload capable kcontrol to signal to applications
> +	 about which platform sound card can support USB audio offload.
> +	 The returning values specify the mapped ASoC card and PCM device
> +	 the USB audio device is associated to.

... and Makefile addition below ...

> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>  
>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> +
> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o

... indicates that this code will be an individual module, although
it's solely used from snd-usb-audio-qmi driver.  This should be rather
a boolean and moved to sound/usb/qcom/, and linked to
snd-usb-audio-qmi driver itself, e.g.

--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,2 +1,3 @@
 snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
+snd-usb-audio-qmi-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
 obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o

Then you can drop EXPORT_SYMBOL_GPL(), too.


thanks,

Takashi

