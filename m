Return-Path: <linux-input+bounces-9117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34551A07C19
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 16:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F441889C5F
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B820721CFE0;
	Thu,  9 Jan 2025 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDKc7bw8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+S+bPMK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDKc7bw8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+S+bPMK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA714F98;
	Thu,  9 Jan 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436981; cv=none; b=ZvRX3oc1d/3KBIgSCQBagVvicL+OPXqHo31+SfX2E03WAieenWRtYFazKE4ALzcUYBsNwdzV+x6IRcuXbfwKQHyphQnOpfGII1pb8cs/xqZ36FRMAxeUUpjsX9Mu/SOyZEVr52Q3taHUs1X05K9jPCzCKVnf/pDkat9ynYa9jFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436981; c=relaxed/simple;
	bh=+EGQuq2SNr8np7calqcCZBl7C+Qv45NpN/pum7mUzm8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eQtrgnjkjc0j5Y7gZAwlivMsf2XdS6u8SHjvigZgxC8/o4TDu88Bwcp2NZDXqZ5gt6WOHhpr0e2IvusIeUa3fcqpuK7G+YufWoAs5xzDJB0k1FBAs7oYrh68A0n+K8Y8gQGMIo34MrEQKcj9/CHOeY80dOBtJWY7vtmJ4JDRDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDKc7bw8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+S+bPMK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDKc7bw8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+S+bPMK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F99F2116E;
	Thu,  9 Jan 2025 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736436976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/VugJIHAxWxTUcOHSYyG02xEmr6NmM5FeH034UTxCSc=;
	b=BDKc7bw8ZIEACODQU6DJBEopcWLN373sjAHCmMyuOlGW0TcedkQ4hejGivyEoFrmROWKq9
	r59q3W69/C0+4dYinNrKjv4d36swPSQ9DGCyNf84Yq0pDHWCxfwd6wTQnJINOTWKxqpg2p
	CcUoqpN3PUxcoSyQu3MsZmAFfiQq8UI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736436976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/VugJIHAxWxTUcOHSYyG02xEmr6NmM5FeH034UTxCSc=;
	b=9+S+bPMK5fW90Aj9k1b0Hw5Sg5uxJsX/6DbvbLBh1bjz67e8T3jJGEm9uelMVvXCl9b442
	n2Rbk5b9lyX4uTAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736436976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/VugJIHAxWxTUcOHSYyG02xEmr6NmM5FeH034UTxCSc=;
	b=BDKc7bw8ZIEACODQU6DJBEopcWLN373sjAHCmMyuOlGW0TcedkQ4hejGivyEoFrmROWKq9
	r59q3W69/C0+4dYinNrKjv4d36swPSQ9DGCyNf84Yq0pDHWCxfwd6wTQnJINOTWKxqpg2p
	CcUoqpN3PUxcoSyQu3MsZmAFfiQq8UI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736436976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/VugJIHAxWxTUcOHSYyG02xEmr6NmM5FeH034UTxCSc=;
	b=9+S+bPMK5fW90Aj9k1b0Hw5Sg5uxJsX/6DbvbLBh1bjz67e8T3jJGEm9uelMVvXCl9b442
	n2Rbk5b9lyX4uTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE6AE13876;
	Thu,  9 Jan 2025 15:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D8m3NO/sf2fCdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 15:36:15 +0000
Date: Thu, 09 Jan 2025 16:36:15 +0100
Message-ID: <87jzb4579s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Input: psmouse: add NULL check to psmouse_from_serio()
In-Reply-To: <Z3t_Z_ri48z99pmy@google.com>
References: <20241230111554.1440-1-tiwai@suse.de>
	<Z3t_Z_ri48z99pmy@google.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 06 Jan 2025 07:59:51 +0100,
Dmitry Torokhov wrote:
> 
> Hi Takashi,
> 
> 
> On Mon, Dec 30, 2024 at 12:15:52PM +0100, Takashi Iwai wrote:
> > The serio drvdata can be still NULL while the PS/2 interrupt is
> > processed.  This leaded to crash with a NULL dereference Oops, as
> > psmouse_from_serio() blindly assumes the non-NULL ps2dev object.
> > 
> > Add a NULL check and return NULL from psmouse_from_serio().  The
> > returned NULL is handled properly in the caller side, skipping the
> > rest gracefully.
> > 
> > The log in the bugzilla entry showed that the probe of synaptics
> > driver succeeded after that point.  So this is a stop-gap solution.
> > 
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> > 
> > It was submitted in a few months ago
> >   https://lore.kernel.org/20240405084448.15754-1-tiwai@suse.de
> > but seems forgotten.  Simply resubmitted.
> > 
> > 
> >  drivers/input/mouse/psmouse-base.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> > index a2c9f7144864..d428e9ac86f6 100644
> > --- a/drivers/input/mouse/psmouse-base.c
> > +++ b/drivers/input/mouse/psmouse-base.c
> > @@ -120,6 +120,8 @@ struct psmouse *psmouse_from_serio(struct serio *serio)
> >  {
> >  	struct ps2dev *ps2dev = serio_get_drvdata(serio);
> >  
> > +	if (!ps2dev)
> > +		return NULL;
> 
> Thank you for resending and reminding me of this issue, however
> psmouse_from_serio() should not return NULL as most callers do not
> expect it. Synaptics driver needs to make sure the port is bound to
> an instance of psmouse and do it in interrupt-safe way. I will make a
> patch.

Fair enough.  My patch was intended to be a band-aid fix, so it's fine
to skip it.

Let me know if the proper fix patch is available.


thanks,

Takashi

