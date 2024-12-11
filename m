Return-Path: <linux-input+bounces-8488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46B9EC09B
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 01:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241DF1693A4
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 00:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A05748A;
	Wed, 11 Dec 2024 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0lGhSeCB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D23A95C
	for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876407; cv=none; b=IpxaOa2rGrh644HPe+RqTaKWETuVKgU+7sODLBKOlK5fBk0KXrbg1gGaWaAqZJYn4DAKfrErezSJ36tNxa/b3V/bCLzVRnux8t3nfZ5HIxJgdf8QE1S2LuZyWoHUciP+U6RKgByxXoVM42dPRjsNIOrO5SUHEL2TuE/SoDn9oVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876407; c=relaxed/simple;
	bh=FJNDkRivl5n3c3f0lOliUISNZyJAuRgGaTVNaOSMOMc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FhdiMX2O5SJwIq3efcUl5U9E18ZzFZP2M+j0UWpOWIE/7KOduOBks4mzWLYqb2Qk4aMFpi9gcPDpusRQ51nib3LT9aIFUZQyzRerAYnber9MRA/twwLTbdidpGb6aDi08UeIw4d/WSY87AHVMeAcLx45qh+MOYn8NiCOBpCUP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0lGhSeCB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215770613dbso41327925ad.2
        for <linux-input@vger.kernel.org>; Tue, 10 Dec 2024 16:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733876405; x=1734481205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRC9yEkE9g7vVhAefcxCRjeWRe/ODE9AB6GWqjMTtzM=;
        b=0lGhSeCBL1rZ1VXzTQyVZl+BJk5Is6MUziDctBUR2/Dpf7XQLAHunh70K3Ho7A6ROR
         R2QlhgxkRbkV6+FMCzvESc92QC8S1R55jgyMV8BkZiqgdq4KdTMFFGsRzpCJZ6G5SGWh
         TcaqwWK1DEXMignO5Zm7FI2P/0iz3M8auXZ9YL53R30HYrylr5lD5sRVX7cCeUgo4JiW
         L6Sf2Sodfe0NQtquFBFaxrAYQdTyuit58iPn3EyvtFb1ShQ+ZHGYsUViIwgJuEZz17U7
         4R2CyDIFjOfA6UAgpXrAzNPKbquDPbFWTpE7IjNmD/lWUXo7q5x31m8/D28JPwjmyUv6
         NpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876405; x=1734481205;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRC9yEkE9g7vVhAefcxCRjeWRe/ODE9AB6GWqjMTtzM=;
        b=rIMyM13+uhIWG101NlUidLHLbTnAxlRcj2uxzmHsNm4U0bM6UJJMbWm89hsz4UIsY/
         5ltb04sYOordkYSxP/tsvaVhiyNf6M1wM3R8sWimtIYKHaEhI8KZ9B36un7RmXkfBUJN
         mNIn/hpwerxkA+0NGut/0Gvyt56h9fBbXRt/vMR24xI0tUNU6nlmGAkXqoFrf6Csl9z3
         bWRLFL7v+LGorbHzwjOuP1/RBnUiCVWRI51BdoNpO9ZD5qQTKXm8RmC+g94jwYZk0+6a
         uS3mpx0UR23T8lTO8SXYlrexfENHiRWqu28e1HHJr59KqjH7hpFepLrUSz2Oug9Tt7Qp
         4mYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVv2UfrsDuxZYnJSQc8qKKoELjqxr4nXL2rtmpZgsC4SBN4yPg2Jt6LdsmgjOx0/o64Dia5/xWaiLTYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzb+2K40nEcObPr/nOMvjuMkxWVdq3xOkSevqj+kjy7h0P4rK
	sReEdbC/xgpNlgx2NLMOgiCfZI7pPuQC+SLCgBqHmnokZQwb3mQLP37znImDPbs=
X-Gm-Gg: ASbGncskm6G1WpFPne9Yf6TE9zDJ1MWcOBfKptH0X8w+HPNi+qMzzQ42x/CpGX1pUDU
	oqr418TwC78ed2O42v9z+CnnPNdBFhg6rKjR21CyNl6O1WDgYYHGfetgp5DW1LG1NEB6p94IeMn
	yVZDeKe2toC1txWZcbJ+L5FvBG+9d6O5DQANbPEwarLuQO26rPl6z5hpVwYwWrqmFT754fdX5yz
	HQhCvCFfdsa1Pq6AKStWyro72VDYbQ2306g/PyT4UL4Y8h+hUSG
X-Google-Smtp-Source: AGHT+IFmcRdR0HCB2a3gaNUahUkUF+BtT/p6ITp1NBqQs83IckQiXsxBMl0idj1mc28sf0T45oP52Q==
X-Received: by 2002:a17:902:db0b:b0:212:6187:6a76 with SMTP id d9443c01a7336-2177851fac3mr15669435ad.14.1733876405035;
        Tue, 10 Dec 2024 16:20:05 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216364e471asm54499955ad.92.2024.12.10.16.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:20:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 akemnade@kernel.org
In-Reply-To: <20241205204413.2466775-1-akemnade@kernel.org>
References: <20241205204413.2466775-1-akemnade@kernel.org>
Subject: Re: [PATCH RESEND 0/2] ARM: ti/omap: gta04: properly specify GTA04
 touchscreen properties
Message-Id: <173387640426.1968502.1994971041924318982.b4-ty@baylibre.com>
Date: Tue, 10 Dec 2024 16:20:04 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8


On Thu, 05 Dec 2024 21:44:11 +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <akemnade@kernel.org>
> 
> Specify touchscreen in a way that no userspace configuration is needed.
> 
> Note: if the devicetree patch is in without the input patch, things
> will be broken in a different way.
> 
> [...]

Applied, thanks!

[1/2] Input: tsc2007 - accept standard properties
      commit: 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1
[2/2] ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties
      commit: 77f40f1983c40f6dba0a5eef125a037498de8268

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


