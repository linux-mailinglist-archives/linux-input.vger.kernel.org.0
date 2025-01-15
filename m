Return-Path: <linux-input+bounces-9246-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B7A11B22
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 08:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EAD31685B3
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 07:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5722F3A6;
	Wed, 15 Jan 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xeCPZaTf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WTehAooR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xeCPZaTf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WTehAooR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F31EEF9;
	Wed, 15 Jan 2025 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926933; cv=none; b=WePKR5peGVJ/JWk/VgK2pmGJFjY7hW1pKrcNZU4lNmq/p0a+8sIwES9vqHgZ5XsNsOiz9c5Gpcp7noe0BWS/HEqzSAGqoIvKFY6UdUcUKXqt75NzDbwjS4hu16rTWyaerAzvEB1Rg7UzZnsLLBX5YjQDA4Z2K4BSzrpK/CGU9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926933; c=relaxed/simple;
	bh=pYacy/6ZdIWOcaimeT1Gu9rL5/mDXiDG1MJDjNXLvOs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBpbJJKr1VWSexGebeHZZgv5WKersfB3rwJU3OBLF2hp2oC3fpezgWKJ5phgD76CVbzUNkoS3AtAIxJ24hLqpwJYeoJ8ZwOYIhifusH6t0SIVNL8paIBj6i9nmI1lrht5pn39JgqlYt4vMe5/kvxOm80MYmVHRiEuwiN5fns2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xeCPZaTf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WTehAooR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xeCPZaTf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WTehAooR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 598801F37C;
	Wed, 15 Jan 2025 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736926930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eub/Ig+AmiblrsWo5X2ZSkmVuWJI0/VHedFLDwKHy1E=;
	b=xeCPZaTfcGuMhrltVtsyFjlitI0b9DlU2f562qjaI0isIVYhwrZW2TZKaUOi7vJiH6og4X
	xdDBc2eMOAM79TmO0Tt1/+W9u7SNUrVIUw/tgoJFP+zK21mu/naHAczREn154roh17AF97
	wlZVEUqphlPc2TJ6yAP8TxCGOsf/cyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736926930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eub/Ig+AmiblrsWo5X2ZSkmVuWJI0/VHedFLDwKHy1E=;
	b=WTehAooRQbrRsTlS0F2sMO9s2okXmMEBdEgmP7f672umeosHoI1Hp3PFLWUu/VLfNLkvTD
	HR9sthI67mfSAMAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xeCPZaTf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WTehAooR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736926930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eub/Ig+AmiblrsWo5X2ZSkmVuWJI0/VHedFLDwKHy1E=;
	b=xeCPZaTfcGuMhrltVtsyFjlitI0b9DlU2f562qjaI0isIVYhwrZW2TZKaUOi7vJiH6og4X
	xdDBc2eMOAM79TmO0Tt1/+W9u7SNUrVIUw/tgoJFP+zK21mu/naHAczREn154roh17AF97
	wlZVEUqphlPc2TJ6yAP8TxCGOsf/cyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736926930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eub/Ig+AmiblrsWo5X2ZSkmVuWJI0/VHedFLDwKHy1E=;
	b=WTehAooRQbrRsTlS0F2sMO9s2okXmMEBdEgmP7f672umeosHoI1Hp3PFLWUu/VLfNLkvTD
	HR9sthI67mfSAMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10994139CB;
	Wed, 15 Jan 2025 07:42:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id djR7AtJmh2dqbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jan 2025 07:42:10 +0000
Date: Wed, 15 Jan 2025 08:42:09 +0100
Message-ID: <87ed14le0e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
In-Reply-To: <6273ad6b-3c3c-4cc3-9b7e-1da5066d2321@cosmicgizmosystems.com>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
	<20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
	<87jzaxzi24.wl-tiwai@suse.de>
	<6273ad6b-3c3c-4cc3-9b7e-1da5066d2321@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 598801F37C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 14 Jan 2025 23:14:13 +0100,
Terry Junge wrote:
> 
> On 1/14/25 4:38 AM, Takashi Iwai wrote:
> > On Tue, 14 Jan 2025 00:51:59 +0100,
> > Terry Junge wrote:
> >>
> >> +/*
> >> + * Some Plantronics headsets have control names that don't meet ALSA naming
> >> + * standards. This function fixes nonstandard source names. By the time
> >> + * this function is called the control name should look like one of these:
> >> + * "source names Playback Volume"
> >> + * "source names Playback Switch"
> >> + * "source names Capture Volume"
> >> + * "source names Capture Switch"
> >> + * If any of the trigger words are found in the name then the name will
> >> + * be changed to:
> >> + * "Headset Playback Volume"
> >> + * "Headset Playback Switch"
> >> + * "Headset Capture Volume"
> >> + * "Headset Capture Switch"
> >> + * depending on the current suffix.
> >> + */
> >> +static void snd_fix_plt_name(struct snd_usb_audio *chip,
> >> +			     typeof_member(struct snd_ctl_elem_id, name) * name)
> > 
> > I personally find this style of argument is difficult to use.
> > That said, IMO, it's better to stick with the argument
> >   struct snd_ctl_elem_id *id
> > and access via id->name as in your earlier patch; it's more idiomatic,
> > and easier to read.
> > 
> So, is the coding of the rest of the function body acceptable if I just pass a
>    struct snd_ctl_elem_id *id
> instead of an
>    unsigned char[44] *name
> ?

Likely yes.


thanks,

Takashi

