Return-Path: <linux-input+bounces-12474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2AABD696
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3779D4A7239
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 11:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ABD277004;
	Tue, 20 May 2025 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjWgacpW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2023127A106;
	Tue, 20 May 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739714; cv=none; b=rpU170Gi5/FDdNtaKr7VzhiHuW6ksRIBMUuyMxbkjV8ohyWTsIRUP1WjuPyAOzbpa//lh/2byajdnX36rf++TxdlWM6uDioD5GKEYh/5tJqQ/Tt2A43lqOWTlF48zcloOijGXBQ7INzEVYjdzhLv+jsMMq7IIP04THt2cYGQlBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739714; c=relaxed/simple;
	bh=f9pvOAMQXiWb/a/qqJyytjLQEhwxsLFruDbxIpt+uxc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KEDNnQw/VlNYp/7ZCpg5YOjZwQ8NTve/m/mjKtXftCtDFQSkKlWFDYgBDL7VflztnEN8PKQFkuoS5SfTnqbJFidK88liMcfI68W4d4yPeoyYcdWKRMA9Ob5iIhBA5kvoo72q2ABbDT3qauYWCyBBEzSyox77ZH2vfbzuoE+zSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjWgacpW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-443a787bd14so23287375e9.1;
        Tue, 20 May 2025 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747739710; x=1748344510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9pvOAMQXiWb/a/qqJyytjLQEhwxsLFruDbxIpt+uxc=;
        b=DjWgacpWRpA4jac/YiiFE2v0caodbmmqNfRMDeD6GDvsWA91R95FFGPQ84Rt2/73XG
         0EYxrWGIq055IzdlGJlSKUGYChJMpAPHoUz3D16aS+tWCc0GkJNC/70kIXcicnG7OGml
         mc5u6Q0zG1yximfXmNtuEkaV8eAkeM3W0NcAuAXurNfC2h8n2ouXhmJLMF7GxnKETUGv
         HmvyF1WCoQTjQrFxLX5Pl5e/ERx5DFMbJjNWME9c/OvVOfWSZpM+XZt7BR+NAHLgCH9E
         34sreuQaEdowy2I0Dm6HjazFVMLbach0IlBdGEOXGw8KXdItZPqk5TvcHR4+GI9nEmHt
         sBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739710; x=1748344510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9pvOAMQXiWb/a/qqJyytjLQEhwxsLFruDbxIpt+uxc=;
        b=CoRupPG243s7dAFUgUI+ayssRVan/O66UjH9W84X/zK7O5DjEwa2/MlysRCHveCOLM
         aWRDEOUSNc7916RBEMxVI33ymjRtKNJbKobrVlnjq3rGFP+TNmsx0AGSeMIesCghuvLZ
         qar6bJ+UMSr3zkMLfjFFYX2ZsGBk944i3RHfMGCaj4dqYZmvRpX+csZFdvlQPTDM0+hs
         rrDhCUKeRWO/oNESTb4Y/bpzgNGy9BC9evHstLLCSvKd2C4f6oWZ7clacE22N5VhvRIR
         CKkmqj9rW3hsNqc2AjHcUvfWCiDQ4fdUSux8ESIYDRA+4vh6eqP2cDRnHiQcLzoBRUt5
         /bAA==
X-Forwarded-Encrypted: i=1; AJvYcCV5edX2dnLJulXD2cvkHgGJdxqNpoBLKb2zueVFSz18Acn8MdX9LFqvCZTqEWWJeGfTupuJK+6ytaW+zQ==@vger.kernel.org, AJvYcCXptLE2/jFEWV+IT+4nm/SKk65p7HWBH/HoOCj2nbaY/bIjVz3YlrT5soy3yl6HDGhG5N++8y4El1k1LSOy@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwJzRieyozC3ZiuZywNX/+T5iz8hwsVbSpo56QxwJyP9O9VbC
	G2PhiF1DZsqi3jpzXfsaWhagEsqLrPiG5AsQuC7FwUhHSM6Yn9bDw1ofKT4tFk5taoI=
X-Gm-Gg: ASbGnctaPIzx3jVbH7lUWQYWjxOVVg67Wz3Zx2ELd6EAgWILy6vFCf/8KKkbtfxmDh4
	nva/5PgOtX8JM1cEvlJoDzns7FlZYZittgRJRnBfWE/AgGPUO6Q12Et278Gn7C3gBXuJc5DMxLJ
	HzyhqH2AyYnpXMtfbqrZ2R/fXAGU985jhYX+bKbnpvZ0wyyRhxM6md02H49ZKzcucNQnQAumVLL
	6VDmwBp0Tmf3CQahEhSIXYDOgrKdNegUCv8vyypK1IPJ8w/12ZL/oz+X+DH/IMvH3mVM4fGmvH9
	vNweJN1+MvAFRKzeZJ26R/v6Ej0arO1o/71nFnqGuWUeR4WgYjNl0p+AJbaikGngnOvrOJ5h17B
	5WellAU26agj/83C50TkKTdM=
X-Google-Smtp-Source: AGHT+IEWQPdzMZtYVbzwHPtj9/7/m+Oig1UhDpjw5mcuSZJjnuUV3usE6qp0SIfmUKVl6lF4jfZXOg==
X-Received: by 2002:a05:600c:46c9:b0:442:f8f6:48e5 with SMTP id 5b1f17b1804b1-442f8f6494fmr188299885e9.8.1747739709986;
        Tue, 20 May 2025 04:15:09 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm27936995e9.4.2025.05.20.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:15:09 -0700 (PDT)
Message-ID: <4d3e9a97e0c1f4d5a5eeaee133b5980a0a065aac.camel@gmail.com>
Subject: Re: [PATCH 0/2] Input: adp5588-keys Please correct and add
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Denis Arefev <arefev@swemel.ru>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	michael.hennerich@analog.com
Date: Tue, 20 May 2025 12:15:12 +0100
In-Reply-To: <20250520111301.1346035-1-arefev@swemel.ru>
References: <9615d118cf3e52ea67ac0421016f0b6cceb49c71.camel@gmail.com>
	 <20250520111301.1346035-1-arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-20 at 14:12 +0300, Denis Arefev wrote:
> > On Fri, 2025-05-16 at 16:43 +0300, Denis Arefev wrote:
> > > 1. Add check on return code
> > > 2. Prevent buffer overflow
> > >=20
> > > Denis Arefev (2):
> > > =C2=A0 Input: adp5588-keys Add check on return code
> > > =C2=A0 Input: adp5588-keys Prevent buffer overflow
> > >=20
> > > =C2=A0drivers/input/keyboard/adp5588-keys.c | 18 ++++++++++++++----
> > > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> >=20
> > Hi,
> >=20
> > Thanks for the patch. However, not sure if this is really worth it... T=
his
> > is
> > driver is in the process of being removed:
> >=20
> > https://lore.kernel.org/linux-input/04b8a6d68fdc0c0eadf69fbbc6a130ecc6c=
49360.camel@gmail.com/T/#mad1980e9652161a6a2e36c2aeeb97f900c6e9fc2
> >=20
> > Unless we want somehow to backport these patches?
> >=20
> > - Nuno S=C3=A1
>=20
> Hi Nuno.
>=20
> It'd be great if the fix patches are applied and then directed
> to stable kernels before the code is dropped from upstream.
> I've sent v3 with relevant stable tags included. Thanks.

Not up to me to decide that :)

- Nuno S=C3=A1

