Return-Path: <linux-input+bounces-11450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C92A7757D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FBDB3ABA00
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 07:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B21C1E991D;
	Tue,  1 Apr 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gyC95Z5C"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2731E98E7
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493456; cv=none; b=BFkGHY2wTfWTkqRcrJrgALAfhhBYFNUVMUxy1GL6l6A49TeiljQ6tLI7h2DJtWOiYU42JHc6u6Iw4p5SGZUljQjgYHKmij7t1eefa3ltp1fQVHoQ1+xS6xIu6wVKCcSG544JemloJaXKXDYoNHsmXHPYeHeLwWC3KLGkXOafEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493456; c=relaxed/simple;
	bh=hWmAheMtuhxFnyMRwswe4uXnr5FLHPcfRBwyhvpHn0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=sN3PBK237bdHh7zWkZK/ROtCkdE/hMT27Djp5Its2RTG9WAsnVnanZEI0qtlv5nQumZDIo5wJ6nHbRnVIRIEa2Aa3UgtGR+F9so7/k+PKwyTLhpaBIkT6fvXkrNViy6PdmYJEf/MEInheKz2UvDwsAMvrmxF9hlKQMJou8GRAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gyC95Z5C; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250401074412epoutp02994bbadee91eebdadbb7f49fc9867e51~yIg7Njzkg1018310183epoutp02g
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 07:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250401074412epoutp02994bbadee91eebdadbb7f49fc9867e51~yIg7Njzkg1018310183epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743493452;
	bh=Xvybmv+rHSjh6SzMpmC/QRRcIPVm/J2ey1JPBENIdcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gyC95Z5CYaahSwX5j1vTYc8aE2I5/7A/NArKb/QM7+kyCKMtiezuMrt4x+6PYIKuN
	 P03a3sfl5T9M7v4+JIkvqGLpDcezyGT4Lc9I1QFfhxx+8orfIRRZhv20hL5rOhInYY
	 kZnSg3ItMBDrO/6IqOk6TzyBLEEM9alBgXLtFY9E=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250401074412epcas2p349de7002ef623ba085026c6658695545~yIg6qyKBr1639316393epcas2p3Y;
	Tue,  1 Apr 2025 07:44:12 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZRg4C3Nl2z2SSKZ; Tue,  1 Apr
	2025 07:44:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	0D.A7.09787.B499BE76; Tue,  1 Apr 2025 16:44:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250401074410epcas2p2f185dc1823c25a9105fbf355ad58ea18~yIg5lHKZw2021520215epcas2p2k;
	Tue,  1 Apr 2025 07:44:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250401074410epsmtrp176a4716e433a86d64b1ede40fc102ead~yIg5jzrTN3077930779epsmtrp1z;
	Tue,  1 Apr 2025 07:44:10 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-81-67eb994b99e1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E7.23.08805.A499BE76; Tue,  1 Apr 2025 16:44:10 +0900 (KST)
Received: from ubuntu (unknown [10.229.95.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250401074410epsmtip1c9c8c4701439d33857c47a477b89564e~yIg5U6Mw01220612206epsmtip1X;
	Tue,  1 Apr 2025 07:44:10 +0000 (GMT)
Date: Tue, 1 Apr 2025 16:53:23 +0900
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
Subject: Re: [PATCH v36 08/31] ALSA: usb-audio: Export USB SND APIs for
 modules
Message-ID: <20250401075323.GH98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGCq0LYs5=Re74G99n3=Vbdu1Q2M5-SKZqXTgPKJZYtSHjXZPA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOube9vZgUrwXkgBt0RbfBVmyRj4Mpcwk47mA/YLhkkxho4K5l
	QNv0Foe4TRTkywVBcEoHDAVxEBmzgIGCFgoyWASzoE4MmMn4GCA6QRDnwLVcXPj3vM/7PM85
	73lzSFz0ncCdTNIYGL1GmSIhNvGudHsjaWTZrEr2R5srOv1gnECXrg5iaLwzF6Afegb5qPv8
	XwBlVTcSaNp4n0BLt/IwVGwZEKBzOTU8NDy/xEdD5nICVUyW4uh87XEcZZlK+SjffJKP/nk5
	iaGyBi9kai/ko5cdrQKU09vLR/VVnQL087MG8L4r3WYcFdBVpjS6umMao031+QQ9cqeDoCv7
	o2lLxSUBXV1YwqevzdUSdHHHN3Rj820e3WxZAPSCySNKuD9ZoWaUiYxezGgStIlJGlWIJDIm
	LjQuIFAml8qDUZBErFGmMiGSsI+ipB8kpdhGl4gPKlPSbFSUkmUlO99T6LVpBkas1rKGEAmj
	S0zRBel8WWUqm6ZR+WoYw265TOYXYBPGJ6vzH1h5upqY9N5SC54J2kMKgAMJKX84cuM2UQA2
	kSKqFcB/j9XxuGIewJ6zTeudJQA7m8p5ryxTQy/WVVcBHBgpXy/GAVw1tQO7ikdthxcWVzE7
	JigfeH+5D7djZ+oN+HQiF7MbcKqfB/us19cMTlQ0PPF4lF8ASFJIvQNrjm+100JqC+wvG187
	2cEmGb65DOwSF1v+TNcRewykLA7wVlf1Gg+pMFjUmMFd1AnO/NIs4LA7nD6Zs45ZeG9qEue8
	2QD+OJONc41d0DiZu3YdnFLD7CtHeVymF+y5x+NoR5jXvSLgaCHMyxFxTi94ZqiIz2E32DU7
	uJ5Iw4W8AgH3PN9i8Gz1TaIIeBo3TGbccJrRFotT3rDRvJOjPWFWy/c4R2+DF1fJDYoqQNSD
	rYyOTVUxrJ9O/v/eE7SpJrD2QXz2toKSub99rQAjgRVAEpc4Cz9dnFaJhInKQxmMXhunT0th
	WCsIsG2sGHd3SdDafpjGECf3D5b5BwbKg/wCZEESV6H1yYRKRKmUBiaZYXSM/pUPIx3cMzFm
	tg2v3DWc9iJRWZd5xGuzd4OiPTTOcb/Yb/BiUr02wNe931EayZjne9qCP1a0pApnDvqAp2IW
	xlc+N+/JrPJa+rI79/T10vTdjlkubTeyJOGP+/YNXH5X5TG7zTgWihR7icY9itdWKt4+FN4k
	jfgsj2ypLQy7W2/ad6E7/rdnX++Ido78/cnkw7uWrpykmICH9NGxjPQz8Hmzm7X3i3LZlMAp
	J+PytRKzwWP5E7V0NDQ24sMIs0i0+VRd4p16+JX41ybydW2FIcOdV/6o6c10WubpPLeysqP2
	sCmVCXSjog9PYI/OYQdijy1K39oyHzJ2wrr0uar7T+FPsQfaNeEx2yU8Vq2U++B6VvkfmhrQ
	cKkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSnK7XzNfpBstaTC2mPnzCZrFm7zkm
	iycH2hkt5h85x2pxeNELRovmxevZLF7Ousdm8e1KB5PFxP1n2S0Wti1hsbj56RurxeVdc9gs
	5j6bwmyxaFkrs0XzpimsFp27+lktfv1/xmQxc62yxabdfawW//fsYLdoO3aM1WLVggPsFhu+
	r2V0EPfYOesuu8eCTaUei/e8ZPLYtKqTzePOtT1sHvNOBnrsn7uG3WNx32RWj31vl7F5TNxT
	57F+y1UWjy37PzN6fN4kF8AbxWWTkpqTWZZapG+XwJWx7esjtoJjARVPdq9hamD8adXFyMkh
	IWAi8fzyb5YuRi4OIYHdjBK7Zy5ihkhISiyde4MdwhaWuN9yhBXEFhJ4xCjxc6oEiM0ioCKx
	9Os/JhCbTUBL4t6PE2C9IgKKEl+etjOBDGUWOMkiceLQUUaQhLBAoET3+7tAgzg4eAW0JZa0
	ikEs7mGSaH29kQ2khldAUOLkzCcsIDazgLrEn3mXmEHqmQWkJZb/44AIy0s0b50NtosTaOTN
	8z8YQUpEge55dbB+AqPQLCSDZiEZNAth0CwkgxYwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7N
	S9dLzs/dxAhODFpaOxj3rPqgd4iRiYPxEKMEB7OSCG/E15fpQrwpiZVVqUX58UWlOanFhxil
	OViUxHm/ve5NERJITyxJzU5NLUgtgskycXBKNTBV7m7gcM58qOHZdOdf6XqXT3qRVk7bhGYL
	hr077iVcoh66xGfms9cGFbwn6/VmzXi29duFrR8mzzB29ek7zLbXXjtn7UxtxkVv9iZcFP/v
	p7fy8xW1kGczLMq7fyy1L3y19nQnr9Mjnm6vvtVSdrZ3/uZ+uXSlzGzjoV+GDFNCVT/rd3ys
	tr597sNJvw8a1TV3+y7lpxud1m2+bTVNL7qq0c1MYH/N8sbbUocXsLjzX9N6qt3ZUX1sV+vn
	b9eqmlVi5124tWnOjV8b05W2Wpf139M6wH383Y47K8VEYrelrJ0X9ecgW385b+kFTv3IE9/v
	ffz/7vprk5nu7fPXiFby++646b2wauWiPPsrkbLGSizFGYmGWsxFxYkAy1x+/3sDAAA=
X-CMS-MailID: 20250401074410epcas2p2f185dc1823c25a9105fbf355ad58ea18
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="-----xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_6ad0c_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250328074925epcas2p41af613e944eade82e874e2d4b0110124
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
	<20250319005141.312805-9-quic_wcheng@quicinc.com>
	<CGME20250328074925epcas2p41af613e944eade82e874e2d4b0110124@epcas2p4.samsung.com>
	<CAGCq0LYs5=Re74G99n3=Vbdu1Q2M5-SKZqXTgPKJZYtSHjXZPA@mail.gmail.com>

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_6ad0c_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, Mar 28, 2025 at 03:47:00PM +0800, Puma Hsu wrote:
> On Wed, Mar 19, 2025 at 8:52 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
> >
> > Some vendor modules will utilize useful parsing and endpoint management
> > APIs to start audio playback/capture.
> >
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Tested-by: Puma Hsu <pumahsu@google.com>
> 

Tested-by: Daehwan Jung <dh10.jung@samsung.com>

> > ---
> >  sound/usb/card.c     |  4 +++
> >  sound/usb/endpoint.c |  1 +
> >  sound/usb/helper.c   |  1 +
> >  sound/usb/pcm.c      | 75 +++++++++++++++++++++++++++++++-------------
> >  sound/usb/pcm.h      | 11 +++++++
> >  5 files changed, 71 insertions(+), 21 deletions(-)
> >
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 9c411b82a218..a0087bde684c 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -1030,6 +1030,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
> >                 wake_up(&chip->shutdown_wait);
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
> >
> >  /* autosuspend and unlock the shutdown */
> >  void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
> > @@ -1038,6 +1039,7 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
> >         if (atomic_dec_and_test(&chip->usage_count))
> >                 wake_up(&chip->shutdown_wait);
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
> >
> >  int snd_usb_autoresume(struct snd_usb_audio *chip)
> >  {
> > @@ -1060,6 +1062,7 @@ int snd_usb_autoresume(struct snd_usb_audio *chip)
> >         }
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_autoresume);
> >
> >  void snd_usb_autosuspend(struct snd_usb_audio *chip)
> >  {
> > @@ -1073,6 +1076,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
> >         for (i = 0; i < chip->num_interfaces; i++)
> >                 usb_autopm_put_interface(chip->intf[i]);
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_autosuspend);
> >
> >  static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
> >  {
> > diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> > index a29f28eb7d0c..1fed039b10ed 100644
> > --- a/sound/usb/endpoint.c
> > +++ b/sound/usb/endpoint.c
> > @@ -1524,6 +1524,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
> >         mutex_unlock(&chip->mutex);
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
> >
> >  /* get the current rate set to the given clock by any endpoint */
> >  int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
> > diff --git a/sound/usb/helper.c b/sound/usb/helper.c
> > index 72b671fb2c84..497d2b27fb59 100644
> > --- a/sound/usb/helper.c
> > +++ b/sound/usb/helper.c
> > @@ -62,6 +62,7 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
> >         }
> >         return NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_find_csint_desc);
> >
> >  /*
> >   * Wrapper for usb_control_msg().
> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > index 08bf535ed163..18467da6fd9e 100644
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -148,6 +148,16 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> >         return found;
> >  }
> >
> > +const struct audioformat *
> > +snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> > +                   unsigned int rate, unsigned int channels, bool strict_match,
> > +                   struct snd_usb_substream *subs)
> > +{
> > +       return find_format(fmt_list_head, format, rate, channels, strict_match,
> > +                       subs);
> > +}
> > +EXPORT_SYMBOL_GPL(snd_usb_find_format);
> > +
> >  static const struct audioformat *
> >  find_substream_format(struct snd_usb_substream *subs,
> >                       const struct snd_pcm_hw_params *params)
> > @@ -157,6 +167,14 @@ find_substream_format(struct snd_usb_substream *subs,
> >                            true, subs);
> >  }
> >
> > +const struct audioformat *
> > +snd_usb_find_substream_format(struct snd_usb_substream *subs,
> > +                             const struct snd_pcm_hw_params *params)
> > +{
> > +       return find_substream_format(subs, params);
> > +}
> > +EXPORT_SYMBOL_GPL(snd_usb_find_substream_format);
> > +
> >  bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
> >  {
> >         const struct audioformat *fp;
> > @@ -461,20 +479,9 @@ static void close_endpoints(struct snd_usb_audio *chip,
> >         }
> >  }
> >
> > -/*
> > - * hw_params callback
> > - *
> > - * allocate a buffer and set the given audio format.
> > - *
> > - * so far we use a physically linear buffer although packetize transfer
> > - * doesn't need a continuous area.
> > - * if sg buffer is supported on the later version of alsa, we'll follow
> > - * that.
> > - */
> > -static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> > -                            struct snd_pcm_hw_params *hw_params)
> > +int snd_usb_hw_params(struct snd_usb_substream *subs,
> > +                     struct snd_pcm_hw_params *hw_params)
> >  {
> > -       struct snd_usb_substream *subs = substream->runtime->private_data;
> >         struct snd_usb_audio *chip = subs->stream->chip;
> >         const struct audioformat *fmt;
> >         const struct audioformat *sync_fmt;
> > @@ -499,7 +506,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> >         if (fmt->implicit_fb) {
> >                 sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
> >                                                                 hw_params,
> > -                                                               !substream->stream,
> > +                                                               !subs->direction,
> >                                                                 &sync_fixed_rate);
> >                 if (!sync_fmt) {
> >                         usb_audio_dbg(chip,
> > @@ -579,15 +586,28 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> >
> >         return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_hw_params);
> >
> >  /*
> > - * hw_free callback
> > + * hw_params callback
> >   *
> > - * reset the audio format and release the buffer
> > + * allocate a buffer and set the given audio format.
> > + *
> > + * so far we use a physically linear buffer although packetize transfer
> > + * doesn't need a continuous area.
> > + * if sg buffer is supported on the later version of alsa, we'll follow
> > + * that.
> >   */
> > -static int snd_usb_hw_free(struct snd_pcm_substream *substream)
> > +static int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
> > +                                struct snd_pcm_hw_params *hw_params)
> >  {
> >         struct snd_usb_substream *subs = substream->runtime->private_data;
> > +
> > +       return snd_usb_hw_params(subs, hw_params);
> > +}
> > +
> > +int snd_usb_hw_free(struct snd_usb_substream *subs)
> > +{
> >         struct snd_usb_audio *chip = subs->stream->chip;
> >
> >         snd_media_stop_pipeline(subs);
> > @@ -603,6 +623,19 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(snd_usb_hw_free);
> > +
> > +/*
> > + * hw_free callback
> > + *
> > + * reset the audio format and release the buffer
> > + */
> > +static int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream)
> > +{
> > +       struct snd_usb_substream *subs = substream->runtime->private_data;
> > +
> > +       return snd_usb_hw_free(subs);
> > +}
> >
> >  /* free-wheeling mode? (e.g. dmix) */
> >  static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
> > @@ -1746,8 +1779,8 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
> >  static const struct snd_pcm_ops snd_usb_playback_ops = {
> >         .open =         snd_usb_pcm_open,
> >         .close =        snd_usb_pcm_close,
> > -       .hw_params =    snd_usb_hw_params,
> > -       .hw_free =      snd_usb_hw_free,
> > +       .hw_params =    snd_usb_pcm_hw_params,
> > +       .hw_free =      snd_usb_pcm_hw_free,
> >         .prepare =      snd_usb_pcm_prepare,
> >         .trigger =      snd_usb_substream_playback_trigger,
> >         .sync_stop =    snd_usb_pcm_sync_stop,
> > @@ -1758,8 +1791,8 @@ static const struct snd_pcm_ops snd_usb_playback_ops = {
> >  static const struct snd_pcm_ops snd_usb_capture_ops = {
> >         .open =         snd_usb_pcm_open,
> >         .close =        snd_usb_pcm_close,
> > -       .hw_params =    snd_usb_hw_params,
> > -       .hw_free =      snd_usb_hw_free,
> > +       .hw_params =    snd_usb_pcm_hw_params,
> > +       .hw_free =      snd_usb_pcm_hw_free,
> >         .prepare =      snd_usb_pcm_prepare,
> >         .trigger =      snd_usb_substream_capture_trigger,
> >         .sync_stop =    snd_usb_pcm_sync_stop,
> > diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
> > index 388fe2ba346d..c096021adb2b 100644
> > --- a/sound/usb/pcm.h
> > +++ b/sound/usb/pcm.h
> > @@ -15,4 +15,15 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
> >  int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
> >                                     struct audioformat *fmt);
> >
> > +const struct audioformat *
> > +snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> > +                   unsigned int rate, unsigned int channels, bool strict_match,
> > +                   struct snd_usb_substream *subs);
> > +const struct audioformat *
> > +snd_usb_find_substream_format(struct snd_usb_substream *subs,
> > +                             const struct snd_pcm_hw_params *params);
> > +
> > +int snd_usb_hw_params(struct snd_usb_substream *subs,
> > +                     struct snd_pcm_hw_params *hw_params);
> > +int snd_usb_hw_free(struct snd_usb_substream *subs);
> >  #endif /* __USBAUDIO_PCM_H */
> >
> 
> 

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_6ad0c_
Content-Type: text/plain; charset="utf-8"


-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_6ad0c_--

