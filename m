Return-Path: <linux-input+bounces-14160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26941B2C98A
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 18:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1B13BF7A5
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 16:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F972550CC;
	Tue, 19 Aug 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="TsioKAtq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040925485F
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620562; cv=none; b=JyDqDw+TaF48LnZmrNmVLMLwaA/ASLpL2TiHtcVukhfmxKN5uhRODC28WKOnQlzo2kipp3Hj10UsN05FtMIr9AGp48B6Pm4SRn81aVr8Sdh61sZYlHtKZYjR8vMfPrn386sChfXkH+QVxRIJ7yLUaZs0JR6VXBGGqCOOTxb7kds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620562; c=relaxed/simple;
	bh=3PqWY3JM4TexPZHQ/zTUCSIoCVYTLd+w0kuE6RM4q38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOtqxp5LeMWxwyZqe+q6PPd9Q1Nv6eUQCqEwdqWkLf86Y1JEmjey6acD8ePaW7ZCcSEVfkMR6XJoXAPWaU68WL3WKoew7IHoFN+mocNtrevSGlecEvT7n+7wEX/iVcr6Ly+y/6eR9Fz8QDFqIB6fANntKBmC78L8oZWSJY1O57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=TsioKAtq; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e933a69651dso3238404276.1
        for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755620559; x=1756225359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8uX7ecTc4H8lkiWTvCLVy7qyorEzP8ZhS/5YwBDze8=;
        b=TsioKAtqsOW7xWHMyZrnK3tvMgoAvgiLifdji2ngn1dbCsjUI9fnxHXvsAoHBiUuBN
         Y9X+vaw1m8nKk6CYBkby1O7uEF3DWIbGuivQiP8y1Txzf9z8BjLBuwjebocIehO02zkP
         fIafIsuqAnIcuZ3E9TW2R06wo/QrSaR+RiK4Yb/SLmAD/AMbWs+bOT0Nd9a/kFp2zqmJ
         9no7eBiPj6kDSHEgqonOpm50kCwBbYTfjypE7GGcOFCjxwHpW0QTLJ1nVbtDD8iwnmQU
         3A+5Zpvxxn4JImu4nXV0ugikz1VUopfqmurA+AHDT5dC0OpHr6EhBNx0renHvPjZp/E3
         T/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755620559; x=1756225359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8uX7ecTc4H8lkiWTvCLVy7qyorEzP8ZhS/5YwBDze8=;
        b=fwSK9ridEPVtJ04i2+V96I0stbFs3l8BD6BljMdQeuUx6Plbsz7S4seqq7x2TKdxHH
         zHKQzPF74vTy/2xE7MhFUPg4x6RWjGQfHQyDzQiNXml9Z0kSOHoz9HT/TNgZnz5LhKmf
         dsNwOAhIUt7eejpw5Gy7CsznH7dTV14BD/bTjRu48bn+Ye4oMl3g53ovUdbOpFopUOs7
         wRBos4AMVkXf+/rFMQa5KHqM69qbl0mg5UDZw377rk1lK79LRk8Rs/PRHqatPjwdRY3n
         zQpib91qZFQ1McaAEAWEgyl160fQ8S/pBgF4RdQTZfm/WntCM1HcicxROT98CySUT8oB
         CFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV47LsaEOWDWC+DP4lEX8DEFZVFk3IiB2l2iM/YgLtev9zm55bwvn92nXi+85YC+T8P27qsiYRHI6jFaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wLJ8IhLTIS84crUS6zkz899xsazEcNUGULAceF59n6/lOfmm
	KJnukL8BcxU7CVYvTQqaqxnpU51Qi9xAkRqkK+Ig/WC9mDZzUkAGT+CzfPT2EVN5py+aPOEyaKt
	/exh0NvWOOInR6Tb2QJq1LBacJtq3g4/lLwE5wHD2
X-Gm-Gg: ASbGnctlpnb55GH+s5hmjJlhRxszlUrZ3/Ruffa4ngB0P7rwO6af715KXDugtkNdAco
	3bgZzgBA7o+TYtWRriu+UpkwFCZ7rtFZK4oT4Eq+piCrTLdXD/1eqTnPx0tFSyt/+dzfPKR6hH0
	NM4Se7KTY6I3iHbdTyMXY24HxjcdDSdMCZWs4XTzmCXtPEhIrSJsu4euWK3d/0suvKlalI62mA/
	FAdXenpjSWc4LUU
X-Google-Smtp-Source: AGHT+IHAbgCmisgA8W85dRst53S4trRP2Tj2MSg8YDm0HI7X9Bx/bnhVBpTLBnfB9kCmzLTF2uWkoYVrZwQ5t7+gtq4=
X-Received: by 2002:a05:6902:6286:b0:e93:4d9d:4010 with SMTP id
 3f1490d57ef6-e94e61bc1c8mr2964138276.16.1755620559370; Tue, 19 Aug 2025
 09:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <DC6D9ESWXGKO.1NS287IU5YJSZ@kernel.org> <DC6DBZ4HHGOF.11HI37DX56PH0@kernel.org>
In-Reply-To: <DC6DBZ4HHGOF.11HI37DX56PH0@kernel.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 19 Aug 2025 12:22:27 -0400
X-Gm-Features: Ac12FXyCrcVI5pAcKrqvEQ_WmuIEzaUhsOqC2zEtK7b_1oJoCpdciQcQ0tp88JQ
Message-ID: <CADL8D3Y0hRgJ6P59YvUKYzYBADjCXr7kevHNUDoqZXT41Ka2Yw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Powerbutton driver and powerdown request for TPS65224 PMIC
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:30=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> On Tue Aug 19, 2025 at 1:27 PM CEST, Michael Walle wrote:
> > Hi Job,
> >
> > > The following patches were created to get the tps65224 PMIC
> > > powerbutton driver and power off request working on the
> > > MitySOM-AM62PX. The patches are as follows:
> >
> > Are there any news on this series? Do you plan to post a new
> > version soon, or do you want me to take over? I'd like to get
> > support for this into the kernel :)
>
> FWIW, jsava@criticallink.com is bouncing.
Yeah sorry, Job has gone back to school, he was on an internship.

I'm not entirely sure how best to move forward with this change.
There have been several suggestions thrown out and I'm a little lost
on what's best/easiest.

If you want to take over and add us as co authors that would be
greatly appreciated.  I can get his personal email if that makes
sense.  I'm not sure how the kernel normally deals with short term
emails (interns).

Note we are currently using the driver as is, on an Android prototype
and for some reason Android isn't able to detect the power button
hold, and open the power menu. Single push works fine to turn off the
screen.  I haven't looked into it yet, to see if this is an Android
issue or if we are using the POWER key events wrong. Just thought I'd
mention it.


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

