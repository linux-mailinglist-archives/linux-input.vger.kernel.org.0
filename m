Return-Path: <linux-input+bounces-9855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A0A2D7C1
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 18:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1650E188899F
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406DE191F6A;
	Sat,  8 Feb 2025 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+F7W0u6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F21241CBE;
	Sat,  8 Feb 2025 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036195; cv=none; b=ab88M7v7Dg0toRugExZMEFyZC0QJd6WCHFElFVuf+ZZEa38jYdIeMkwblKX0xAkGGKE9Udd/5jR04NfyoyAXjlPORM8va0TinqEUEc7lhFFD6y4KZhyyKnPXfDSa3CRxO4W+GzerodGvcOA6bJJ6HlY1XwFMvEqjmBOabz2omv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036195; c=relaxed/simple;
	bh=pV2Dv17dL2PulioC5/LJvildJ3ccDsAFlLGNRJm1g9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lD0lpxQbIv6DxrsrnIyuAXl03YXW6Q2SRfzsfG6TFe0rD+5pJpijQG/dTydTgBmsxBD6OZH7+NFGsPi17NuE+PlpDutGcUzIikPTB03JblAZ0W6vHk21nVndmlTsN3TSdFun+hHhay7cx8eMqIRxdvH3gVJ8YMdoCWRPKOQot3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+F7W0u6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-544107119b5so387459e87.0;
        Sat, 08 Feb 2025 09:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036191; x=1739640991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xxA+6AQA1H+MMB2+UVcywcdFT3ibON4Gb+pRswWaHsE=;
        b=W+F7W0u6s3LPjtQ01NEtk0HZGPC1uOGxnUHYSyIPtPV+Z/A5tg8FNIZCK7Jryz6Mah
         GUNQ5U69yfd7sWn1qm9STM/4BLaJsF1BEPF6PKlYWZC94Akkv86sKL+V5sT1K8+TS9oQ
         BHa9OO3el0wnioPYFcit2aqpkAWHlnGDW8xKIwjQ17a7dPkaAlvvtyLaTkq4tVCVEx5Y
         aLYoASKp7DlKMpI5Sa0jpHSJjb1PufCb/4HEDBBnECTjHNDxR4lUDF/JOS0JkVM47dM3
         exQEYZkW4KxxOD1or8OaNlCrbFcs5qA04JlnqRO+GrE/evX6mJ8paKPzb+Oen8BV23eK
         zcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036191; x=1739640991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxA+6AQA1H+MMB2+UVcywcdFT3ibON4Gb+pRswWaHsE=;
        b=kaRzsT/i0gr3MBx8w4I9im07uLuuB5K5SQM9kd6+8if9gM+Em8euWmk4gGTwqG1riN
         WwTFM9enKlCgDOBFBPOJMrr/jlhNGkOjErFmCJgnbAUlNRdk6ONg4hzHyJGdvNnNvKw3
         SxHS3un30aAlGDflpJ/3V8La+r1dR8YmLmORNzSU8K9B4gQGo0funO5EZUMl2eoc4NBq
         bkrUxXKKOL3j9bvRVY3blG0IcXtaQoJCXat3aV5SgeOcpjOKjPFmPYzxJsJ4/Gt6Cizq
         tDGpGSmDyfz70tYgH/iFPPJ/qYHV0q5RvwzNCbLfu9uj1vsauzsYNf4cZClpcbd9d19G
         HHkw==
X-Forwarded-Encrypted: i=1; AJvYcCUzXzGRUGu0UwBIwqi6sGPcfFBvKXtIi9ZrCHIjELxtg06hAoD3b7b1VVh8qH2pc4hfZnj8QDCtscXysQ==@vger.kernel.org, AJvYcCWS8og1BJLj5zpvfsKH75cOq32QeSeECYQv01T9UVs4yv38S8IU6zYyhjyEuSE09aMT+Qb4UQc9tM4s@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVr3HHaLTgYYyH4YaiZZLrfYfWYwhg3LUcnbF01qQeH2F3ZjZ
	Yc4ZBsSkzrIpd4/6YQowaKVDV1Pu6ei3SxHS19vP79/FP1cF9ohZ
X-Gm-Gg: ASbGncv5oCe52Endz4WUBLlZJezgS0Cg5fvt8aMKwFk4VsyYxW6XBnYYz+wb9D9Z2Dt
	R9kXYbIGFZ/aDSDBBjSLvm5GEal9b4R0EakDMy7cdvrkYypiu20SsIBOQc4oO2PZRmJixB7bqWP
	TrOBrugpU26Ff0rPW3y5fWVrLewPg10CP/8mEecJX7j+YTo/W+eFNXr72koZYNRsZakT49O2eNN
	Srp/G166NnjDrDTeaAjgWu75ps/bSllAVZ9GFnJ0zFwKOHmFTKE6B5g8y2XLBMNQEuZep7XYRya
	fvoyckwx7USZdbJdsohUm/27za44yv4nSQeBml4wlgkuaKpVoDutSsucD+HQHw==
X-Google-Smtp-Source: AGHT+IECKdiH0LhvStH5qEsDhVUgiP6gvZaqSMi2hnje3BeN0OMP8j/1bIBi+B5c4s/j++lL1mNf+A==
X-Received: by 2002:a05:6512:2805:b0:542:1137:612e with SMTP id 2adb3069b0e04-54414ab771bmr948004e87.6.1739036191222;
        Sat, 08 Feb 2025 09:36:31 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm774808e87.3.2025.02.08.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:36:30 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/3] HID: pidff: Compatibility update and new devices
Date: Sat,  8 Feb 2025 18:36:25 +0100
Message-ID: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a small series based on top of hid.git#for-6.15/pidff.
Add Oleg Makarenko as hid-universal-pidff co-maintainer as he fixed
his email server and will be able to respond to LKML inquiries.

Small compatibility patch for situations, where POOL report haven't
been properly initiated and adding Asetek vendor and 4 of their
wheelbases.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
Tomasz Pakuła (3):
  MAINTAINERS: Update hid-universal-pidff entry
  HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
  HID: hid-universal-pidff: Add Asetek wheelbases support

 MAINTAINERS                       |  3 ++-
 drivers/hid/hid-ids.h             |  6 ++++++
 drivers/hid/hid-universal-pidff.c |  4 ++++
 drivers/hid/usbhid/hid-pidff.c    | 34 +++++++++++++++----------------
 4 files changed, 28 insertions(+), 19 deletions(-)


base-commit: 5d98079b2d0186e1f586301a9c00144a669416a8
-- 
2.48.1


