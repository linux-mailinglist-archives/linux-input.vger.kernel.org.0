Return-Path: <linux-input+bounces-14864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B69B85E82
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 18:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FCB4189F992
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15BE314D32;
	Thu, 18 Sep 2025 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eAJjOX8A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C897314D29
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211503; cv=none; b=ZJVbr8q7b3D7fbWA3W6JJCqrjQZPMR/d7I/smGiNdFj5EhPo3lWC68uzDRmCyaGTvhG/2HpphX0fWkDrRaawagHbpWh+rDe4bpqoLHfTgkwqQV4VxgW2lQyurzt3i7UzryIeUnoPmGUZJ48rz8osFGVkmM1tew6SX86DS0y9jLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211503; c=relaxed/simple;
	bh=lYuuVq2c2mGG8GtYZXdwpj1TRV+Txzn06Yn/v4INq2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8g8MUFKJqoJ6cSt2vvsHY5WGkro0+dl1j6K4XVCVpo+yn+VCHSnGSlEw2WON9ABYqxwdoZ6xMR2ZI1eVFsGjsdb63/h2/NqtmsNImA5FW0AhNHfCI46mS13aPOBi44og+UC2LeQREiOD5uFvnhNlUQCQavQ1TpJEYsV65NWPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eAJjOX8A; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e94d678e116so1321612276.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758211501; x=1758816301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYuuVq2c2mGG8GtYZXdwpj1TRV+Txzn06Yn/v4INq2g=;
        b=eAJjOX8AF59/ZpXGVlfT16sY2yKrbCPC7b5J65pxo70lTaezz/flLtxH442lRmPsvR
         n3pMr9EbW9GiXPLsylDjCtn+08Q4b7LndpI1kCUzZ8i3d3VBIV+gJIusELLoBwVIA2vL
         aFLgLbuPZtLAiPccFvek02I5TOPj07TPtxCb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211501; x=1758816301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYuuVq2c2mGG8GtYZXdwpj1TRV+Txzn06Yn/v4INq2g=;
        b=SHkTlLW+teg71CPukNtwLHQMXnIjXs5xvGyBG8retmEz3mKHicmp4QgfwyYOZ6T5B+
         xPUIY7Hcr6sHQTjVnc5u/PIfCTfJOQqp7qJxyR/iKiz5Rfrqwq81cZskXr+tgT8iMaL1
         NNtV7lMIkvcCddMJt37Btazv+rLC0ZOqGk/TOmYCW+/Uvi+AJ6JON8+eolzAbTqaLrxn
         g/lda56g9wM3SjDhdSqVM9EKfw5U11AA2awCgZzXTEvTLLgwX3GlE83K4y02ZqUv+J2a
         ZvZdTe+juKF1MNhjdDmXatdtj3WSpAuZPhKONOy2sqGqzZpH6Eq0+Rbewrh1u4UIJy5g
         OTdg==
X-Forwarded-Encrypted: i=1; AJvYcCVEUW6oyj660A5UV7p2UxffIQrI1GiZRdBaBjQabo8QWbg7tOjtL2A52JGPsl+FesuVJ4bMIoF0d8NgiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwG4eCo4cVy3D2qTRc4pAi8GguuuawWT91YXsZSL4Ewgjy7mV
	C9nQt5nLF/Vay7z7sBoaNGYD6Kl9uBQQ1hsiNjBpSceHgXkhbDU0AW7RaQGOlo86IAVIQQR5sgJ
	2GIsaScv3FizwbpPftC/eXwqmQbk3seSEZ1GF4TSymchIpPyerOcrJdE=
X-Gm-Gg: ASbGncsIGuXDNTnMge1XbhfAfrg+RZw+G0bu96IXE+nUOLR6hgw0tyjHi7fvtxzBu8u
	/gu4AISSn6Rx98AwH/nriONLK+8ywfXfEridw/rxmdcKaaJq37jCcLqMD0UpzK1Mq1ItC0H2wsP
	vGrlvVG/GdpFkcfkcUyPpC3hGixnYLbUs3Och5SavJjm1zXXnNJRVvq9BbnceO5AMitVe9jpa5u
	QVU+h/rSIDMcMRfHVQzt9pG
X-Google-Smtp-Source: AGHT+IHxSXi29UFW2nfj2WCiCTSiNTNZ0K9Fav6RAJFsRCcIQzCBj3yv1u6H5MOa6iU2eN8pItlTROtG4gg/yGYd8sQ=
X-Received: by 2002:a05:6902:e07:b0:ea3:f6c9:ad6b with SMTP id
 3f1490d57ef6-ea5c057dd64mr5394869276.43.1758211500339; Thu, 18 Sep 2025
 09:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915201748.1712822-1-dario.binacchi@amarulasolutions.com>
 <20250915201748.1712822-2-dario.binacchi@amarulasolutions.com> <it26gfh7qwemksyqw3btcqyr4obbviwaywmyptsjedil2v52vi@rylzlifvans5>
In-Reply-To: <it26gfh7qwemksyqw3btcqyr4obbviwaywmyptsjedil2v52vi@rylzlifvans5>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 18:04:49 +0200
X-Gm-Features: AS18NWClBmtV3TGuBJja7IxKTv258z-H9vTIrPPB1rYqlA078YmgINmcyYbNvFo
Message-ID: <CABGWkvpPesDoz_-X-rMjA567eX3DQEQ8mpSsp=ShpoKjTWWhjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - rename sysfs attribute
 report_rate to report_rate_hz
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Al Viro <viro@zeniv.linux.org.uk>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Yu Jiaoliang <yujiaoliang@vivo.com>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Tue, Sep 16, 2025 at 2:38=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Dario,
>
> On Mon, Sep 15, 2025 at 10:16:32PM +0200, Dario Binacchi wrote:
> > The sysfs attribute has been renamed to report_rate_hz to match the
> > report-rate-hz property from device tree, making it clear that the same
> > parameter can be set via sysfs or device tree and behaves identically.
>
> No, this attribute was defined since forever and we should avoid
> gratuitous renames: they will break existing users.

OK, I understand.
Do you think patch 1/2 is correct?

Thanks and regards,
Dario

>
> Thanks.
>
> --
> Dmitry



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

