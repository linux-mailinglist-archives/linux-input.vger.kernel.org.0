Return-Path: <linux-input+bounces-9225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A87A106D6
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 13:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CB3B16399A
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 12:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9A2236A83;
	Tue, 14 Jan 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cu6hIOSa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8fprte0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UtY2shuS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lXh2tkiz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1D236A78;
	Tue, 14 Jan 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858333; cv=none; b=u52hKyTg9xdOHiuEIxmKoKeIFCuwzIxF00z6lUGkCPQAr+akpnZfZvbNr1S6zIQ/UGGyq8JxHm9R+X4k9owR2Mq7vzhyOBGubOwka4HPhqLR9jDwj3p+v3wAVtt3+HU2NVe8cOPPpErBv1XX1YW6dkH3h2tUl6OOZ9dS+24S8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858333; c=relaxed/simple;
	bh=72sxGCfSrpdT7WhCmND3j6oZTC8fKPvHxLaRJTRAU3w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wo2xpJb/MGYq8RMpZIVuVosexjdPv1HbwPP/e/xm8tdwBBNgNXGWeBWWMibpo/sgfM85T7xhICjUxeL0Vbi8eQI5M5LRJmfuu3ciQ7vIKd9EUPyFAu2WwHJ4VQ4kikKR8JF/uR/jFhS/VDOlBs8N/gGv0WIqwrb9kEL4YbxRd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cu6hIOSa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d8fprte0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UtY2shuS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lXh2tkiz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F13881F385;
	Tue, 14 Jan 2025 12:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736858329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E2WCCGs71cvqPur/tUrr+6NCm3YbPY3HrkUz0mH5TtQ=;
	b=cu6hIOSaNlrtnvKIHhfK98dnUowaEEi0jr0lmzYKYgc2ovBcMx1ocO+gKWa+huoJMdz9dM
	Je/3YN6CG0Qo5BF42PG/x7AfZ4hH4T5o0UsFpu3cp3ogKEgNKLWIy9zw9XQZSb9QU3EmsZ
	oRSaDOe8lrzNf1Mz9y2kN/bpXjrLogo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736858329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E2WCCGs71cvqPur/tUrr+6NCm3YbPY3HrkUz0mH5TtQ=;
	b=d8fprte0d31ut31B7Yn698FJEt/CUaLyIEAICAl4z0pLjWgS0tDviMJoKz/KCNNcFb99jX
	yb5J4RSn9iAEgvBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736858327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E2WCCGs71cvqPur/tUrr+6NCm3YbPY3HrkUz0mH5TtQ=;
	b=UtY2shuSe5rDGSxvG0dMdSautf2hPdMgAOFgMCt2EQp9PrVvR82Oilox/0xsnoMvfPivSm
	Bwo02MkmWI1wFk8lX44FrCIWs+qazRu0PgFnoF5HVmHT0HAefjaFT4l95e+5SN0sLBe1+g
	JA5q70uj6rJfxa/WUxFeLUsXTDSDCfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736858327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E2WCCGs71cvqPur/tUrr+6NCm3YbPY3HrkUz0mH5TtQ=;
	b=lXh2tkiz+12692ZRRb5WPeMfPEXPtLW8vwZhow9wQuwWHwuJ8Fi7g1eaDWhFDL5cK0Q1vZ
	ekVj1JBLxYcCeZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D025F1384C;
	Tue, 14 Jan 2025 12:38:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +342MtdahmcaNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 12:38:47 +0000
Date: Tue, 14 Jan 2025 13:38:43 +0100
Message-ID: <87jzaxzi24.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3 2/2] ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
In-Reply-To: <20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
	<20250113235212.78127-3-linuxhid@cosmicgizmosystems.com>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 14 Jan 2025 00:51:59 +0100,
Terry Junge wrote:
> 
> +/*
> + * Some Plantronics headsets have control names that don't meet ALSA naming
> + * standards. This function fixes nonstandard source names. By the time
> + * this function is called the control name should look like one of these:
> + * "source names Playback Volume"
> + * "source names Playback Switch"
> + * "source names Capture Volume"
> + * "source names Capture Switch"
> + * If any of the trigger words are found in the name then the name will
> + * be changed to:
> + * "Headset Playback Volume"
> + * "Headset Playback Switch"
> + * "Headset Capture Volume"
> + * "Headset Capture Switch"
> + * depending on the current suffix.
> + */
> +static void snd_fix_plt_name(struct snd_usb_audio *chip,
> +			     typeof_member(struct snd_ctl_elem_id, name) * name)

I personally find this style of argument is difficult to use.
That said, IMO, it's better to stick with the argument
  struct snd_ctl_elem_id *id
and access via id->name as in your earlier patch; it's more idiomatic,
and easier to read.


thanks,

Takashi

