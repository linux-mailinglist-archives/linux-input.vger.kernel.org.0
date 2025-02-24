Return-Path: <linux-input+bounces-10264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1598A414DA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFA93B2F4C
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7220A1B413D;
	Mon, 24 Feb 2025 05:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrJAwp8P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E419A3C14
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375663; cv=none; b=MuEASPunRXP322BAljYkYCfPCDM6K240gsHKtBb8vsLqgaF7Wnt1KYJtQjxHijG31AEjMFdej6ejCYx23Qk2XDLArXC1XouJLLJAxfeElOb4rug9/fHn5m0qxhouaRDDh5TYD/5yzi8sl0PD6MPZuba2GniY659vFdbAE79rJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375663; c=relaxed/simple;
	bh=3shVKq+vgkmYzSHF0zoCaneGsGaR26e5UOCR0+KUo1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBT+UUgp24eid5j81VmnTBelaDFB4tlfVSNKMGJ0uOzEDYTxPaTGKBJP8fmXLg5R+vRkCEf3zah/KnycJQ91JCWEqGes+99YNJMrISY1LHeiEp2XFYnsXDdwHBAp2R6uKJuSGsah7+OEDeCqkAZ+Wrp6ygVPJBdnYORd5YmfV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrJAwp8P; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fcdf0980a6so11423667b3.1
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740375661; x=1740980461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3shVKq+vgkmYzSHF0zoCaneGsGaR26e5UOCR0+KUo1c=;
        b=PrJAwp8Pp6lVk4y6TcOn1gSTn8GKzbPgwJdHfH8IPmxygdMxVlk9hHW6eZOJbjwych
         ZoMsaL0XIIZIPsWegqwvjxK0p5nXwjzOyX5RLXPgkj/kw+llHP4oAxeN2MToGt6v/v3d
         1o9lpXx/gTRFYl5FFlnarDsjODAjOIwIGuW3B4aOrw1MxYUV2kll6ILQXycy9k+/YfBg
         L4YgNVZOzBntji0XJznS4ynfR7amRh4TrnofHp+vAY8yVnVFR0gJigS9IhTHf21Wc3ID
         t2+UIg5JRPUgK+YZhODhzzDJH6zQVogXYcBKeYe/aw9G+8siOdrS6/qlMyxIv5+yEQRf
         92bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375661; x=1740980461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3shVKq+vgkmYzSHF0zoCaneGsGaR26e5UOCR0+KUo1c=;
        b=HtEFb3NaAjyCp/dkiFYNhy7pw88KJYSFx64GkXpfpDvttpEsfVRG2lO8muEVbmY78k
         aQkaeWq/wJUGycDLYD9+9DqLjpg/7oMlv+1S+gVy6MF3iq4cmWanhSwC8zoX/J7PcTU4
         L8wMIDR25Z1FI7r584Mo0BsEwWii2kWOLlQId353QoDR2ipNQ18iVGp801tfIHjJxEqT
         LrJJyShgecanCd5Aoz24576TXXJWi6RqCNNsAA1ngQpXaPo/9MJnAa+ORcAaGnQcVafT
         c60LwRslANzxeMQnSo+XtiY5r2OKCZDg+72uu5Ziwxw1C915RpVSLlrelhDWQep9JO1x
         kCkQ==
X-Gm-Message-State: AOJu0YwW3WfqlVe4OIwqykmGKhaFV1XMfMgYTsLLBMBW7F43OyRgRVFk
	Mg5sWkfNnALhedPIXOAK9FpNqewSpNCfQlnT3+UJ5JBfh4Koxsou6Gb6khT8B+KEMAdH04Ij++H
	ADVBzt5Gnn3kqOxwPrRTzzMrD9Cyljg==
X-Gm-Gg: ASbGncvs7GAGofx4yKZyGpFovaCVKRlpS9hES0kvh7g+/cqIovXBimJE/7vP7Teyovt
	qMgYoAntsP2MHPm0i/XNUwl8twkzlEW2XmUTJ7ja8kpyXk4bfCf6bN+Qc51JX7mSefjydt9NNr2
	ptou2KMJM9ntd8TIZ22noo/xZpJe6u+AYX1QIK+puY
X-Google-Smtp-Source: AGHT+IF7VkFp2uLB8/9+F7ywE3OLWQifZKT3dUMwR7HEJhBdiLCyJaKDXpqEAUOZJdMpeE7u2+C8eOssRVkJsizcm64=
X-Received: by 2002:a05:690c:6a06:b0:6f6:7b02:2568 with SMTP id
 00721157ae682-6fbcc38c9c1mr98851087b3.32.1740375660680; Sun, 23 Feb 2025
 21:41:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com> <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com> <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com> <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
 <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com> <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
 <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com> <PNZPR01MB4478184BF3EBAE540C876EA9B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PNZPR01MB4478184BF3EBAE540C876EA9B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 22:40:25 -0700
X-Gm-Features: AWEUYZmNRC68ZcolQwDPkTtRE0Vnqm-VsYnJWsbftM3W45boHm04V2R74mb7F8Q
Message-ID: <CAMMLpeQ_pT5310atonw2-bs8Zn9a+Uwe_Pb16WQ3dV8SG6vZbw@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:30=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> > On 24 Feb 2025, at 10:49=E2=80=AFAM, Alex Henrie <alexhenrie24@gmail.co=
m> wrote:
> >
> > =EF=BB=BFOn Sun, Feb 23, 2025 at 10:05=E2=80=AFPM Aditya Garg <gargadit=
ya08@live.com> wrote:

> >> Removing APPLE_HAS_FN quirk seems to be a better idea tbh
> >
> > I agree. I'll send a patch shortly that will do exactly that.
>
> I just made a patch. I'll sent it soon.

I was going to spend a little more time looking over the patch I wrote
before I sent it, but I just sent it to avoid wasting your time on
duplicated effort. The most difficult part of the patch was writing a
clear explanation in the commit message.

-Alex

