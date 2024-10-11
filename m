Return-Path: <linux-input+bounces-7367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B317399A447
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 14:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6192628543E
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 12:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811F21858E;
	Fri, 11 Oct 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ate7Vk07"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D2218D6A;
	Fri, 11 Oct 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728651588; cv=none; b=UWli9K42WIpXJ4aKRwwncL+RlE9aeYSZ5fkaA75QqoSbdXoTiJvI0KkcUvb7Knc2UqK0OXmb/6/YyA4MQg4h4xCdCwD6s13FblsvnXorLCVeGMcGRTFyJGsEaLcslmJYSCo4Aggjn796yC05NHNsWg4DoRqseg521vlhg0qrHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728651588; c=relaxed/simple;
	bh=zJji73vQPQjjdllOwp1GIgkznEC5tEAxyK776Syuxqw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=n7cKhnxZrCJa9ZBZI6OVGMX/5zlGzxMxpgRes7JXYvncAV7LagkwbixhLKUBgHbYFbHHs6CIOGzG93UbAYftiuv6mA2w2cIpGhZxImTIInj1bRmLbGjlnfQCmmdk9PGJeFEGJgPUIQJkSAWEwcnoQIYH1LbhP9n7aqBF4sJ1RoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ate7Vk07; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so1756830b3a.2;
        Fri, 11 Oct 2024 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651586; x=1729256386; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMHj9QgZWz/4wdSSYdaInX5JeYDfd1EUXIF74GbVMX4=;
        b=Ate7Vk07hNKoKGSEtFKg82albT+ddN3ZS5bM08L5/9eihCgK+a8fkGjY8mQRCLIUmf
         3ywxAmJfofTQXwqtQ4CpfjZ+Kf5xUwCLR1/nTSVeKFAxRTGDybH0qyr7huakVVISw074
         JeFjYLY9cYoOtfWCYPlt7qcUMLlhe493eiM+dmoQo25IDXctLjiksDTnstOCmnV4HrMv
         G9LktDnp8mslsk3lIJjhr89wm+TrpqdWaqJrTbtKPtbxACxzMBoKi1qgvu9znpUkfGUr
         Gsgmfr6eaiHOlp03BiLCXVZFj9+JT4NmafWePpcDtXgRTPEqZHE/ektoye7nedq2TxEU
         rJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651586; x=1729256386;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tMHj9QgZWz/4wdSSYdaInX5JeYDfd1EUXIF74GbVMX4=;
        b=UT/y9sjxksDgWVtaD6hSJQNIyA4/Ssx0yOFRs8Y0hqiInWgz9KrvBIFTWotOCia7xF
         tZ5J33v8ucwdVAtqkKIqs0idfiyeR6TwQ8J5THvUzEYvbCy0aW1nVxcFUDYgu1w3pAEs
         4jf+k6g9DhfRYFSQNIFj0oV6ROSzPWnizNKlksEWjzLv3CZwmf0SD+Q7fqLCaE/MAaQX
         XqtIMWMz+KlCVBpOkIxfMAU/rP5nWjHB7DKv6fbe6XCrohekm3JLueE6he5oWrh7gttk
         BvXs+n7wU+kzy7deEvBuZDcMdg/NpkE4WDHVLkFkgu86cusugQw+vR+zu5DqmEsw+lHe
         3QpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFHG5nmCCVkb2rJ1KCC+572bAPPkXWGRwssCcNmROmOwRfxiRV7TKs5Ho4dEZ9EPboMiUnP17diMpQFZY@vger.kernel.org, AJvYcCWrw/wTGZnIs8I9cOzWpoi+aLL78JGQu7kNq3lkcDuNqG+rI7BNFYviSWPX7iAHW5VkkLRktjECA1r5Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+/f/DiYRu9qM9YVc833L6UK/rsuGQTeD2dGz1kQYlfZXDUbW
	vl1d5FNUhyIziVp6vwoUoZTNYFnG7pCWgT780F7yLuWyOIkr4cCRSanLdukv
X-Google-Smtp-Source: AGHT+IEoVIvXrUVoQSfmpspSNOUJ2G0rUIAIERSQdMipbXdV9EywaGyK8upKQ3vx3GNKO50XDKdRYA==
X-Received: by 2002:a05:6a00:2e85:b0:71d:fd28:70a3 with SMTP id d2e1a72fcca58-71e3809044emr4578241b3a.24.1728651586387;
        Fri, 11 Oct 2024 05:59:46 -0700 (PDT)
Received: from localhost ([2600:6c51:4c3f:8886::b19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9e9709sm2535227b3a.20.2024.10.11.05.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 05:59:42 -0700
Message-Id: <D4SZUDRTK0LN.2I9S7T660S7IM@gmail.com>
Subject: Re: [PATCH v1 1/1] Input: xpad - add support for MSI Claw A1M
From: "Christopher Snowhill" <kode54@gmail.com>
To: "John Edwards" <uejji@uejji.net>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241010232020.3292284-2-uejji@uejji.net>
 <20241010232020.3292284-4-uejji@uejji.net>
In-Reply-To: <20241010232020.3292284-4-uejji@uejji.net>

On Thu Oct 10, 2024 at 4:09 PM PDT, John Edwards wrote:
> Add MSI Claw A1M controller to xpad_device match table when in xinput mod=
e.
> Add MSI VID as XPAD_XBOX360_VENDOR.
>
> Signed-off-by: John Edwards <uejji@uejji.net>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Um, I may have erred with my contribution of a R-b? Do I have to test
the patch on the device in question to review it? If so, I'll just Ack
the patch as looking properly drafted, and applying cleanly. Sorry for
the noise.

> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 4eda18f4f..9f44669df 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -218,6 +218,7 @@ static const struct xpad_device {
>  	{ 0x0c12, 0x8810, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x9902, "HAMA VibraX - *FAULTY HARDWARE*", 0, XTYPE_XBOX },
>  	{ 0x0d2f, 0x0002, "Andamiro Pump It Up pad", MAP_DPAD_TO_BUTTONS, XTYPE=
_XBOX },
> +	{ 0x0db0, 0x1901, "Micro Star International Xbox360 Controller for Wind=
ows", 0, XTYPE_XBOX360 },
>  	{ 0x0e4c, 0x1097, "Radica Gamester Controller", 0, XTYPE_XBOX },
>  	{ 0x0e4c, 0x1103, "Radica Gamester Reflex", MAP_TRIGGERS_TO_BUTTONS, XT=
YPE_XBOX },
>  	{ 0x0e4c, 0x2390, "Radica Games Jtech Controller", 0, XTYPE_XBOX },
> @@ -492,6 +493,7 @@ static const struct usb_device_id xpad_table[] =3D {
>  	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
>  	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
>  	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
> +	XPAD_XBOX360_VENDOR(0x0db0),		/* Micro Star International X-Box 360 con=
trollers */
>  	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
>  	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori controllers */


