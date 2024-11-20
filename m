Return-Path: <linux-input+bounces-8167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7709D3A7E
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 13:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047D1282DB8
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2331A3BC8;
	Wed, 20 Nov 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYOVtqlp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLT+iV2t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYOVtqlp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLT+iV2t"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC119F13B;
	Wed, 20 Nov 2024 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104954; cv=none; b=djythtP0BOWCEXRxXuSqWngvA3t1PXfMUQ68KzJs7ggLfMcSMn9P0xD/CAKfKmHwKmXSKXeeaPyB10bdIyBiO903ceMoVRYf2i9gitioCmvPup0K2w30fzBb88VErPlms5XjqpkCGcUT92usKpuZHqMCKNqqchdMp8pWPmCzw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104954; c=relaxed/simple;
	bh=rUWRVgIpsN+qqDYsytfpIupLDOZ51LODujjC8CHoTZc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Av+8nAyDkjX00l7+mtT6TgjP+wvRGXmYGWuAjB4GBHpR+rvY5eQjej+M3LezOeW7TZ35n/yADj/DSRX/FBB/7TiXDFw8O1tg6VZIharb0jnM7MYxJnRVD5C6K4F/MUoz+6jlDwn6huG1lc33i+33DTX5uimBb+2kLRms0irV0K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYOVtqlp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLT+iV2t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYOVtqlp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLT+iV2t; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FC851F76E;
	Wed, 20 Nov 2024 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732104951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TtZOhsAKBtybCxBgSSK+eJqeEPxyGmEPvC3eHY3IE=;
	b=gYOVtqlpmEBIa9ncQj3AZs8dQKvAiCR4NouHLPoIyceGzfa+l+G11v3RhG8V8olfA/nCEB
	N70hRlx4JS9jC3mtKN14j0gA3K0y1/ig5FpTyZ9zv2wzMw7LuHSPkPOhU2MLV6UOPzt6TP
	7UjF5/oMb/2ncozW5D8hM8ZyZ7jx1a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732104951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TtZOhsAKBtybCxBgSSK+eJqeEPxyGmEPvC3eHY3IE=;
	b=PLT+iV2tn7kwhTcYgDYYJeMI4PbScJS0Dan4ViISWeQxnIv820ibMmGlDIwOFlRNYyQjj0
	Gv0bf7Xp5i90X3Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732104951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TtZOhsAKBtybCxBgSSK+eJqeEPxyGmEPvC3eHY3IE=;
	b=gYOVtqlpmEBIa9ncQj3AZs8dQKvAiCR4NouHLPoIyceGzfa+l+G11v3RhG8V8olfA/nCEB
	N70hRlx4JS9jC3mtKN14j0gA3K0y1/ig5FpTyZ9zv2wzMw7LuHSPkPOhU2MLV6UOPzt6TP
	7UjF5/oMb/2ncozW5D8hM8ZyZ7jx1a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732104951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TtZOhsAKBtybCxBgSSK+eJqeEPxyGmEPvC3eHY3IE=;
	b=PLT+iV2tn7kwhTcYgDYYJeMI4PbScJS0Dan4ViISWeQxnIv820ibMmGlDIwOFlRNYyQjj0
	Gv0bf7Xp5i90X3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 072FE137CF;
	Wed, 20 Nov 2024 12:15:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W9g0AffSPWfyCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 12:15:51 +0000
Date: Wed, 20 Nov 2024 13:15:50 +0100
Message-ID: <87a5du3xu1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
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
	<gregkh@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v30 26/30] ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
In-Reply-To: <20241106193413.1730413-27-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-27-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.com,synopsys.com,suse.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Wed, 06 Nov 2024 20:34:09 +0100,
Wesley Cheng wrote:
> +config SND_USB_AUDIO_QMI
> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SEC_INTR && SND_SOC_USB
> +	select SND_PCM

This select is superfluous as it already depends on
CONFIG_SND_USB_AUDIO that does select it.

> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
> new file mode 100644
> index 000000000000..a81c9b28d484
> --- /dev/null
> +++ b/sound/usb/qcom/Makefile
> @@ -0,0 +1,2 @@
> +snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o

Use snd-usb-audio-qmi-y instead of *-objs.


thanks,

Takashi

