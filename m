Return-Path: <linux-input+bounces-1560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8238436AC
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 07:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E15E1C215CB
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 06:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E62A405D8;
	Wed, 31 Jan 2024 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbpj23tf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93656405C1
	for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682429; cv=none; b=sl924KV7M5zTvIq1A8iM96R0x4O4664kczCBwemu59JSYw822cqv6tLCJ5A+efZX00kdK67x3UdJs3V5txTzQ6pSUUW2wO+II2FTqZzK1/6yJWBUV/ujJAMV3VtPO7FQcYg/dDaUqFfTFmG0WPlOQDD3fdP84lJEn4ZdZqpfPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682429; c=relaxed/simple;
	bh=4DxgEHV2qTmEkeqF/8mayBmcLIJcXq5bI5YQV21iz3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hYg6UuCll5mqtOOQB22VbXUCr1471aGA0kD6CV/s9zyaIrQOOEFo+BWx31iGcKQHygg1TxiX0lgbHkYZgjIwfz7Zbw9P3a7yIo3FX4ZTojzZsB6O2j1d/6XVtzlais143+nX68N4++B/DS2+A3MT2A4PKC+xANoWL/5rLkJ/dNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbpj23tf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so674176866b.0
        for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 22:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706682426; x=1707287226; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWaZyKeLGRS2KPQ6AE1LzDAfNjq4+Gkbll2hjxwu5BI=;
        b=lbpj23tfb9usqlmrbVnRSRe+R4xINndiSC8sASyLmBGcShCm1hYeI0XeuNEBzdyCN2
         baTmzIaMAR5liCdpAdKmfYOHa3fbdvNGogjvassmUggj803YPlODW4mgw+WawNBi+JMM
         XS7Kvr7QptfwMtAyQfp7c8zXIibqWTd2/Db+2hCivXUaoQTY8pPuXqXmTa1oagtsJnHi
         JUgbGVzcWNmvYmVy1/pqyJRyghXDKnRjX/xFb+bErrninGAKiTWd5rDOVMIoE+Ok4+AC
         pTG/hafo2Rr1KX7gaA3AoHt8oRTF1zOE1j1MIYTywu+bExHxVnuMWsoYLTyuImd7iOS3
         bwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706682426; x=1707287226;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWaZyKeLGRS2KPQ6AE1LzDAfNjq4+Gkbll2hjxwu5BI=;
        b=cPRU0zNp4NOo+xJAHiyjBAkH/w6X6SfkOu7P9veqI+yGegHBX1dkh0B+/nAUncR2sS
         DgkpPTPm2Ol4QByohgM6JH0bS7s/9g6fqUWIWcKHPEX7mwkMXwF2oP/DXTLnbN9dJMWw
         W9ARynPJGqN0O82KqopRQ6kWgC24TqVeF2YMvf3TpNEsbEnuC0P3+0X1GQ4LBVPxD2Jc
         zs8jHCCDnFXEEDLupwmT5HFbNvOlnd5VEOddQCIUQ2AxqAUf0E2gvZwfREmoAYxjQFwn
         +QhQIyPRQyz+6vdej9LzR4V6CmpmzfFcN0yV2CLg/Ok6seF4XaG8HRlFYZajG9aq8Jxv
         uH0Q==
X-Gm-Message-State: AOJu0Yx55+q6j0CihyaS7QYkieDhoAZSGYYJqqMPSyJSkUVV01N3RtWz
	owATFOAUcX3Ky1xtp22Jm4MhtzF/rD0nhsdiGHeABEX2CTTQ1QYWtdVwo0UWJu/MhcF2jX0RZz0
	hMTbf1FK1AIuY/eZROBtCudcF/gn67+46jPM=
X-Google-Smtp-Source: AGHT+IEdUZG9ysQscXVw4pCmW1t+fys/Zr6QZKafNAuy5wA7gc87EcJkOE1hyx8SqdcP4E8C4f1A6J5QwM7/QGHC2BM=
X-Received: by 2002:a17:906:e28c:b0:a35:4663:74a1 with SMTP id
 gg12-20020a170906e28c00b00a35466374a1mr436554ejb.5.1706682425565; Tue, 30 Jan
 2024 22:27:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
In-Reply-To: <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
From: Taco Jerkface <tacodog311@gmail.com>
Date: Tue, 30 Jan 2024 23:26:56 -0700
Message-ID: <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
Subject: Suspected bug in hid-microsoft.c
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending without HTML:

Hi,

I hope this is the correct contact for this report, I found you as the
maintainer in the hid-microsoft.c.

I believe there is a bug in the microsoft bluetooth driver for the
Xbox Elite Series 2 controller.  I have been experiencing issues with
it that I initially thought were SDL related.  However the SDL team
seems to think this is driver related. My SDL bug report information
is here:

https://github.com/libsdl-org/SDL/issues/8907

Basically, SDL reads the controller correctly when connected by USB,
and if I run "controllermap" with root permission, but with user
permissions it misreads the number of buttons as 122, the first paddle
button on the back seems to act like the "screenshot" button from the
1914 controller, and the other paddle buttons are not read.  All
buttons read fine with evites, but the paddle buttons "KEY_UNKNOWN"

type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 0

Please let me know if there is a better contact for this, or if there
is anything I can do to help identify the problem.

Cheers

