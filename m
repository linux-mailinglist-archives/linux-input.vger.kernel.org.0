Return-Path: <linux-input+bounces-9466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0ADA1899D
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 02:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D035318813A9
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 01:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2AD537F8;
	Wed, 22 Jan 2025 01:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpCNPaCc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA84C9F;
	Wed, 22 Jan 2025 01:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509893; cv=none; b=c2Cnb7ubd42tlzV8ZXj5nslLFiYBZJUHAM36ualLGULqXiWYunU6DRxFMkjGGHQQ+tkoHK83AbH2RVZIIhBjYbS84l0ILQDzaR5pLrqTj5Ve34sBUBcJQj1udIT83BjQcSpjhe6vQS7CwRKgR9ek0usSIs69VJUdr9iiBCHxmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509893; c=relaxed/simple;
	bh=Lz3SIHYMhgXydOym3yn4en99rQ9JPIj1a2EG5Pb9nGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRgsFyvgLXA/gftGtg2Af6clXY+fAoi584TWgRJcMuzuFHwL7+gWuDjf4IYQQHBag+bsoCE9NoHwBiC4ADp4K1w+D0aYp2gVC2loXCkRaqXQ8wVPSKpXsYVzkycLnsZ+2nLhNL5LyDNnGh/xCkBQVBElze0dF2LTyyoFqr2nrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpCNPaCc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so1124973a12.2;
        Tue, 21 Jan 2025 17:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737509890; x=1738114690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNlY5IyLUoZY/2/Y/gPJNlKOMRUsYZcyfBDnAIjXeA=;
        b=XpCNPaCc6K8mpdY7DfS5oGsl4zgHkAUyMs3L6+4qu97O9PJTamFE0CE5llvMQyrKG2
         /VsSqSyWB8ix6FQqKlKx04pbQ7SgxW3txQUEcvHMNtzt4MZ4iXEhRpgJfz9q3OJyJHJT
         lZCX9bwqbE17ziGuF7LIpnrqnLChkZN2+ywmTeqNXCawVIfpAnYDRvDMJC2kxECfEPKN
         RaHFVX9bEKl1IIcFxlLM8qCB1dmJpnU2TQpFUVq5uXTX8oUlymGSQW1jv6HBRq8fWmis
         DDsCUefn+wKadx4R+URJVM/l8beFhYnsx9OT9Rt+o9OxQlpj8s7Awwuiv4ZDiBGhI6Pw
         mGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737509890; x=1738114690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SNlY5IyLUoZY/2/Y/gPJNlKOMRUsYZcyfBDnAIjXeA=;
        b=g4d6nu3Nss/pgGwZRTd5Gc+Ou/tjI+fFcyRJ61Ldkm33pF/xhvK6FwIc7MVjlK5/93
         USdPWUyO8RATBBTWPz5pywZHM7ak/R8ScMRVXLvEOjyk8PAD/Gp/tN0M7E3OKUczOLPI
         m3GQ2yk9MiD4KwMq+0CT9JhTLIXWcwi8ur/O270BuFjrQEb77W4poTgA3bgXKOTFoaYZ
         yRhz8kgN3MwDTtxSygLG0aEUWuViPARQaTX6XZQb/ACrxTGyjuvGLhaP4nZ8DrHSiyfa
         OPqrGvmwusdEq7R79FHDogi9kmtjKze+e/u430LL5Pz2tdm/Oijt0pvWEBNvbPCoLih7
         ujwg==
X-Forwarded-Encrypted: i=1; AJvYcCUV3isVc75pB5tUCgth1xlnAQjDUmcpZOtlEF3fXbws1qxItCVHPFQqX0ZBHZEtd845zqK3mp3uiXqb@vger.kernel.org, AJvYcCXfGI6IaNc/ulRNdiIf310IcgO0FnxhAXJce1WNzEHjzrH2QzFRsTRuq/uo04d+58BfIdd04Bi/xuHaew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxevCj3NzoI/+059IDoMr9lkChpl/lkh5OR+uh7wo3eZx4aIaC+
	J0RiMrsdP/xZBTmNof2bKkqDSlJ0QHw/3MD5aRimCGlVde3SexsaBCeY5uCaLImGPNz2u6iWU4x
	EfEut5nttbqHnxe+aa8RWLGOacWEDz4P2yCA=
X-Gm-Gg: ASbGncvAuOQu46v3Sj1VvlFrH1aMRoYDOHoFc1G6X1JdDu/OR7EPzQS2jJBU2wIaF1y
	AAR9WHgW6DZrD3+ZB4Xiu+6r38QYKhEvQrDg8+ZyGJlRSsenQoQ==
X-Google-Smtp-Source: AGHT+IE6DH7B508BM62qIX5G8c6AJ33gYbQwGBbj23shCIH0ucA/PwpyprMXVVkirk0jyssrpZkcELDElbgZRE7/MRM=
X-Received: by 2002:a05:6402:274a:b0:5d0:eb6b:1a31 with SMTP id
 4fb4d7f45d1cf-5db7db1cd8fmr6322330a12.5.1737509889713; Tue, 21 Jan 2025
 17:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com> <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
In-Reply-To: <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Wed, 22 Jan 2025 02:37:57 +0100
X-Gm-Features: AbW1kvZS9PKsiLrP5Mv0K5WyBg3d_m0JYp5JqlO2y8Lt6VGil3Z8E1pe8ohfnOo
Message-ID: <CAFqprmzGukRpTqQs6EAzL8wQhnDT2dYaE5adOGdoDXM7FSsOMw@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] HID: pidff: Stop all effects before enabling actuators
To: Oliver Neukum <oneukum@suse.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2025 at 11:10, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 19.01.25 14:13, Tomasz Paku=C5=82a wrote:
> > Some PID compliant devices automatically play effects after boot (i.e.
> > autocenter spring) that prevent the rendering of other effects since
> > it is done outside the kernel driver.
> >
> > This makes sure all the effects currently played are stopped after
> > resetting the device.
> > It brings compatibility to the Brunner CLS-P joystick and others
>
> Hi,
>
> it seems to me that the same thing would happen upon resumption
> from S4. Will this be handled?
>
>         Regards
>                 Oliver
>

Turns out, the whole pidff_reset function was completely wrong and mostly d=
idn't
do anything. Is some edge cases, it could maybe enable actuators, but
as it stands
pidff->device_control was treated like a field to assign values to,
while it actually is
an array with boolean fields.

