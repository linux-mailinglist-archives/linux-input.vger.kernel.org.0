Return-Path: <linux-input+bounces-8482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E344C9EB727
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 17:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58175165428
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 16:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FBF237A56;
	Tue, 10 Dec 2024 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RRdDX4sV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFGrJV/q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RRdDX4sV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFGrJV/q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AF2343CF;
	Tue, 10 Dec 2024 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849538; cv=none; b=BAl76jn3sCwhnok8qDQ5+cz6/r+zq7KVKdveN4q/uaU9NgZr3G7z3McPnusx4kkejl4CHaKS1aMLuDQsZ5dgbyvwlmQJ0bwClnMbh4C9u/xUs5nOdRw8LhvO2h4C7PGNqNoi8Rr2XvDql5sKILRZcnq++fr5v7wZJmlHJ5/rRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849538; c=relaxed/simple;
	bh=F768FKvg7FF4b66UZ/Q7WEOc2p7Zd5GIQR2lUzGMMtE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9+TjuwpqV0RUha+2Jv4z6gBwqVMA6ynVDn76ARPNZ8ZA3/CquAInHAY2fPeG55jLsTIjI8yOejlD75LzbGqrlGKRGzKcOm0IgzcyKDT9G68i+yS+TTeAgHdnngH6Qt8RrDKTbffWYNcWWQ/AhDxrgsuJ5bW1kHJbJWh4l9gXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RRdDX4sV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFGrJV/q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RRdDX4sV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFGrJV/q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 786C31F396;
	Tue, 10 Dec 2024 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733849534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aIP4i4jvUV/G+qzhtRhmfq3gIeQW3kA9mI6aymWOb0=;
	b=RRdDX4sVHqwXSpZmO5qyaLk+OT0prHhbpm2RuVO3tADPrjjC51flgdy0bBMhilMgSqfKc4
	Dv+yE6TghAluhsMrjkHgGNWID+PoJ/WHqwfFkxouFBh0COAXQtRzDSLaPKulw82QS7hBhP
	+JNegq3x34VwLUziHLi3yWibLzKHsDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733849534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aIP4i4jvUV/G+qzhtRhmfq3gIeQW3kA9mI6aymWOb0=;
	b=TFGrJV/qKUuxfk4pwQ3vf4hKGth7ZcX/alooGyybcmiPTp3F4ONZLxZLopwxTQX7o9od+3
	MfCkzXC7nWsDVODA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733849534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aIP4i4jvUV/G+qzhtRhmfq3gIeQW3kA9mI6aymWOb0=;
	b=RRdDX4sVHqwXSpZmO5qyaLk+OT0prHhbpm2RuVO3tADPrjjC51flgdy0bBMhilMgSqfKc4
	Dv+yE6TghAluhsMrjkHgGNWID+PoJ/WHqwfFkxouFBh0COAXQtRzDSLaPKulw82QS7hBhP
	+JNegq3x34VwLUziHLi3yWibLzKHsDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733849534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aIP4i4jvUV/G+qzhtRhmfq3gIeQW3kA9mI6aymWOb0=;
	b=TFGrJV/qKUuxfk4pwQ3vf4hKGth7ZcX/alooGyybcmiPTp3F4ONZLxZLopwxTQX7o9od+3
	MfCkzXC7nWsDVODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D559C138D2;
	Tue, 10 Dec 2024 16:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lzzyMr1xWGcDRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Dec 2024 16:52:13 +0000
Date: Tue, 10 Dec 2024 17:52:13 +0100
Message-ID: <87wmg732gy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>,
	<pierre-louis.bossart@linux.intel.com>,
	<Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>,
	<robh@kernel.org>,
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
In-Reply-To: <1b77ad01-9621-4d2e-84c0-077032fbc5ef@intel.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-29-quic_wcheng@quicinc.com>
	<1a361446-7a18-4f49-9eeb-d60d1adaa088@intel.com>
	<28023a83-04a5-4c62-85a9-ca41be0ba9e1@quicinc.com>
	<1644aa6b-a4e0-4dbd-a361-276cb95eb534@intel.com>
	<3e246be8-22a9-4473-8c78-39788ae95650@quicinc.com>
	<1b77ad01-9621-4d2e-84c0-077032fbc5ef@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,vger.kernel.org,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.com,synopsys.com,suse.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Tue, 10 Dec 2024 16:24:30 +0100,
Cezary Rojewski wrote:
> 
> On 2024-12-06 9:43 PM, Wesley Cheng wrote:
> > 
> > On 12/6/2024 1:09 AM, Cezary Rojewski wrote:
> 
> ...
> 
> >>>>> +#include <linux/usb.h>
> >>>>> +
> >>>>> +#include <sound/core.h>
> >>>>> +#include <sound/control.h>
> >>>>> +#include <sound/soc-usb.h>
> >>>> 
> >>>> ALSA-components should not be dependent on ASoC ones. It should be done the other way around: ALSA <- ASoC.
> >>>> 
> >>> 
> >>> At least for this kcontrol, we need to know the status of the ASoC state, so that we can communicate the proper path to userspace.  If the ASoC path is not probed or ready, then this module isn't blocked.  It will just communicate that there isn't a valid offload path.
> >> 
> >> I'm not asking _why_ you need soc-usb.h header, your reasoning is probably perfectly fine. The code hierarchy is not though. If a sound module is dependent on soc-xxx.h i.e. ASoC symbols, it shall be part of sound/soc/ space.
> > 
> > 
> > That would basically require a significant change in the current design.  Was that requirement documented somewhere, where ALSA components should not be dependent on ASoC?  What was the reasoning for making it one direction, but not the other?
> 
> Well, some may call this a common sense. ASoC is founded on
> ALSA. There are no ALSA-core components which I'm aware of which have
> a dependency on ASoC components. You may not get compilation problems
> now, but such approach does not scale and will hit circular dependency
> problem sooner or later.

In this particular case, I guess we don't have to be too strict.
As long as it's a dynamic add-on, there is less dependency problem.
OTOH, if it were linked directly, that can cause an issue, though.

But, which code is put at which place can be reconsidered, yes.  The
right placing may help better understanding of the code, too.


thanks,

Takashi

