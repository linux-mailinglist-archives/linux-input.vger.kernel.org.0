Return-Path: <linux-input+bounces-8229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B99D7E14
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 09:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085C52823B3
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D4118D64B;
	Mon, 25 Nov 2024 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzFVxJd+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ssVYC1V1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzFVxJd+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ssVYC1V1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538829CF0;
	Mon, 25 Nov 2024 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524929; cv=none; b=fyjBMSLef8CWojbAtN9vWhdYZmhXcfKSfwF6e4EYYsA4Twh04wp4+I2gBM0oDTlCITi7u6a1W6g7SKjToJzvndoz5vHEnmEgoEc1PEPn9282/lAS/aKQ0fnxuktDKorKBj0EeqYkai5aP6rxUdzUd3ul/5pq6h19v5LIbuxezVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524929; c=relaxed/simple;
	bh=/MdDbQEXF8xYVnn5onG9FNHwjiAqSs2pCMWfp614Dpg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kitbp0u4GUhTTZP6WXahKkZN9X1yNoi/WegDaKgeLZdkWbE6GIHu1PNJAANB1aLZkOxNR8UVb/x90cCjMwAFB6+aKWl/bM9maM7+07WCiPoj4YSPcEne3p3wb4yx+aEdhzlAPNTl+g1chTJSjjp5fa60TfzLG3hAfOsVn8KZih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzFVxJd+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ssVYC1V1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzFVxJd+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ssVYC1V1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0944B21163;
	Mon, 25 Nov 2024 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732524925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMbBg9crqV6U/iKHjLl9UznNIXTJtJPaz9goql8gn98=;
	b=JzFVxJd+9tI1+KvrLhociaODHS/gyhSFFRpzpn0kwhi/JU+VJ/6WRAmiPqwqIwjlPZu7q6
	0pXB1eBkR22Hu2TCCu8Kg7jW1ENwcjz4LbpBV549KVomNovqf5vE0ZWbB1ZJ3V3sWhgzdX
	SpUpW/acAKUHZTDVzLEektTsv71w2n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732524925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMbBg9crqV6U/iKHjLl9UznNIXTJtJPaz9goql8gn98=;
	b=ssVYC1V1wRbg8yJv4KCDgIiSGwHMGekH8c1iYpp1bqLS5qcUu53pYgWkCbKiWe87j2LmUG
	vvbnPXKOcHI0P5AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732524925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMbBg9crqV6U/iKHjLl9UznNIXTJtJPaz9goql8gn98=;
	b=JzFVxJd+9tI1+KvrLhociaODHS/gyhSFFRpzpn0kwhi/JU+VJ/6WRAmiPqwqIwjlPZu7q6
	0pXB1eBkR22Hu2TCCu8Kg7jW1ENwcjz4LbpBV549KVomNovqf5vE0ZWbB1ZJ3V3sWhgzdX
	SpUpW/acAKUHZTDVzLEektTsv71w2n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732524925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XMbBg9crqV6U/iKHjLl9UznNIXTJtJPaz9goql8gn98=;
	b=ssVYC1V1wRbg8yJv4KCDgIiSGwHMGekH8c1iYpp1bqLS5qcUu53pYgWkCbKiWe87j2LmUG
	vvbnPXKOcHI0P5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2156137D4;
	Mon, 25 Nov 2024 08:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y4TkLXw7RGflVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 08:55:24 +0000
Date: Mon, 25 Nov 2024 09:55:24 +0100
Message-ID: <87h67vzo8z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce Poly/Plantronics mute event support
In-Reply-To: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sun, 24 Nov 2024 21:32:39 +0100,
Terry Junge wrote:
> 
> Hi Jiri and Takashi,
> 
> I'm not sure how it works with two different maintained trees
> but this patch set needs to be applied and flow upstream together.
> 
> If the HID patch is applied without the ALSA patch then mute sync
> issues will occur with multiple Poly/Plantronics product families.

Both patches can be applied individually, and even if only one of them
is applied, it won't hurt.  So I guess both subsystems can take the
corresponding one at any time.


thanks,

Takashi

> 
> This patch set was tested by Wade and myself with multiple
> Poly/Plantronics product family headsets.
> 
> Hi Wade,
> 
> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
> as you see fit.
> 
> Thanks,
> Terry
> 
> Terry Junge (2):
>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
>     names
> 
>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
>  sound/usb/mixer_quirks.c      |  35 +++++++++
>  2 files changed, 100 insertions(+), 70 deletions(-)
> 
> 
> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
> -- 
> 2.43.0
> 

