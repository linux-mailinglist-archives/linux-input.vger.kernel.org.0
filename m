Return-Path: <linux-input+bounces-14058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3CB29296
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 12:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A16321B238B2
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1CE23372C;
	Sun, 17 Aug 2025 10:23:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CA14B06C;
	Sun, 17 Aug 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755426181; cv=none; b=fUnDxQZ3GeQY1ref0BoxjiRb6N+O5ef8oppdWOHqiB6Ppflgx8Kvm9u4ekYTFIRC+ZUn+ceczZuhwDbQG/nVmks8hQXxa2A1CsoKp8cItEUUER8T2o9koZ3ioW3hvDVeBA0nJeIoWRmg9mhd4WBx53yU59GOJh6+I69hl7N6MnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755426181; c=relaxed/simple;
	bh=lJC10/440A/pwP+F4k2P/0FHtlqf6NxLunA99P4CC7U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WIqj70MjcZhYx5VtaNpsnRkkQFeSCgRVTnZc6lqW3To4SSRW+3rdpmo5gsDdvrgOpzPX1O59JRbPg2Ek/FGmH52O+oj4RsOyZ4wFIExBPuvyhWzbvyW/QI9hV0PdQQ9PYy90YnKcxQgKOkkLk5qVRGXIJBKpM+V7HqTcdqgtNDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57HARprR029752;
	Sun, 17 Aug 2025 10:27:51 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57HARpKr029751;
	Sun, 17 Aug 2025 10:27:51 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH 0/6] Fix, extend and upport OF to mc13xxx pwrbutton
Date: Sun, 17 Aug 2025 10:27:44 +0000
Message-Id: <20250817102751.29709-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Goal of this patch series is to make the mc13892 PWRON1 button usable,
found e.g. on amazon kindle D01100/D01200 readers.
A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
extended to the other to mc13xxx PMIC as well (keeping the mc13892
PWRON3 key unsupported for simplicity) and adding OF support.
The implementation has been tested on amazon kindle D01100 and D01200
readers using PWRON1 of a mc13892.

Alexander Kurz (6):
  Input: mc13783-pwrbutton: fix irq mixup
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  Input: mc13783-pwrbutton: convert members to array
  dt-bindings: mfd: mc13xxx: add pwrbutton dt support
  Input: mc13783-pwrbutton: add OF support

 .../devicetree/bindings/mfd/mc13xxx.txt       |  35 +++
 drivers/input/misc/Kconfig                    |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c        | 202 +++++++++++++-----
 include/linux/mfd/mc13783.h                   |   4 +-
 include/linux/mfd/mc13xxx.h                   |  17 +-
 5 files changed, 196 insertions(+), 66 deletions(-)

-- 
2.39.5


