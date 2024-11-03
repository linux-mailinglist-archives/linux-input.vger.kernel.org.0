Return-Path: <linux-input+bounces-7839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311419BA395
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 03:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95CF1F21B24
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 02:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187354723;
	Sun,  3 Nov 2024 02:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyADI5Zo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA04C81;
	Sun,  3 Nov 2024 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730601144; cv=none; b=miss2R4VMjUR4WNQuMfsgVek9CSUR2DGBcrISnhVdu4L16ABdvTJa+5atfa7HqoQWYt0wShM9cdXsKSuCDiR24uHu6EUe3bSqtSIjO2T57KF1sTBqpzZ6mDN2w2mm28Nqr0ZmVGgEvP+vk9dvFzfTKFELPaDiLc6Ujh6xHsQBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730601144; c=relaxed/simple;
	bh=4lz901kcXc09LIMIf1KReQdqPmwQLbgc1yGqsM8Nycw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCZFvqQCxOqe+5GQ+VL0Yb129Gb3XMFQnWvldBnPPXm/cuZgCa7ACzD+amacd0aJI7gW8XY1A51pR5S5Ri6Q7YLWSabY2kg5AlNR8XKbn7Ucol7dlTUFnyoS48IOeX9WazbpOHEcBie6wxQUDBdFpPfdebmKzYZebeYrxCfHvTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyADI5Zo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d518f9abcso2179972f8f.2;
        Sat, 02 Nov 2024 19:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730601141; x=1731205941; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vPlrl7acoQ/1i2JTGP4tpwU2W/5uHE/MHM+eKp35xHk=;
        b=IyADI5ZoksOo7nPTYNFv87FFXz1USH7Q5fHX6giybzgPNLrdRd7qrVysuzZlOTLlJy
         lw+KodoUNr/WzYNF6wCVTnz6IbdX9lFKyPk7zUjmFLb5QQl2cXSdvTDXTqVw0cXztYE7
         3PEafT6edEqNjJ4b0I76K7mGF64xTgrxPOdxDLet97b1giyj5/kpXqlKJxqYkTWQQSsS
         cfwDBR+3ueKCX/hc3dFruAxQHy++kvJ9MjER4YwDwcEQRAjvlLVIFfI7ux0wMMxInbwA
         Bil1RtAEoCvhwvh6FKPOUVIbiU4a7hZNlUw/2QMjF+8jZ4CFYIOpPR4xsaUbJGfluH2/
         sd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730601141; x=1731205941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPlrl7acoQ/1i2JTGP4tpwU2W/5uHE/MHM+eKp35xHk=;
        b=Sbn5lm8qmIe+tI3vAyH6RY0+84PbrS+gaT1IpKKiFoRdK7y61wu74CvkAsBB+5L1+u
         CxTWUq/ZYdQyTKdkfbwKFWISgtrPw0d+/TCI2xFWnr2qtP8olOmfycDxz2PZImpAIW99
         uclVYdu9K9DdV4UF9cPaI7osTYDp5k8uHA2ogFu6BqEyYt1ZYomdna/M+bSfNNGEdgXp
         VuUWCYV3cClOhMsLUu36eoFNCNRTr5fRrTSuyzx5QhEYAG8fZqHQaDF5HNOzICV7xt8V
         hdOsciCSEeIVpvuktn0hIDjxX+Wdvq0OZTkIHNr1+WDkMfVqY8Rxsj7u4mZzoKLVIuGk
         QzHA==
X-Forwarded-Encrypted: i=1; AJvYcCXH6j0h/MjJh1DyeTecq8KHJzA3JBwV6BDa1/4gqF1kA6z55baLg4IcAJr7utLzM30REs9rIRMVK9krLzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuhqidzJXh8dvlqUJnj/1thy6KfyJABQbwhNQMuS0lGNmVrHja
	2VKXcY2CMnFnifiT8Jrd7202h58ajK0FF/7cNQMTm+bsvllqAmVU6vf8v8rfabPeOuzc0ZfFatJ
	ge2c3dCfQH2O67XXxcPJYHOKmddI=
X-Google-Smtp-Source: AGHT+IHYsouaKPr0ui72NKGheKLmuYISCPmlWRrBxgdQtDYtnIGl6noa2TOF8Y+GE0Y+qE2h8C04GlTMf0X9FTPeF7g=
X-Received: by 2002:adf:e311:0:b0:37d:542c:559 with SMTP id
 ffacd0b85a97d-3806112831fmr18545034f8f.18.1730601140723; Sat, 02 Nov 2024
 19:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241020195717.CD7CC17525E@bout3.ijzerbout.nl> <CALTg27kQOjBkX+W4L+EntReUkRSiPKKB4jhoB05f1LGvTNgyFg@mail.gmail.com>
In-Reply-To: <CALTg27kQOjBkX+W4L+EntReUkRSiPKKB4jhoB05f1LGvTNgyFg@mail.gmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Sun, 3 Nov 2024 02:32:09 +0000
Message-ID: <CALTg27=tjOq38cHfRAW8QN+dN3QxGMkZRj+3amwDfzFwJf42uQ@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add missing initializer
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Linux Input <linux-input@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Checked the script, CCed missing people

Stuart

On Thu, 24 Oct 2024 at 02:51, Stuart <stuart.a.hayhurst@gmail.com> wrote:
>
> Good catch, thanks
>
> Are you aware of 'scripts/get_maintainer.pl'? It might tell you to CC
> Jiri Kosina and Benjamin Tissoires, as they can actually apply this.
>
> Stuart
>
> On Sun, 20 Oct 2024 at 20:57, Kees Bakker <kees@ijzerbout.nl> wrote:
> >
> > This was detected by Coverity, CID 1600743
> >
> > Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> > ---
> >  drivers/hid/hid-corsair-void.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> > index 6ece56b850fc..d1fd04264656 100644
> > --- a/drivers/hid/hid-corsair-void.c
> > +++ b/drivers/hid/hid-corsair-void.c
> > @@ -553,7 +553,7 @@ static void corsair_void_battery_remove_work_handler(struct work_struct *work)
> >  static void corsair_void_battery_add_work_handler(struct work_struct *work)
> >  {
> >         struct corsair_void_drvdata *drvdata;
> > -       struct power_supply_config psy_cfg;
> > +       struct power_supply_config psy_cfg = {};
> >         struct power_supply *new_supply;
> >
> >         drvdata = container_of(work, struct corsair_void_drvdata,
> > --
> > 2.47.0
> >

