Return-Path: <linux-input+bounces-11451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA8A77587
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5C33AC13D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CF01EA7EF;
	Tue,  1 Apr 2025 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nT3j/ui2"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB01EA7ED
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493476; cv=none; b=WQmnrRfphIgsOE7opVFJK0IX+d4tzqnFXevMyXp5DKqawjTqrGK1VAVgT0+tyC6PNisRhfst1PlvlJrgDHD2PFSY3Jvai3etdPk3Gh/a+DdKqEpIDfC3V2JUSCnMo+1XgnvlLIL07S1YO4mDNtiTJwFUduGjA/B15CghGc0P7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493476; c=relaxed/simple;
	bh=StWgNhbVT74w+4EPNqqZDZapxDxdpKZBSeEPruykYxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=j43RV1G1s0oNU/fmDjqCT8hFVAGd0qOorG21dLfvpj1xDoMdFEWhLauqngYIjL31ALBcCIl3x9bv+S9vkT/Mm6mzjv//7qhB6hj95/AFXEFfJjGvgq4UgeYVYBS6mSnPn97vjx4npIU3fidTn8ZGpws/zGNKNeCb6sWFdENLF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nT3j/ui2; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250401074433epoutp027ed8aff29ca1c2095317727139c23c88~yIhOH_Kh41017510175epoutp02r
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:44:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250401074433epoutp027ed8aff29ca1c2095317727139c23c88~yIhOH_Kh41017510175epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493473;
	bh=3MRdpHtIiwqvpeVCVz9txam/iHAkLYLHB9+ipflqPm0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nT3j/ui21EcOYOu8iHrktmJ6y6KQg/ktKC117MqoWsTWo2NNNtV8XNvHfP53u1+dx
	 O4H4rrk3UPzV8gQwDitIYtuYsIxUPg3rtn2JF/wI4ib6t3YISt7f7aNX+xxpB1UvhR
	 Uui31XKB2l4FeeL7FK4R5/yaBHs38cg4QDnupriQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250401074432epcas2p399089231d6e73929f4f34e67435ba024~yIhNagNzU1639316393epcas2p3f;
	Tue,  1 Apr 2025 07:44:32 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZRg4b4QVrz2SSKm; Tue,  1 Apr
	2025 07:44:31 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	95.D3.09856.F599BE76; Tue,  1 Apr 2025 16:44:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250401074430epcas2p27a19d0e3e53983d091af2258cdc7f2bc~yIhMMA1c60193401934epcas2p2b;
	Tue,  1 Apr 2025 07:44:30 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250401074430epsmtrp20fd71249e8a69512d5458a68d548d10a~yIhMK8c1z1633316333epsmtrp2H;
	Tue,  1 Apr 2025 07:44:30 +0000 (GMT)
X-AuditID: b6c32a47-c1fdf70000002680-35-67eb995f9907
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	11.33.08805.E599BE76; Tue,  1 Apr 2025 16:44:30 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074430epsmtip27caa53a02145fc3cbf40da4e67594d6f~yIhL41JY21086710867epsmtip2F;
	Tue,  1 Apr 2025 07:44:30 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:53:43 +0900
From: Jung Daehwan <dh10.jung@samsung.com>
To: Puma Hsu <pumahsu@google.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v36 12/31] ALSA: usb-audio: Introduce USB SND platform
 op callbacks
Message-ID: <20250401075343.GI98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LYvXsRpfhWrvWu0=hQHBVYqJ2ifnv0wEbPWtmTw7j6-CQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTdxTer7e9vRi73VWcP9mYtewRugAtj3JFMPhA7+I2a0aGI8u6jl5b
	Rmm7Pqagc2YgpZiBBHTQgYJlYBiIFNyglIflbZDp2HwQYCGjlceYUwZbHMhaLi78953vnO87
	5+TkYAj3LNsPS1YbKJ1apuKj65jfdwaKg6TFMwph03l/4uz4BErUtA4yiIkOEyAudA2yiM6L
	k4DIsNahxJRlDCUWfs5mEPntN9hEeVYFk7j3aIFFDNlLUKLUXYgQFytPIUSGrZBFmO15LOLx
	sptBFNcGELaWXBax7GhiE1k9PSyiuqyDTVz5uxbEbiKbLaNsssxmJK2OKQZpqzaj5MhtB0qe
	7z9ItpfWsElrbgGLbJutRMl8xwmyrvEXJtnYPgfIOdvLEk5iSrSSkskpHY9SJ2nkyWpFDH//
	u9Ld0gixUBQk2kZE8nlqWSoVw9/zliRob7LKszqf95lMZfRQEplezw/ZEa3TGA0UT6nRG2L4
	lFau0kZqg/WyVL1RrQhWU4YokVAYGuEp/ChF2bQo0I4IjrYUDDBPgl95OcAHg3g4nBltYOeA
	dRgXbwIwO7cWoYNHAJqv3mDRwQKAP07nIk8lk6a+VUkrgPcLsgEdTAB4ab6O6a1i4q/A05P1
	bC9GcQEc+6dvRe2Lb4V/uUwMrwDB+5mwz9kNvIkN+PtwaXQM9WIO/gZscN4ENH4e9hdPeEwx
	zAc/CPuvS7xwo8d/+toXXhuI/+AD75S0A3q6PbDgznWUxhvgdG8jm8Z+cO6P1lVeD4fvuxFa
	nOkZejpzdbUwaHGbVowQXAkfmLsRbzOIB8CuYSZNPwuzO5fYNM2B2VlcWhkAvx46w6LxZnht
	ZnDVkYT2ecdKWy7+FQOaZpVnwBbLmsUsa5pZPK4IHgjr7CE0vQVmXP1mlX4RVj3B1lSUAbQa
	vEBp9akKSh+qDfv/7EmaVBtY+Q/BviZQNPtnsBMwMOAEEEP4vpxD81MKLkcuS0undBqpzqii
	9E4Q4blYPuK3MUnjeTC1QSoK3yYMF4tFkaERwkj+Jo7zoUvBxRUyA5VCUVpK91THwHz8TjIw
	i6vgk93HdoZ0W81pec+JP/TvPFX1MEF60/fb1vK4N7fvnAAf1yqSmiUxIvflDyyZF14bWY8O
	X4o1HREvsIy9CS/t49w4rEhs0EXbC40lxzTvZM1slXxZ/a/pAHrF/LtwuPS7vJHx+ENm/hH1
	/t6GLtfl6l1xI6+7ih6HyZ+pL28+rtnFdMzLnORtVzp5oOUwHphi0DS32BtuJVCVUUU1C/lv
	1/ykLftUaFUNFW2HuW13UyqCBIuxmTtyel4tky+5g+MNv0Xxjr7HG08MP7F+eW9PSXOFf9yt
	z9Mw8+TsWKWz/65/hyP2wTm/c23T9zCr+3iVKH5xoH7zk44Baig9QcNn6pUykQDR6WX/Aaio
	SKKoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7bCSvG7czNfpBp2rDCymPnzCZrFm7zkm
	iycH2hkt5h85x2pxeNELRovmxevZLF7Ousdm8e1KB5PFxP1n2S0Wti1hsbj56RurxeVdc9gs
	5j6bwmyxaFkrs0XzpimsFp27+lktfv1/xmQxc62yxabdfawW//fsYLdoO3aM1WLVggPsFhu+
	r2V0EPfYOesuu8eCTaUei/e8ZPLYtKqTzePOtT1sHvNOBnrsn7uG3WNx32RWj31vl7F5TNxT
	57F+y1UWjy37PzN6fN4kF8AbxWWTkpqTWZZapG+XwJWx+v8epoJ/6hW7jrE0MM6V62Lk5JAQ
	MJF40X6CvYuRi0NIYDejxJSWRWwQCUmJpXNvsEPYwhL3W46wQhQ9YpT4uLGJCSTBIqAi0f1i
	I1gRm4CWxL0fJ5hBbBEBRYkvT9uZQBqYBU6ySJw4dJSxi5GDQ1ggUmL3cnuQGl4BbYnNhy4w
	QgztZZI4/OM9C0RCUOLkzCdgNrOAusSfeZeYQXqZBaQllv/jgAjLSzRvnQ0W5hQIlDh5KgDE
	FAU659XB+gmMQrOQzJmFZM4shDmzkMxZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/
	dxMjOC1oae1g3LPqg94hRiYOxkOMEhzMSiK8EV9fpgvxpiRWVqUW5ccXleakFh9ilOZgURLn
	/fa6N0VIID2xJDU7NbUgtQgmy8TBKdXANOWmfeSX3SfOJXRc5f40R4Jvy8f5T9NeCc9PkdnR
	4xt4mG9WouncGUsXLCrYpNNVEnJ4vr2nwyYlRyNhxT36B4+E21h9VqgJUPuj4/A6yPkQswNL
	oOLtJ9XF1rte/maw/FySw2i3/7dfc9Ic6SaeiytrtwrNeJ5ZefO1q80Fl+/qC7ttPJ5Ps9V5
	0VmiGMyzZ5fsLD2FmCfpIu6lNuw/FnxZalAad63/hF6zZZjK9axZIkrdCvva/N19r6w9HHb+
	Xo3Zpo9Nk/nXH50UovhVN/lb6dSidkb1kPMiET98arqaPqolpBR1/U95tIQpbM7fS9Lz9q3l
	sr4ct9ng7/OEdYE2txawd+yoiYveppOhxFKckWioxVxUnAgA66cdSnoDAAA=
X-CMS-MailID: 20250401074430epcas2p27a19d0e3e53983d091af2258cdc7f2bc
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_6a803_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074841epcas2p43e82d8eba2aa584a1034a7206ffb2e4d
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-13-quic_wcheng@quicinc.com>
	<CGME20250328074841epcas2p43e82d8eba2aa584a1034a7206ffb2e4d@epcas2p4.samsung.com>
	<CAGCq0LYvXsRpfhWrvWu0=hQHBVYqJ2ifnv0wEbPWtmTw7j6-CQ@mail.gmail.com>

------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_6a803_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:48:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:56 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > Allow for different platforms to be notified on USB SND connect/disconnect
> > sequences.  This allows for platform USB SND modules to properly initialize
> > and populate internal structures with references to the USB SND chip
> > device.
> >
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  sound/usb/card.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  sound/usb/card.h | 10 ++++++++++
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 6c5b0e02e57b..4ac7f2b8309a 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
> >  static DEFINE_MUTEX(register_mutex);
> >  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
> >  static struct usb_driver usb_audio_driver;
> > +static struct snd_usb_platform_ops *platform_ops;
> > +
> > +/*
> > + * Register platform specific operations that will be notified on events
> > + * which occur in USB SND.  The platform driver can utilize this path to
> > + * enable features, such as USB audio offloading, which allows for audio data
> > + * to be queued by an audio DSP.
> > + *
> > + * Only one set of platform operations can be registered to USB SND.  The
> > + * platform register operation is protected by the register_mutex.
> > + */
> > +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> > +{
> > +       guard(mutex)(&register_mutex);
> > +       if (platform_ops)
> > +               return -EEXIST;
> > +
> > +       platform_ops = ops;
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> > +
> > +/*
> > + * Unregisters the current set of platform operations.  This allows for
> > + * a new set to be registered if required.
> > + *
> > + * The platform unregister operation is protected by the register_mutex.
> > + */
> > +int snd_usb_unregister_platform_ops(void)
> > +{
> > +       guard(mutex)(&register_mutex);
> > +       platform_ops = NULL;
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
> >
> >  /*
> >   * Checks to see if requested audio profile, i.e sample rate, # of
> > @@ -954,7 +990,11 @@ static int usb_audio_probe(struct usb_interface *intf,
> >         chip->num_interfaces++;
> >         usb_set_intfdata(intf, chip);
> >         atomic_dec(&chip->active);
> > +
> > +       if (platform_ops && platform_ops->connect_cb)
> > +               platform_ops->connect_cb(chip);
> >         mutex_unlock(&register_mutex);
> > +
> >         return 0;
> >
> >   __error:
> > @@ -991,6 +1031,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
> >         card = chip->card;
> >
> >         mutex_lock(&register_mutex);
> > +       if (platform_ops && platform_ops->disconnect_cb)
> > +               platform_ops->disconnect_cb(chip);
> > +
> >         if (atomic_inc_return(&chip->shutdown) == 1) {
> >                 struct snd_usb_stream *as;
> >                 struct snd_usb_endpoint *ep;
> > @@ -1138,6 +1181,9 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
> >                 chip->system_suspend = chip->num_suspended_intf;
> >         }
> >
> > +       if (platform_ops && platform_ops->suspend_cb)
> > +               platform_ops->suspend_cb(intf, message);
> > +
> >         return 0;
> >  }
> >
> > @@ -1178,6 +1224,9 @@ static int usb_audio_resume(struct usb_interface *intf)
> >
> >         snd_usb_midi_v2_resume_all(chip);
> >
> > +       if (platform_ops && platform_ops->resume_cb)
> > +               platform_ops->resume_cb(intf);
> > +
> >   out:
> >         if (chip->num_suspended_intf == chip->system_suspend) {
> >                 snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> > diff --git a/sound/usb/card.h b/sound/usb/card.h
> > index cdafc9e9cecd..d8b8522e1613 100644
> > --- a/sound/usb/card.h
> > +++ b/sound/usb/card.h
> > @@ -209,7 +209,17 @@ struct snd_usb_stream {
> >         struct list_head list;
> >  };
> >
> > +struct snd_usb_platform_ops {
> > +       void (*connect_cb)(struct snd_usb_audio *chip);
> > +       void (*disconnect_cb)(struct snd_usb_audio *chip);
> > +       void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
> > +       void (*resume_cb)(struct usb_interface *intf);
> > +};
> > +
> >  struct snd_usb_stream *
> >  snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
> >                                   int direction);
> > +
> > +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> > +int snd_usb_unregister_platform_ops(void);
> >  #endif /* __USBAUDIO_CARD_H */
> >
> 
> 

------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_6a803_
Content-Type: text/plain; charset="utf-8"


------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_6a803_--

