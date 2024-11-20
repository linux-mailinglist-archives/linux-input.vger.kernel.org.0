Return-Path: <linux-input+bounces-8165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB559D3A31
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 13:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B7EB2A916
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7461A725E;
	Wed, 20 Nov 2024 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NZ8VMx1X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1RIkwra";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NZ8VMx1X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1RIkwra"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77D19E98A;
	Wed, 20 Nov 2024 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103469; cv=none; b=gcR0kF6Xn+rgTpyMk94uv3lJjYbhF00JMKZI80emPVoQNnjF8elX4CZKsdZnnZxkYV6VruKRdLPh9qXcGVOGDMgCmDcvd6OLXVQwWOmi3qje0wcB2JjEX42mLo8X3M2JcjbH/VAio+uz44lK+GtwPzGUd7lJhnelxTeNIoi9UG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103469; c=relaxed/simple;
	bh=pfzD9JZysH5yH1K8T/llTAH2wZnCPrqr3Qfq5KmQ/PA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hv5MwcCrvI3P0NC8aRGx/xeMuArQKarM5PJTNw1hOCcA0RatuFTKYoU6XRjSDoCQ30txXR23BVxHD72XTBAENTGJ5kfy7CHhue6i8Ve9ymEwu+mJoNXmDCDy+zA3jlxgMwo2sWnoscNE7psutTluvahYGz5ciC4Wd4/wGef2y5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NZ8VMx1X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e1RIkwra; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NZ8VMx1X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e1RIkwra; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A33B2219E2;
	Wed, 20 Nov 2024 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732103465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkCw99QpcQVbtEHgXs/tUnm+ow4hNCf+q4EnIyOAeR4=;
	b=NZ8VMx1XYrFobKh4o/w8jpD/iH1sEv9BFen2TGTOFVD1QwBm9bE6nxZ4qwd99lD2icHWhW
	bXeBQ8Vb5a0hi8XmsbNLwLmBIff+372doL4HS/+kRpeBYChOQh0vR1nCIH41taLrTbRpCZ
	xQaYlOAk3BPVDqOVYJl6iN16Tn52qSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732103465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkCw99QpcQVbtEHgXs/tUnm+ow4hNCf+q4EnIyOAeR4=;
	b=e1RIkwraXqZsZ9lcOCc+0805j+kqDzkv4C+s5BpCEJi4/1+YOIHRmFLcRqTyPdxA89VXKH
	nw/7bJp9xdvtkODg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732103465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkCw99QpcQVbtEHgXs/tUnm+ow4hNCf+q4EnIyOAeR4=;
	b=NZ8VMx1XYrFobKh4o/w8jpD/iH1sEv9BFen2TGTOFVD1QwBm9bE6nxZ4qwd99lD2icHWhW
	bXeBQ8Vb5a0hi8XmsbNLwLmBIff+372doL4HS/+kRpeBYChOQh0vR1nCIH41taLrTbRpCZ
	xQaYlOAk3BPVDqOVYJl6iN16Tn52qSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732103465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkCw99QpcQVbtEHgXs/tUnm+ow4hNCf+q4EnIyOAeR4=;
	b=e1RIkwraXqZsZ9lcOCc+0805j+kqDzkv4C+s5BpCEJi4/1+YOIHRmFLcRqTyPdxA89VXKH
	nw/7bJp9xdvtkODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6101F137CF;
	Wed, 20 Nov 2024 11:51:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SjS/FinNPWeyfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 11:51:05 +0000
Date: Wed, 20 Nov 2024 12:51:05 +0100
Message-ID: <87cyiq3yza.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v30 07/30] ALSA: Add USB audio device jack type
In-Reply-To: <20241106193413.1730413-8-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-8-quic_wcheng@quicinc.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,intel.com:email,quicinc.com:email]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Wed, 06 Nov 2024 20:33:50 +0100,
Wesley Cheng wrote:
> 
> Add an USB jack type, in order to support notifying of a valid USB audio
> device.  Since USB audio devices can have a slew of different
> configurations that reach beyond the basic headset and headphone use cases,
> classify these devices differently.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

This one needs an ack from the input subsystem people.


thanks,

Takashi

> ---
>  include/linux/mod_devicetable.h        | 2 +-
>  include/sound/jack.h                   | 4 +++-
>  include/uapi/linux/input-event-codes.h | 3 ++-
>  sound/core/jack.c                      | 6 ++++--
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 4338b1b4ac44..82826f5a3741 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -340,7 +340,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x10
> +#define INPUT_DEVICE_ID_SW_MAX		0x11
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/sound/jack.h b/include/sound/jack.h
> index 1ed90e2109e9..bd3f62281c97 100644
> --- a/include/sound/jack.h
> +++ b/include/sound/jack.h
> @@ -22,6 +22,7 @@ struct input_dev;
>   * @SND_JACK_VIDEOOUT: Video out
>   * @SND_JACK_AVOUT: AV (Audio Video) out
>   * @SND_JACK_LINEIN:  Line in
> + * @SND_JACK_USB: USB audio device
>   * @SND_JACK_BTN_0: Button 0
>   * @SND_JACK_BTN_1: Button 1
>   * @SND_JACK_BTN_2: Button 2
> @@ -43,6 +44,7 @@ enum snd_jack_types {
>  	SND_JACK_VIDEOOUT	= 0x0010,
>  	SND_JACK_AVOUT		= SND_JACK_LINEOUT | SND_JACK_VIDEOOUT,
>  	SND_JACK_LINEIN		= 0x0020,
> +	SND_JACK_USB		= 0x0040,
>  
>  	/* Kept separate from switches to facilitate implementation */
>  	SND_JACK_BTN_0		= 0x4000,
> @@ -54,7 +56,7 @@ enum snd_jack_types {
>  };
>  
>  /* Keep in sync with definitions above */
> -#define SND_JACK_SWITCH_TYPES 6
> +#define SND_JACK_SWITCH_TYPES 7
>  
>  struct snd_jack {
>  	struct list_head kctl_list;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index a4206723f503..f44b9f41d26f 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -924,7 +924,8 @@
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
>  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> -#define SW_MAX			0x10
> +#define SW_USB_INSERT		0x11  /* set = USB audio device connected */
> +#define SW_MAX			0x11
>  #define SW_CNT			(SW_MAX+1)
>  
>  /*
> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index e4bcecdf89b7..de7c603e92b7 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -34,6 +34,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
>  	SW_JACK_PHYSICAL_INSERT,
>  	SW_VIDEOOUT_INSERT,
>  	SW_LINEIN_INSERT,
> +	SW_USB_INSERT,
>  };
>  #endif /* CONFIG_SND_JACK_INPUT_DEV */
>  
> @@ -241,8 +242,9 @@ static ssize_t jack_kctl_id_read(struct file *file,
>  static const char * const jack_events_name[] = {
>  	"HEADPHONE(0x0001)", "MICROPHONE(0x0002)", "LINEOUT(0x0004)",
>  	"MECHANICAL(0x0008)", "VIDEOOUT(0x0010)", "LINEIN(0x0020)",
> -	"", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)", "BTN_3(0x0800)",
> -	"BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)", "",
> +	"USB(0x0040)", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)",
> +	"BTN_3(0x0800)", "BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)",
> +	"",
>  };
>  
>  /* the recommended buffer size is 256 */

