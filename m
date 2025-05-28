Return-Path: <linux-input+bounces-12622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3AAC6AD8
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 15:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654F84E41D2
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 13:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E1B286D6B;
	Wed, 28 May 2025 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2aYRG6X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555F3D561;
	Wed, 28 May 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439851; cv=none; b=OTNMoDIJt1ZVFYq2GQDW4znyuNV0llMIhjIkFfbR/LU45ue5uyQDmPoIq0F/sYCP7yMp87y2routFh8FoYYxvDrM2s1SHW5fVQ6y/t0U8oSTR7IUHWZ65z2vzuek0l/FOJg1whhJnUYqdp4YJYUa4MWtsGBSMHPWd0fdFABAxnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439851; c=relaxed/simple;
	bh=ivXPZGYPGUFwUchdnZTRkdaXf0SBh7scsOYbpyld1To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7skjtZjWXHb0oJeYXZgUjmsKdpCbZ8ah9rxBApPNpe7qeM+9lUr++ugpqD+orj1GvqqxVlzMcVPA9f0wxSADI+QWSZ38tjzS8QRz8K+jP3waPwCaaFqjDhAHWjETS1l61H/8dmfjtRPxUW6hMv80NnH6jicQwG24Cd8xl7HlOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2aYRG6X; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47686580529so37647781cf.2;
        Wed, 28 May 2025 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748439848; x=1749044648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivXPZGYPGUFwUchdnZTRkdaXf0SBh7scsOYbpyld1To=;
        b=R2aYRG6X70C3XjKApol9M4WLvymVFHGQumDPDX9rgrwNvdnIovv3j0J6q8xCSoDLD3
         8/PxJBuQkPNDoC34REnPu7qDLRKmiM8D06c3lvQFtmKRSUu3BFBPvEBqka7ZQMhilb47
         sjkq+eOqPYbS6ekC580JvpqpEmKL4s3XRDEMW8n/GCQ3KYlPSlYFFNefa+xCiqV1K0GM
         TsYfYjp39k96xf9wyIcAHu0xFWJ11vbGInPUPk2BTOPmeW4magjjP78B6mePfTKF3Yhf
         9103V9Z8CjDSm1Lr+ILB5+szBgvvBzk+6wtfWcsjDv4Xt0YdtZrl9jVkaI+IBxJXbPPY
         yePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439848; x=1749044648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivXPZGYPGUFwUchdnZTRkdaXf0SBh7scsOYbpyld1To=;
        b=K7WFj9rVPFDQc1niocvUp/MBuajiaXtbDXKsmjMWGCgyEHuEWuKnyx1wj0wu/8MPGU
         bnZGQrXzpPBLLbTy7GUCWfOAG9aIVPbwvUH7NXnDVnirLrC6JmuzJMKN1pHFwcqk3h7Q
         gvk8KnFYgvCCnQhg0P74ERTPxGA3JWQcwTjtvYOVGfGnVve3vOeS+f6pa/IAe7RgTQbx
         +Wq+VhwM4i+TjWJAVXwOfLPA+TaF02xq9t3OGIRsueQ2aQyGtQT/p7iJ5WNZRvclmX/A
         mFdnBuixBziS6jF9rMHf4mY0vRQiKAjNZ4u/jKCdfylBObKAE6mgvAFipqPyeqOvCxls
         23sA==
X-Forwarded-Encrypted: i=1; AJvYcCWuhSMjnh/99W9I4wQAU6VKlB/b9Y8PpzodvJGf5dU5jnKkGvLV1zSRs91ZWjr4zpvtNj363ecEeh1VrHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1E/tM0eDlfuhNJIrNEluOGwgww9yE80HzkRAda815AQxaA/4J
	4OxMAsjmKhHay2tgTfcuZVdoD3dqt3HrIGawaoBkwjt+iQjwGCbsC4qqpEmnyk21jYN6Dob4Ahu
	zG7nYtcMwDuFR6IIVtlJocos1qcGQya8Yt9aaCeE=
X-Gm-Gg: ASbGncsmlWR4By+QTGylRN3f5DKij8jQ4Odu5KZbgyYJqcTRqumBskILa7wdqpRiNlK
	Y7DGUti7PCmJ6RpcZWTuZ94ko0oBn0G8R2+EBNOeeEwe2YWBwRyNvbyq8fdFDnVIIzQNY9+mvqS
	useFKRhZbuwFoj3f6Xf5/taIBqnpULL3qcsg==
X-Google-Smtp-Source: AGHT+IEfSGvN6Gi909FdJQ3g/ClhFdpKwiegzmk+Sy9zxTE47iRN11ZKMPOf7QUGW25a6G9/V6ECQjq6/86XIs5fPvY=
X-Received: by 2002:a05:6102:8096:b0:4c1:9780:383e with SMTP id
 ada2fe7eead31-4e42406acdamr13895204137.4.1748439837746; Wed, 28 May 2025
 06:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOU40uDDL9-ivR=8nx67T9_j+1+2dCXNyBUqFvOPyv0cpPr5Yg@mail.gmail.com>
 <j3gqh3iv7hsanemh3ctsrzcd3hljhsmdwe65vrnsjrygsz5dzx@7wvtrimqooim>
In-Reply-To: <j3gqh3iv7hsanemh3ctsrzcd3hljhsmdwe65vrnsjrygsz5dzx@7wvtrimqooim>
From: Xianying Wang <wangxianying546@gmail.com>
Date: Wed, 28 May 2025 21:43:46 +0800
X-Gm-Features: AX0GCFuT-UwMcOAG3n596KKZpc-LvyGfVxAFZf_8ZpDZcgKK1gzjSc_o5WzfRKI
Message-ID: <CAOU40uAurZLiPCiDNh8Gz3JaYOSRGTLkqQNddZi=kX3UdkP7Pw@mail.gmail.com>
Subject: Re: [BUG] general protection fault in input_unregister_device
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Here is the trimmed reproducer. If it still doesn't work, please feel
free to contact me anytime.

C reproducer :https://pastebin.com/raw/NkJX5AfA

Best regards,
Xianying

Dmitry Torokhov <dmitry.torokhov@gmail.com> =E4=BA=8E2025=E5=B9=B45=E6=9C=
=8828=E6=97=A5=E5=91=A8=E4=B8=89 05:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Xianying,
>
> On Tue, May 27, 2025 at 04:21:40PM +0800, Xianying Wang wrote:
> > Hi,
> >
> > I discovered a kernel crash described as "general protection fault in
> > input_unregister_device." The crash occurs in the input subsystem,
> > specifically in the function input_unregister_device
> > (drivers/input/input.c:2500), due to dereferencing a non-canonical
> > address, resulting in a general protection fault.
> >
> > According to the crash report, the faulting address is
> > 0xdffffc00000000a4, which corresponds to a KASAN shadow memory region.
> > The crash is triggered when mac_hid_toggle_emumouse calls
> > mac_hid_stop_emulation, which in turn invokes
> > mac_hid_destroy_emumouse, eventually leading to a call to
> > input_unregister_device with an invalid or uninitialized input_dev
> > pointer.
> >
> > The report indicates that a corrupted or NULL input_dev structure was
> > passed into input_unregister_device, possibly due to a use-after-free,
> > double unregister, or incomplete initialization in the emumouse path
> > in mac_hid.
> >
> > This can be reproduced on:
> >
> > HEAD commit:
> >
> > commit adc218676eef25575469234709c2d87185ca223a
> >
> > report: https://pastebin.com/raw/4TeX6E8M
> >
> > console output : https://pastebin.com/raw/ZE2AZ1Gq
> >
> > kernel config : https://pastebin.com/raw/BpCtvUt2
> >
> > C reproducer :
> >
> > part1=EF=BC=9Ahttps://pastebin.com/raw/jhU9v99k
> >
> > part2=EF=BC=9Ahttps://pastebin.com/raw/dcaKCHZ1
> >
> > part3=EF=BC=9Ahttps://pastebin.com/raw/CzgGBb7C
> >
> > part4=EF=BC=9Ahttps://pastebin.com/raw/MnwtYcjd
> >
> > part5=EF=BC=9Ahttps://pastebin.com/raw/VE8xNmHT
>
> Could you try to trim the reproducer to something more manageable? There
> are really too many things going on to make sense of it...
>
> I guess we are ending calling mac_hid_stop_emulation() with NULL input
> device, but I can;t see how this happens unless we manage to overwrite
> sysctl table memory with some garbae earlier....
>
> Thanks.
>
> --
> Dmitry

