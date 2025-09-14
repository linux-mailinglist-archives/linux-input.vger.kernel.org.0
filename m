Return-Path: <linux-input+bounces-14696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EBEB5696B
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 15:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D950F1891A42
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 13:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B11EDA2B;
	Sun, 14 Sep 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND6q329a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063551D618A
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857525; cv=none; b=iw7EENqUgPLod4A3N1wSjg0gOk9aLxXPw1nZ3Jtyx3UpF/8AgrpKe9m/RSVdmCBOvbO897edECI3Edait3VjyQYJpSJJBA6xFZa17wM2jV59r/2YdpqEMjVYPvGvwtkCfhav35Nil2s8h8gs4msoGRvff7J0bjulOXCJ9Ard4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857525; c=relaxed/simple;
	bh=FV8p+SLdKIFqO/3EWnCpzCmMf+GNL0Rh41XOQVklt44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3+OAiOadvdDoauJ0yWlQ7CVRGOAaKGfix2kBw9guLA2js2qFt4tcZXhA3pkQWaguzPDpyp3HXb9+Nfjwd1kpPhBLCtnZI8jf6rY4uzXQHCvBNIsVRIvWAIwItLyhNrcAzY54LKcf+XypsK++bwPZ0Yd2MCDzlhCALr77JQWpnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND6q329a; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so6814155e9.1
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857522; x=1758462322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=ND6q329a1EGIWzr9X2KIU+52m34E5prmFatdZ+tX0K33TUQMiGGV4gk7iSJsD9ytIG
         w+yipH6/RROp+7xDLkUpb8OHQtuey3YeTfp0roesklnuepHQXhZ6fRxgLOueVdtF7o61
         v9qmMqyUNP/Wy0NilM4L53w2oyPR8Iar3uoLYfN83Oq3YVyTT+vXFZZqUMmXQow2WFGj
         6IczwMeT41IFdRwKYke/p7TAtwoJCmbeaAwhqS7H4BWfxdjcbyT5eDJfrKnYgiilIjDK
         RoCYhWRAMqVJOb2mFnX1FRH5FU1t3r7lzQyG8llMrzOFjG2a+iShmgtUtNUyPQv/s6pg
         akAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857522; x=1758462322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=qLqPtmCkG2e66l9Vfw9qViL5qd3lEt10i41cJYKwgJu5/JJ+sYJ+7IqQBwkYgCCN6z
         JgAJNrW3tvVsEFPY63jSeI5BrfCZ3KSXGyKMkoS/u8T+xhOwnVD5OaC+hA9JGmS28fMB
         sv09ZXdXKaoJYiloKZZyJIPBZUlJJJE0UFPDdhRDMb4mqTEpPmgeeb4/qnw5SB4SB5fz
         mai11CX/5AK5v481DISHZQx/x/V/lx31qKkq3SxFoZJBMbhoFkT1/AnXA2jEP98D0rY7
         v5Q5B1fI4d8gJxdjQ3Ll84/KM49u4Xnh/nxE8XhYuXJDah41uFlE1dvgdzY9arPo+1hq
         eyfA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QQ+mXOyqF1RvUA0dc2XT5Rxg7DrkKZAWqllAPgEQWdoc49kvomSdjCqkYqPKdjWAPYsyUsz1oMmFyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tF+/iok84aAzud/PBhbbTohEvy4SIMiqmCsT6oelSo26fO3f
	Rftz2VJSdaEPNqcNzm4wKT7gVaTUUbEKaOlsp+BVZtEBY1P61W097eBh
X-Gm-Gg: ASbGncvowYJ6MdmaIZkP1AUWjIB77asEtBLmHXd6v89Bu+9KhHTULhe2DqOz3uUj8g5
	OLef6mtFNdHM3QPq0Ab/loQa3Zk7RllZor4SPL1VbkIeKJi5NrH7ep65TvrrIu97hqw/gh1dJlR
	xa/TxqHkNCujypAj1wra9StgEhuYTzp6fM7t24X3nlk6rQRG2yJvG3g7f751OfOMNBzaM2LT/Ha
	JWBTZgr/KnfjSYmtH54r1PF3Pz6qUgL0B7Nbs6UCjF1IUQMDr5FcERYUebkbOyee8btiHG7Q1kZ
	FY8PLXSx3OFYYZZhW+WbbT1W0XUwUjqllkfOfH1eEnQRQ83fvXsIsDPMBGrkkzHn2UBoVQ2/S8H
	XBtwras//qTA3dHm/p4Xr+c0sCONOc5q3wbG1Lmv6T91jgMglHArGVBooaRpMw1Z++GF16JhbHk
	ue43kvUjYG
X-Google-Smtp-Source: AGHT+IHBvWsNWGPacN8UTX5YfRqDAFI5tNEvxSQah7xL7TEoK8EoMA73bDud3VP/tlRdpm4BfsNPjw==
X-Received: by 2002:a5d:5f53:0:b0:3e5:6297:dd21 with SMTP id ffacd0b85a97d-3e765782ab3mr7606735f8f.12.1757857522073;
        Sun, 14 Sep 2025 06:45:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Input: s6sa552 - add a driver for the Samsung A552
Date: Sun, 14 Sep 2025 16:44:55 +0300
Message-ID: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the Samsung A552 touchscreen controller.
Naming is based on the current s6s* convention, used for Y761. The
IC is similar in functionality to 761, but has enough differences in
registers, bits and functionality to deserve its own driver.

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: input: document Samsung A552 touchscreen controller
  Input: s6sa552 - add a driver for the Samsung A552 touchscreen
    controller

 .../input/touchscreen/samsung,s6sa552.yaml    |  54 +++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/s6sa552.c           | 439 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
 create mode 100644 drivers/input/touchscreen/s6sa552.c

-- 
2.43.0


