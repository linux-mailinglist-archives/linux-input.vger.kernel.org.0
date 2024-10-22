Return-Path: <linux-input+bounces-7604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D709E9A99D2
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 08:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63423B2154C
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 06:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A82142E9F;
	Tue, 22 Oct 2024 06:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1r2s5bA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1C126C02;
	Tue, 22 Oct 2024 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578729; cv=none; b=VnQ+pZ2GsXtr58OKt/TguwAV1YiHfrBRuKx1iXo8FasuEOj4nWuwc7kEVtVghbhIDBfXiB+PTrHqDVAacXkosXi/mzoHKHcQySXZ90ILMgOLyrn90kjSiewxPmxoroBp+DLPbva+XOMryj3ujdsf+eFzOv+m4vk3Bl7MRZI+3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578729; c=relaxed/simple;
	bh=fRv3QAZ5GTT1Ytn6SNlfvUscWQW7sf1SPvVZnk5xV1w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=oA4M3njBxL1AnzVwvVhQqRjkZcjA9VILn7EvH4e31h9yq+yuz1Al81sc43ZjVR/F/++YJ7c30hI71zoYgwia1eDcQVXeLoVuVYtKVUegWTn3NvMzuwAlBUos4puupS3vYuZWX/TXjmTc0rMPaKTWYUMPcWV5HuqkZLYx7my5B0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1r2s5bA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso4385524a91.1;
        Mon, 21 Oct 2024 23:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578727; x=1730183527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0ZVg94ADVSlaDxa+1PXOL3bzB11GUZscW4ia7W/tYk=;
        b=R1r2s5bA02z11dBb3XB/QVXOgONzJjPWuk3oEWtyy7rcUh4ckdAERlvrRti/RGaCUo
         UnUwNc33tsBXSY8e3g5nYjGFYoT7G4Phgmvj+U/8a1JmbJsdgzeU85yontapHHmAR3Eb
         pLqVT4zNKAfgTm2hyRkiHIA4MyFLQHDyKWBR9dxdZtxV9vdNadgI/iZa95ubGXpL+0Zo
         ApziIhH66iy/Vmr8ZhDkYG6k2gv60snJC/vQKIlusPypkU9sfe16zujufluEVj2+k91Q
         QT7ELLvhZnd+ig5VXRoPh+uZR8hBG9gAYtK6KL7mumrXm1iIHJZivV/+eLDm0aeXSiBk
         bP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578727; x=1730183527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0ZVg94ADVSlaDxa+1PXOL3bzB11GUZscW4ia7W/tYk=;
        b=EsBm9glCneEs4/p25+NQLVmZoY7bsq7r1iOE3W2Lf+rjp4dnVVdJ+w6+8cOCwesHeL
         xKlxM05y7hW+yPmqAezcCysWt+3sqg9tW+z5AvUJjRmR5CJtjF5SlyDDjj5mfa/NNnrm
         2rNYrJ85Sw3jFsmG+8RV7GKE2e3C2swEr3WpmLg5WyhPiHxaPX6rkIxrabTcfdFJot4h
         8/WEHx6ewhuYs0inIG9D0FGi/IBoyA1iTCj1Km4BJFc2/MTo3/eL1sC9F6M0WpI1ucdq
         n0F9VM39oyIdk/uR0i4J9mG1ZZ2uhur4sTRLUK8FD7Gjrg2CBhPuKhoiAtcuStfnC+6b
         0DLA==
X-Forwarded-Encrypted: i=1; AJvYcCV05w5WkU2QudI+MoxdjOb6A0JsFRWXqAduUF2V2QOCtOcttq/26c4x8++Y7qlH+n0ijkc3Dc1dBclg1fw=@vger.kernel.org, AJvYcCXOF5P18FYF/Hiu6OGrguGmrKh9oIEGRdclEta0gTUP2fpNfzb4WAcG2KqoiHh3Z8XjMt7j4qutpHRE@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3GGpxNb9z6VdxQQiga8nGf3XrUQK0wErhCg+WTHRWtJv0NSB
	cYzNUOe9Oe48ZGEl4nw9C98SPhbfOLRC4ukUSX9wk0jvWrFt0m3n5zv8fKfc
X-Google-Smtp-Source: AGHT+IFXgTBiFgFsXxOg631XJW9inf5ov3uskzvCNIx2xVHr9SuSJamqxyvMEirBwTsGX8DTDMZajQ==
X-Received: by 2002:a17:90b:f0c:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2e5db94f135mr3456580a91.5.1729578726704;
        Mon, 21 Oct 2024 23:32:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad355bebsm5227508a91.7.2024.10.21.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:32:06 -0700 (PDT)
From: mjchen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	mjchen@nuvoton.com,
	peng.fan@nxp.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Tue, 22 Oct 2024 06:31:56 +0000
Message-Id: <20241022063158.5910-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: mjchen <mjchen@nuvoton.com>

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

mjchen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nvt,ma35d1-keypad.yaml     |  88 +++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 312 ++++++++++++++++++
 4 files changed, 411 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.17.1


