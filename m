Return-Path: <linux-input+bounces-9285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0093AA141C6
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 19:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D703A10C8
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 18:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D38922BADF;
	Thu, 16 Jan 2025 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCv0TmKp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C84414;
	Thu, 16 Jan 2025 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052933; cv=none; b=bg8RPeQF6LQOWQhT3kv3Iaaq0caEdqnKA8lhUWAB6X7JQQi7dmfaTjMyhrGD0Va3VbWp3d7+6dEJWSfsuTQcaADEpq51CAbIsNwVE0Tpe4FTWFTDuaRwMjK+CToF1TcABzkLopG1bQnr/zBBp5qwSG5z/XC37Qtmi7UXlMG5OP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052933; c=relaxed/simple;
	bh=zSL5wHMZ4BwaynjanjQAP5VVZMX0vbqau8aMtqlVRNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfiIv+l3wG65mdGmxzA8FwSj+IWkk4Jd7oUgaIxQ0Aoey4Fo1vYYTpqto7aVKAOqvYRmAcPqViySxIF7S6ivTxhYf/5cWg/OLGUgd/oEn3ZUI06sxEGDb2pvI7S4e+oVbe9+upUBqRW5KXALHq4AXFTeOqPrdo0NT8kXNXm2Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCv0TmKp; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e398484b60bso2089392276.1;
        Thu, 16 Jan 2025 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737052931; x=1737657731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=JCv0TmKp2GdKdRnSUaecaIUtoVwUriD6ZAAgVDTCe2Mpm4GlhknWBeZ+5kOfg4OJpS
         3G/rVHcNjtHVKTQ9MyEgptelgHGRpp0C7CbL/FcZ3uoYmKcOoU/NkQYPPZNXi+GIPX8u
         7duKfXE3VHtSa2+0zHCL/E6E2mTpLVNNxHjJh27F5+BELsVj/4bnr2Qoti4mgZ7P2gBN
         wU151z2XgUkLWfZyWR/+FyvQqXyA+IdfTCsheZuIeRLJbTIlEk8m/lhE7GA1uQ/ZIJXx
         nND1f+RgDZgjuao8+ECL3t+A1d6zajxnT8jZnO8f5ZcL5pVsb//5zHycSg8GNnFI3A+C
         r/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737052931; x=1737657731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=LIZWQbE5Y88qatvF1sa6Ssb+iKfy7aAjcV/cUWBKJEBhrK5r4AbUaF6lIJALRgohWT
         sO0Era1Toza+2DdK/Pch79Ihjs9EdkSNZ2sWfbxQreDMSFgSTRzkjst9039XxTlbLqCn
         yLGC60N9ZDbfFIjzMTXe2MllFJthSYiQXEm8/lS+8prYzf8MgDMM1HhhU7tnOCCN0uUP
         A8bUZBQ5Uleq0A94cJM3n3/caH8PLkO9PuHRawsrwKOYjNQJOKsMC/OsnkWogC+lsvgi
         b48M4WtthitIVsJUWuq2wbIVHE+Kt2Slq+iJJbRmGaJtuBQiDkIn2AbBJaR7oLvM4yGs
         NlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1DjTtq0qount5DFa0/sp3Qb9WfWvGt2Nv7jQ4zB/H7tGjV6Jy3pEXiAYl7MccAU/Z5B+1F1pv49uaPyaT@vger.kernel.org, AJvYcCWYPb/Zjc7n6mZi63O2zLVQulH4rL5j0hEX5Osbtnxvr6eNRbPt9TAunGyXqIIZVvI3C9CgjQA3JnSM@vger.kernel.org, AJvYcCX/YwWSRpnZLS+aDQuMuDPT5puAZkdgYGbuDt44F9yHZU/C/VHsO+VMYUoDVH+O0TLY2WuUTJ5eQcx4oSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZQufv46GFV+whP/JlA3DKDGZ+LpMXx83md3MntX6bSYNO5dsh
	SPZsUQEZZoxxbq8Tr3mVepubg0KwjUNdOnQ5Js1/7wmA61b+eXDvyzA5C2b5jEw+GjDWup9Dhv+
	N/OVV8CLLFmih7OTtuPfOeo9iGj0=
X-Gm-Gg: ASbGncvSESI0fFXPSgb8ydFY+hpyDq7cABo/v3IgR9srge/6qz42Lac9z0DxQiKFSKa
	P1l4N6ktjS5nDEv+K8Cj/b0d3yqIoB7w4AluELkQ=
X-Google-Smtp-Source: AGHT+IGgrjI/s6xaOVBHbScyM7IE9Im1N4NOLXcypovdtK+sa6A2HqO5UQpSC92AIJbeGu6/Yntga1lOW0CS39rvr40=
X-Received: by 2002:a05:6902:1448:b0:e57:633b:6781 with SMTP id
 3f1490d57ef6-e57633b6cf8mr12550590276.44.1737052930723; Thu, 16 Jan 2025
 10:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com> <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr> <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
In-Reply-To: <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:41:58 +0100
X-Gm-Features: AbW1kvbV-JZv8ggAR3kH02R-upbl0ZACxuPcSn7inUrp8BPKXzOfVMY_gM5ZC54
Message-ID: <CAMT+MTSTtwsoWMPuF9cHt1oHE8geWYZr4t7EU44wq5m3zbSyew@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, j@jannau.net, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev, 
	robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 19:29, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> >> +    z2->tx_buf = devm_kzalloc(dev, sizeof(struct
> >> apple_z2_read_interrupt_cmd), GFP_KERNEL);
> >> +    z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> >
> > This will allocate 8192 bytes because of the way the allocator works.
> > It needs around 40 bytes for the devm stuff + 4096 requested. So
> > rounding rules will allocate 8192 bytes.
> >
> > So either you could allocate "for free" much more space, or you could
> > allocate (and document...)
> >      z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres),
> > GFP_KERNEL);
> >
> > or have an explicit devm_add_action_or_reset() that would require less
> > memory, but would add some LoC.
> >
>
> or leave it as-is, of course ;-)
>
> >
> > See https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/
> > devres.c#L97
> >

The precise size does not matter in this case, 4096 was picked semi-arbitrarily
as a "nice-looking" number that is definitely bigger than the maximum
message size.

