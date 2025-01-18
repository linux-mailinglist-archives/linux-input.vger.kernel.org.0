Return-Path: <linux-input+bounces-9365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF761A15BE6
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 09:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC8DA166769
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 08:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF93156C7B;
	Sat, 18 Jan 2025 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ctKQz46a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoUY4/HT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ctKQz46a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoUY4/HT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F26647;
	Sat, 18 Jan 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737188009; cv=none; b=A30QZZWxxaXfDlO9AaG8BCzSLrz/i3hqTyiPC/W024mDeaz1vtoQLtTx3vHhHMm6upWxhNb5sDs2VsyKvFY4lkj26jc6l+/TeAhN6HkJUydH1mAM/uw4cXH065e/xVWoJX/oCV03YAY3xk3f1IhYwssAsaPkzHjpOk9xKlguiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737188009; c=relaxed/simple;
	bh=lcbtuNSIEY2U0fJIiJVsyrOv3+zymdPGNUYjle2rn9o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXjFraaMf1kS53Xxm208zS92Q/05/KdbI9byTcO3aKt8xpoXRx5gKukmOL/VE9vsrxT13FUZxzyE4CKQuqZjtKvYObcz62uIqmUglg/eFusIBIxFxoTMhgNN0Sf5f0Ct35DMfAFYOiqtSq2uiKOz7AhJK4zYbiT/cmLAuJxaejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ctKQz46a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoUY4/HT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ctKQz46a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoUY4/HT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F48C1F37C;
	Sat, 18 Jan 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737188005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kdd1E/HA3rmLLCH/IF9M+UMVNIUFtrXsr5M29EdbJso=;
	b=ctKQz46a0AE4vkBcEgmk6PZtBNHxKmP9sRWmyk6n4AQeS9JLw3uPFjuS+zd7HuPZMjrX7X
	sdHyV9sr5uAQHE5Bod1vS5GqRNSOHmD1h9Fxrey4q6pwfNf3aooJ75gbgPaZ6UcoivF1Uc
	CfpoQtQdB+py9ocDjAbqHhRrxbAUik0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737188005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kdd1E/HA3rmLLCH/IF9M+UMVNIUFtrXsr5M29EdbJso=;
	b=HoUY4/HTQdzgkg7t3CtedYtuZPdEp2ySn2ix2YF0pdkKL92oMbKStRlX8oAFmWh/33Vg8i
	lwK3TInIHagpAxCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737188005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kdd1E/HA3rmLLCH/IF9M+UMVNIUFtrXsr5M29EdbJso=;
	b=ctKQz46a0AE4vkBcEgmk6PZtBNHxKmP9sRWmyk6n4AQeS9JLw3uPFjuS+zd7HuPZMjrX7X
	sdHyV9sr5uAQHE5Bod1vS5GqRNSOHmD1h9Fxrey4q6pwfNf3aooJ75gbgPaZ6UcoivF1Uc
	CfpoQtQdB+py9ocDjAbqHhRrxbAUik0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737188005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kdd1E/HA3rmLLCH/IF9M+UMVNIUFtrXsr5M29EdbJso=;
	b=HoUY4/HTQdzgkg7t3CtedYtuZPdEp2ySn2ix2YF0pdkKL92oMbKStRlX8oAFmWh/33Vg8i
	lwK3TInIHagpAxCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E8B41373B;
	Sat, 18 Jan 2025 08:13:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PqGGEaVii2cHGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Jan 2025 08:13:25 +0000
Date: Sat, 18 Jan 2025 09:13:24 +0100
Message-ID: <87tt9wr13v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Introduce Poly/Plantronics mute event support
In-Reply-To: <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
	<20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sat, 18 Jan 2025 01:58:37 +0100,
Terry Junge wrote:
> 
> Hi Jiri and Takashi,
> 
> If at all possible, it would be preferred if this patch set could be
> sent upstream and to stable together.

Note that, for picking up to stable, it's never guaranteed to take two
at the same time unless you explicitly request to the stable
maintainers.

In anyway, I don't mind to put the USB-audio change via HID tree.
In that case, feel free to take my ack:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


Or, if the HID patch can be taken via sound git tree, just let me
know.


thanks,

Takashi

> This patch set was tested by Wade and myself with multiple
> Poly/Plantronics product family headsets.
> 
> Thanks,
> Terry
> 
> Link v1: https://lore.kernel.org/linux-input/87zfl333uy.wl-tiwai@suse.de/T/#t
> Link v2: https://lore.kernel.org/linux-input/4a25e5d0-5e09-4246-8d70-8083d3189d53@cosmicgizmosystems.com/T/#t
> 
> Terry Junge (2):
>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
>     names
> 
>  drivers/hid/hid-plantronics.c | 144 ++++++++++++++++------------------
>  sound/usb/mixer_quirks.c      |  51 ++++++++++++
>  2 files changed, 118 insertions(+), 77 deletions(-)
> 
> 
> base-commit: 09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
> -- 
> 2.43.0
> 

