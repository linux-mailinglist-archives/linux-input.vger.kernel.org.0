Return-Path: <linux-input+bounces-10835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B81A60F58
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 11:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104673BAA43
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 10:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BBD1F03F1;
	Fri, 14 Mar 2025 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ts5UoW2Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB51FCFDC
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949637; cv=none; b=qy/Pxe0rnQR55Bj0bWq+NlWSgI418ECuSQpSFInnS1c2EdsFdcJzx4aKV6UGCKDhEgrg77Iy8VfUGKuNzbt9mWeN0LIxcqnuuXsD4DLxLFUuI04+HWiqPednusLmyxXmrMgEOxKrihBu+3aVk/mmgNfB1l6w3VLWi5nZ7lNbbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949637; c=relaxed/simple;
	bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfJusfPWRRRYoY+p8qZVcgKA7vyfblQx7+LkrN+BngoieqHZL/Pdga10sXDa9rMeDYZkPNFFoyZqRyqOdNY4LqLf7T2VTFghp7Ds5cSV8HD2ql3G0FaqLEkgDYmFn4lWmrs/n8EROrU7keCqIIz6+GydBcGX9R9IbFdeXtRIjWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ts5UoW2Q; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2394026e87.1
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949634; x=1742554434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
        b=ts5UoW2QyXh5vBfN5rcptPygxva1UOMQcvJJl3YF7SN3js9KkNVcC5CSs2I4yR5WEC
         nkWFW6y354+sOI5aep1y+kapzuDq1dPCA3Vp/Rt1kd9ckl62vom5aWk8c1J9yvxHvPo6
         /+6M1EgwyUiDAQhDFGBW7tDzrrJVPmuky6/4T1ecyG9tmk4MGyzuUgYr6S+urcCBLny5
         Umh60qOF0XoRFlEtUjaMY1MFLsaT5BEbeuuQlF4zmzpkCaSNKFKFdUENhS/woA27wdPb
         zKyquqR4IZwQh2Xwglpa8p3SX52ZHbk5x9+nz3JIpRtmL9TDVo/JU8hIPpkEsoRmtHsb
         r6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949634; x=1742554434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdjrUj2ENKDpO8QMmgpWcHwmqWwffwTY4fDD4PrBuM8=;
        b=ReHV0ocYNKDzkIjlhV8CKhSbEYOWw8Ub7ghqk11w/ENyz1pl2bMl/176zmd3vgMvEL
         98qzsw7ESmFlHjHTGrA59YZHQNG1FRjIS8W1qsZEBH70n2JAyj1rFg7jHJfCq6uWt5S8
         XtZQH9vHXP+7rnCAL7A2bP+XLkGu04ZMcOo7HYhAZLVWoIlt0WGRvphx6KTFY9xWvd/p
         D9liccBi0ft8nKvAfMvHoCpiPbTFF/aY9WYWytpS3rhkr60Rgp2uhMQUjQZREH1kLwC1
         741rY0LY8hZUcxMSZGE/OvRg0uVoXS7AA7sFtK+RlsavVKZYhL8mdGo5sgm2yOsLTHFN
         Tyhw==
X-Forwarded-Encrypted: i=1; AJvYcCXCRj7IjnqhI0mDSiKP/1poZs8uEwVmeePeCwgmAf10vAVhM2ahhJY7qR01NVBKro6MXYvTxNSMXWXeHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLvGf3NHEwpEwei90NA/hg3X4QurkXDGSFHnIix8RiwHgLGpE
	FHbdiMraIB2OfX5/aVuvT9R9IEKBkC1LJooLbN7mLGuzwAnv4T8emvB5DVNFfDmnuVoJK8GbTIG
	xYI/NRegUjNDmS9cUusaFX7jEzPxjGmmAT7Cn1g==
X-Gm-Gg: ASbGncup343tSliqG+reLIXhmi1pQo6nBRBrt97Eb8VXdng6htq1e18C4W22jEOkhP9
	PMfXWj+3r2uqEkFU1MiKZgFpgDQjapx80j4sq+7U6tj26F9iWeVaSlyVxYBdrSLLD650L0dxhFB
	DqeVm+rhIKmqVW5HNWWsWkr/uM1iioC0sYYA==
X-Google-Smtp-Source: AGHT+IGyZcjGQVRXdmPf+HFRkYlkCyfk9cxA0ikymLJVaBdq4csHhKzWdrWNXA3EtIAdbabIZKVRbXn3G++rpQeYfIs=
X-Received: by 2002:a05:6512:2350:b0:545:2b24:c714 with SMTP id
 2adb3069b0e04-549c3911e6bmr776230e87.18.1741949634058; Fri, 14 Mar 2025
 03:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-dev-adp5589-fw-v1-0-20e80d4bd4ea@analog.com> <20250313-dev-adp5589-fw-v1-7-20e80d4bd4ea@analog.com>
In-Reply-To: <20250313-dev-adp5589-fw-v1-7-20e80d4bd4ea@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:53:42 +0100
X-Gm-Features: AQ5f1Jos35lQGGapvP68CdJghmgF62TRmPj48uDq9_6LrGBWABanTI3P7iIbNwU
Message-ID: <CACRpkdZd1b-D76n2oYMwg79BewV70FGaNcxbYfq1GDGOHm_BDQ@mail.gmail.com>
Subject: Re: [PATCH 07/18] gpio: adp5585: add support for the ad5589 expander
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:19=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Support the adp5589 I/O expander which supports up to 19 pins. We need
> to add a chip_info based struct since accessing register "banks"
> and "bits" differs between devices.
>
> Also some register addresses are different.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

