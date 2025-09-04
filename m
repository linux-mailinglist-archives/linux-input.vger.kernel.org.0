Return-Path: <linux-input+bounces-14480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A16B43C0E
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D7C1C82B6D
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93D22FDC28;
	Thu,  4 Sep 2025 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4+s7xvh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458712FC009;
	Thu,  4 Sep 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990269; cv=none; b=T0hBIjsP8BmYDpFT1r99x/RIvXEEymil+Ihrd/Ku+cd7DJKPyHPfHXl2luX+40YrxCgthLJexS/U/v/P2oygvAVeWo9SesVxVeLWW8K+GpXC0+0NZFLAn4PCHEGhhD5KQX44Cpn7xEPDg+MxQROX11LLHJ3I8QzGPYqYMBOEv5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990269; c=relaxed/simple;
	bh=eIKYTmiVJ5yfD1xV0iQhiKGU4UTgOxNpb38dYIPe608=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7D47OjTgTlllo2ty4cSeKXLfCAqKa4zu1e+xFV90SFo/3E4vUpoJwGK2QZQp48kLxN6pr9s1YbaXUwCVbrIUjAmj3o3ttAGVvPLpeMJ1KjhS76e3Z1FxsLYP425GGNrgkG5xPdWnylnK4+5mQjsfqXw7sEeo9gm4/OTVcrTGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4+s7xvh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so780994f8f.1;
        Thu, 04 Sep 2025 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756990266; x=1757595066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIKYTmiVJ5yfD1xV0iQhiKGU4UTgOxNpb38dYIPe608=;
        b=i4+s7xvh7PY1unU3xeDJLLiktU/nxpsfvp3QTY36qvOnYOrZN+c1zIv37HUotCtBxs
         A62R9T1K2yKRGp9wFBh3ZEbx2leh0s25gJFQiuCd2gYPAyRli5MA0mjXp4lDtS6JxV+q
         45fMEWcqOsFxAbWhycCyoAdzBZXDyFwz3rzfKUdvRBGYIDs4rOeFqOm9OMqOXydNJUpU
         zoU4GYLnVvp6/xVOCQOnOZSGHb7b/NJpUg3jvNYCGJeUMKQ4xIAaywZ88OqXgCOKjKws
         2VtGNfEmOgMEHyQ14m23bNjM/hDQvCKXOg7NEjmmxEuDc2caQ8gN+z0iEY3kyIc7us8W
         uDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990266; x=1757595066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIKYTmiVJ5yfD1xV0iQhiKGU4UTgOxNpb38dYIPe608=;
        b=AzyjEURtghCQI4NX0EIkoLEfAe/gf/ijJzXii4nk5c/nndCJuNAha/EudhtRFMgg4e
         zeC1e15S1NNQDKZ8QIvqOW2nSDm4bf3vBouknB2+XukZIhcbcMV8aqeWTT/ZZ2x75jqY
         hJesHjcVraW45fMKG10LJ8R0dQ+CkzpbdYYIxFIdMjbihIj5cenE9RMntM2KaDjGcKwQ
         pKD7fQwBylTlFZv06QKaloJfGx0K4ety7JjxSaFSZGH02jB8n8BzbJ/+dDmnAIVJQ0zj
         uHdmOSGs0Pq2HrHJhgvi3NESnVd5hO84wx6nrc+lpbqDEbLtO7PxXZXDHPtOWlk1oxvU
         MQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBSovHdKIH83zkdMLqdCUmMskGqBP1S80FAW5qsenJSdpW1wxQOYnwa2PocWUcl+6QhLybtITAbVyBt+xx@vger.kernel.org, AJvYcCVzv1vx3BlMVDcaQVJ4fDe1HyRpMcBB5w5kkjUyyXNJBiWWTDO199OlX2PUC55WISKKZZcThhhO27GLuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDXyuGdbswGeX44eHfuXfd/LOW+CEUFY1mSpWrevrpO9n8Gew
	Y0NU1TD8psruFSwmiFdCGdpSRx9OgMvMqrGw1L5TR4gsSkVRZURlXswhzJDPPVDQTRZpcC+zEAK
	A++AR6tLPpkY0sQsjoM5jRbO+ndpz4oM=
X-Gm-Gg: ASbGncswu6K0ZpOTFeeN65Ti7Wre2NeT3thEgmsFOukfouM89NpTYvHcuksmYxyKKOf
	SHQuK53WAPEUnf2Jc7oNxchUW7MCgbMlUnPNDWk7xPPVCc/tbsLEGVCZulH0aUaNdSQ5g4yVF8n
	9k5IB/ide1lrUbzqljTpzMjEynjtlthZwdwL2tvd1QWYF44R4pwmJZq4vaxzHxFDgUprfFqW7wi
	/4aNsza1+Djxkc74t8=
X-Google-Smtp-Source: AGHT+IEPf7mfkRpPLaB0y4Ac62qoI+10hGhweFxYiiSBOrdamFK1Qy2pRjskSnJmjZCSbFSmubfiej0baEUjF4svHHM=
X-Received: by 2002:a05:6000:2dc6:b0:3dc:b041:9919 with SMTP id
 ffacd0b85a97d-3dcb0419c22mr6177984f8f.11.1756990266278; Thu, 04 Sep 2025
 05:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903162327.109538-1-clamor95@gmail.com> <20250903162327.109538-2-clamor95@gmail.com>
 <acakhrd7m7uigyqepxnaidrzpmftvxjaeybqlns6boujmzdzwq@lter6ek2b7er>
In-Reply-To: <acakhrd7m7uigyqepxnaidrzpmftvxjaeybqlns6boujmzdzwq@lter6ek2b7er>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 4 Sep 2025 15:50:53 +0300
X-Gm-Features: Ac12FXygWh6QSsyyOI-HKUOp1gcLrKsBvdpFLzFQh63HtOp2US09qTYCJBx2kdE
Message-ID: <CAPVz0n015aKKjArWk5u+0rHU_tDZyQ1zQ92m3BbA2A=JgjAegg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] input: touchscreen: atmel_mxt_ts: add support for
 generic touchscreen configurations
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 4 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 15:22 Dmitr=
y Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Sep 03, 2025 at 07:23:27PM +0300, Svyatoslav Ryhel wrote:
> > This provides support for generic touchscreen configuration options lik=
e
> > swapped-x-y, min-x, min-y, size-x, size-y, etc.
>
> This requires corresponding change to the binding document.
>

I assumed it was already included, but it seems not to be. I will add
appropriate change to schema in v2. Do I need to add any adjustments
to the code?

> Thanks.
>
> --
> Dmitry

