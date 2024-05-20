Return-Path: <linux-input+bounces-3746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458678C9FCB
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 17:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8A2285389
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C25E136E2B;
	Mon, 20 May 2024 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwf55qNa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E31FC01
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716219520; cv=none; b=GMA0E/k5kTkeWdrZl23pcr60d3EqpSdzUkB8zSqLDHdj08Bq/5oj3340FSKKdSP/jqLUIwt4vVRKf0ZjbFr01j8fWdCNPy5akawwr11K1mJHjuzNyRNVyCVyO+9ywMJwpJiKP3/XLsuwBU4ujR7WIxSCmR9b23y/aRFIUTlkf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716219520; c=relaxed/simple;
	bh=xR38KVD3bbKUAoYUfwjtudqWW7AHDRaw+vcgMm2ki0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKcqysNvlxoZTOlCKR7EqrNUuczTar8OYkfZsveUz6FQJxqZL5YI3EuiK6Exvhd3Rw+ICLpx355yTMd5uUQPZ5sA26sQskCA7oXemTNG3WrkBKGpCrgafBlEpMQhhlv265c5p0mGwWrA/r021nN7q9pt1DWL2oWUsrl6jTJRrbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwf55qNa; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43d2277d7e1so10873561cf.1
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716219518; x=1716824318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKPnejpOVVglMsc+d8kH/kXQPdEfmoXhhEf4Gy8y/h4=;
        b=dwf55qNabLsoAjUM5qmkvs+aMYoXbdLFHBPAiDue0XReH+IKsG/PeUBsWBg5evQqpd
         gJfpVe+QirEj1bGeZwM4DxwrLOVItfj1JlcAS2u/QPTfgeVy03k7Ix77LEm+NAV/28Rb
         sBfFR88Stnx82Dw9pQSUJHRODvawVsjjVvyBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219518; x=1716824318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKPnejpOVVglMsc+d8kH/kXQPdEfmoXhhEf4Gy8y/h4=;
        b=hzY8HdyGa10K4eAaramaO+WsIh/ily4dhy5yXCXhImcVVI0K1fMuUMtwRR9sY5G2FS
         l4ONwDZIPuLiFpoJerJbDeZRD0OfuYVwUgQ/kHbomZ8RF10DVmiPw2Ecv7z82RVeCNXd
         /eYhZLRkoRk1m2wSmXzAUqEtURSFeqC03jvTsPt+WfaO872mDlth3EG5aHYLKE3G2Lwz
         3thaikhFsgxokZArk1N1N3ImnuiXU4ifq7YbHr/n7vuDkne6iJdCPvrOdcZmneW+3GDu
         yFyctcxrMJGU/ocelL9KFYVXo2yUZ6tk/QN7qQCWWqRWbQoZqh6U/Q3oC7NWcdyf0WqT
         MuWg==
X-Forwarded-Encrypted: i=1; AJvYcCXNcmpmx+S3cgHESk2q7cdTpw+C/B8QdMBSnSHdFrr4o+8LjrTxYsxf2q4NSGuA+aEHejmbs8sKVu/ETFFDV6IR9AiBFLR9D9HE/ko=
X-Gm-Message-State: AOJu0YxDLOoqU8KDW51S3VaODJvmsuMIQc/46Xu7Id3w4hG6UUrscmyk
	KWokrC36DRuVWe9GDR/wl1LbgRehLFJPP8D8RFlDKhnJgLXRoLFGCgXUps3ymOVOMjQuMISbgvk
	=
X-Google-Smtp-Source: AGHT+IHnAAyFvKugHOwkkSpjt4/7dbUG/O/XOx32MFnts8AUp5JM1yR3YhHutxyH6+Ok//2f3skWog==
X-Received: by 2002:a05:622a:1b17:b0:43b:15e1:1e87 with SMTP id d75a77b69052e-43dfdaab036mr451439591cf.11.1716219517664;
        Mon, 20 May 2024 08:38:37 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e2ebc82e2sm79407991cf.79.2024.05.20.08.38.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 08:38:37 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43dfa9a98d2so286861cf.1
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 08:38:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIXeXmd8m519tvKS90OH2Oi57OFRnlkKFywunCMgPtl2lQc2MhBr8p3AP1QLcG3/vWiQhDYI2yvG7rncaK/+WBmsv+Omk/ePRjycs=
X-Received: by 2002:a05:622a:5917:b0:43e:ec2:4bb8 with SMTP id
 d75a77b69052e-43f797e0ecemr5611191cf.26.1716219516885; Mon, 20 May 2024
 08:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <20240507144821.12275-5-johan+linaro@kernel.org> <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>
 <Zks3hp5iUhTe3rLH@hovoldconsulting.com> <Zks5gJ7H6ZuWr_Xm@hovoldconsulting.com>
In-Reply-To: <Zks5gJ7H6ZuWr_Xm@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 08:38:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDdc_YgZ=JGamWpdyCgAM_0szk-m_RgUnkDA9m1zbzWw@mail.gmail.com>
Message-ID: <CAD=FV=UDdc_YgZ=JGamWpdyCgAM_0szk-m_RgUnkDA9m1zbzWw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] HID: i2c-hid: elan: fix reset suspend current leakage
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 20, 2024 at 4:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, May 20, 2024 at 01:44:06PM +0200, Johan Hovold wrote:
> > On Fri, May 10, 2024 at 04:36:08PM -0700, Doug Anderson wrote:
> > > On Tue, May 7, 2024 at 7:48=E2=80=AFAM Johan Hovold <johan+linaro@ker=
nel.org> wrote:
>
> > > > @@ -67,7 +77,14 @@ static void elan_i2c_hid_power_down(struct i2chi=
d_ops *ops)
> > > >         struct i2c_hid_of_elan *ihid_elan =3D
> > > >                 container_of(ops, struct i2c_hid_of_elan, ops);
> > > >
> > > > -       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > > > +       /*
> > > > +        * Do not assert reset when the hardware allows for it to r=
emain
> > > > +        * deasserted regardless of the state of the (shared) power=
 supply to
> > > > +        * avoid wasting power when the supply is left on.
> > > > +        */
> > > > +       if (!ihid_elan->no_reset_on_power_off)
> > > > +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > > > +
> > > >         if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
> > > >                 msleep(ihid_elan->chip_data->post_gpio_reset_off_de=
lay_ms);
> > >
> > > Shouldn't  the above two lines be inside the "if
> > > (!ihid_elan->no_reset_on_power_off)" test? If you're not setting the
> > > reset GPIO then you don't need to do the delay, right?
> >
> > Yes, I guess you're right. The off-delay is weird and not normally used=
,
> > but apparently it is needed by some panel-follower use case. AFAICT it'=
s
> > not even related to the reset line, just a hack to add a delay before
> > the panel is reset by some other driver (see f2f43bf15d7a ("HID:
> > i2c-hid: elan: Add ili9882t timing")).
> >
> > I think that's why I just looked the other way and left this little
> > oddity here unchanged.
>
> Hit send too soon.
>
> Since this hack does not appear to be related to the reset line, I think
> it's correct to not have it depend on whether the reset line is asserted
> or not (e.g. as there could be 'panel-followers' with
> 'no_reset_on_power_off'):
>
>          The datasheet specifies there should be 60ms between touch SDA
>          sleep and panel RESX. Doug's series[1] allows panels and
>          touchscreens to power on/off together, so we can add the 65 ms
>          delay in i2c_hid_core_suspend before panel_unprepare.
>
> The power-off delay variable should probably be renamed, but that's a
> separate change.
>
> So I think v2 of this series is good to go.

Sure. As I think we've seen in the past, my choice of bikeshed paint
color seems to be quite different than yours, but nothing here seems
like it needs to block landing, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

