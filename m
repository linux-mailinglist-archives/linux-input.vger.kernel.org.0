Return-Path: <linux-input+bounces-11332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45FA744BE
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 08:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28763A7DF5
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 07:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87F4212F9F;
	Fri, 28 Mar 2025 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhNKDRh+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D135212B0E
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148099; cv=none; b=ieswJI22K2gI+E8bVNHIrNYVKws05pTS39BCbwMUvN+bbsugrpgNRt1OsFsqPU0FMGixw5CK+/fEshmBYySz7L5OunJLfJYdCDvv6E5nS78WluDU3Cy26JOX/shanINL1Sz8lWweJRt+qMVw/aLClx2eYJenjdid7wHwGgb0pRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148099; c=relaxed/simple;
	bh=1VRG5gptAlPsvHDNKA/iNCN3DmfzeGWVXmFnEWaIm8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvxYWUBoJGBxAi6P8nrcRDuryHBOo04eJWpHoezkDdwKdY4cu04V1jNl6kfGmDowX7/6bXYlJWUmn1ed1B9oc3L5do88aro05nru1tOeH0qz4u9qpBjHhHrjAo0QgJ9H7hS5aGKN1ip2Pfbg2cF/nGvDeaApb1vP17dUvkfnQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhNKDRh+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2391297a91.1
        for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743148096; x=1743752896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=GhNKDRh+8za6emkYm3zB+1svPtZsuKZfHMXkjR67qgoXb+RRsqj9TIUvo0IJOIEaMN
         9XkY9jrSXp18Lp2nJOHLyGyhYjhbS7zyFGeT/L+4wFmRXfmvUnePmFUDvory/ork7SPa
         wEfDBbb6U3kIp7/w/3FcCIDzT9/Xd8wqDMF0z7mtnQkPDavyDrp/PPLBbC9xp7OBR+rH
         Kyje2oJGFqOJiIJZRmjEdj0Zxtmr+ZrnWHb8/BkFhNOGYROz1BjcWupoKvsXmQSsgIgF
         wFA7vyvnxDqZUHbwKBikk3pa8Edr7eH9kaLj1am71FoIKmPKN5NsJlCDXL8WPip259gQ
         TNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148096; x=1743752896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=RSvC3nfkMhFRpORB48LH7tsaesY+U5HMVG1OZz9z/DqDjGqrb57yYDW6cAbxhgqIAw
         mOSelnvY/wE1RI3A3JPxL2YB/L3n6TO6DzvUmjNjWj47Y4M0HQw1hxdMszcE+BEHa92s
         pHKs274P5nWGg5psf6LZtwk5+JNZ+wF78sVCu4m5e5tx89RGdKppcZxPDdotdwSxbSXr
         mVmBaExrSUMYd3JAnehHlc2w3jhciEO9TIhzLxIEy8nUmFOcwYqU4pwrBVuPAQe7c2YJ
         V2l2jgF8Xay0A/Wa/qVTtg/4YPhqMhB5T1MkN6r+oLNHEH9GXPFZGrf/+bxrturGLgql
         0/gg==
X-Forwarded-Encrypted: i=1; AJvYcCV+smTDpAaFcYUaq/sD0qFSob0e9ZTsIeo5jtQ1wImkBJxtc05PrJcMa63dvoWWtLfCUZPEkuqNsqTOvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuigzelKCaZ7pmAhkHHcc+jnn/9rt4bTxLjOOOSsnFONXOBvy8
	iz9ms3K8i9vaUJX4ctCK9eBgbPuFbk6IykL8YDiGw7uBMNM+fRwNXUVq7rFg3X/7Qhf2ExMrw5Y
	fDQ0uRVNV8aXqPxaJ4kWj7OHna3C1c5h4OneN
X-Gm-Gg: ASbGncsTP2Svg530CrilFqSU6D1PCwi5/tyXBfsKA3Bj1gVHQgvswTPoYKlqzpKGOwA
	NlConvLcBk6KMIwgyISupmBxbBoofzZmJgca3AfxmlNAWvqY3Rrymz49072+Ff+o4+h33W8Tlbg
	J87et3zMfRcZe+q1dY6mjXpcQ7nde7kqCoBR2eRyUZxDIPlTwim9lbIFmx
X-Google-Smtp-Source: AGHT+IEBaxbL6HDDZL1bOaRlCywyrAoYUcEN4dxkxdnp4CwBP8mzj2N3dlVlnb1ED+EAow643ibowia8gXssCwa290c=
X-Received: by 2002:a17:90b:2590:b0:2ee:bc7b:9237 with SMTP id
 98e67ed59e1d1-303a85c8a48mr9336414a91.27.1743148095893; Fri, 28 Mar 2025
 00:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-13-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-13-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:48:00 +0800
X-Gm-Features: AQ5f1JrlHT0yIgJWcDgTjea01A8oianDjLUwfLWklDsfjSug36IyOZb6G4iSTYk
Message-ID: <CAGCq0LYvXsRpfhWrvWu0=hQHBVYqJ2ifnv0wEbPWtmTw7j6-CQ@mail.gmail.com>
Subject: Re: [PATCH v36 12/31] ALSA: usb-audio: Introduce USB SND platform op callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:56=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Allow for different platforms to be notified on USB SND connect/disconnec=
t
> sequences.  This allows for platform USB SND modules to properly initiali=
ze
> and populate internal structures with references to the USB SND chip
> device.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  sound/usb/card.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 10 ++++++++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 6c5b0e02e57b..4ac7f2b8309a 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descrip=
tor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +/*
> + * Register platform specific operations that will be notified on events
> + * which occur in USB SND.  The platform driver can utilize this path to
> + * enable features, such as USB audio offloading, which allows for audio=
 data
> + * to be queued by an audio DSP.
> + *
> + * Only one set of platform operations can be registered to USB SND.  Th=
e
> + * platform register operation is protected by the register_mutex.
> + */
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +       guard(mutex)(&register_mutex);
> +       if (platform_ops)
> +               return -EEXIST;
> +
> +       platform_ops =3D ops;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +/*
> + * Unregisters the current set of platform operations.  This allows for
> + * a new set to be registered if required.
> + *
> + * The platform unregister operation is protected by the register_mutex.
> + */
> +int snd_usb_unregister_platform_ops(void)
> +{
> +       guard(mutex)(&register_mutex);
> +       platform_ops =3D NULL;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>
>  /*
>   * Checks to see if requested audio profile, i.e sample rate, # of
> @@ -954,7 +990,11 @@ static int usb_audio_probe(struct usb_interface *int=
f,
>         chip->num_interfaces++;
>         usb_set_intfdata(intf, chip);
>         atomic_dec(&chip->active);
> +
> +       if (platform_ops && platform_ops->connect_cb)
> +               platform_ops->connect_cb(chip);
>         mutex_unlock(&register_mutex);
> +
>         return 0;
>
>   __error:
> @@ -991,6 +1031,9 @@ static void usb_audio_disconnect(struct usb_interfac=
e *intf)
>         card =3D chip->card;
>
>         mutex_lock(&register_mutex);
> +       if (platform_ops && platform_ops->disconnect_cb)
> +               platform_ops->disconnect_cb(chip);
> +
>         if (atomic_inc_return(&chip->shutdown) =3D=3D 1) {
>                 struct snd_usb_stream *as;
>                 struct snd_usb_endpoint *ep;
> @@ -1138,6 +1181,9 @@ static int usb_audio_suspend(struct usb_interface *=
intf, pm_message_t message)
>                 chip->system_suspend =3D chip->num_suspended_intf;
>         }
>
> +       if (platform_ops && platform_ops->suspend_cb)
> +               platform_ops->suspend_cb(intf, message);
> +
>         return 0;
>  }
>
> @@ -1178,6 +1224,9 @@ static int usb_audio_resume(struct usb_interface *i=
ntf)
>
>         snd_usb_midi_v2_resume_all(chip);
>
> +       if (platform_ops && platform_ops->resume_cb)
> +               platform_ops->resume_cb(intf);
> +
>   out:
>         if (chip->num_suspended_intf =3D=3D chip->system_suspend) {
>                 snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index cdafc9e9cecd..d8b8522e1613 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -209,7 +209,17 @@ struct snd_usb_stream {
>         struct list_head list;
>  };
>
> +struct snd_usb_platform_ops {
> +       void (*connect_cb)(struct snd_usb_audio *chip);
> +       void (*disconnect_cb)(struct snd_usb_audio *chip);
> +       void (*suspend_cb)(struct usb_interface *intf, pm_message_t messa=
ge);
> +       void (*resume_cb)(struct usb_interface *intf);
> +};
> +
>  struct snd_usb_stream *
>  snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params=
 *params,
>                                   int direction);
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> +int snd_usb_unregister_platform_ops(void);
>  #endif /* __USBAUDIO_CARD_H */
>

