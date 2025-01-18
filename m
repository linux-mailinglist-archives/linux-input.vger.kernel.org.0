Return-Path: <linux-input+bounces-9367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1BA15C30
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 10:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C321885854
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFFD165F1E;
	Sat, 18 Jan 2025 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fq4JlaQm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ecBRtb/a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eSLibxEF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zAu7P2Gt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBC3A8D2;
	Sat, 18 Jan 2025 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737192829; cv=none; b=dNyKEqa+iZVhHob+yGPTyBQoKDs5BE0tpBvl6kYzlP4pfZbhzSLY3vr18sqUHbEQByg+nW1xUg+1yGZyJar6QHSmc1AgV32HQiWiOXo7a30LnzZyWka9Jd7XQP728fvX/U1xEKMccB24oHIVl4hWiICjpL1u5bjA9TxhqE4GTVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737192829; c=relaxed/simple;
	bh=UDBNN2xRohNovt/GVNMeiHwc+NgOU3sHWrDKCIsqSQM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzhtzcTGIAEP8VHhORaRy/xXHmHRFLQ4LmMfJD6wCtSmgGB+BIr+DywWreE123hQGX5s5hqHF7ekf4/3ZKazr8/Y/7xRBTFF1NBq5RteJgW2j92Z9J2Rsz2j7JL99C5QI56BusV2L2liYs6UmP6mUiHtkSEa6O09qgXkLoH2lPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fq4JlaQm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ecBRtb/a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eSLibxEF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zAu7P2Gt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4E0E1F365;
	Sat, 18 Jan 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737192825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xin9eRnR1ZNdxEd6uiVkgB8NUvHWqr/aecXAnZjk5hE=;
	b=fq4JlaQmpDJ90fyLAfxwstosQIbU0so9v1oAIlPCCfujWBpIE9SAfj8H6vHkfjSlwi0nZq
	G/Vbi7kWZwYbplvUIhPPVU6fJgl6BQi57oBD788QfwhnBhcDl1qhcbPgPPnf/cBuleeRC/
	OFt8U+FahFhI8FbP+FgVBWta5Wzbw8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737192825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xin9eRnR1ZNdxEd6uiVkgB8NUvHWqr/aecXAnZjk5hE=;
	b=ecBRtb/a/hOIMrqp4D4YbnBiUvLqKwcuF7MtKhYNtv0osf3BNR8E5nRh2uxogI6x2XPP6i
	zA931EgK4a6SWSBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737192824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xin9eRnR1ZNdxEd6uiVkgB8NUvHWqr/aecXAnZjk5hE=;
	b=eSLibxEFEyyXdP3r/j9vc0SjvrsGRH/QHISKlbnY0HN3L+qh5xytnDkoIuCVgW0ingcZOr
	SyB2CEBR4HumyXwMvZ1QgwsV/m2h7wgjv5V4CklXVEd5vd1LoaPKwgNES4RvoVa7AkhN7K
	TG/aUQQe62F6QEZGfu7ifHjeoxp6Rvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737192824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xin9eRnR1ZNdxEd6uiVkgB8NUvHWqr/aecXAnZjk5hE=;
	b=zAu7P2GtSxw6pmLeURNuVO62q0vwBJtMcLm+blLVb6eoEGTERSQ4KVqr7VHsrsEugn6hp+
	c1hLBa5Chm9o/oCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0AD813332;
	Sat, 18 Jan 2025 09:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ngqLXh1i2d9bAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Jan 2025 09:33:44 +0000
Date: Sat, 18 Jan 2025 10:33:44 +0100
Message-ID: <87ldv8qxdz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - fix crash when enabling pass-through port
In-Reply-To: <87o704qzkq.wl-tiwai@suse.de>
References: <Z4qSHORvPn7EU2j1@google.com>
	<87o704qzkq.wl-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 18 Jan 2025 09:46:29 +0100,
Takashi Iwai wrote:
> 
> On Fri, 17 Jan 2025 18:23:40 +0100,
> Dmitry Torokhov wrote:
> > 
> > When enabling a pass-through port an interrupt might come before psmouse
> > driver binds to the pass-through port. However synaptics sub-driver
> > tries to access psmouse instance presumably associated with the
> > pass-through port to figure out if only 1 byte of response or entire
> > protocol packet needs to be forwarded to the pass-through port and may
> > crash if psmouse instance has not been attached to the port yet.
> > 
> > Fix the crash by introducing open() and close() methods for the port and
> > check if the port is open before trying to access psmouse instance.
> > Because psmouse calls serio_open() only after attaching psmouse instance
> > to serio port instance this prevents the potential crash.
> > 
> > Reported-by: Takashi Iwai <tiwai@suse.de>
> > Fixes: 100e16959c3c ("Input: libps2 - attach ps2dev instances as serio port's drvdata")
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

BTW, backporting this patch to stable kernels wouldn't be trivial; it
needs the recent changes for guard(), too.


Takashi

