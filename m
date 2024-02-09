Return-Path: <linux-input+bounces-1800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813F84FCD3
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 20:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A3E11C245A0
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 19:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5946E82862;
	Fri,  9 Feb 2024 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ddSupYo/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A582D7D
	for <linux-input@vger.kernel.org>; Fri,  9 Feb 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707506864; cv=none; b=Qjlpj2tKdr6a7AX60a7AishCLowDrm1jmY301QN+wUnzlZ/IYOu9erNGQv1J+K+MTbCRyWOG+UnWmn/kihPDtlV3niILXO3D9TAnE43DqrydFYCEiOOC17fvSt89d/SSUhl/JFi1wdpFWmlXdZ9K4wmovsR7h0jIGNnCrm8Dw1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707506864; c=relaxed/simple;
	bh=0v6ED3snAjxM9vFfXv0XqE6tPOrUqXYAeIs2qAsIJZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4eIh0dmxQr4/WRDJ0msX2rMdTn/SLMINo7ksVU/scS1G5K8VGiOet6bPzd9neaVKdnarCVmyT9h3bCFbjvhZ3aKoaCwERqiHnakxcoJ0BqtYnyERr1Jy1GSfoh04O8IyohwzvtVbhkm5sZI9ysP/tEi99pOM1YEPPxknR0B2d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ddSupYo/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so8189945e9.0
        for <linux-input@vger.kernel.org>; Fri, 09 Feb 2024 11:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707506861; x=1708111661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZXVPA2Exz3NuK0lyDvz1cz+iATc7pFXb2hCpSkFusk=;
        b=ddSupYo/lu4X+9x1c37MnfTqIDbW8wiFUa1axTjUpQT9LPkkq9w9IylH6NGvfoILNu
         RxOSWvl7e08nolXYGiWwNbU1eFsnKuB6lAi11aytPcgf9rbW8lUmNRyX9HGGRDHx3cJl
         HkZ/Txwa3Wl9nmncke74Y4/gboIHBmacmFVyZrWkFnyRDVVxfM4y6KoU0+4I5pPIUGcz
         scwIu3mXMV09WMPZJso116IANBWSP+QANJYEstBCTVteNT8YrlqXT+xnZrB6AFTMk+Ov
         PDWUj4w5iqYD3WgvAGprEJHTYrkk3QE9WFPX71iEedkxcb6eQvRuLpITOoY+fvPUg7wp
         6WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707506861; x=1708111661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZXVPA2Exz3NuK0lyDvz1cz+iATc7pFXb2hCpSkFusk=;
        b=YV5NIotF8BP4CmpL4q8NeG+S0i+esbvMtBTvVfBqSoc3oLc0ucZrc4J0j09Za1Vciz
         +LehvAmB8uumE/j5oTC3Fg8zwbjW5cUg/SYILZR1ie6TSAjFezcgzh9oH790VBh7Lh73
         b2Ilwnt6xTsNbNXuYIfUwL1/8NG0kknoqCgzGuSbhxC8tcmH58vdyhykERFYfPUyokJS
         W93apppRZrRuaUrqRJUZY0js/daFect4Tmly91/2yW9Pgi4wARGduTdshBfrDecdFxbl
         65HF6jlO4xSnBE87xJz1GbD1YsdykmcZWHc3DPw4GmQEKc0ZbVz7r0SDW6+1wHNtl9QC
         4oyw==
X-Gm-Message-State: AOJu0YyeMyXJgDGVkFauWKM4L16qIjzjifyr9HgQEEpVBZIjun32cnBD
	RdraoiYEjEFx/RwnuMbAgEoSIQTXBkqjIlYDdKQ1B0ipeOCNI2TYFtxAPakJspLCbUA/DyTNmA/
	1g5xWH4ZUFD1eqQ4XtOLqYZTpWPGQgbcWQd7P
X-Google-Smtp-Source: AGHT+IEscmlZlnhTQjd2k6sf1c6n8zUq3B0h5Io2bVrrApwOwkAIiu7m8z3rcBwyvKP8/ZV3CGJXSuTlKQbPPleK0ds=
X-Received: by 2002:a05:600c:b89:b0:410:8842:2bdf with SMTP id
 fl9-20020a05600c0b8900b0041088422bdfmr73952wmb.5.1707506860962; Fri, 09 Feb
 2024 11:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zbl49VAMZx2qrz-p@google.com> <20240130231903.293265-1-appsforartists@google.com>
 <ZcZ1Sn_iPwlgfI3s@google.com>
In-Reply-To: <ZcZ1Sn_iPwlgfI3s@google.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Fri, 9 Feb 2024 11:27:26 -0800
Message-ID: <CAAL3-=-nonZbKM4co_jqFgcXEShu+QVCypojZoR8YF3YtBQ8Rg@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - sort xpad_device by vendor and product ID
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Cameron Gutman <aicommander@gmail.com>, 
	Erica Taylor <rickytaylor26@gmail.com>, Ismael Ferreras Morezuelas <swyterzone@gmail.com>, 
	Jonathan Frederick <doublej472@gmail.com>, Matthias Benkmann <matthias.benkmann@gmail.com>, 
	Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org, Sam Lantinga <slouken@libsdl.org>, 
	Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 10:56=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Kernel style of multi-line comments is:
>
>         /*
>          * line 1
>          * line 2.
>          */
>
> I adjusted and applied, thank you.

Thanks!

I did scroll up to check comment style before I added those, but I
must have caught one of the ones that's out of spec.  =F0=9F=99=83

