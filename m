Return-Path: <linux-input+bounces-5331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770C947700
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 10:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EC62813E1
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9002914BFA8;
	Mon,  5 Aug 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6h4JZBB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E411465B8
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845721; cv=none; b=XuGSzfPSw3VW/tgT4c+DAGtkuzxUvZm5E2Q4L3n/QqjMBoe7ziyNxmwsMUfzQrwOmCmwlKG5avP5z82OnMDhSMIPAjpspQ+0d1OY9RS3pE81toxLrHWusGkXp60pkXUEkicEOTwxFbMmOys7rYN5qxhdaM13zvyuGhwXnAUlCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845721; c=relaxed/simple;
	bh=02dJS4qXgZ7UM0o8jJd4oCrkx+dEUwHVR2zreAtWCsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WX51RjfxFiZzqDBv38sldlUBXRXINGncU0bCqkh38eoLIY3FTxV4owK7y0WWX9Okb5y80NVbO7n+jaMuLSPYk1JM+xLReXIKz/ypNBDChUnmrp+zoUjs73ynOxXWKgWNn3hQxGcL2l3uV5+RawbHB5diQd51fIkGTlhZBvWiulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6h4JZBB; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso143193971fa.0
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845718; x=1723450518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02dJS4qXgZ7UM0o8jJd4oCrkx+dEUwHVR2zreAtWCsE=;
        b=j6h4JZBBTZI791iFUHjyI6jaX2iJSgP8AMdbLh1J6Mmy9QUviRi2+x7jRemilicTMF
         5PUKJCiCL3D/ZDZYDqOVBgh7WMW6XT7yRAjvNkwf1yiZ1poLC8Mll8M8+IMsB9RshxzC
         6yREv5mdcJNsHTEnDN9So/iks56AKLoILJ+cGAq9lm/bD0fPkkx1BwHl1/DZ7uwXztx8
         pQcblzxVkApqPD0JwnUJAD9e2cWCpDNZEaNu4coBxFGavlhcTvx9XAdW5dO+4pZ+n98G
         YLQGQ9tUGHv4pSJ8cQZ9eP8qSo7kY+wc9r273z8Zv6x4VmKBAON+b+L4tROi1a9PoUZk
         +CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845718; x=1723450518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02dJS4qXgZ7UM0o8jJd4oCrkx+dEUwHVR2zreAtWCsE=;
        b=m3xBa1INI6s5SSA+FTxUW9xUTjtqGGcL5b9FDHDuhgpkcPyh3D8pRvSRlUAOYjNp/t
         n8AAFBH3bqEDA+DGSTK0Ik0rFD10/o3td41PRl/wQ+kmEPmbue+/ZfxpRyE7+Zt0Cyzc
         jx+ZqTBCo64VuclOeaP7jyzZRl5GtozlBOoPuLGSsm0oxSn1JFkTnsPKZoec38ZCS0u6
         lj4/UUy9vlDsLqAO1zWFUoPqkaq3GggrtoBJmljqReOQMgIYywgPCw+Rrpj9tA/FPH5b
         jvuZ8hOp/KqMpxki1oH0AbIIy57Fz5BJdCY3JnOFDsH+dZ3gZz1eg89+UxWHrsTyZXMI
         sb6Q==
X-Gm-Message-State: AOJu0Yz2svSTeRawipnXRFY4T6qD8AQrn58txo9O0E9rD2ek4OXyc9dq
	Ux1VYjEv86+99H21R7fCX87fRfv+zILbmIt+8Xd76YvgdDwXZtEszyh8MV2F7XPMeWDhpTTxfCM
	mQr5pykn2EqZ7drjYeEyuVAgLIIwy7FZdlNikzKDv393kyWfe
X-Google-Smtp-Source: AGHT+IHFE0asTojEFyFN1hGyYypB+vCuvfehldI0nMe6gLGypRXLEqVOtCDdu7pKwvSU2t+ghl8CRCYzleDZzngjytE=
X-Received: by 2002:a2e:320b:0:b0:2ef:28ed:1ff2 with SMTP id
 38308e7fff4ca-2f15aa88cb7mr87559091fa.9.1722845717523; Mon, 05 Aug 2024
 01:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrAaHWNvaAfDlDfI@google.com>
In-Reply-To: <ZrAaHWNvaAfDlDfI@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:15:06 +0200
Message-ID: <CACRpkdbv63K=Lt2d27R0ar3pK854MUgd77NLR5Z5Z4AHoUrPSw@mail.gmail.com>
Subject: Re: [PATCH] Input: ilitek_ts_i2c - stop including gpio.h
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:17=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The driver does not use legacy GPIO API, stop including this header.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

