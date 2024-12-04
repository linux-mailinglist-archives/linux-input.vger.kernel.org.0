Return-Path: <linux-input+bounces-8381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC49E33BC
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 07:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6E7167CA0
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 06:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89FC18872F;
	Wed,  4 Dec 2024 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gsx0fpkL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DmLFCM6T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gsx0fpkL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DmLFCM6T"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65094A33;
	Wed,  4 Dec 2024 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295421; cv=none; b=VqB6SSo0RL1UmunUHm5agAascd0OsgchV7RC+YLRh1gAHWIE3ZJKiH7h0LeC5/oQr6S80tLmmycAUOfForSLRXwvyFetrRRArafOAME/cAACCMubJoHbJgsNLFguGveT4jvuq5TrliARaN+qwBAof9AKOm+sMsGNlHUPnUv2BsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295421; c=relaxed/simple;
	bh=SX05jmL3WeLeJ090/TmB8lLmFGv00Y3fHeRTdhT4bQo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzx18DzPRdYjdcn7lLQVwjM99uBQFHMmTHlNlclusWkZmwimmoGsNxhIahWJV3tBVVz8YUP2KYE7hm7YiURogCuRl2h6Z+QhA1Mtl6U4DDVRFxvTd9y4AwHsW9elMJQ4ZdZhGU6mXaJHh0stL6pqR1yhr0POd8B+CbTHmUorx3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gsx0fpkL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DmLFCM6T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gsx0fpkL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DmLFCM6T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 692181F38E;
	Wed,  4 Dec 2024 06:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733295417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CI+ko2pG1nD/DF13ZWs1T364nLUFEA2P1gB1BrPJzg=;
	b=gsx0fpkLTEyctdIZ1gyuAPA5+Ia4mCfe7l6PxgtCIExmxgxo1YjPml0Uod66jF+1h81rQ/
	uhA5EbO11oRB0FIusNo5gv+yxDjWRC078KsQu58G2o+t2kGafkML3Zw5RYpxBsmeCL2d2m
	tNMTauvBFh+mAIFDVuapGVfK/4OtYX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733295417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CI+ko2pG1nD/DF13ZWs1T364nLUFEA2P1gB1BrPJzg=;
	b=DmLFCM6T+lqOQ9PJGPNPCzwf3G5B0ZVswIZeKIVvjCjj492tfjkBN0WKl0pzDuyea327JR
	50PfuLdmrdB+SpAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gsx0fpkL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DmLFCM6T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733295417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CI+ko2pG1nD/DF13ZWs1T364nLUFEA2P1gB1BrPJzg=;
	b=gsx0fpkLTEyctdIZ1gyuAPA5+Ia4mCfe7l6PxgtCIExmxgxo1YjPml0Uod66jF+1h81rQ/
	uhA5EbO11oRB0FIusNo5gv+yxDjWRC078KsQu58G2o+t2kGafkML3Zw5RYpxBsmeCL2d2m
	tNMTauvBFh+mAIFDVuapGVfK/4OtYX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733295417;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CI+ko2pG1nD/DF13ZWs1T364nLUFEA2P1gB1BrPJzg=;
	b=DmLFCM6T+lqOQ9PJGPNPCzwf3G5B0ZVswIZeKIVvjCjj492tfjkBN0WKl0pzDuyea327JR
	50PfuLdmrdB+SpAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11723139C2;
	Wed,  4 Dec 2024 06:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0//OAjn9T2ceQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Dec 2024 06:56:57 +0000
Date: Wed, 04 Dec 2024 07:56:56 +0100
Message-ID: <877c8gx7ev.wl-tiwai@suse.de>
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
In-Reply-To: <93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
	<87h67vzo8z.wl-tiwai@suse.de>
	<dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
	<87jzchz0g1.wl-tiwai@suse.de>
	<93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 692181F38E
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 04 Dec 2024 06:23:30 +0100,
Terry Junge wrote:
> 
> On 12/2/24 11:32 PM, Takashi Iwai wrote:
> > On Mon, 02 Dec 2024 23:35:51 +0100,
> > Terry Junge wrote:
> >>
> >> On 11/25/24 12:55 AM, Takashi Iwai wrote:
> >>> On Sun, 24 Nov 2024 21:32:39 +0100,
> >>> Terry Junge wrote:
> >>>>
> >>>> Hi Jiri and Takashi,
> >>>>
> >>>> I'm not sure how it works with two different maintained trees
> >>>> but this patch set needs to be applied and flow upstream together.
> >>>>
> >>>> If the HID patch is applied without the ALSA patch then mute sync
> >>>> issues will occur with multiple Poly/Plantronics product families.
> >>>
> >>> Both patches can be applied individually, and even if only one of them
> >>> is applied, it won't hurt.  So I guess both subsystems can take the
> >>> corresponding one at any time.
> >>>
> >>
> >> Hi Takashi,
> >>
> >> I've tested out the behavior with each patch individually applied and
> >> have found that, IMHO, the mute functionality and synchronization is
> >> worse than the current behavior with neither patch. However, with both
> >> patches applied the mixer UI microphone mute control and the headset
> >> mute button are fully synchronized.
> > 
> > That's odd.  How can it worsen?  As far as I understand from the patch
> > descriptions, the USB-audio patch corrects only the mixer volume
> > control names, while the HID patch changes the quirk to be generalized
> > (to be dropped the next key in a short period).  If only USB audio
> > patch is applied, it doesn't matter as the volume binding didn't
> > happen before the patch.  OTOH, ditto, if only HID patch is applied.
> > Am I missing anything here?
> 
> The USB-audio patch also corrects the names for the mixer switch controls.
> The HID patch also adds mapping of the mute button to the KEY_MICMUTE event.
> It's not the playback volume handling that gets worse, it's the capture
> switch handling that gets worse.

That's what I don't understand -- how can it get worse?  The key
binding didn't work beforehand, no?  Now HID patch handles the
mic-mute key event, but what can it *break* without USB-audio patch?

> The USB-audio patch allows the mixer to bind to the headset's mute control in
> the feature unit and mute/un-mute the headset microphone while the HID patch
> allows the headset to request the mixer to toggle the microphone mute state.
> 
> Both patches are needed for microphone mute synchronization to work.

Sure, but the question is what becomes *worse* by one of them.


thanks,

Takashi

> 
> thanks,
> 
> Terry
> 
> > 
> >> There must be a way that both patches can be tied together and be
> >> applied simultaneously.
> >>
> >> If it would help, and be allowed, I can submit a single patch that
> >> contains both changes.
> > 
> > Applying both from the single tree is possible, sure.  One of two
> > needs an ack from the subsystem maintainers.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> >>
> >> Thanks,
> >> Terry
> >>
> >>>
> >>> thanks,
> >>>
> >>> Takashi
> >>>
> >>>>
> >>>> This patch set was tested by Wade and myself with multiple
> >>>> Poly/Plantronics product family headsets.
> >>>>
> >>>> Hi Wade,
> >>>>
> >>>> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
> >>>> as you see fit.
> >>>>
> >>>> Thanks,
> >>>> Terry
> >>>>
> >>>> Terry Junge (2):
> >>>>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
> >>>>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
> >>>>     names
> >>>>
> >>>>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
> >>>>  sound/usb/mixer_quirks.c      |  35 +++++++++
> >>>>  2 files changed, 100 insertions(+), 70 deletions(-)
> >>>>
> >>>>
> >>>> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
> >>>> -- 
> >>>> 2.43.0
> >>>>
> >>
> 

