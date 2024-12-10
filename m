Return-Path: <linux-input+bounces-8480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6C9EB620
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 17:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451631884578
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 16:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A7F19D884;
	Tue, 10 Dec 2024 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4CbS3ox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+MAiJJ16";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4CbS3ox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+MAiJJ16"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D5719D06E;
	Tue, 10 Dec 2024 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847738; cv=none; b=lDTWs/SJ0CLAwiQLwxMEjVO1XKX5arOXHNTx5BJpGMVI+Td4m2lu4u/BtL8GYyiLu6Zh8vzolYHX/NgQqI4zcghAZmEkt+7L5g9bVZAKxxhP5Bj5f313Vt7jMUAHNmVHBuT4sYbItAE1vkCRWDXopzRDSk9mFWop5x9QLkHgHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847738; c=relaxed/simple;
	bh=8lzSNS5kPstXUeEe6nuQaziSBet2+DbvRId/PCLHcIo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+XjB8jbBbjAnI3fkgK/m21HnQP9i2fBUaCc7+tKItCpW8tlXxXPNOQpuQ+z7WTlzygSDZn8pZ3wPpkO/w+i1KhKNc6rnMoTfYJORFMbOIDoSqz0sOa48px5Fj4fC1oZfVDHi7qX4sLt7edtdUQBlZVHCT2/HINVs9XR1PhRaVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4CbS3ox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+MAiJJ16; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4CbS3ox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+MAiJJ16; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 598A11F74C;
	Tue, 10 Dec 2024 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733847734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LYAf9tFP7b+hiSmpzZWOAO+83IqkIGOo//hwNDld+N8=;
	b=s4CbS3oxDbQThnYTQywZMmHupm7C+FInbxEuPtU26pbumnCPshDYESA320C5ncvRHHqH64
	uS1PgYXIKFE8CfA40BFln2x00qwGEp49KSO19ApvKWlbsQvzN9/lLyyjntUJhfG3jMjAum
	R6pBQHZs6mFmLToXDaTWQ4X+8y4ZdQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733847734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LYAf9tFP7b+hiSmpzZWOAO+83IqkIGOo//hwNDld+N8=;
	b=+MAiJJ16mPiisfk7H3ZCzqM19hlzhfOxlkd3KxhY7F/qWsqTj/1dZDBrl2oXhhl0Dyykjn
	DOU9d1dfHI/YFLCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s4CbS3ox;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+MAiJJ16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733847734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LYAf9tFP7b+hiSmpzZWOAO+83IqkIGOo//hwNDld+N8=;
	b=s4CbS3oxDbQThnYTQywZMmHupm7C+FInbxEuPtU26pbumnCPshDYESA320C5ncvRHHqH64
	uS1PgYXIKFE8CfA40BFln2x00qwGEp49KSO19ApvKWlbsQvzN9/lLyyjntUJhfG3jMjAum
	R6pBQHZs6mFmLToXDaTWQ4X+8y4ZdQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733847734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LYAf9tFP7b+hiSmpzZWOAO+83IqkIGOo//hwNDld+N8=;
	b=+MAiJJ16mPiisfk7H3ZCzqM19hlzhfOxlkd3KxhY7F/qWsqTj/1dZDBrl2oXhhl0Dyykjn
	DOU9d1dfHI/YFLCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18CF213A15;
	Tue, 10 Dec 2024 16:22:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FPuqBLZqWGcfOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Dec 2024 16:22:14 +0000
Date: Tue, 10 Dec 2024 17:22:13 +0100
Message-ID: <87zfl333uy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce Poly/Plantronics mute event support
In-Reply-To: <f107e133-c536-43e5-bd4f-4fcb8a4b4c7f@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
	<87h67vzo8z.wl-tiwai@suse.de>
	<dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
	<87jzchz0g1.wl-tiwai@suse.de>
	<93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
	<877c8gx7ev.wl-tiwai@suse.de>
	<f107e133-c536-43e5-bd4f-4fcb8a4b4c7f@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 598A11F74C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 05 Dec 2024 23:19:00 +0100,
Terry Junge wrote:
> 
> On 12/3/24 10:56 PM, Takashi Iwai wrote:
> > On Wed, 04 Dec 2024 06:23:30 +0100,
> > Terry Junge wrote:
> >>
> >> On 12/2/24 11:32 PM, Takashi Iwai wrote:
> >>> On Mon, 02 Dec 2024 23:35:51 +0100,
> >>> Terry Junge wrote:
> >>>>
> >>>> On 11/25/24 12:55 AM, Takashi Iwai wrote:
> >>>>> On Sun, 24 Nov 2024 21:32:39 +0100,
> >>>>> Terry Junge wrote:
> >>>>>>
> >>>>>> Hi Jiri and Takashi,
> >>>>>>
> >>>>>> I'm not sure how it works with two different maintained trees
> >>>>>> but this patch set needs to be applied and flow upstream together.
> >>>>>>
> >>>>>> If the HID patch is applied without the ALSA patch then mute sync
> >>>>>> issues will occur with multiple Poly/Plantronics product families.
> >>>>>
> >>>>> Both patches can be applied individually, and even if only one of them
> >>>>> is applied, it won't hurt.  So I guess both subsystems can take the
> >>>>> corresponding one at any time.
> >>>>>
> >>>>
> >>>> Hi Takashi,
> >>>>
> >>>> I've tested out the behavior with each patch individually applied and
> >>>> have found that, IMHO, the mute functionality and synchronization is
> >>>> worse than the current behavior with neither patch. However, with both
> >>>> patches applied the mixer UI microphone mute control and the headset
> >>>> mute button are fully synchronized.
> >>>
> >>> That's odd.  How can it worsen?  As far as I understand from the patch
> >>> descriptions, the USB-audio patch corrects only the mixer volume
> >>> control names, while the HID patch changes the quirk to be generalized
> >>> (to be dropped the next key in a short period).  If only USB audio
> >>> patch is applied, it doesn't matter as the volume binding didn't
> >>> happen before the patch.  OTOH, ditto, if only HID patch is applied.
> >>> Am I missing anything here?
> >>
> >> The USB-audio patch also corrects the names for the mixer switch controls.
> >> The HID patch also adds mapping of the mute button to the KEY_MICMUTE event.
> >> It's not the playback volume handling that gets worse, it's the capture
> >> switch handling that gets worse.
> > 
> > That's what I don't understand -- how can it get worse?  The key
> > binding didn't work beforehand, no?  Now HID patch handles the
> > mic-mute key event, but what can it *break* without USB-audio patch?
> 
> Sorry, it's a long story...
> All this describes the behavior I see with Ubuntu 24.04.1.
> 
> 
> The current mute behavior with no patch:
> 
> Headset cannot communicate mute toggle intent to mixer
> Mixer cannot communicate mute state to headset
> 
> Due to the name of the microphone mute control a software based mute control is
> created that mutes the capture stream after it is received from the headset. It
> is toggled on/off with the UI mixer dialog. Toggling this control is not
> reflected in the headset, mute LED does not toggle, "Mute On" and "Mute Off"
> prompts do not play (on some models). This mute control is totally independent
> of the headset's mute state.
> 
> The headset also has a mute control that is toggled on/off with the headset mute
> button. It mutes the capture stream before it is sent to the host. Mute state is
> reflected in the mute LED and/or mute prompts. As the headset's mute control did
> not get bound to the mixer, this mute control is also totally independent of the
> software mute control.
> 
> If either of these mute controls are muted then the capture stream is muted.
> Only if both controls are unmuted will the capture stream be live. So if the
> user mutes with the UI mute control then they need to unmute with the UI
> control. If they mute with the headset button then they need to unmute with
> the headset button.
> 
> 
> The mute behavior with only the HID patch:
> 
> Headset can communicate mute toggle intent to mixer
> Mixer cannot communicate mute state to headset
> 
> A software mute control is created with the same characteristics as described
> above with one addition. Not only does the software mute control toggle by using
> the UI mixer dialog. It can now be toggled by the headset mute button sending the
> mic-mute key event. This mute control is no longer totally independent.
> 
> The headset mute control is still as described above with the addition of
> firing a mic-mute event when the mute button is pressed. So every press of the
> mute button toggles the headset mute state and toggles the state of the
> software mute control. This mute control is still totally independent. You can
> only toggle it with the headset mute button.
> 
> So now the following scenario is possible...
> Remember that if either control is muted the capture stream will be muted.
> 
> Mute using the UI dialog - software control is muted, headset control is not
> Press headset mute button - headset control is muted, software control is not
> Press headset mute button - software control is muted, headset control is not
> ...
> Press headset mute button - headset control is muted, software control is not
> Press headset mute button - software control is muted, headset control is not
> Unmute using the UI dialog - both software and headset controls are not muted
> Press headset mute button - both software and headset controls are muted
> Press headset mute button - both software and headset controls are not muted
> 
> So the user should not use the UI dialog to toggle microphone mute.
> 
> The mute behavior with only the USB-audio patch:
> 
> Headset cannot communicate mute toggle intent to mixer
> Mixer can communicate mute state to headset
> 
> With the names corrected the mixer now binds to the audio controls in the
> headset. A software mute control is no longer created. Toggling the mute
> control in the UI dialog actually sends the mute or unmute setting to
> the headset's feature unit. As such, the mixer is in direct control of the
> headset's mute state.
> 
> The headset mute button is not sending mic-mute events so it is unable to
> request the mixer to toggle the mute state. The headset will comply with the
> audio control mute/unmute commands as they come in. The headset's response to
> mute button presses depends on the last audio control mute command received
> from the host. If the last command was unmute then the mute button presses will
> toggle the local mute state as described in earlier paragraphs. If the last
> command was mute then the mute button presses will *not* unmute the headset.
> 
> So if the user mutes the microphone using the UI dialog, the headset will mute.
> Then pressing the headset's mute button will result in the headset playing its
> ummute prompt (beeps or "Mute Off") followed immediately by playing its mute
> prompt (beeps or "Mute On") and the headset remains muted. At this point the
> only way to unmute is by using the UI dialog.
>  
> So the user should not use the UI dialog to toggle microphone mute.
>  
> 
> The mute behavior with both patches:
> 
> Headset can communicate mute toggle intent to mixer
> Mixer can communicate mute state to headset
> 
> The microphone can be muted or unmuted by using the UI dialog or the headset's
> mute button, in any order.
> 
> 
> So...
> Neither of the single patch scenarios is actually *broken*. The user can
> mute or unmute the headset although some confusion can occur if the UI dialog
> is utilized.
> 
> So it comes down to user experience and possibility for confusion to rate them
> from best to worst.
> 
> Are either of the single patch scenarios better than or equal to the no patch
> scenario?

I don't think it'll be so big problem to apply individually.  Even if
only one of two patches is applied, it doesn't break things
seriously.  Certainly there can be inconsistency due to individual
mute behavior, but that's not much worse than the current situation,
IMO.

And, as long as we keep Cc-to-stable tag in both patches, both of them
will be taken to stable trees.  Also, since the changes aren't too
intrusive, it's no big problem to apply both patches to the same tree
by receiving Ack from the other subsystem maintainers, too.


thanks,

Takashi

