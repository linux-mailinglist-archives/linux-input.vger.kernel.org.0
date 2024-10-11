Return-Path: <linux-input+bounces-7360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96A99A2B2
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 13:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7F71C2271E
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A259F215F7B;
	Fri, 11 Oct 2024 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnrKGWWF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD90215F76;
	Fri, 11 Oct 2024 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646138; cv=none; b=XDcoaxEPZQSNw/GhkFGtR5l/PbP0SXv1F2Mgd8NBeQGT7dvOO+Pe6DnZK9XXaUDpROHBTjOFFwifg6l36IRsDSJx4ryLxZ7nMmIzmnBUv/4hNyWRyhHqLoWJdlNjMdTUSRlxt2ShifGr060m8X9DMhBzGSsw+da3R1O42/yNKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646138; c=relaxed/simple;
	bh=GgBdKZj5b5Cw7VBmE28q+2hXK+ccSbU/BebsShCtnPw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=A8QDnsgBR1CsafXcCV7L1CX1PIiEV4sLFpA3JzNcefNSbbBxywYzdD0RAlFJfUqiiNo3EDZ+A8x0PvtsaG+zZy0bKYP134vCrjJ6tkCwhVtTxzY3Y4hrJ88ykRr35MaN298MSjRI+WmZSDFggcsMXfAFYIcGVRp4I7LJlZWRQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnrKGWWF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso789088a91.0;
        Fri, 11 Oct 2024 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728646136; x=1729250936; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtMGOeknI/GUD3P2TAt2mIiZv/wehPAwyVMjpNzsS1o=;
        b=KnrKGWWF5P5bOaQTOgpiqGpJORjYbNYoWxi6/lLrKX3ZdJS2//H9Tfq46/EyYdfwL2
         r41n3A4dOYxzftaFzpRwPS35Qbgmj2n09wZr3PSwNLGREUVrS2pz9yOr5Uq7MiRAsU9N
         i3mo3o1S93xQxrvZS3gdW1mQnl/pRRu0F4xa7AQ3zKlRrZ1ZuzA2c6ipJ6Ej+FA41oVt
         yjVkR9ELiPoWEB2c8BvQlvJ8ZMLsYrAm3+s3vUeR+CYebACnto5NpMMklbycsEi9vBHZ
         umXH3bBNVyWKtCjSEnffIPlRJqbTkwqtQ63sHTAXnv9qFyOtLTzgYH9hJUrmTEwxSv+s
         /RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728646136; x=1729250936;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FtMGOeknI/GUD3P2TAt2mIiZv/wehPAwyVMjpNzsS1o=;
        b=r96qAHJwz/mk5zterYBQO3sKW07PTCITvopLIteMXBYDiQ4eO3aoyMteWs433rxixz
         4P0wuqClX83g04otW+VyORkh7QxLno5eQPkgEdQGiYzTgQ4o5yhCpJ9qcF/04lgXXsVh
         PIJqH3B5VuD7KDBLsLu+ZfZxqoTtLa+q0iDs2Lue3ZeyzLFORqc+tX0QukvF3XJ0/fp3
         AG9PS6CC8AatILZkuuYesm9q5aK6JcGy5kHkXeAhqWWLROWnWwBoZfoDAkT7A4dRiHlI
         iYf0pEhGUleTNW8oejTRXdLCkaLTAyYgSFAsQdXswYcpSFDF4lYYy3uPbFKFgPIC4vTO
         eRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJitqERa9DkK4d9+r3T9248OsYHxxUhokHMMlGzrYPsUuhZqqZdmuQxU3nRhxY2YVeCKEG82hsmNHEQA==@vger.kernel.org, AJvYcCVieDWyCH3MURkJJ1h3exiUo90kNBHjkbBz+4ntJCLoltzvYzAgH0gxakkgJ0YXOTVa8JFCGGK7T8oLeh+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw0xnZ10VwHg8g8bu8Yw1uf4/k+yOZiY9Rh4Wrl3GN2Cwvxce8
	VzLKWTCBBc5cq9g9ewYCUA3GZL7HHFmu9vRt0IMe1kE2dg8PPH39
X-Google-Smtp-Source: AGHT+IHbwrwpRxUcRd7FpYOTq9kEIBl+bXIw2XHRlM96zTS/ROKUqgUd4cgcCw9cFdnJUO9yhXmPAw==
X-Received: by 2002:a17:90a:ce83:b0:2e1:89aa:65b7 with SMTP id 98e67ed59e1d1-2e2f0a62d34mr3352008a91.9.1728646136355;
        Fri, 11 Oct 2024 04:28:56 -0700 (PDT)
Received: from localhost ([2600:6c51:4c3f:8886::b19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a55e0c48sm5356358a91.2.2024.10.11.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 04:28:53 -0700
Message-Id: <D4SXWUKKJI1G.A7QZ3B0TYHK3@gmail.com>
From: "Christopher Snowhill" <kode54@gmail.com>
To: "John Edwards" <uejji@uejji.net>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] Input: xpad - add support for MSI Claw A1M
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

As a once contributor to the Xbox360 wireless driver, who also happened
to botch the SoB address and missed a CC from GKH later...

Reviewed-by: Christopher Snowhill <kode54@gmail.com>

Also, feel free to be the first to submit a hw-probe of the machine,
since there's no MSI Claw reporting at this time. Guess not many people
would be interested in running Linux on a machine that didn't yet have
working controller support. Thanks for that. :D

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


