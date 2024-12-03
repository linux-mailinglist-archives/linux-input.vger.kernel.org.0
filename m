Return-Path: <linux-input+bounces-8361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D439E1447
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 08:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 295392859FE
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 07:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0E4189B91;
	Tue,  3 Dec 2024 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MZogqkDf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BLwiM9td";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MZogqkDf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BLwiM9td"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F5184523;
	Tue,  3 Dec 2024 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211139; cv=none; b=dXVZFiP6inaO6yKOTPeLsN+5r+LcCDQNajGkbwhVzDxoBL4U5F7d1fb65jTKldu4fG0JGpkQVckYpYOZswqQir5NE39Y07gGfZqwyLRyQt1x2lXfFh/kXaa7Og8u3IcBoAKI2ROHAlgSUxGx4ZaFWyYaic/bTXPFx7trmy71BFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211139; c=relaxed/simple;
	bh=udYLqrYjuh2kacEBtUeniMwzqFUcQY3ID3ufmc94kEE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZbX34NxSLYC5UlXfcTjaPgiu4YsfWkEOl9nOM+g+JMJdSUBSSNcjis7bPTa7k3RVsV9KvPmE0bXvK6/zajmMJmyVl3IJ0xHd6MLtRVaYbq6/6mAw75RsqpWDrjMY5ZMPwTtDN+jYPjH2/XArKuc4QrxYkXYCEhTK98plW5/u4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MZogqkDf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BLwiM9td; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MZogqkDf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BLwiM9td; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 757762117F;
	Tue,  3 Dec 2024 07:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733211135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3F2qk4aItgPbYyM0+CFq3XI15x8JbIdS9V/LWbUrSY=;
	b=MZogqkDfVkCTmfCmSeZMM0QHOC3dR9E3dXoJqCFEZUeqQ45Kno3ExgFxDiR/H8F3NP65CG
	gNvafl4GRmS3kxq5eQ/BwtoHqufUb2etjeNjmCwiJmmVPY+WFylTM6UaaiAt2oyJqoB02s
	9/XLtvucgmLiGFF2vwkbnRyT8ovsWxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733211135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3F2qk4aItgPbYyM0+CFq3XI15x8JbIdS9V/LWbUrSY=;
	b=BLwiM9tdPQ7Xj/piJ2RHGV1SPjfWaqfgEQVGbdMjKQvfr4MpMjGaKWpXrhDPUMRPOBri2k
	ZMAYgLLMXn8+2BDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MZogqkDf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BLwiM9td
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733211135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3F2qk4aItgPbYyM0+CFq3XI15x8JbIdS9V/LWbUrSY=;
	b=MZogqkDfVkCTmfCmSeZMM0QHOC3dR9E3dXoJqCFEZUeqQ45Kno3ExgFxDiR/H8F3NP65CG
	gNvafl4GRmS3kxq5eQ/BwtoHqufUb2etjeNjmCwiJmmVPY+WFylTM6UaaiAt2oyJqoB02s
	9/XLtvucgmLiGFF2vwkbnRyT8ovsWxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733211135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3F2qk4aItgPbYyM0+CFq3XI15x8JbIdS9V/LWbUrSY=;
	b=BLwiM9tdPQ7Xj/piJ2RHGV1SPjfWaqfgEQVGbdMjKQvfr4MpMjGaKWpXrhDPUMRPOBri2k
	ZMAYgLLMXn8+2BDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30BCB13A15;
	Tue,  3 Dec 2024 07:32:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8g+ICv+zTmfwKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 07:32:15 +0000
Date: Tue, 03 Dec 2024 08:32:14 +0100
Message-ID: <87jzchz0g1.wl-tiwai@suse.de>
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
In-Reply-To: <dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
	<87h67vzo8z.wl-tiwai@suse.de>
	<dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 757762117F
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 02 Dec 2024 23:35:51 +0100,
Terry Junge wrote:
> 
> On 11/25/24 12:55 AM, Takashi Iwai wrote:
> > On Sun, 24 Nov 2024 21:32:39 +0100,
> > Terry Junge wrote:
> >>
> >> Hi Jiri and Takashi,
> >>
> >> I'm not sure how it works with two different maintained trees
> >> but this patch set needs to be applied and flow upstream together.
> >>
> >> If the HID patch is applied without the ALSA patch then mute sync
> >> issues will occur with multiple Poly/Plantronics product families.
> > 
> > Both patches can be applied individually, and even if only one of them
> > is applied, it won't hurt.  So I guess both subsystems can take the
> > corresponding one at any time.
> > 
> 
> Hi Takashi,
> 
> I've tested out the behavior with each patch individually applied and
> have found that, IMHO, the mute functionality and synchronization is
> worse than the current behavior with neither patch. However, with both
> patches applied the mixer UI microphone mute control and the headset
> mute button are fully synchronized.

That's odd.  How can it worsen?  As far as I understand from the patch
descriptions, the USB-audio patch corrects only the mixer volume
control names, while the HID patch changes the quirk to be generalized
(to be dropped the next key in a short period).  If only USB audio
patch is applied, it doesn't matter as the volume binding didn't
happen before the patch.  OTOH, ditto, if only HID patch is applied.
Am I missing anything here?

> There must be a way that both patches can be tied together and be
> applied simultaneously.
> 
> If it would help, and be allowed, I can submit a single patch that
> contains both changes.

Applying both from the single tree is possible, sure.  One of two
needs an ack from the subsystem maintainers.


thanks,

Takashi

> 
> Thanks,
> Terry
> 
> > 
> > thanks,
> > 
> > Takashi
> > 
> >>
> >> This patch set was tested by Wade and myself with multiple
> >> Poly/Plantronics product family headsets.
> >>
> >> Hi Wade,
> >>
> >> Please feel free to add your Signed-off-by: and/or Tested-by: tags,
> >> as you see fit.
> >>
> >> Thanks,
> >> Terry
> >>
> >> Terry Junge (2):
> >>   HID: hid-plantronics: Add mic mute mapping and generalize quirks
> >>   ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
> >>     names
> >>
> >>  drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
> >>  sound/usb/mixer_quirks.c      |  35 +++++++++
> >>  2 files changed, 100 insertions(+), 70 deletions(-)
> >>
> >>
> >> base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
> >> -- 
> >> 2.43.0
> >>
> 

