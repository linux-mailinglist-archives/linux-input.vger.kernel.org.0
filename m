Return-Path: <linux-input+bounces-13992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A5B25464
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27EE25C08C3
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11862FD7CE;
	Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU8ldvkp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151882FD7CF
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115822; cv=none; b=XSlZx+sZauaBpSZDPpLnfi44gE6XCuQQ5d0WTvA6RJUDsfHzRGJUYz4+O1aV26KktEhBYC8oycyiPRWIygsZxSDBn3jYx0qn9aGju9HMSZMoZZnyV2LvqIJL7CaP0+Ij4nJhkfUAT7viLenNChUKTnaFQoM0qm2ZhaS64OVwZVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115822; c=relaxed/simple;
	bh=rU9k2cbLvaGzMK4eLVj8A4SzzERpSzfUoqQRBKijbAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzqaYRiy26pVuCVrxzLZT/KljYxrlyD1gcNRuFfj2v7fLLWZVqEj++IaRoob17tHGL1UO/RgfxhEFra9Olc1htocmGKehhFqK16shf/MLIvhVpdKduuGpAtI2Wk8h2Bvs8hIsO9hRAPrTWBe+nN19wYn0Tws49q713G7dk16x6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU8ldvkp; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b6f4dafso38767a12.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115819; x=1755720619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2Vyrn/KvMDB1g9QfNbk/GaamvRlEBmKpmknXqNvjEc=;
        b=IU8ldvkpgmYGDhk+njHGBaB134vgMRYMJSVi1JajMvjHYob/8DtbuSovZiFHmP6vw1
         /jjQW9evTFXenwf/9hH3FnV1FVd5Wk2Rj4wyfftv7JzCRgnLPDM4jS1FKJIDeKn/3fWK
         Qfj4Izb/vnnf6zi0b1rbVrHN++e3laEEyX48/SINoZ3GopCZhd8x/6VjeKSPssu0E3X5
         pbCxX7yHRD+SsP4xzYiKcCasgmE/vBBatgHrHUEu7RO6qrn8ftfBY1+D1OhC2B86E45H
         0vIKVHWi+nhxOIBQZYfAXr/+eJc4FzDfhTcg4pSWh+l/y2G3ccRYv6CbDx/mkdHm9fAj
         i43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115819; x=1755720619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Vyrn/KvMDB1g9QfNbk/GaamvRlEBmKpmknXqNvjEc=;
        b=uTAsqMMZEePCmit7GtDQuRXZJYNOcIagw5IJgp67yQ5MBoMlkN1jhzg1k6WPsgnODV
         naEHmi2vAa3buxFc9Yzwx4GeSkyCXGcl9fF66a8PrCgMKsY8waSNyJy/vhFxSsWH1Wd8
         kqfh1mALm3bn24djUGKhaFaV/xkVJvxi0axIe5AO8p+M2kudaOqS1jsgtiTN8xR9VEqa
         e3rl12E6CiVz62wYS1SGQBFITpSatRLf09kPP0O1n8j5GZnlks+G5biqv0LsUvwo19UR
         Vfx6rIx6A266wRcsOPZss07U3d4Rrr23Pue3NPEN3sTPymFgDHr9It6hxh1M0KIeXDWE
         ZP+A==
X-Forwarded-Encrypted: i=1; AJvYcCVoli+pm2EGSXrcK02PFwuA3MlSCE/U27IHdlfgTdOim6pAfeznmJ0dWvDr6yhHJz+SGOJmnOS0qU5XNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9qeX2fh7wnyhii7ovY6fO6Szr3efp6izE6pe36DSEGiZfhXR
	+QlKiRAHpkv9uG949Fgc3yBSXBhUEGHOmQl5jAvMiDu6VH3BQBNlCXQT
X-Gm-Gg: ASbGncujsscXbVP2YZoEZrqV/24CNaDplvCJ6Tprt34ZCXMeg1HHOyFlc5gU2v39RsO
	dsidROlGDz8WM1QsjmpMX/mJxyou3jxx77hS0TFMYrD+k8YnGtUJIOvZ1vT5GFQ96qKRD4oNy/a
	b64OsUMf6d0FnCorHu8MRw7sdMXxBL8InfaRu44S9wAeV9o6CiIYaBT/RwxD3pEihZHCKtKYMQ1
	VXETsk+ucxDNzi/iJY6GW6OjADRFjklhqs/jTuF7Dr9Y7sE5odixSqfS5+bzaZhwnnGEaWqLenp
	J7lWhXblMLiMp4k+Xs0JqcqLbQdBY5+ZGalkr9cXAg607VyzE6QSM5XdgfiuWrrt7gptLIkVK1g
	78c5tslN+S0MB2oOHiEIO/IFUQyXzNrnRLLW3Y6UETu35bktr3t4o4ELLVYnyco+ARINh/WHRhg
	0=
X-Google-Smtp-Source: AGHT+IFgct/AraWVD6Upjs5oiu6ixo9W7JpyfUSrlxviThufyAU0h9tZkY4/MPG6A0VooX9SaGse4w==
X-Received: by 2002:a17:906:fe0e:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-afcb99d7bb3mr15145866b.12.1755115819209;
        Wed, 13 Aug 2025 13:10:19 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:18 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 14/17] HID: pidff: Define all cardinal directions
Date: Wed, 13 Aug 2025 22:10:02 +0200
Message-ID: <20250813201005.17819-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Will be used by ff-effect based autocentering

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index ebebac5c4384..7f4c1186a44d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -148,8 +148,12 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
-/* Polar direction 90 degrees (East) */
-#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+#define PID_DIRECTION_NORTH	0x0000
+#define PID_DIRECTION_EAST	0x4000
+#define PID_DIRECTION_SOUTH	0x8000
+#define PID_DIRECTION_WEST	0xc000
+
+#define PIDFF_FIXED_WHEEL_DIRECTION	PID_DIRECTION_EAST
 
 /* AXES_ENABLE and DIRECTION axes */
 enum pid_axes {
-- 
2.50.1


