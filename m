Return-Path: <linux-input+bounces-12970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06110AE0B50
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 18:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697CB3BBA4F
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 16:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E24526A08F;
	Thu, 19 Jun 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+nxAzya"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B5235046;
	Thu, 19 Jun 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350167; cv=none; b=LXQtFAbF06GqGsEH4sMK/19XjYbo4EFYBZ15PduwBTNa+Ox9qgTnjCMvdil0z2rN+gEWocAGpub0mHbfJu7cBLPvvpiCOHhXOoEfxRs9X8S785XxbsfTQx6GjVTpBRaZ9akQegX5/4qt7F8TRR+sWpuKrHaUU342abNIEkuOcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350167; c=relaxed/simple;
	bh=3M8nSpkh6crM7aTmJhN8UbN7CIor63CHUcAhorZ968o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NSUsstutTQ1VgJwtPGqP8I3Zobxe1gNS28VnSEvjtlb1jwLaPJHdLTXKggOn8DQTVeNNsWaLGgAbaMi3dHJw9mWZ2oKZ7pUjn7QJ66hxti/xgQz5yL/Bg2StoP6zvBDUrWNoHTlX4PmABWUU9u0R50+n+c2g1UqIVSH7xHYAdYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+nxAzya; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6006cf5000aso148660a12.0;
        Thu, 19 Jun 2025 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750350164; x=1750954964; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3M8nSpkh6crM7aTmJhN8UbN7CIor63CHUcAhorZ968o=;
        b=B+nxAzyaj2FgpBn7i0t3LWG5UUjdm9z8wJRvHhTolGEJNT4q0LkbonWwFb5jVQg0Fx
         kcZICVEgtxn3o0aWzdXVn369A+N7nJfPLpSsp4G/Bww+sDHw8nIQQWplJFCjABC5/39N
         VWMkIXuHJffhjoMymFVYYzFuexD6D6uLBNJGiqPjPt9VOBb6BzAXRWYuYz1OpFsumMPR
         4xAQCwX7itXw8RTgDyT2CjhKlizo/I5Dyz0yBxhgE47aayB7Y/Rrh8Bk4i+A+Oeo3/Ny
         xH6EmEQikLH760h6SW876bqJPPZonjXUS2IBpyy86RO6lgED7bbbCZjLsaycnD0GPiHN
         V3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750350164; x=1750954964;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M8nSpkh6crM7aTmJhN8UbN7CIor63CHUcAhorZ968o=;
        b=JK2lQH9N7K8Y9xqmD73PLnousa68x7FJvZ7PIxRWCKmUhp2Psl+kh5CpVgGJ0MEDnb
         8V8GqFsiq9pV2Q808RccICrMVJ4MCjpfD5Tgk55P+xqNSDH/Wonc3QzMD6pSuypCCH9C
         Ydy/7HZ5Ox3+WAvGcIWanppHcVwd0Wc5rTdML1gqce/37PqoOy4bkW+SflHNsODf/uwA
         MK8RSe1pO2fetPjB7IWPDJfc968zZxkLxUd2TfLL/9Jb1bzUbjUG+T0EF2gofaLM5PBF
         b09DnhbDGNQjdPVYmgQBUquFtMrTyqUlOe8ceDbSt05Fz1o/UfYnyTAkzUBnOPqm1Z9B
         pWrA==
X-Forwarded-Encrypted: i=1; AJvYcCW2m3CRrOIaWL4O/a7yJTNXDhWbeBw5mnS+MuSAT1ZyhgE9mt/1xbFgt8vTDxwD6HLgrNJlWHgyTQWo@vger.kernel.org, AJvYcCXv2irL5nr56fUBmJ9XKeuw4CtVMKusrIbf9CnXz3apkyW0NLmr3udGOIKtlZyg7Tp2KK//l8my9DkyFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqPxSgxtgLOFYmhSCRGaAJZ0igCYQnXYdkVgwf87PXybjrUDc
	fN1oS/GKbi9Q8jZpDJnOYeiEAkGA/3ewA5hox7g0nxstVTAHTPHULARuFLrhTQ==
X-Gm-Gg: ASbGncskyS7kXtCPj0wd55QdcMf516Fcxpx9S8a4iBMh/WNZ/3rVfbwmf5g3SQmrbDt
	ou2D11p5mHy64u+Gfx4pCUXRH62cAamV67qSyJocCmdFQfXOUG7GmPLXgjFuM7cPV/ZDnNzzAY0
	krqhvKNvaUJQy+l5f1nN3ZfE1naXUAFTTTK/JkVOSsE3FOwtRwaH5gA5A5/oiH5gkuOAIlIQcKG
	TFr5uq5IhnAahxJww30rq2fR/NLF+LeVxxrs8APc3BbvBYqjwLdq/2ivTNdvIuCPuF2zy6tUvYN
	RUDs+nbwBPUk3BOMOMG17nMoBtMWNS07wegECUWPxYy/6DKbd/HjDIIwTWBP1APsR2wGzJ5Q3FV
	4RSD6eT4=
X-Google-Smtp-Source: AGHT+IEsM4qC9wJhgJ8fizl9oj94bxpB+gFiaE3ECcayLCIxPSB9/NiZ2hGAxw+jmXqU1lisbtdwOw==
X-Received: by 2002:a05:6402:43cb:b0:601:e25d:198a with SMTP id 4fb4d7f45d1cf-609e3114304mr1218798a12.0.1750350163609;
        Thu, 19 Jun 2025 09:22:43 -0700 (PDT)
Received: from [192.168.1.239] ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbd8easm126117a12.67.2025.06.19.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 09:22:43 -0700 (PDT)
Message-ID: <8cd6407cd106628abc4876e9fc42a872a5e6e1a8.camel@gmail.com>
Subject: Re: [PATCH v2 00/11] HID: pidff: checkpatch fixes
From: tomasz.pakula.oficjalny@gmail.com
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org
Date: Thu, 19 Jun 2025 18:22:40 +0200
In-Reply-To: <57084nn1-q930-5p4r-r2s4-sr7s7109494q@xreary.bet>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
	 <57084nn1-q930-5p4r-r2s4-sr7s7109494q@xreary.bet>
Disposition-Notification-To: tomasz.pakula.oficjalny@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-10 at 21:29 +0200, Jiri Kosina wrote:
> On Sat, 24 May 2025, Tomasz Paku=C5=82a wrote:
>=20
>=20
> Sorry, that didn't work, I was overly busy over the past few weeks.
>=20
> On the other hand, I don't really think there is any imminent need to rus=
h=20
> this in, as there are no functional fixes.

Yeah, no worries! We were debating as to when to send out a few more
fixes to the driver that should only be enabled for distros that ship
newer SDL as well and 6.17 will work for that.

>=20
> Now queued in hid.git#for-6.17/pidff.
>=20
> Thanks,

Thank YOU and I wish you can get some rest in the meantime.

