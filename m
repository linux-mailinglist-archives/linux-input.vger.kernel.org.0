Return-Path: <linux-input+bounces-5712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0178958D8D
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 19:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C664B22422
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 17:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE621A7048;
	Tue, 20 Aug 2024 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGcgX5J5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854601BD51E;
	Tue, 20 Aug 2024 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724175580; cv=none; b=AQ0m4+Ms+vJYLnsLKa7qy2w87Wot7IVoyXk0mcEqWZK/u69JmjAzCWE4y86qxEZ6zY23hEzu2fO7mhAP1nluguYJShrdwLUCjqNMTMUIdTW+kjXtTAfFDK+yRVmzwPoLcizHkuivtPlT2bsCjka0J4nI9w9AU7ucFMRD6d1tkAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724175580; c=relaxed/simple;
	bh=mhaQrQ5YKGvk0q+jxM2o6eHojffWLeEEv3eMgl4mTNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PawfnFROl8fXZY9u8lRtdTqVvA1HnyEtXuBsP6Hzo8LEcw98qKGePZQh4D+Ytf2jaNVm/AkwFXOKK6nP53JruvZkNVyL3pXM48DFuSUHr0Jo3bdSCeE7LSkDftESkjwJHar+9bFoTYKjFovNGbIvv35BpqDer4OZPeCSjKamtGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGcgX5J5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3718c176ed7so2760326f8f.2;
        Tue, 20 Aug 2024 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724175577; x=1724780377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6yCMNIP5ljDsCWLfC1SuiiZdpEuw853pQHmtNZCILY=;
        b=nGcgX5J5RPsCWoSYhFPQ936AT4MDXj99KoREW4BOQWC5n+NlMOC1xP6Xd50rscn7IH
         mHBd4iO6H+c+rhPuOPF9CamFm9KL86cWiiBmdQuPPSXlPyt4D4OK2iV+VJ72+5xMocup
         akxTWgje/qfqh7jKcuA5+6buQXdIYdAOE9MVgRQwuBFDUwgJvUYWZg/dDcfeUthYBGEn
         iICQYgqyjIlYSRYhOGXKloeJ6lxEmddnJ7xS2bQfh2/gfD32S4EeDoW/+cYqnHQOOye/
         vusvOK+1zTEXdzeL08oteBQitLb631TTBEOy5CMnFGT8kSCbGsTp5Nv6lYyLJABvMH0I
         YuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724175577; x=1724780377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6yCMNIP5ljDsCWLfC1SuiiZdpEuw853pQHmtNZCILY=;
        b=EVqBRv0Lrz/yShEUg1O+P3Q1lDWzIPT78DqBPAzT1DF6gBWb6/fD6iP1acdtXOAA8o
         ADVay5rcrUqU20ZiCpEKa2vgt83Q9xlrU1lCyMGeQ0Ju3KXjyPaBk/Bl7Yjci+NRiS1Q
         N3kN+/LoUbJdAyt3GdreY8YbCBvi7tgSUZWUWrRR3W8XJgr9IzV8d6GJKggyLIQPGyL8
         ljW+r4Vzy/py1cUA+IJZksPZ1hTdiBO/t2jJJr4G5zEmTAVvGozr36Jh5ue6TqEfjYpN
         s/EW2qtQORKTB02/K1VkbqOfk88/CGu3S7l1WqTc/P+MCQe1E+DMKClKE/JD+DMvlquG
         kT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNpX0jeZ1HybSUWy8jeGmkgcgGEKHj1SwKur/ZLHKeEEQUNlPXfBbMUCB2uLcOgaAjUTa2Z+W/PVlGBoc/Zw3UKnBw5Lyg1MvwQ3sV
X-Gm-Message-State: AOJu0YxgYLmCzBNcvupiScjWiiqRksvacltLdjIfFuV0P5U8L/L3zK6j
	saF2D6ip+hUid3un338Op8Mby4gST/J1OCr+t9reGuGyOOjeuqt1unnODnnRibWQo5NhLzCOWdQ
	h94BXKGut70oFkN/97ygzr/15gW8=
X-Google-Smtp-Source: AGHT+IFAeGhIrWnkhDUgQipH0lqCqAB/UfzSf8jTdPmiY+9pUBtFnuqR+VZIal73B6Y+nvKPfP+xVRz4wr5FGLbFe40=
X-Received: by 2002:adf:f3c5:0:b0:367:980a:6af with SMTP id
 ffacd0b85a97d-371946cf569mr9464956f8f.59.1724175576036; Tue, 20 Aug 2024
 10:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com> <64039307-fcfc-4e08-8727-c805964f7386@web.de>
In-Reply-To: <64039307-fcfc-4e08-8727-c805964f7386@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 20 Aug 2024 18:39:24 +0100
Message-ID: <CALTg27nNxjicXCGZMAqbebmUWraRqyqDm2hrTk5WZ=igJerX5g@mail.gmail.com>
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Would you like to return the value directly (without an intermediate loca=
l variable)?
Done, thanks

Stuart

On Tue, Aug 20, 2024 at 10:17=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/hid/hid-corsair-void.c
> > @@ -0,0 +1,842 @@
> =E2=80=A6
> > +static int corsair_void_set_sidetone_wireless(struct device *dev, cons=
t char *buf,
> > +                                           unsigned char sidetone)
> > +{
> =E2=80=A6
> > +     int ret =3D 0;
> =E2=80=A6
> > +     ret =3D hid_hw_raw_request(hid_dev, CORSAIR_VOID_SIDETONE_REQUEST=
_ID,
> > +                              send_buf, 12, HID_FEATURE_REPORT,
> > +                              HID_REQ_SET_REPORT);
> > +
> > +     return ret;
> > +}
>
> Would you like to return the value directly (without an intermediate loca=
l variable)?
>
> Regards,
> Markus

