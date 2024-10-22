Return-Path: <linux-input+bounces-7618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C34D9AB02D
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 15:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ECF8283CBD
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E4319F47E;
	Tue, 22 Oct 2024 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zYP90jaF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vIs0nCwm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B5TBZtQQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ERVik9h3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5319F133;
	Tue, 22 Oct 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729605364; cv=none; b=scyLnSoFSHExt8s0rSwuQmJvgPV3me57zSMNMtrstHkwtUhqg/GEn2DI4RxhUcGHAfkKhIO3Rv1/7BbceIkgTkD94k0FI7xZ51pooRTB2oaFll/R+fT5V1jYd3Z4HbScZdWiHn5VfJWcsOMJ1dSb2FI4o7OcJ06iKpJTFrlsjsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729605364; c=relaxed/simple;
	bh=Y7HT68PXYjz7d0Br/DnftiWOw45gz2zuwSv4S657zF4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGe7TvekAaJJoPFjpVTUraJCVi25y3BU24Atn4v25UgbAMS2UHSBbaLn/Q7d6k7qstmNl8RIjTzGHjsDCRtZrj+iAyilironWuYpi8SWEoGAFT0yo+ulKOb8UOXaGKhixXiiCXT2zcYD8ELJRvKsLQuS+7bZMr8NcPcYBXzeIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zYP90jaF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vIs0nCwm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B5TBZtQQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ERVik9h3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6F6D1FD13;
	Tue, 22 Oct 2024 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729605359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=zYP90jaFV5Pb19n9JW5vzlWwFSGAe0FYGkbu+Cfa+verVBwzWQkpkwgHO33ZFE1a1dvdZK
	0tuttYC1/ND40gdt/oVuioznRPistLudIU9xk6Zdof6abOgPA7P/swYId5Xclt2KqFkUPn
	faS1AQNksTyS2I8MJkUgpI7CfoJCs9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729605359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=vIs0nCwm9UqtOTXXFO9pD/BP3RbeOj6NRCQ/HfioJ6yWSWynK/EOKscWg2EUYRGgcMo+x4
	vQLfd+I0xAxQduAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B5TBZtQQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ERVik9h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729605358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=B5TBZtQQGPrR/TbPsDqk7IKz5X7Tmi0z8yWulsHmNXfN58NXJ7pLzmeTOndtyhgQYMDGux
	Jhn5TKi5cbmYtWR3p10EYoWsI7n5dizutXWa+Q0ru1VZjUVhTK/eHUtBqUewhTzBQ8rmi6
	WUSrnL82ebJ0sAg8lV98eb4e0td5tnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729605358;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=ERVik9h3/yqOOJhof89a2VZZjwOFO1icKKHLZh4yt4bADxjSZ5iuEx8HZ24zLD+hyEGHWK
	EX0IGujbRuv0oXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98B1B13AC9;
	Tue, 22 Oct 2024 13:55:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M/jDJO6uF2epZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Oct 2024 13:55:58 +0000
Date: Tue, 22 Oct 2024 15:56:44 +0200
Message-ID: <87wmi02qcj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	lgirdwood@gmail.com,
	tiwai@suse.com,
	krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com,
	broonie@kernel.org,
	bgoswami@quicinc.com,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD for secondary interrupters
In-Reply-To: <2024101824-hammock-elastic-8d38@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
	<20241015212915.1206789-2-quic_wcheng@quicinc.com>
	<2024101747-defog-squiggly-ef54@gregkh>
	<5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
	<2024101824-hammock-elastic-8d38@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D6F6D1FD13
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,suse.com,linux.intel.com,synopsys.com,quicinc.com,vger.kernel.org,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Fri, 18 Oct 2024 07:52:35 +0200,
Greg KH wrote:
> 
> On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> > Hi Greg,
> > 
> > On 10/16/2024 11:40 PM, Greg KH wrote:
> > > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> > >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > >>
> > >> Allow creators of xHCI secondary interrupters to specify the interrupt
> > >> moderation interval value in nanoseconds when creating the interrupter.
> > >>
> > >> If not sure what value to use then use the xhci driver default
> > >> xhci->imod_interval
> > >>
> > >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> ---
> > >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> > >>  drivers/usb/host/xhci.c     | 4 ++--
> > >>  drivers/usb/host/xhci.h     | 5 ++++-
> > >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > > This is already in 6.12-rc1, which makes me confused as to what tree you
> > > made this series against.
> > 
> > Sorry, I didn't fetch the latest changes from usb-next.
> 
> It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
> based this on :(
> 
> > In this case, should I rebase and resbumit?
> 
> As the series can't be applied as-is, probably.  But I think you might
> want to collect some acks from the sound people and xhci developers, as
> I can't do anything with this until they look at the changes.

Honestly speaking, I couldn't follow fully the discussions about the
fundamental design -- IIRC, Pierre and others had concerns to the way
to manage the offload device via kcontrols.  Did we get consensus?

I believe that's the biggest obstacle in the audio side, i.e. what's
visible to users.  The kernel internals can be corrected at any time
later.


thanks,

Takashi

