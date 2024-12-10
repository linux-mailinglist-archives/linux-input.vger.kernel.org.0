Return-Path: <linux-input+bounces-8481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 605379EB6B2
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 17:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14A2281728
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 16:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302DC22FE0D;
	Tue, 10 Dec 2024 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1tjTJQF7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbVkz5ki";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3eeSNYj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6D0lUttY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A902343DB;
	Tue, 10 Dec 2024 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848853; cv=none; b=eMkCxAC5n0FO5ZK6/s6lrAj5bYhtSGUp1F9A4WW6bONT4UyBoQRv5OnlwjqdLEvlEzivqBgIA6QhtGKi/WrF4NWUFCwBrmehat8UB4qPeI4ZLN8Kd2PG78CNPR3Tn2a0B24wzeqaQSlZM0fQNDwVWdyLs6E1AJ3UlNMKqHARSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848853; c=relaxed/simple;
	bh=p85D9s7tysu9FxexEW/PA420b+YkVfiM3KU+ml5gJh8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JiOnqFSnkPs9eTM/j4SSV1vfECPJ45rNbsc/xi4VZfC/ZNrJdoXh+N6QyUsFbXXECYfpKCO0/DVHMfjJ8oLWHV0ehip6OEpxtt77zXAxRPmVsIBPHz76VTDp4Zufyv0CXXABlvWR55VrTWbUtjpxgJ3cZQ/KfRFg0FhYJicm8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1tjTJQF7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tbVkz5ki; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3eeSNYj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6D0lUttY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD7F91F396;
	Tue, 10 Dec 2024 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733848849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJoArr2r5pFfdB4/YkzK4PnjaiyKrITWnEHUvllbKDU=;
	b=1tjTJQF77zM5KNxgTrVYReobO6Bc3SwoDhluK+2wr/BW05lG5sPtkO7ALDTHkXf17+YF7q
	4pB1KwDP/jHRtyMXzKRxVBG7h6OlToolneQzEoenWVIzou/QtnH8oIfFze7SwplH4dr6Jy
	fPfrOd4BxurMPWiEfh8HhhjgjOLj5ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733848849;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJoArr2r5pFfdB4/YkzK4PnjaiyKrITWnEHUvllbKDU=;
	b=tbVkz5kiORsMHSForUiJFG7QuTOGWB0gEwSws4R+05qRdMDdhA8y60b1c/CpichW0tGTDl
	wFXWHQ9v4DMfhcBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N3eeSNYj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6D0lUttY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733848848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJoArr2r5pFfdB4/YkzK4PnjaiyKrITWnEHUvllbKDU=;
	b=N3eeSNYjWhFAet28Pu2B6qErZIkvnkJHb3ny0vK33rfNXgi7fkRx7G5s2rZ9F7gXoM0BAO
	dMbZJjjzvRm6XD0imDiKsYTHkHunFSd34MetSR35G/sYCbFZyL+UOd8DBAj/9PLTZt3uKp
	Jy/UvJbLJnkZvB3JTEy2kek6qrBn88g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733848848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJoArr2r5pFfdB4/YkzK4PnjaiyKrITWnEHUvllbKDU=;
	b=6D0lUttYZ1WaUQQLL54b/ykDLPwFv6zxQ6JLZ/sFrYa+GcnlI6t+0TIgVdCgnW1vsZTMp+
	xXGWmiMdd/AhPwBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32CCB13A15;
	Tue, 10 Dec 2024 16:40:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l2OOChBvWGcwQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Dec 2024 16:40:48 +0000
Date: Tue, 10 Dec 2024 17:40:47 +0100
Message-ID: <87y10n3300.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Cezary Rojewski
	<cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	Greg KH <gregkh@linuxfoundation.org>,
	<srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>,
	<Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>,
	<robh@kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
In-Reply-To: <75e6516f-5cf5-4b0d-ade8-bfbc5632765f@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
	<2024111655-approve-throwback-e7df@gregkh>
	<2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
	<875xoi3wqw.wl-tiwai@suse.de>
	<d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
	<CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
	<65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
	<4C900353-B977-451C-B003-BAA51E458726@linux.dev>
	<e7b8f141-efd4-4933-b074-641638914905@intel.com>
	<4E9925AF-F297-42A5-9CB8-F8568F0A5EDF@linux.dev>
	<0a36814a-5818-493a-a9e3-b1a1e9559387@quicinc.com>
	<75e6516f-5cf5-4b0d-ade8-bfbc5632765f@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD7F91F396
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
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,intel.com,suse.de,linuxfoundation.org,linaro.org,perex.cz,kernel.org,gmail.com,lwn.net,synopsys.com,suse.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Tue, 10 Dec 2024 01:59:10 +0100,
Wesley Cheng wrote:
> 
> On 12/5/2024 4:53 PM, Wesley Cheng wrote:
> > On 12/4/2024 2:49 PM, Pierre-Louis Bossart wrote:
> >>>
> >>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
> >>>> The main difference is that we don¢t want the USB audio *control* part to be seen in two places. The only requirement is to stream data with an alternate optimized path, but all the volume control and whatnot is supposed to be done using the regular usb-audio card. It would be complete chaos for userspace if the same volume can be represented differently.
> >>>> The comparison with HDaudio is not quite right either. In the case of HDaudio, it¢s an all-or-nothing solution. The external device is controlled by one entity, either legacy or ASoC based. That choice is made at driver probe time. In the case of USB, the application needs to have the choice of using either the legacy path, or the optimized path that goes through a DSP. I think the last thing you want given this context is to make the USB audio device an ASoC codec.
> >>>> I find it rather interesting that this architectural feedback comes at the v30, it¢s unfair to Wesley really...
> >>> Hi Pierre,
> >>>
> >>> Obviously I'm late. After scanning the history of this one, indeed it's been a while since v1 has been sent. And thus I posted no NACKs. At the same time if I am to choose between: provide feedback vs provide no-feedback, I'd rather choose the former even if I'm to be ignored/overridden by a subsystem maintainer.
> >>>
> >>> The subsystem maintainers also hold the last word, and I have no problem with them merging the patches if they believe its existing shape is good-enough. For example, my team could follow up this implementation next year with a patchset expanding/updating the functionality. I see this as a viable option.
> >> That¢s what we had in mind before I left Intel. The interfaces seen by userspace are PCM devices and kcontrols, it doesn¢t matter too much if there is one card, two cards, and if the implementation relies on an ASoC codec, a library or something else. 
> >> The bulk of the work is to enable the USB offload from top to bottom, by changing PipeWire/CRAS/HAL to select the new optimized path when available and deal with plug/unplug events.
> >> Improvements at the kernel level can be done later if required. It¢s hard to argue that the proposal in this series is fundamentally broken, but as usual it¢s likely that some requirements are missing or not known yet. The same thing happened with compressed offload, none one thought about gapless playback until Android made it a requirement. Maybe what we¢d need is a ¡protocol version¢ for USB offload so that changes can be tracked and handled?
> >
> > Thanks for chiming in, Pierre.  So for now, with the next revision I have prepared, I'm currently adding:
> >
> > 1.  Some improvements to xHCI sideband to account for core sequences that need to be notified to the offload driver, ie transfer ring free
> >
> > 2.  Moved the USB SND offload mixer driver into the QC vendor module for now, as instructed by Takashi:
> >
> > https://lore.kernel.org/linux-usb/87cyiiaxpc.wl-tiwai@suse.de/
> >
> > 3.  Added separate kcontrols for fetching mapped PCM device and card indexes (versus one that returns a card and PCM device pair [array])
> >
> > 4.  Removed some jack controls (enable/disable) from soc-usb
> >
> > 5.  Updated documentation for #3
> >
> >
> > Those are the major changes that will come in the next revision.  I'm just trying to figure out who/where the "protocol version" should be checked if we decided to add it.  (or if we need to check for it anywhere...)  From the userspace perspective, it should be agnostic to how we've implemented offloading from the kernel, and I don't see any major shifts in how userspace implements things even if we make improvements from kernel.
> 
> 
> Hi Takashi,
> 
> Could you possibly help share some direction on what you think of the current design, and if you think its detrimental that we make modifications mentioned by Cezary?  I have the next revision ready for review, but I wanted to get a better sense on the likeliness of this landing upstream w/o the major modifications.

Honestly speaking, I have no big preference about that design
question.  The most important thing is rather what's visible change to
users.  An advantage of the current design (sort of add-on to the
existing USB-audio driver) is that it's merely a few card controls
that are added and visible, and the rest is just as of now.  The
remaining design issue (two cards or single card) is rather
kernel-internal, and has nothing to do with users.  So I'm fine with
the current design.

OTOH, if we follow the pattern of HD-audio, at least there will be
more preliminary changes in USB-audio driver side like we've done for
HD-audio.  That is, make most of USB-audio code to be usable as (a
kind of) library code.  It's more work, but certainly doable.  And if
that can be achieved and there other similar use cases of this stuff
not only from Qualcomm, it might make sense to go in that way, too.
That said, it's rather a question about what's extended in future.
If Intel will need / want to move on that direction, too, that's a
good reason to reconsider the basic design.


thanks,

Takashi

