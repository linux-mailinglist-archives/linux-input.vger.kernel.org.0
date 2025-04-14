Return-Path: <linux-input+bounces-11755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5EA88FE8
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 01:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883F717D00E
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 23:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B897C1F4180;
	Mon, 14 Apr 2025 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpfVEWYs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8751E1DE2;
	Mon, 14 Apr 2025 23:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672106; cv=none; b=N6ivtjfBjPpoqdh4K3xTGyFKE3SMmVS5eOY3CJh3ygJzCcINGp+4TCSfWoVPsGtnhTMwwtawwFfzhjgdfxKcM0BaHj/4sbsViPWV6sQ88f8mubouQ6zDd60D+a4SrMx/BFSeOUAMF0MImYEQxdHKMI/h2mFTYGp1VCvmzqAYeOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672106; c=relaxed/simple;
	bh=XfD8ffN9Nm78fevyv/4fXWARJZ/tMed++zhRH5Nvkkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iKZOzaGp0+h3V1xsTRTWFrjOFvORlzP4/bNJHar6endoin/mS+ZnGpGNHyANYAXiPr4OnqvsKmVqHpxVDcTSpONLScXNqdwyusfPkxl5ZAgrTkI2l0mH1wKPc0LweBmd2oavv1Iyr2R3X3exnhs96RtYUx7WNTVXW/VM/bn7qg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpfVEWYs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb03ad9213so25291766b.1;
        Mon, 14 Apr 2025 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744672103; x=1745276903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJRMiweLG+hO/WGA08j/qE6jlnahNOBUB92vlz8iTTY=;
        b=FpfVEWYsXEe/RGzmfTUbepwJboHPSGunU9anIxEwE4yfMMXzCeS7YpHDGaI23fBd4X
         Qtid10OxS+c9OyUofmQd7MZP9oui0VYPtvXre9f6fKyyYytqqXlyer0xrLDtUOoeXNBz
         OcpUo9tijXfOMzIiA8sd79woYLKMw6uhWAYYW15mgO8A/ppCMXD8nAfSxFZd6VIF/bb/
         AgFG3+sN29LHnYtBZQQtCGdOhdcnuCUWkSYcSCRyJCn0nq/Izq5PdL48nFqtCzRMahny
         9+qIavt2RFH6lEa5PqB2B7JsJ287KiXLmbuP0Vk2gdtNUgzRwVWXl9WWeQUZKtxFCK9z
         Dosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672103; x=1745276903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJRMiweLG+hO/WGA08j/qE6jlnahNOBUB92vlz8iTTY=;
        b=PF8VVbSRWj6Ue8lR6KHIxUvn/8NPoK7jqyrztR/d/t/nfEQibCViSIDlaGC6wGRWMo
         aM/vyaCeFQSkc1EQUph7kZGDDQ1zUZBcWm3UbxvpLx8srI5ag2r0DbgcP8ZhgngiKb64
         XI8AKVCdtpb7qvkg56zswD7AB1O1vpgKGp6VfuxBD8VgMhYrOPlVxvTgLcfesCeUCFSc
         DSItzZG+oN1g2ZtVX0ITUThK8jSoZSB1cvHV+y3oJkhXGFmBtRc+0iYFSriGn0f1f8aC
         3h55/7WwM8MmNQ6VRO8HnOBu+UJ51L+Y9fpRI9CMXDn00Nl+odBx4/Lm61EP9FgWQCLR
         U1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUjCGSp+2C9tqQHNhkEK1Ifs3BADjKF4SULOrlp1W6gcL9jQ2mehIL/FP2jvvGbQlByNlFlZyirXe98@vger.kernel.org, AJvYcCVQjV6nPoZExFBV9pf87VCVqd4onPOtw6FWp03XHaRJKuEthV5KRr+Fvq22jlHLnl9Opnnbnhd3fwaipQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcDAsL37/nICdzN8TSS3OtotsVWZcrI7eg9UEPOXoQj4sqJCA
	TO3NzPF0R4pSwQ0DEL8VwMRipDcay4woGbdWNBDrQhq8qR2CCDy96x11Kw==
X-Gm-Gg: ASbGnctclwnhU0N9/in/z3PDSUm3PzAOjlixpRH0R/hJOKm9t0jIs8baNTu1mgxHf1u
	4PDWVQbzvBrTkkLdJTXKPbbfO9N4pCserkxZ3rsRYHWn4Hsy/gjiHsl2cruG21fOBU01qPOwe8Y
	TSbQEYngI93O5rhtNGO1SNgogcbygZDl3B014p1aazLoq2CSlRDO1R1L0ADefNzr1uMwXb1ZEqQ
	45c4bZWv3bBe1WNk0sSgtgoclPxsGBb1eFwO687ct94yGOQ5szI02yjC7xZHZaeAlfGe42KzIsJ
	+xMjtRWCy0cUoTlaWvnnQ1Ft68t/W97VXDiW7Usf7SQuhwLjcGt+iLg6CMOEX16Hap7ORr8Xtp7
	WLZQEovtSaSc=
X-Google-Smtp-Source: AGHT+IEfIbf1o86N8Yf36KO8jpfnPUgRDeUMr3cQYTik16oJRURgK2gBLxxxT/zgBCAeAJBVQLFP7w==
X-Received: by 2002:a17:907:c8a9:b0:ac7:390f:e36a with SMTP id a640c23a62f3a-acb1404db8amr40859366b.14.1744672102669;
        Mon, 14 Apr 2025 16:08:22 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3e08sm1001328166b.14.2025.04.14.16.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:08:22 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND 0/2] HID: pidff: checkpatch fixes
Date: Tue, 15 Apr 2025 01:08:16 +0200
Message-ID: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No reason to write too much. Fixing errors and warnings from checkpatch.
Made on top of for-6.15/pidff. Applies cleanly on 6.15-rc2 as well.

I apologize for not checking my patches earlier.

Tomasz Pakuła (2):
  HID: hid-universal-pidff: Fix errors from checkpatch
  HID: pidff: Fix checkpatch errors and warnings

 drivers/hid/hid-universal-pidff.c |  10 +--
 drivers/hid/usbhid/hid-pidff.c    | 129 +++++++++++++-----------------
 drivers/hid/usbhid/hid-pidff.h    |   3 +-
 3 files changed, 63 insertions(+), 79 deletions(-)


base-commit: e2fa0bdf08a70623f24ed52f2037a330999d9800
-- 
2.49.0


