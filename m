Return-Path: <linux-input+bounces-12272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E939AB30E8
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 09:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A036189AE18
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB94255F48;
	Mon, 12 May 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtrH0EgW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE13D984
	for <linux-input@vger.kernel.org>; Mon, 12 May 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036652; cv=none; b=LmC2QfkAHAwvvcPW7cB1+eFq6YXMVIbDe+xzvbbpnec7ICcwX22AMrYSaUW92s3famrOsnZIonisPT04sKdCGq17qyjVDe3TNyAXOFaOu3XnkbUo+gLe3sROIPOJeyjnmtyZgBpXFYIxUnO9HHcD4Zm3L/BpLsjj9Bm5wrlTapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036652; c=relaxed/simple;
	bh=MNsWX/MaCJozDCvNRtgGThYZGYQRomkQ1qf5vv5TS3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9NspTh1pAG/oSf8/PLv5fJaoHy+dKOMJPRRJwYj7b3G4OEmEXDy+ipeEzki50OuTxL3Vue4NrcV+l/grh8N6QTxFvD+LfXdSDkb8SsVmmyQ0H174jpMTCr+O+WJ2GG92otQNQ08FJ6+58sgkiIDGQP8SnDWkHGUSFNS1C62CAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtrH0EgW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-31062172698so44990841fa.0
        for <linux-input@vger.kernel.org>; Mon, 12 May 2025 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747036649; x=1747641449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSrUBxWWojvwqe/WEpuGAakvw8Xmmk3ZVwFQ0ufc+T8=;
        b=jtrH0EgWSEVa2i+JU0sZn9nn+kDrGOgd77yXKlbTJ+d0/+s/o6DCu+EjObd28A6594
         r4ALo0qnI84R9VxJNvWI3gFhnh/AOnwLlClVBBcqKCGQo2Q4kalOqu7XWiw/pMhTAhBN
         oNGRR3xdVZP07hNzbcYu3mBk42/HOOM36h9NGjb5KQ4A6zZM3eCODoYA0M0IL0wdS1bC
         ELbX9/PBOygpGJA+ukq6YDNgW8JbbwgR0z/0MkdVRW2z65ysbK3fKTOa/yrgn92PXFnM
         0w2U5w/fLRulOsL1DYQBJCxMl0NdK+sjeT5BTB/trR6H9HXBdCQq1YfiaEAStFPCZ60C
         KNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036649; x=1747641449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSrUBxWWojvwqe/WEpuGAakvw8Xmmk3ZVwFQ0ufc+T8=;
        b=HXBl1ATwwh8eSkmkGEh5NmM6TEE6AZOhMWCYI7THI4wh15A/jbbD1xYiScZAXjQ7td
         6TEXsC1aCh38FFe+4nGZwgvVpadGX6HCZBcYCZgeYWz1Gdwrf4zTpmJEUYgBguPqZ3Pn
         z+88PtnaTp0dvtp+QFBFbJ+wwo2HsSmB1pEJUjMXQ5L1Vbo+WVdB5B6HUtxYVyk7GDyu
         SyUdjZPYAHyBdYE2TNBCeRL90GJ+afWwhyGYw03wJciI30q4FLenR5ToMHgRqZ+/ZtHR
         22IRimzKR7+zbUgsiZgFsmLCV1BWYZetrC1VfKzwgpxK+UHGiS2qGLT7ADo8+eH2BFGz
         edNQ==
X-Gm-Message-State: AOJu0YyZxwi3AapMXvPRtUv6VX9fM37a3hZ9wlyK1fgqJhl7c5GAmQkK
	iL4gUSkm30qAYZCp/g/uBYibGZGJXbgwM+Sf+kCEsCoMyaZES4t5aHj4upZQDBrBN0NDHVCl5oP
	Ies4M87WR1Z4pPBn6+pjTuKEA7sU3/ZnMTtFELA==
X-Gm-Gg: ASbGncswXju7F7Fr/Qb1aLubIgNvdyNR2Ybk6steGhO7bgzHhGYOA4w4ZQVbWjMw9Lo
	s6vPDPxdZhyCJYZZRjpv11z1QTeNWAnK6BnJ/PkRYbFU+58c2WB/g+46mSfWvfXo6ZobTRFvhGc
	A1gxjjB5ehY8RxfQ4a9fUGPcL/jYac4PrkKQ==
X-Google-Smtp-Source: AGHT+IENi5p2bYLOI3JnEgdDg9mPV7tdfPVtcND8BcoS+36s47QW8uagPl0uHl8geBf6sbWITUBDmdezf6FAIzGrvlA=
X-Received: by 2002:a05:651c:549:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-326c45460f2mr47762931fa.3.1747036648872; Mon, 12 May 2025
 00:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
In-Reply-To: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
From: lihua - <lihua@huaqin.corp-partner.google.com>
Date: Mon, 12 May 2025 15:57:17 +0800
X-Gm-Features: AX0GCFsX1XuuIhEJSjplLu_YCwSa5UniiusnI5n9qOnZKm5KsUqOge8i9lwauj0
Message-ID: <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
To: dmitry.torokhov@gmail.com, hdegoede@redhat.com, 
	javier.carrasco.cruz@gmail.com, zack.rusin@broadcom.com, namcao@linutronix.de, 
	andriy.shevchenko@linux.intel.com, tglx@linutronix.de
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, All linux team members:
      Could you please review this modification as soon as possible?


On Tue, May 6, 2025 at 1:58=E2=80=AFPM Hua Li
<lihua@huaqin.corp-partner.google.com> wrote:
>
> Previously, long pressing the gpio key could only detect short press
> events and could not report long press events in sleep mode, we need
> to recognize long press events in sleep mode and fix this issue.
>
> Signed-off-by: Hua Li <lihua@huaqin.corp-partner.google.com>
> ---
>  drivers/input/keyboard/gpio_keys.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> index 5c39a217b94c..b546f38ecf8f 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -426,6 +426,8 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *=
dev_id)
>                          * handler to run.
>                          */
>                         input_report_key(bdata->input, button->code, 1);
> +                       input_sync(bdata->input);
> +                       return IRQ_HANDLED;
>                 }
>         }
>
> --
> 2.17.1
>

