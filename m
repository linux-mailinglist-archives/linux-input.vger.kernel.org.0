Return-Path: <linux-input+bounces-14502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39319B4508D
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 09:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F4E540E02
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 07:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7B52F7442;
	Fri,  5 Sep 2025 07:57:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A0E25B1FF;
	Fri,  5 Sep 2025 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059069; cv=none; b=Tyr8tkf4Y1LENNJKEtj4sTbotm3eTujpHzN+PnBByYI6EcCI7MbGU2Ge1mD1Yb3edIrHrmiDV2oegLWabUK+O6fdsx0/oa26qAkhl2p+qdFlQaTkrJmedYyuI7UV7SPCxJ60X1z5IZwryfXMmBNGQhb14xauJIQrwftb8KVvfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059069; c=relaxed/simple;
	bh=DAubCHcXcP/MDA4gDcViJapkOOeGhI9rKCdWgQ/LVfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlZXrb8zDoj6ONclp/qoKRmEk5wtW6DGXUfDPWK/ZPSgIVq9CH/uy2RSXb+ysxckl3vrInnPmjRqBaspyfWcf2npSV4zMMGBPQbVHirUEYzHLcxJUBFnkWP0+m3p75KStUfCNKxpRaST6zI5wQ0WBqmMDnkjCGOBqzr+VErASOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544ba28ae58so1278884e0c.1;
        Fri, 05 Sep 2025 00:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059065; x=1757663865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAOcXlAx6DPgP9UtLfIGxuYVjzOl0tNzCcNLPQpFRRo=;
        b=EJfYp2lfOY4N6ZusnzY4LheFggr+NQGY12OximvuFdk+tldOQirezM0rkbYIlBI7gU
         /Np5JZ1QzCPAf+pGJ84loU/JnN3Ho+7q1oytOj+WSZugLjqflaiLyCJqodLO8z0i29Ca
         KFoKLi3IYx1jcQugrF3CDEJpr3zQiFX0Fip12ZF5Mp3BV9ZfvU7lyzLB0fLkZBBmKlz0
         eGuC1zQsDPmSSck8sRaz3NnA6eP8XNOsZEUu+xSfB1kpmB6mwYIYCZ/5xdy+XU97s95K
         swSYZ87G1b3nwV9dH6GHWRPBwIsItp2ZHZgrZhk/o3QOJT5c9koL6kMpXYvL0G7RiPhd
         7KRw==
X-Forwarded-Encrypted: i=1; AJvYcCW66o2eePnXWsBSHeCUpjBMbkmmCurSosBazc5bw+2SFvHy/MkaDkJuNxK7O4iWcVwLzHbhZaoccc/j6aph9wQ3Y0k=@vger.kernel.org, AJvYcCXI/XQq9FBPhlfPTYBDx9LrxeojqaYW0pQuii1sQvKRZ1EgRgQRvOvHjWGD9u47d8fDgQBMPonwQLQ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mWXy/fPKcMt1XspzIFVIgJWe3cnEj3LSdVFkm3vEH6mS22OQ
	uSyHDU3pk2glywYPHN9VlRPhC24FMT80Alar4ntN6CYaM5rsHY2lOb6WWrspBr/Y
X-Gm-Gg: ASbGnctKRh37z4Q/SqfPg7UWML1gjoyWMrqs/8vT/8oZFXgevfN549+1Xh1OEJDWtAv
	a87L4L1ZPJt33I7Zoumzr25/wpTp51KpHTI9lVbmBXD2P3a/Z1ZHvB3O5dxgxivRqYsobWLJrjL
	JSR3mpIgF7/QXiBTD4VfLNiKAxAaF9j/k02v2FFOXAWMZj1W02Ss9A3F4lIdOQ2ItzjqIr3Cxmm
	6c7mRSLbArujbip5Bnw1mtcBOy+bECM71R+dfUj317X/tgHmsnuxgQ19wXkU3iRv2ERupdVoxAD
	KAfSa9N5Ti/0C7zhf6FRU3e6nHMg5SOqUPaQKRVUkFjENnOHYFGW2pQPxoCWHOgYsn9btT33SMP
	T132+HMlq3OhlgoY54jgCA8+mcnxdJP/qPoPORQ0P7XY0HzfTM5vEUpCIkKek
X-Google-Smtp-Source: AGHT+IEarSLR0Vjh2ZnJ+yWp4cb4RC4L2pnm5/tg/66sLN8ePCrnueVi0F1fKMlAZrXxf6mdcjuh6w==
X-Received: by 2002:a05:6122:a1f:b0:539:5cff:8070 with SMTP id 71dfb90a1353d-544a0254443mr7868913e0c.9.1757059065598;
        Fri, 05 Sep 2025 00:57:45 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544afcfe32dsm6642533e0c.23.2025.09.05.00.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:57:45 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-53042807be7so1408876137.3;
        Fri, 05 Sep 2025 00:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVcYW7MCE633bwa2XU6vs955yEZW3GOnclRMdBuhBd4mSVBDI5x7v8YNDqMzWwVXr2qdqATN96P/lu@vger.kernel.org, AJvYcCUsokMLD9J0p7BSXcmBV8NOhUthnyEXYapKxRDmpNc4QePXRbjgcqEAxtc9yA/arvvxAPFsiOoDrWi91g+wTEAFz20=@vger.kernel.org
X-Received: by 2002:a05:6102:b09:b0:527:8b63:78fb with SMTP id
 ada2fe7eead31-52b1c353160mr8528081137.34.1757059065276; Fri, 05 Sep 2025
 00:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 09:57:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7CNfXVNZqAq+_uZG0gxYSumYj8hO1H2dRw1jYJS4-0g@mail.gmail.com>
X-Gm-Features: Ac12FXw_Ku-KRzX3YE4QLpzkx8QtNsTO6NA18d43MEyq2rfpjgEI02y8lXhUxNw
Message-ID: <CAMuHMdU7CNfXVNZqAq+_uZG0gxYSumYj8hO1H2dRw1jYJS4-0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: touchscreen: goodix: Drop
 'interrupts' requirement
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Sept 2025 at 02:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Since commit 409fe0cea366 ("Input: goodix - add support for polling mode")
> the interrupts property is optional, since at least the Linux kernel driver
> supports also polling mode.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

