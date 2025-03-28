Return-Path: <linux-input+bounces-11325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1EA742EB
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 05:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D9C1B6015A
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 04:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987220CCD7;
	Fri, 28 Mar 2025 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eroXl0n8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270819E98A
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 04:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743134904; cv=none; b=Y8/eRHu/Ea1Y8HYoCUvXUXZQ0KZTdcEUZcGqyTON8/j30YyAoDPdYiR5ZGWjSB8eZK/+UIMM9qU05RTF9utYtZaF2TA2S5Kz8eknA6IJy8Tg2++qLt8byt5DW5LOYzj/uO5Uk9NNLd5+QJ5aZuiJldBchI05q+qpUB/O8Blz8m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743134904; c=relaxed/simple;
	bh=iYrVRcD+hMzJtKzodR0ESNhu7mLxGvDK1xY/1pi4jNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPYl77PAP6uJyY1KpxzZMlAy65TFE6fH160dLNM6eBlgE6Ce55m7cTvXIjUHc+MJ5MHaScrFCc3KMBSpJNMr1NCHqlu4HS/sCbzl5618CJ1GikrOWBj5/0HRpDg/0F6rcc04BfXQ6X6gwAVV1VR0Jg7bCDa7EghQMIndMrHo1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eroXl0n8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso2781608a91.0
        for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743134902; x=1743739702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N03iBb0aPoOa1EMU2w3tNSLo9fIJtKzm12qVBAP380o=;
        b=eroXl0n8+OT1WgONptV+EA+kK8ucFA8h5gKi/zuj5OQRMp/bjukCcy0en5STiHvPjF
         hk+0RbyfQArUFzXVJCZIU4lcCM91HpM/R6oLg8REt3szqn/8DlbFUqRaFz7KVW1uUhC2
         2R8lLzlWzv6PGJtf5oH90dHAX4cRqBki80bGQli/mIh7ZKqVh16jWHyF8BwonOgC8xc7
         Z58exKQhCj/OHYjOLyfr0Yzl57V4S4mqh5MMEoBf0uJYiiEa9z8FZgYVjc1Rkeys5wkW
         c9jZIRU2rtdOEMJu1njuawOnnUTKseg6qPEo2Os8ZhCqc/A/C6VyepPeTfTpL9L62XQc
         HrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743134902; x=1743739702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N03iBb0aPoOa1EMU2w3tNSLo9fIJtKzm12qVBAP380o=;
        b=VvKHToyqn5BsVYtDpfKV5s3TQUwxIklD475qn7pLAwhjxv31o5aBOGNYxiP3lKkm4l
         0DrQSaRQEEYAdDex3MzH/erXINYqZgL3rL+t1vToCVjDbm6VXclEdJIJ1u6jaz62rGSn
         vVqMeGb1sjkpoFUYKLZdtt6wugbn8zRF+NQCW/XmXj1QEiyf2t1Ewixb0Ysu92bCr34S
         mup1uC65mkpxFaiLBoBq4wMcQaIUGLN+eG9Lcaujru0WHdRHsfJvnpGJ++8t4AwMDiv6
         tU3j56an82jpFzPSNEyGiG6dz5LHdKDPbNTQm9hwRTKy0tyFzRB2PfqBqcpg/q37XNQa
         Rtbg==
X-Forwarded-Encrypted: i=1; AJvYcCWA/r1YjVqoaFOJ84zqhRe1R8Wo8DKoa2Rp92ZwlgkukdX98XpggWJWBzKdbxEWIhBSsBdUWgJp/st+jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVCTRSrHtfMTkQtjQ7g5qu+yfpE+iz0Z8jLBDI/XRPy6++3Sj
	CRvvzCJgcdS3jt91wJ//VmLe3qU125pb/MNVWWgx/rS0hCVX86qNt8u1EHPlmhuv97VQ/nYBr+M
	FVxozLfFbYlnNPRKgHyPR3q/g7hU2dbsNNpXe
X-Gm-Gg: ASbGncsrRV1mALgafW6KbOIW/AsTDGpHklYXuuN0KxPCIK0//Ugc1fA9diLvj0Bsl0w
	A2vDD6+iCBmM03r1c1VIN94WOc7dfhaAl+/axFmNKW0W5n3yM6XP+I49ecgSJUlUP7sWAVo3eiG
	SoWcF8PxoHR8q8n8dY/7OPiGwyL/6k1rL0fZhDczqE1NH+AHJpFEVfPq7Z
X-Google-Smtp-Source: AGHT+IET2SIyJWG/WqM8dYN2pMoj552qvEHpWMKKbW6yAwVAwSlCGxAcGWCgJC6GDSoyfDHa7yGjAkBy+fMLLMAo3AE=
X-Received: by 2002:a17:90a:e185:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-303a8164d83mr9850612a91.20.1743134902056; Thu, 27 Mar 2025
 21:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com> <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh> <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
 <2025032756-aliens-ibuprofen-79e5@gregkh>
In-Reply-To: <2025032756-aliens-ibuprofen-79e5@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 12:08:00 +0800
X-Gm-Features: AQ5f1JorDK6fkpVgYpd1mPibjV42TOlpaMjT0M3mouvQUfQc-UcxBnx7ecDNaLc
Message-ID: <CAGCq0LZUezCBoqrS2+6Dphd4J2T0w5tPNweNVtGcNzMzjgSUXw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org, 
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org, 
	lgirdwood@gmail.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com, 
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 6:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 27, 2025 at 06:14:00PM +0800, Puma Hsu wrote:
> > On Thu, Mar 27, 2025 at 3:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > > > Hi,
> > > >
> > > > We have implemented and verified the USB audio offloading feature w=
ith
> > > > the xhci sideband driver on our Google Pixel products. We would
> > > > appreciate it if this solution can be accepted. Thank you all for t=
he
> > > > work!
> > > >
> > >
> > > Great, can you properly send a "Tested-by:" line for this against the
> > > 00/XX email so that it will be properly saved?
> > >
> >
> > We(Google Pixel) only use the xhci sideband related changes and two
> > changes in the sound card driver. For the details, what we actually
> > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > send the "Tested-by:" line to the 8 changes above? (I added
> > "Tested-by" line for this [01/31] first.)
>
> Send it to the commits that you used if you only used portions.
>
> But that feels odd, why are you only using portions here?  Why not the
> whole thing?  Are you going to have to revert portions of this series in
> order for your device to work properly?
>

Google Pixels use Tensor instead of QCOM chip, so we won't enable
QCOM specific drivers from this series(i.g. patch [14~31]). What we
need from this series are common xhci stuff and portions of alsa. We
won't build QCOM driver even if this series is all merged, so we don't
have to revert anything.


> > > Also, I think a new version of the series is coming, can you test tha=
t
> > > to verify it works properly?  We have to wait until after -rc1 is out
> > > anyway.
> > >
> >
> > I think this v36 is the last version of the series as I discussed with
> > QCOM Wesley. And for sure I will test it if they do have a new
> > version.
>
> See:
>         https://lore.kernel.org/r/ee95520b-cdcc-4e10-a70e-683993cafe36@qu=
icinc.com
> for where the need for a new version is discussed.
>

Thank you for the information. It looks like QCOM specific, but I will
track and test if there was any change for common xhci in the new
version.

Thanks
Puma

