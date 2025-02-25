Return-Path: <linux-input+bounces-10372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E1A45030
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0206F188E04E
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF8421883D;
	Tue, 25 Feb 2025 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6U6fphL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4221858F;
	Tue, 25 Feb 2025 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522615; cv=none; b=dF4yLgcL1avgto7DeO8kM49gAnGM0/+rdCNiWPlCrHRP3gpsY3XRkhcYAnnns28nd6KMkAk7rmYyOu9fBz37+hUBFl7eaRfY3DzyPpL8WVn8upS+1K8/l1kkpfhgYoezSF89qmVdkJ3i2PuqpXLXT3NYAmMOLlvq+S5uBZv6aQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522615; c=relaxed/simple;
	bh=wpX4MDEKrwsvmMZvujrY/Z5rpaU0povc3dRNk6Rz7rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGrnnDibejchRUWB5Vm2JpbjfSVVM80+Zqmb2r04HwG8+/c/OxouzvTNU89yDijN5qo8yiQCikBWt9JTs2JK3ECkw3eHrzXVeccvH9TVEuIUvBD/HwvSGEuSfg4r6gIz1SwZX/pjd1asiDTpeBOJy3UaXrsF5dplU9KnYJ15tdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6U6fphL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so110149266b.1;
        Tue, 25 Feb 2025 14:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522612; x=1741127412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KepluMyj1J69FmALxGaavPqtO2RMuar8Zd14QOrTqME=;
        b=G6U6fphLvpiLiirpHU0P7eAyXVzzp7KEZDODQcpmEyacbk82B3NarZcO3GrI/Hg68z
         8x104QEJe3OoCN5K+8iThDYuydplg/Em65wxrElYRFoIlXBwQmWNdBYSDf+DiA8pI1xn
         Zg2Qcz8mLYljAklk8rGi+PeAl4RW3LSkYxpU6Q5rUnDr5HaupulyyR61LvK+stcPM88r
         P9d0PBWjkF9DeqTPHqU2nzt/BB0IZnYnyHa2m/OtYPSGWNmf7pXU5WidC33fi6lbVKBR
         MCzaDDbIKLJD2ycfaKkP6m3k7kAAdiiRB6IK0iw5T7hETC4Lt383AvcjJ+ShF71o3m4M
         4vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522612; x=1741127412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KepluMyj1J69FmALxGaavPqtO2RMuar8Zd14QOrTqME=;
        b=c1m1w2aDeJUp2s1hDPhp/KgJ/TxYNeaohPhXfZ5ymupRAT8t6LPe/xMkkv/HBb2zPJ
         WnIBWi0z+K45BiiXLevo+u1nEk4mB2/ntfMyA18D13jGl+KFUvDBq8J3YZcXSaRK7vms
         I0bEei1BmtrwpKoNVhSmD/f95htiqW0fRlLrLx8WLGZxxUY44FJ/NvJzbWkStj8cTbg5
         AmSKfHhjhDtWgffFGrufo8nwHUqOwAUm4x1YdzcTBP8MA93pDMU7UOpNoEOJyT/wx8AY
         Xtc3h5VhpFk4u1OeW//8Fh8pkeEj/v/zWAFiEPMoXveZ8h0MIDB+9lp2kS3hj+WHvdtm
         SJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUQP8Tjj8Ut2l5qexoP+Mnkxearn8q+3hli/NU3jnMiwW11E8rq9ZtE8ddCx1COmb7O5vme15EKxJqvnQ==@vger.kernel.org, AJvYcCVmNDH3sV7Mc/CK6m+jsJlen9bus6XzmoAu0Rq6UAIn9aKUiaE5ewbM36wZ6pzrQVRti525nvpZgggK@vger.kernel.org
X-Gm-Message-State: AOJu0YzzRAfwsia57RA6biw70dsbFnjyWoLE8uTEi5fSAlDqw9aTeRbU
	WbLM5YWboGdwb/hJbQbPxh9RfzjTKf4ZB/eUF5yUyYGcqKd5S+na3Y3Ca6l4
X-Gm-Gg: ASbGnct2V9PpqJy8q3+p7DYdTZdBiHFYxe/w+0QsuGJqyFPMkdC32Wis3142q2Ryos1
	NlMLlhd8NZ27yMd/yqQAymIXvTz3ahhNk4XanBsuNcMd5aIZIZYjrtJhPxvLn4ZaiAdrTwFZKMR
	LKSNXuo6whsQDaXiAp/sJELoD6MExS1h5pZbGC1zV7Rmqj3+hLd5EBjDc/1s3Q2h6tL65KJvwjk
	MspfyLjbhgbWZ6ol9gh9rn5v1it3Kif/HwRkboOFQmm9pgf92E1m37Eaz9m2rZZWAkQrwS2+IO9
	Yr1V6lS0j3zi80NyutPU7MatdpLNVD5G3/hk0ujdKKx3Yxl0podwpMvO0L7POcpjLuKEilUo
X-Google-Smtp-Source: AGHT+IFKK6j26Hyyk9NmDTaQWRrTWWtem6M9BzVP3zEJfldl8BXwXmh0hdZuH40tvJfCUQPtXAdUPA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abc09a3c1c5mr721291066b.5.1740522612359;
        Tue, 25 Feb 2025 14:30:12 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:11 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/5] HID: pidff: Fix 90 degrees direction name North -> East
Date: Tue, 25 Feb 2025 23:30:03 +0100
Message-ID: <20250225223004.415965-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/hid/usbhid/hid-pidff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a614438e43bd..6eb7934c8f53 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -145,7 +145,7 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e};
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
-/* Polar direction 90 degrees (North) */
+/* Polar direction 90 degrees (East) */
 #define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
 
 struct pidff_usage {
-- 
2.48.1


