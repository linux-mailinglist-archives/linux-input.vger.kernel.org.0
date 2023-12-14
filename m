Return-Path: <linux-input+bounces-788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D81812C8A
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 11:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8751EB21041
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D332F86B;
	Thu, 14 Dec 2023 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="AAH5T3/r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE99BD
	for <linux-input@vger.kernel.org>; Thu, 14 Dec 2023 02:11:24 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so74438135e9.3
        for <linux-input@vger.kernel.org>; Thu, 14 Dec 2023 02:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1702548683; x=1703153483; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DwJPwRC5n42ZUrIXnJ3iNJ62mEI4hAuX8AmnWt5GOxU=;
        b=AAH5T3/rqEOq2dzaJ2Ufabe5Mk6VaPvprls3UoMcYTv3bRd2kHUJyazl7R9nr1vPWj
         5ZUCc3fuGsOgDCOCFmc1+o6j+Ydd79pY7yi8VIg65Kk1fIDUlm3uKrq/2Vk10bTOjVTM
         /4G/SxdXrDOhOnPCKjuC070BEjLNgO3j8jLtJ2W6ER8/JkTxT39VXK42aR7ohNzBmBRj
         gYPaL3NwFw7I2y8gugnda4SgSqL2eDIAoYjft1emCBKqLLapFCHlvH2uPHSwI6IlFTPc
         c1lUSiMohcKB8urIMmbh7r/4KPtRxbVfOR72xm7HXUbPE7lBnEa+TvVFA/j8uQ2Ow4QM
         Vhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548683; x=1703153483;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwJPwRC5n42ZUrIXnJ3iNJ62mEI4hAuX8AmnWt5GOxU=;
        b=Uw1Hbum75jJfMIbt4rpRUEF2NbG0gHmpvkjZzcnPGAfYMmT45qQFcSGx+BmhfLQYO3
         nqpgCnTDFeEkxnzHw56MycJgK0DrkBe53Bjl7Y9C7vl95B4yyt6Lbry4QEZx2ypTJtoL
         AmndA+RI4mXDqTktgkyH4Xu5KhrOHhpboOMLV0rFsPV2LPrNY5SxVOMy5IQDSUsr2iey
         oPWuQQVurxoNTmHqJKcZvx1eEn6JgFvv1pO5XrMybUTlaCiMQTdCMZA0f1Lpm32SrBkU
         a5MEg1q7AqmDLEj4c55N+27sC57MTDsk5TkH1VkeKVcLfFZwjU+xXJcOftXrBRpWUakH
         z5KQ==
X-Gm-Message-State: AOJu0YxYCuImChSPyLSZtVM5060+qZNgAiG+ZZZwHjwnJ2M39XZp7BHR
	1QXlU3eiXfM7yjLPSdOuDJBWnA==
X-Google-Smtp-Source: AGHT+IEwCgUn9rve/eSSnIs2eQKl/d1mHCrM3llLrsOtX7YNvUUHF9eUP2ONysYZWLp41VSUnG0cLA==
X-Received: by 2002:a05:600c:3b1f:b0:40b:5f03:b39b with SMTP id m31-20020a05600c3b1f00b0040b5f03b39bmr2857734wms.189.1702548682746;
        Thu, 14 Dec 2023 02:11:22 -0800 (PST)
Received: from 2001-4dd0-53c2-1-52b8-d67b-716b-9a96.ipv6dyn.netcologne.de (2001-4dd0-53c2-1-52b8-d67b-716b-9a96.ipv6dyn.netcologne.de. [2001:4dd0:53c2:1:52b8:d67b:716b:9a96])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm14119157wmn.13.2023.12.14.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:11:22 -0800 (PST)
Message-ID: <c812ea74dd02d1baf85dc6fb32701e103984d25d.camel@mwa.re>
Subject: element sizes in input_event struct on riscv32
From: Antonios Salios <antonios@mwa.re>
To: dmitry.torokhov@gmail.com
Cc: rydberg@bitmath.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jan Henrik Weinstock <jan@mwa.re>, Lukas
	=?ISO-8859-1?Q?J=FCnger?=
	 <lukas@mwa.re>
Date: Thu, 14 Dec 2023 11:11:18 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all.

I'm having trouble getting evdev to run in a simulated Buildroot
environment on riscv32. Evtest (and the x11 driver) seems to be
receiving garbage data from input devices.

Analyzing the input_event struct shows that the kernel uses 32-bit (aka
__kernel_ulong_t) values for __sec & __usec.
Evtest on the other hand interprets these variables as 64-bit time_t
values in a timeval struct, resulting in a mismatch between the kernel
and userspace.

What would be the correct size for these values on a 32-bit
architecture that uses 64-bit time_t values?


Kind regards

--=20
Antonios Salios
Student Employee

MachineWare GmbH | www.machineware.de
H=C3=BChnermarkt 19, 52062 Aachen, Germany
Amtsgericht Aachen HRB25734

Gesch=C3=A4ftsf=C3=BChrung
Lukas J=C3=BCnger
Dr.-Ing. Jan Henrik Weinstock

