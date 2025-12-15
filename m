Return-Path: <linux-input+bounces-16565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 070ADCBD28F
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95CB030053F8
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B4D322B71;
	Mon, 15 Dec 2025 09:21:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A316320A38
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790499; cv=none; b=TiD/6LfTR7DAEYkTdeEnOJdCLqPXWcFcqRFKanr9fPbBUgzpiXIF4bOZf4mQ8WRSw18bn24a2AtqzJyo1kCQXhK5/YacV+QzYCl33A4NIxraNFEXRPbDr+f93gep9G6MpZxrWlhtB68Ib/uwGQQjKoe/5c+ZpmRWO1xBx2wJE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790499; c=relaxed/simple;
	bh=PL+6NLii3pNAIMOwfsbGkrxmE6sEQOXFEePNerQiLlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZ6hSGv2nJMa5brjMJ3cFSmc8Y1eHGSUVhNBoSa0z6XExzVvN8CPUdfVUo3+1lPmzd2eXuao5l+Jy7Pql3pd45WBL41mzYv/J9kU0l56LhiVj9AT0UB8vTcAKXe7c9oboySQpX0vlS2QZDnJMNsCDidvkVqEKEEISW1zc1ETVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b26461e78so758922e0c.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790496; x=1766395296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD3LsoVy+6tGvT7r+bqKFlMWkABubbkzpuGbkM2JYfI=;
        b=AkiDD4yFWvJh9OGq1nBhbs05JAVFY9hw9zc++byXaxl6sSAGUSBgrAjUNmHtiFvX/P
         uS3BuMHqstKVx3EDj+cCMmyZkQ8/o1aIlqHhcTxwwV9yIth3gCuM6u0r7VTt2SmnzziJ
         8U2p1TsBejE3wYSZI92jEtGvj4E+Pqv7eyEl7pxDRVHjrP6np39mcDR7trS+TBsBP0hi
         2gzPxM4r5an5eVbY6K0rorl8leMIdYtl//HO8YQ/opzqii60x36E3zpV2kjbbwgNYP2+
         viyGSe1/vnx1sdG0ByYdWrTENj0XuWnGc1wpdUiC91gnsjdgBN1M116TOwBKe05rmgmK
         iqAw==
X-Forwarded-Encrypted: i=1; AJvYcCWNw5YfiXVvgT3uN1qOTcV+PrXmdQ1nw9Si8pVuYeau9FvC2puZ+JvS3KxeQGSemqEPJjKWV+8SUSQ0Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9iZipOGVy3Pc38aiLk4TMYICIIOd30iJY/dN3btvNvQ9XM2X
	9+MxBEED1Hm3utrSGSl6oEkgR4wMSSA7cp3lioYjjng+Urq55IkutjI6E2X75OekM84=
X-Gm-Gg: AY/fxX6/v5q7d0RgsnqWJKE0MI4FJQqNEJFYabPBPJYAln0QSZ99xuf1zR0iWxoWqJH
	FeOBcYxeli5EUWRQtvZIIPWDROZ3OUmzWESz3hcSAQ1WZ+i84BGWC98eyjjyqDZ84fEduTKE0mA
	WpoQtu7nFuCMm9FMDER/YSyzZpH0IwDd88LprDKnKyGPTaxwvqIbtl01J85NKJ4UrfJ+4x/mYn8
	WaVq0EgQRiLXdkZKE2bDAjMW7JImAvNM5+zD6oY6dleQIWu8TQ6NGMvhO7wtuV7Z2//MiqrNX0v
	lVaAIJwCuiuUYoGnPnVi4dS+p2vxn2kNiSfkHa0SYX3C6jz5ML/DpAqRh95ka4B3KqpXz/+mkJd
	BpgUsstbxeDtRO4VG10a+5V270G3GlHzm7uQrCEOjWzbdcRKISMTFoOUzQqOrjQDSzrKVav6q7+
	g8cK1Mg80jatnFjWgPTE0eURjYv4F838h66YlhwVExZZmVZSUcm8fugPjImhUNc6g=
X-Google-Smtp-Source: AGHT+IHKA6KSqr7/VLonaHSTH2XTvT7ofQjVdd4i/1yZLor65ygxr1RVKD8O3XYhIc/b3ASTrL1v6w==
X-Received: by 2002:a05:6122:612d:b0:557:c467:7994 with SMTP id 71dfb90a1353d-55fed562c72mr1896951e0c.2.1765790496282;
        Mon, 15 Dec 2025 01:21:36 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55fe91833e5sm5350919e0c.7.2025.12.15.01.21.36
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 01:21:36 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55ae07cf627so821608e0c.1
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlIKtsuClkcDdVJwjb7agrrmgF50EOO1HxeLIT3loE9rHvqlx42ApekSIPmNH+YED8FYuqTHBqgnbOQw==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5db:f031:84d6 with SMTP id
 ada2fe7eead31-5e827803cbdmr3453459137.28.1765790495946; Mon, 15 Dec 2025
 01:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com> <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
In-Reply-To: <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Dec 2025 10:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+U_Mv76CQ7B8CWGFDWA+Vh=L6r2DsAnDVPc13VpSK3A@mail.gmail.com>
X-Gm-Features: AQt7F2oAUeI2BPTR6xXu5vgy0Vjr6n4qDbSOW4fA1OROG46ue1ouIwHUCHWuG4w
Message-ID: <CAMuHMdU+U_Mv76CQ7B8CWGFDWA+Vh=L6r2DsAnDVPc13VpSK3A@mail.gmail.com>
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Samuel Kayode <samkay014@gmail.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sat, 13 Dec 2025 at 10:39, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> > If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> > *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> > fixes it.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>
> Applied, thank you.

FTR, Samual submitted a similar patch 6 weeks before, which did take
into account alignment of the continuation:
https://lore.kernel.org/all/20251028-pf1550-v1-1-c50fae56b9b1@gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

