Return-Path: <linux-input+bounces-9410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E11A1784C
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 08:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDEB37A5EE8
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 07:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F02D1714B4;
	Tue, 21 Jan 2025 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mn0sJm65";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOGwxDnv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mn0sJm65";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOGwxDnv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E12260C;
	Tue, 21 Jan 2025 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442820; cv=none; b=TC5FHD/fSBDImiXaKjueoL/pRCgnQheIgRNadttAXZH9fQW6JuZP/p5YYKtdvmoeknAwmpwnNj9AtV7s6WUS3pd3t8+iyXOjotdf0YV4hUnbmmBrrVUCBq+yMU4YkHPk0j5hk+58G7Ri/nIleszT6s1JO4fn4wIFcML6NZwJioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442820; c=relaxed/simple;
	bh=n8jcJZ5MvKZZ3pKYTgAxweAtri0P1KHKNeihD5Rv3es=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFn+FIXkTD9L+y8pO5IPEUbK7z2VwEKYXGp464ZhgGVuzx/JDyBQ5sNjMsHkC2/ezakYXzyFJnxN5NW/NbCEQXnfvPHai9/Gv/fAcQlrOxyC7CtrhbQOq4mRJka5UUX8mJCgSgT0rKeOlyFF9gDt+6Xa1tlX7TQrOg5734bRQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mn0sJm65; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOGwxDnv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mn0sJm65; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOGwxDnv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F80D211F8;
	Tue, 21 Jan 2025 07:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737442816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGyNsFzaQ7JYZu5XntlLDqLsY7QhluJYO6s0N/WDJDs=;
	b=Mn0sJm65Yn/ldgVfwr1XFTWDBWtJm23ZzIHBt20CHFZ4wgoNy2VTzMtmWv0DKwkR5ivkQD
	aaycRkL4C1YA0VrNfv/H4pDXAjDskOh7o8rcxSCvlM2pVTUX3x9dxeC/agMZllotpvM5b7
	vy3C/3ze7xJyVFVMz0/WpATGMY/S9YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737442816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGyNsFzaQ7JYZu5XntlLDqLsY7QhluJYO6s0N/WDJDs=;
	b=vOGwxDnvEVFvMUbN0X8U4OvoussBg5pMpiFt1wm8h+LRXZggH8WcaudJNqZnHm1nnLqURh
	C1Icq+428769UmAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Mn0sJm65;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vOGwxDnv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737442816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGyNsFzaQ7JYZu5XntlLDqLsY7QhluJYO6s0N/WDJDs=;
	b=Mn0sJm65Yn/ldgVfwr1XFTWDBWtJm23ZzIHBt20CHFZ4wgoNy2VTzMtmWv0DKwkR5ivkQD
	aaycRkL4C1YA0VrNfv/H4pDXAjDskOh7o8rcxSCvlM2pVTUX3x9dxeC/agMZllotpvM5b7
	vy3C/3ze7xJyVFVMz0/WpATGMY/S9YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737442816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGyNsFzaQ7JYZu5XntlLDqLsY7QhluJYO6s0N/WDJDs=;
	b=vOGwxDnvEVFvMUbN0X8U4OvoussBg5pMpiFt1wm8h+LRXZggH8WcaudJNqZnHm1nnLqURh
	C1Icq+428769UmAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67FBA1387C;
	Tue, 21 Jan 2025 07:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IG0bGABGj2c4OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jan 2025 07:00:16 +0000
Date: Tue, 21 Jan 2025 08:00:15 +0100
Message-ID: <87o700aby8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - fix crash when enabling pass-through port
In-Reply-To: <Z48vvnjs3qtoPqqY@google.com>
References: <Z4qSHORvPn7EU2j1@google.com>
	<87o704qzkq.wl-tiwai@suse.de>
	<87ldv8qxdz.wl-tiwai@suse.de>
	<Z48vvnjs3qtoPqqY@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8F80D211F8
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 21 Jan 2025 06:25:18 +0100,
Dmitry Torokhov wrote:
> 
> On Sat, Jan 18, 2025 at 10:33:44AM +0100, Takashi Iwai wrote:
> > On Sat, 18 Jan 2025 09:46:29 +0100,
> > Takashi Iwai wrote:
> > > 
> > > On Fri, 17 Jan 2025 18:23:40 +0100,
> > > Dmitry Torokhov wrote:
> > > > 
> > > > When enabling a pass-through port an interrupt might come before psmouse
> > > > driver binds to the pass-through port. However synaptics sub-driver
> > > > tries to access psmouse instance presumably associated with the
> > > > pass-through port to figure out if only 1 byte of response or entire
> > > > protocol packet needs to be forwarded to the pass-through port and may
> > > > crash if psmouse instance has not been attached to the port yet.
> > > > 
> > > > Fix the crash by introducing open() and close() methods for the port and
> > > > check if the port is open before trying to access psmouse instance.
> > > > Because psmouse calls serio_open() only after attaching psmouse instance
> > > > to serio port instance this prevents the potential crash.
> > > > 
> > > > Reported-by: Takashi Iwai <tiwai@suse.de>
> > > > Fixes: 100e16959c3c ("Input: libps2 - attach ps2dev instances as serio port's drvdata")
> > > > Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > 
> > > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> Thank you for the review.
> 
> > 
> > BTW, backporting this patch to stable kernels wouldn't be trivial; it
> > needs the recent changes for guard(), too.
> 
> It is as simple as changing it to pairs of
> serio_pause_rx()/serio_continue_rx() so pretty trivial.

Yes, but for applying it to stable kernels, you'd need either modify
the patch itself or pick up the preliminary patches.  It won't be
obvious for stable maintainers unless you explicitly order so.


thanks,

Takashi

