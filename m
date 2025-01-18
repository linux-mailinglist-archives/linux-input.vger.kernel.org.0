Return-Path: <linux-input+bounces-9366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C51A15C04
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 09:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B64188939C
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01511547E1;
	Sat, 18 Jan 2025 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dvjTja3S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4P0Q7UjL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a2duApX8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tV9rfoSY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14977143759;
	Sat, 18 Jan 2025 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737189994; cv=none; b=YFc+aHy50ynTytSQ6JnTsC2WykkH84vYwF9NCkMb8Eotq8jm/ulKZjujmJWzYEuJPWdA8i3xyp7oIip6IyRhf5dCrM3yUZmJ2bVjGFdd470pro9hcBcwh92YZ/jstlOKSrNCJJRTIymb0WMsU6xDvfE5ug1qPbxwGWmrdJ2zuPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737189994; c=relaxed/simple;
	bh=+ajo96Qj1YQzgLVslUAX5EaG2o+A+0NH3nwIbGE6+Mk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTpe2IwhYrrR5uaXU2xjy3enPmdN8aLv/XZeJsieKd/SSXWR+4zz/tISeMCS9DQFQa80Z8yvKKA9+M1M3ooptQHyY6SthoRsd5Hq8eDwfr2mwocFJU8JZUc16kiszfaBaNNTLmRswB0K/xWiC+CGO2G2LVSgg6iCfefz79vxW5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dvjTja3S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4P0Q7UjL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a2duApX8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tV9rfoSY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00B8E1F365;
	Sat, 18 Jan 2025 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737189991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDXZ3juKC7xcdsUNcxALzGgSZX54si0kXXPn41/coJQ=;
	b=dvjTja3SzrgrETa63QEuP9rKHO4bWma6wCL9P6MH215kHij6/IFiE+dng+YBJJ2AHnQ4Wq
	cmTW22CBsiz8ehfdLshRuHk/76WRn8YpGQ0TRCb3PQBcomufxdLV9w2UZkkWe1GEi+c37B
	RCtC3hRVvpN9F2H/RJgpI0zU/QyD6xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737189991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDXZ3juKC7xcdsUNcxALzGgSZX54si0kXXPn41/coJQ=;
	b=4P0Q7UjL3UY8VBEdD0aAQmhiFJhq84ezBs58JFePYeEwVKmZ4jai6XgD6kYm7ztayhRQju
	TtNcQGTLu1x2h+BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a2duApX8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tV9rfoSY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737189990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDXZ3juKC7xcdsUNcxALzGgSZX54si0kXXPn41/coJQ=;
	b=a2duApX83NLwD9Rm2FcyiWPKX2HDZNabjLsQM1Nt+qjOuFaN0z/7+lmyggx2mpdyU3iBox
	9hw5SDoeWSXjbw7JzKtB42l2dQUUOxl2MqElJ0nf/X/edV/odn9apMDVXLasxg9ttOUgS1
	Pxp2nVdqZbALqYegz5Br85EF4lPIB54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737189990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDXZ3juKC7xcdsUNcxALzGgSZX54si0kXXPn41/coJQ=;
	b=tV9rfoSYUycdZ3KM4gz8I65YcRJ+PHZPufDZPAFVe1Crm+cNSJdF6LG4eV7ZmWReg9iQvO
	7fKkNM3zHE8fckAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9E921373B;
	Sat, 18 Jan 2025 08:46:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIqYL2Vqi2dNfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Jan 2025 08:46:29 +0000
Date: Sat, 18 Jan 2025 09:46:29 +0100
Message-ID: <87o704qzkq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - fix crash when enabling pass-through port
In-Reply-To: <Z4qSHORvPn7EU2j1@google.com>
References: <Z4qSHORvPn7EU2j1@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 00B8E1F365
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,suse.com:url]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 17 Jan 2025 18:23:40 +0100,
Dmitry Torokhov wrote:
> 
> When enabling a pass-through port an interrupt might come before psmouse
> driver binds to the pass-through port. However synaptics sub-driver
> tries to access psmouse instance presumably associated with the
> pass-through port to figure out if only 1 byte of response or entire
> protocol packet needs to be forwarded to the pass-through port and may
> crash if psmouse instance has not been attached to the port yet.
> 
> Fix the crash by introducing open() and close() methods for the port and
> check if the port is open before trying to access psmouse instance.
> Because psmouse calls serio_open() only after attaching psmouse instance
> to serio port instance this prevents the potential crash.
> 
> Reported-by: Takashi Iwai <tiwai@suse.de>
> Fixes: 100e16959c3c ("Input: libps2 - attach ps2dev instances as serio port's drvdata")
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


Thanks!

Takashi

