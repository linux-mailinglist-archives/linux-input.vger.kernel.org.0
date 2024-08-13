Return-Path: <linux-input+bounces-5553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA8950B61
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 19:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E1E7B2364F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 17:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0101A08DC;
	Tue, 13 Aug 2024 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VTuhrTWL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D201A2C1E
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723569993; cv=none; b=IKZpapBKooj3RjVkwkOjrC5GSo9CIqEDxrxmB3JQdJGW/imGZJ/mXpMb+7rlZwmNkwz7KFvZlsd2T5gxPlrDglMwkaQhkK/WEIZELZV9VUdrOWS4Ypqpf0z2wo6KITMW5uEwaTMc4ANQaagshcG5wGTuM5OBwjwGBRNH4UQ0c1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723569993; c=relaxed/simple;
	bh=g5luCYPRUnOaUTfxUADhYc+LBS38OEZ8tTN4hBNkyGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/EWu0KNyOxhaPnb+tjSJ5VObmSegbKUpXKI8E15hL6XvzSSwaGg/LtNr0lWoGelWCBabDQv2nk5Z4bnBe+eCJnitHvZKE3tcTUptLlCRJidrCFEE5Su4nEjZYq2KLWWZCO07Q+YO08ETzcG1kNca3r4svqneewjUhQlpqmJqes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VTuhrTWL; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5d5f24d9df8so2810353eaf.2
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723569989; x=1724174789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL1n98BYjvpNXBfsENT7L2FFIE+k6G4EwDvpPJWlOW4=;
        b=VTuhrTWL4E650nsOLQ0zA3gPpMl9ERZxKgDzD78KJvE4BCycWu85EQx7XViNID2CSR
         vQ8L6svdZcJEt8rKcHuhDQdo2njnt/7GLMMpQHe1voKHv079DDHB6SWCVmmpl4grEPPJ
         ejlyBWzvqnPPUWXBizkdWdGtVlnScAj1N9vDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723569989; x=1724174789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cL1n98BYjvpNXBfsENT7L2FFIE+k6G4EwDvpPJWlOW4=;
        b=d3BHllyeWZnZbkxkmvLgg/6CgtSC1twJPbJ1/Czopba9g0wz6myLmQ+/DUDmDPxuSl
         EZvNtF2u0gzGmF7HUEedQakvIBc+ajdGEefRK36tEkcSlzOPZnZb8YMz5wscsr4ZBDDT
         rGaZ0byDjhHpl0OuvcD6RJ9Mzj/1Tdr4Q5mWfV3m7d4MH5Fjt/3V8We+dsfWd52uyTGV
         ZSthDEcoX+5oH9L4h6ual688afIokxAdGnXI7WEL6k+rblEP92iN0ep6xkAIX5mulVxS
         cl6vf1MuhmTlheSoynsRk8BNOEPa041QngQj0+FkcUs8NWIWCH9oyrfpVdlzljgR4xZ5
         kzhw==
X-Forwarded-Encrypted: i=1; AJvYcCXOwIYMEg9337sOE7juANtmMIM3UGO6phJ6m4ofQzUWxdf6d9L9aI59GJPyyZw79Rc1yg+MKHT/ISp9w83xsXYDSvNhbUqPHX5F3D4=
X-Gm-Message-State: AOJu0Ywyt1/PPPmGndhsuUUu32P+8cockPTB58S3zX19BX7VsVOoMF6b
	SOTYM5CKIXfbtItjQ++IaYNbUCCofXpi7/WayntM61MiSmVS1+4ga4mK43W+kag0jwkjbzDVE88
	=
X-Google-Smtp-Source: AGHT+IEQwEi+x1ELnM7diN24/W1o1yjiR57xdU+GLqCLS0SBU5HvXdqH62B514xHdW/RKJUSLgwhRw==
X-Received: by 2002:a05:6820:60c:b0:5c4:57d:691e with SMTP id 006d021491bc7-5da7c68f3acmr501883eaf.2.1723569988918;
        Tue, 13 Aug 2024 10:26:28 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5da3e53e167sm1743593eaf.5.2024.08.13.10.26.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 10:26:28 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5d5af743b8fso3045221eaf.3
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 10:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtHllj/n9mLRY/nNdV5PE4KclW+MdIwHuaOrlV1lSGdDv1jkBE0aeUVI6nsMTXz9pp567dlRqBVojznietDL8k02a3pkIdnpt+rBc=
X-Received: by 2002:a05:6358:989d:b0:1b1:a8fb:4600 with SMTP id
 e5c5f4694b2df-1b1aac4890bmr14711955d.19.1723569987284; Tue, 13 Aug 2024
 10:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813133612.49095-1-charles.goodix@gmail.com> <20240813133612.49095-2-charles.goodix@gmail.com>
In-Reply-To: <20240813133612.49095-2-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 10:26:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7rqE+sSbspo6b0un=FbBcxgS24sKLUZ+NTkOdveJObg@mail.gmail.com>
Message-ID: <CAD=FV=W7rqE+sSbspo6b0un=FbBcxgS24sKLUZ+NTkOdveJObg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com
Cc: dan.carpenter@linaro.org, conor@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 13, 2024 at 6:37=E2=80=AFAM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> This patch introduces a new driver to support the Goodix GT7986U
> touch controller. This device is not compatible with Microsoft's
> HID-over-SPI protocol and therefore needs to implement its own
> flavor. The data reported is packaged according to the HID
> protocol but uses SPI for communication to improve speed. This
> enables the device to transmit not only coordinate data but also
> corresponding raw data that can be accessed by user-space programs
> through the hidraw interface. The raw data can be utilized for
> functions like palm rejection, thereby improving the touch experience.
>
> Key features:
> - Device connection confirmation and initialization
> - IRQ-based event reporting to the input subsystem
> - Support for HIDRAW operations (GET_REPORT and SET_REPORT)
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  drivers/hid/Kconfig          |   6 +
>  drivers/hid/Makefile         |   1 +
>  drivers/hid/hid-goodix-spi.c | 810 +++++++++++++++++++++++++++++++++++
>  3 files changed, 817 insertions(+)
>  create mode 100644 drivers/hid/hid-goodix-spi.c

As a point of reference, in v5 Dmitry gave you his "Reviewed-by" tag
[1] despite having some nits. It's usually expected that you could fix
the nits and carry the Reviewed-by tag on the next version unless you
did something other than what was requested in review feedback.

[1] https://lore.kernel.org/all/ZoW4_hctu_cSiKA5@google.com/

