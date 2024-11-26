Return-Path: <linux-input+bounces-8240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 400209D9963
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 15:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004972838E3
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 14:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45661D5ADB;
	Tue, 26 Nov 2024 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F8OoYr3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9E8VXs4H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MGlOfHQ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0bFYP/Rk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF581D5AB7;
	Tue, 26 Nov 2024 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630500; cv=none; b=WHP77vLXADBZY/2LhGcAEuFt4G1omw7ZwRh7IMvYpda/tJuMQm0xnzpsV+2rVEP/U4Xcvfup/Z0zxWGc6EPDhtGx7NYDrH9aSvHJ51uhl6sHpK1WRdVacCPB5SeDogLJjw3DKsYSpG7AmFC/dMO1lFJ9zX7srW6hxMjfLNDTUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630500; c=relaxed/simple;
	bh=ZvtRiNM+JH0yEZl2YCu1V3cqQmWYtZw6utlTRkgZD9E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BV9v6VjKbqa9Ve5syxygwzKV6BcMjzlf5XdgkXry8ynhXY3H6ML4OisccX2Z08qIQrpSyzWLF4ppRSq7FSkcM76IIZO12mZDpMlp5CZbdYl4J1ScdFM9B94Hb9kOpzsM4AmwkHtLC17AHr36d05cqXCWydG15RqncMzfdgvJ8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F8OoYr3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9E8VXs4H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MGlOfHQ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0bFYP/Rk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 05D3C1F74B;
	Tue, 26 Nov 2024 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQZm9M6XxBfdUImBopgep7lJubNHrTvnu6+/i4rdEc=;
	b=F8OoYr3OWnsNa5tx+zlyQR7Lud7Vd3EYmoozh4esv0E7dp960I+rOSFS/K2U0MI3mKM97n
	LElVytyeYFQo66wIgLrmj7tRFRsDhXmFVz2pRheYwFce+V19zsv9BBnhuDjRqgZyt8jIMW
	hdAiNpkBUeypiTvY4lWKpOt/sMjmRAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQZm9M6XxBfdUImBopgep7lJubNHrTvnu6+/i4rdEc=;
	b=9E8VXs4Hl6Z/ycqZL6ea8B4aqjp+45/pD6NHRjOeVvnHD4WYMau0R8Ge+ApdOQfcPJDQMj
	2WDTy+y78hUCBMBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQZm9M6XxBfdUImBopgep7lJubNHrTvnu6+/i4rdEc=;
	b=MGlOfHQ77sUrgALK85j9yzIkPB0Pa75NKE4uAooA2JIqRq8Lk393JcVnZ/dUQo+z8nFXbz
	/gR1IIw6jfB3zFtf4jGSrAGVDPVDqoFtt5CSGM2y5aztrXWeCvWpXdcSx/m9OeGKCcH9Xs
	fE1pCOQ5gVC3OSnWhqJZCf7KxFTLPNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQZm9M6XxBfdUImBopgep7lJubNHrTvnu6+/i4rdEc=;
	b=0bFYP/RkhVhLJLwTRn9xX0jfKTlsPUVtyVTMsPYAgImmnsr+aaf6rXahREhgVXfpGZsn+t
	E6Cfp6P75HXQUWDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2C41139AA;
	Tue, 26 Nov 2024 14:14:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gbOUKt/XRWeWcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 14:14:55 +0000
Date: Tue, 26 Nov 2024 15:14:55 +0100
Message-ID: <87cyiiaxpc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>,
	<pierre-louis.bossart@linux.intel.dev>,
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
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
In-Reply-To: <8fc53dd9-0c26-410c-b1b1-3d6df7894a44@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
	<20241106193413.1730413-29-quic_wcheng@quicinc.com>
	<87bjya3xzw.wl-tiwai@suse.de>
	<02c20b06-34ef-459b-9cd1-2d2735eb1352@quicinc.com>
	<87zfls1t7x.wl-tiwai@suse.de>
	<8fc53dd9-0c26-410c-b1b1-3d6df7894a44@quicinc.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	FREEMAIL_CC(0.00)[suse.de,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,linux.intel.dev,synopsys.com,suse.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,quicinc.com:email]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Mon, 25 Nov 2024 21:33:03 +0100,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 11/21/2024 7:50 AM, Takashi Iwai wrote:
> > On Wed, 20 Nov 2024 20:13:34 +0100,
> > Wesley Cheng wrote:
> >> Hi Takashi,
> >>
> >> On 11/20/2024 4:12 AM, Takashi Iwai wrote:
> >>> On Wed, 06 Nov 2024 20:34:11 +0100,
> >>> Wesley Cheng wrote:
> >>>> In order to allow userspace/applications know about USB offloading status,
> >>>> expose a sound kcontrol that fetches information about which sound card
> >>>> and PCM index the USB device is mapped to for supporting offloading.  In
> >>>> the USB audio offloading framework, the ASoC BE DAI link is the entity
> >>>> responsible for registering to the SOC USB layer.
> >>>>
> >>>> It is expected for the USB SND offloading driver to add the kcontrol to the
> >>>> sound card associated with the USB audio device.  An example output would
> >>>> look like:
> >>>>
> >>>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> >>>> -1, -1 (range -1->255)
> >>>>
> >>>> This example signifies that there is no mapped ASoC path available for the
> >>>> USB SND device.
> >>>>
> >>>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> >>>> 0, 0 (range -1->255)
> >>>>
> >>>> This example signifies that the offload path is available over ASoC sound
> >>>> card index#0 and PCM device#0.
> >>>>
> >>>> The USB offload kcontrol will be added in addition to the existing
> >>>> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> >>>> the USB audio device specific parameters are still valid and expected to be
> >>>> used.  These parameters are not mirrored to the ASoC subsystem.
> >>>>
> >>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >>> IIRC, this representation of kcontrol was one argued issue; Pierre
> >>> expressed the concern about the complexity of the kcontrol.
> >>> I didn't follow exactly, but did we get consensus?
> >> So the part that Pierre had concerns on was that previously, the
> >>> implementation was placing offload kcontrols to the ASoC platform
> >>> card, and had some additional controls that complicated the
> >>> offload implementation about the offload status for each USB audio
> >>> device.  This was discussed here:
> >> https://lore.kernel.org/linux-usb/957b3c13-e4ba-45e3-b880-7a313e48c33f@quicinc.com/
> >>
> >> To summarize, I made the decision to move the offload status
> >> kcontrols from ASoC --> USB SND and limited it to only one kcontrol
> >> (mapped offload device).  So now, there exists a kcontrol for every
> >> USB SND device (if the offload mixer is enabled), where it tells
> >> userspace the mapped ASoC platform card and pcm device that handles
> >> USB offloading, else you'll see the "-1, -1" pair, which means
> >> offload is not possible for that USB audio device.
> > OK, the simplification is good.  But I wonder whether the current
> > representation is the best.  Why not just providing two controls per
> > PCM, one for card and one for device, instead of two integer array?
> > It would look more intuitive to me.
> >
> 
> I could separate it, but we would have to have a pair of controls
> for each available USB PCM playback stream supported by the device.
> However, before I get into making that change, I think the decision
> for either two or one FE needs to be decided. Again, I think the 2
> FE approach is much less invasive to the USB SND/ASoC core files,
> and ensures the legacy USB SND path still works through the
> non-offloaded data path.

Sure, the decision about the 2 FEs is the most significant one, and
those controls depend on that.

So my comment assumes that, and if that applied, we need to consider
which kcontrol representation is better for users.  I don't mind too
much about that, but generally speaking, simpler representation is
better in the end, even if it leads to more elements.  e.g. sysfs
allows basically only one value per file principle, too.


> >>> Apart from that: the Kconfig defition below ...
> >>>
> >>>> +config SND_USB_OFFLOAD_MIXER
> >>>> +	tristate "USB Audio Offload mixer control"
> >>>> +	help
> >>>> +	 Say Y to enable the USB audio offloading mixer controls.  This
> >>>> +	 exposes an USB offload capable kcontrol to signal to applications
> >>>> +	 about which platform sound card can support USB audio offload.
> >>>> +	 The returning values specify the mapped ASoC card and PCM device
> >>>> +	 the USB audio device is associated to.
> >>> ... and Makefile addition below ...
> >>>
> >>>> --- a/sound/usb/Makefile
> >>>> +++ b/sound/usb/Makefile
> >>>> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
> >>>>  
> >>>>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
> >>>>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> >>>> +
> >>>> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> >>> ... indicates that this code will be an individual module, although
> >>> it's solely used from snd-usb-audio-qmi driver.  This should be rather
> >>> a boolean and moved to sound/usb/qcom/, and linked to
> >>> snd-usb-audio-qmi driver itself, e.g.
> >>>
> >>> --- a/sound/usb/qcom/Makefile
> >>> +++ b/sound/usb/qcom/Makefile
> >>> @@ -1,2 +1,3 @@
> >>>  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> >>> +snd-usb-audio-qmi-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> >>>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> >>>
> >>> Then you can drop EXPORT_SYMBOL_GPL(), too.
> >> Had a discussion with Pierre on this too below.
> >>
> >> https://lore.kernel.org/linux-usb/f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com/
> >>
> >> I remember you commenting to place it in this vendor offload module,
> >> which is what I did on v24.
> > I assume that my early comment was based on your old implementations,
> > and I guess it was because the mixer part didn't belong to the qcom
> > stuff.  Now it belongs solely to qcom, the situation changed; it makes
> > no sense to make it an individual module at all.
> >
> >
> I guess Pierre's feedback was that he believed this should be vendor
> agnostic, because any vendor that could potentially support USB
> audio offload should have the same kcontrol within the USB SND
> device.  Hence the reason for keeping it within generic code.  Since
> QC is the only user of this now.  Do you prefer to make this part of
> the vendor module for now, until another user comes along and
> introduces offload support?

Yes, less module is preferred for now.  If the stuff is agnostic and
really used by multiple instances, we can factor out to an individual
module again.


thanks,

Takashi

