Return-Path: <linux-input+bounces-922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92181B8B2
	for <lists+linux-input@lfdr.de>; Thu, 21 Dec 2023 14:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C6428F2FF
	for <lists+linux-input@lfdr.de>; Thu, 21 Dec 2023 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F94476DDF;
	Thu, 21 Dec 2023 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="gn6BIKio"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4206745E1
	for <linux-input@vger.kernel.org>; Thu, 21 Dec 2023 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d31116dbeso9049125e9.3
        for <linux-input@vger.kernel.org>; Thu, 21 Dec 2023 05:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1703165929; x=1703770729; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8erZIDLTxmf1m2HH8xQugTTdLGmjGK9/jdlvEoF7f58=;
        b=gn6BIKioQLApCbL+49R8eFqNWY6KQvsbPg03E2H6wCl6Y2XKfPmtRXEq4SePIOOVH+
         iYKfyznuTbO31YB427SieFKhyfmVmjRitZCcRUzOPx7VWLtnhdNIxqZqh1izCG+D4ww8
         C4o9WmM1NiEDHbuUh+0PRT4b+VB7ZBYd7d0GwyYFN7Tin4EYGHDOTi8uN3X9mxOSYNJS
         CWQnXv4xUSz8IgZ/HQCnndqw7T6q6WAH04CFXWAvCOwSmrEB/C1d+XhtCyy1oXSiE5wL
         82zgGkAf5oJVsXlhGiI6jjQpfl5DdRDAN5P1lycHVyyr4kFRNQ2HDn0y+7NXNRhRCMCo
         z2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165929; x=1703770729;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8erZIDLTxmf1m2HH8xQugTTdLGmjGK9/jdlvEoF7f58=;
        b=IyDm250dzpYniHGUHIVInExP2iiUDgN8y4yewCeBg0YYzRxp2vMtFjvdCj8vQ0opHH
         Qf40c2LuNsIHazw+oAFiJWKpiVxmMemfS81Nl6PCLcWs5qqR+apfS9fvim1tCFSA779c
         ViIEU7yz42jGxZv0ZPWDs9XMZUHs5FZ4wkAgoz0vqo3vYbEyyijgf4FXsFtvmZWBGBst
         kOwwyNem+/SuMn3j+NHaHuNsRPVUWzuozPlYlmO+BSdYzDoxtvlvdnFH60LMSm/Q2Xj7
         GvnotXUDAJh9ledIOhb8ZwhchvRXy09l+1DMyyiAN1sJolbEdkqk//oSAd5AmVZlcSw0
         kgSQ==
X-Gm-Message-State: AOJu0YxrWZC0W67TixcONPi/ERiTOyxlsP7fTlcwCMxktxgISiXr+MBo
	R/ov9UO47h/j1BMIbGi3hFnOpw==
X-Google-Smtp-Source: AGHT+IGUIR9znwRjUUxrMi/ay/nLju+L/FpWc6lJv1LUqDx66iRzdK4UFBqkkY58xGux8n6O0R91Hg==
X-Received: by 2002:a05:600c:46ce:b0:40c:3464:f816 with SMTP id q14-20020a05600c46ce00b0040c3464f816mr802894wmo.51.1703165928870;
        Thu, 21 Dec 2023 05:38:48 -0800 (PST)
Received: from 2001-4dd0-53c2-1-46ed-318a-d674-8fda.ipv6dyn.netcologne.de (2001-4dd0-53c2-1-46ed-318a-d674-8fda.ipv6dyn.netcologne.de. [2001:4dd0:53c2:1:46ed:318a:d674:8fda])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0040d1774b4e4sm3323167wmo.42.2023.12.21.05.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:38:48 -0800 (PST)
Message-ID: <caa041d27b0fa45aad09a9a262038e3ae4099ca2.camel@mwa.re>
Subject: Re: element sizes in input_event struct on riscv32
From: Antonios Salios <antonios@mwa.re>
To: Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Deepa Dinamani <deepa.kernel@gmail.com>
Cc: rydberg@bitmath.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jan Henrik Weinstock <jan@mwa.re>, Lukas
	=?ISO-8859-1?Q?J=FCnger?=
	 <lukas@mwa.re>
Date: Thu, 21 Dec 2023 14:38:47 +0100
In-Reply-To: <1a528414-f193-4ac0-a911-af426bb48d64@app.fastmail.com>
References: <c812ea74dd02d1baf85dc6fb32701e103984d25d.camel@mwa.re>
	 <ZYEFCHBC75rjCE0n@google.com>
	 <9e97eb50-f9a6-4655-9422-fa1106fff97a@app.fastmail.com>
	 <491250ba57be2ab983048ffcf5ffd2aec2bedb9e.camel@mwa.re>
	 <1a528414-f193-4ac0-a911-af426bb48d64@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2023-12-21 at 12:28 +0000, Arnd Bergmann wrote:
> On Thu, Dec 21, 2023, at 08:56, Antonios Salios wrote:
> > On Tue, 2023-12-19 at 13:53 +0000, Arnd Bergmann wrote:
> > > On Tue, Dec 19, 2023, at 02:50, Dmitry Torokhov wrote:
> >=20
> > The problem seems to be, that __USE_TIME_BITS64 is not defined even
> > though riscv32 uses 64-bit time.
>=20
> That sounds like a libc bug. Which C library are you using?

Glibc 2.37.

> > __BITS_PER_LONG is set to 32 & __KERNEL__ is (of course) undefined
> > in
> > userspace.
> > The userspace therefore uses 64-bit values as opposed to the
> > kernel,
> > which uses 32-bit values.
> >=20
> > __USE_TIME_BITS64 is only set when __TIMESIZE is set to 32. [1]
> > Under riscv32, the default value of 64 is used. [2]
>=20
> I don't know what __TIMESIZE is, this is not part of the kernel ABI
> as far as I can tell. __USE_TIME_BITS64 should be set by any 32-bit
> architecture if the C library defines a 64-bit time_t, otherwise the
> kernel headers have no way of picking the correct definitions based
> on preprocessor logic.

Okay, I agree that this might be a libc problem then. I'll ask the
glibc maintainers.

Thanks for your kind help and happy holidays!

--=20
Antonios Salios
Software Engineer

MachineWare GmbH | www.machineware.de
H=C3=BChnermarkt 19, 52062 Aachen, Germany
Amtsgericht Aachen HRB25734

Gesch=C3=A4ftsf=C3=BChrung
Lukas J=C3=BCnger
Dr.-Ing. Jan Henrik Weinstock

