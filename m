Return-Path: <linux-input+bounces-8190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B99D501A
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 16:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4D01F23452
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 15:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564A7171E76;
	Thu, 21 Nov 2024 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ml+Zf0az";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8h8Hq4nx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ml+Zf0az";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8h8Hq4nx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9D17BD3;
	Thu, 21 Nov 2024 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732204252; cv=none; b=rClkw7YiYjjM4hdDxggsniFL9LAobFJvb0q5nrUJOpe64qYcLrVzSIWBmYLV3oyfj0KDN/q4ksSEix6R2Jle+F6JLL+rLiGJtgdPEccKObsZ5TLrKjiaxt+DIgQrP/PCqsYdyS7LFbt1q3+6b3as9hIB64pm3oUUGE2wEpfZ5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732204252; c=relaxed/simple;
	bh=vImrSacsOI614jvw7kiRwHhUhHp4yGeurkBEFbnQEkg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWySpqyHvUApMNkjMhjY0jrlDpjs3KyyCT8QOWnHYGZeFjeXaBSC94mP50+RQZ5fHVlCnVYz9ZY1qfOboooAYcfT+l5YXLqSqnZ9lYJfix9bU/3ZfMqCliYEruwWE191NajX1QCsW7v1mQbinAnVPOCK66LFA9kTgsuKzxoW438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ml+Zf0az; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8h8Hq4nx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ml+Zf0az; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8h8Hq4nx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 266B51F37E;
	Thu, 21 Nov 2024 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732204243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7oR72zk/NGiMOSWNYMUBy1bxIH0Iurk7XfGGuW0qS0=;
	b=Ml+Zf0azbqtrrdsm1nHiISlg+m6kVVp752jlzq5OuU/xDd922mphmQGCeg1Znhyb/rYqpZ
	QwMJDDveJ+cUauiT4YHs3Bn/ZlVErs03AFIkZ7MlXjSA2JW/P1Jiuwp+AvZOFoZJgPNzeZ
	0K9txIfcDnOqbFChafBXQ95hmcbsO4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732204243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7oR72zk/NGiMOSWNYMUBy1bxIH0Iurk7XfGGuW0qS0=;
	b=8h8Hq4nx7YDcPlGxUcHJWSLIx2wa7BiW/R4VLAZeU0+Ab9TRwHuExQGTcJlmMPIIxY2HuB
	/5iCMPt4qMW6rCBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ml+Zf0az;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8h8Hq4nx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732204243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7oR72zk/NGiMOSWNYMUBy1bxIH0Iurk7XfGGuW0qS0=;
	b=Ml+Zf0azbqtrrdsm1nHiISlg+m6kVVp752jlzq5OuU/xDd922mphmQGCeg1Znhyb/rYqpZ
	QwMJDDveJ+cUauiT4YHs3Bn/ZlVErs03AFIkZ7MlXjSA2JW/P1Jiuwp+AvZOFoZJgPNzeZ
	0K9txIfcDnOqbFChafBXQ95hmcbsO4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732204243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7oR72zk/NGiMOSWNYMUBy1bxIH0Iurk7XfGGuW0qS0=;
	b=8h8Hq4nx7YDcPlGxUcHJWSLIx2wa7BiW/R4VLAZeU0+Ab9TRwHuExQGTcJlmMPIIxY2HuB
	/5iCMPt4qMW6rCBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86C3813927;
	Thu, 21 Nov 2024 15:50:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YqqgH9JWP2eMVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Nov 2024 15:50:42 +0000
Date: Thu, 21 Nov 2024 16:50:42 +0100
Message-ID: <87zfls1t7x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<srinivas.kandagatla@linaro.org>,
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
In-Reply-To: <02c20b06-34ef-459b-9cd1-2d2735eb1352@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-29-quic_wcheng@quicinc.com>
	<87bjya3xzw.wl-tiwai@suse.de>
	<02c20b06-34ef-459b-9cd1-2d2735eb1352@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 266B51F37E
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.com,synopsys.com,suse.com,linuxfoundation.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Wed, 20 Nov 2024 20:13:34 +0100,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 11/20/2024 4:12 AM, Takashi Iwai wrote:
> > On Wed, 06 Nov 2024 20:34:11 +0100,
> > Wesley Cheng wrote:
> >> In order to allow userspace/applications know about USB offloading status,
> >> expose a sound kcontrol that fetches information about which sound card
> >> and PCM index the USB device is mapped to for supporting offloading.  In
> >> the USB audio offloading framework, the ASoC BE DAI link is the entity
> >> responsible for registering to the SOC USB layer.
> >>
> >> It is expected for the USB SND offloading driver to add the kcontrol to the
> >> sound card associated with the USB audio device.  An example output would
> >> look like:
> >>
> >> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> >> -1, -1 (range -1->255)
> >>
> >> This example signifies that there is no mapped ASoC path available for the
> >> USB SND device.
> >>
> >> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> >> 0, 0 (range -1->255)
> >>
> >> This example signifies that the offload path is available over ASoC sound
> >> card index#0 and PCM device#0.
> >>
> >> The USB offload kcontrol will be added in addition to the existing
> >> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> >> the USB audio device specific parameters are still valid and expected to be
> >> used.  These parameters are not mirrored to the ASoC subsystem.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > IIRC, this representation of kcontrol was one argued issue; Pierre
> > expressed the concern about the complexity of the kcontrol.
> > I didn't follow exactly, but did we get consensus?
> So the part that Pierre had concerns on was that previously, the
> > implementation was placing offload kcontrols to the ASoC platform
> > card, and had some additional controls that complicated the
> > offload implementation about the offload status for each USB audio
> > device.  This was discussed here:
> 
> https://lore.kernel.org/linux-usb/957b3c13-e4ba-45e3-b880-7a313e48c33f@quicinc.com/
> 
> To summarize, I made the decision to move the offload status
> kcontrols from ASoC --> USB SND and limited it to only one kcontrol
> (mapped offload device).  So now, there exists a kcontrol for every
> USB SND device (if the offload mixer is enabled), where it tells
> userspace the mapped ASoC platform card and pcm device that handles
> USB offloading, else you'll see the "-1, -1" pair, which means
> offload is not possible for that USB audio device.

OK, the simplification is good.  But I wonder whether the current
representation is the best.  Why not just providing two controls per
PCM, one for card and one for device, instead of two integer array?
It would look more intuitive to me.


> > Apart from that: the Kconfig defition below ...
> >
> >> +config SND_USB_OFFLOAD_MIXER
> >> +	tristate "USB Audio Offload mixer control"
> >> +	help
> >> +	 Say Y to enable the USB audio offloading mixer controls.  This
> >> +	 exposes an USB offload capable kcontrol to signal to applications
> >> +	 about which platform sound card can support USB audio offload.
> >> +	 The returning values specify the mapped ASoC card and PCM device
> >> +	 the USB audio device is associated to.
> > ... and Makefile addition below ...
> >
> >> --- a/sound/usb/Makefile
> >> +++ b/sound/usb/Makefile
> >> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
> >>  
> >>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
> >>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> >> +
> >> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> > ... indicates that this code will be an individual module, although
> > it's solely used from snd-usb-audio-qmi driver.  This should be rather
> > a boolean and moved to sound/usb/qcom/, and linked to
> > snd-usb-audio-qmi driver itself, e.g.
> >
> > --- a/sound/usb/qcom/Makefile
> > +++ b/sound/usb/qcom/Makefile
> > @@ -1,2 +1,3 @@
> >  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> > +snd-usb-audio-qmi-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> >  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> >
> > Then you can drop EXPORT_SYMBOL_GPL(), too.
> 
> Had a discussion with Pierre on this too below.
> 
> https://lore.kernel.org/linux-usb/f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com/
> 
> I remember you commenting to place it in this vendor offload module,
> which is what I did on v24.

I assume that my early comment was based on your old implementations,
and I guess it was because the mixer part didn't belong to the qcom
stuff.  Now it belongs solely to qcom, the situation changed; it makes
no sense to make it an individual module at all.


thanks,

Takashi

