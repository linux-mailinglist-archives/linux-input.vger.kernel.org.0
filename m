Return-Path: <linux-input+bounces-4946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3785D92CF44
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A98D7B290C6
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 10:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BAA1922FE;
	Wed, 10 Jul 2024 10:28:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88321922F1
	for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607327; cv=none; b=qjKUoq/KIraVXeTzvGsBVvR+JAx8pCK+LGXjMX3FC2E3oJ3vaT48JjLa6o6j6RcJBUKSJD1Cn/c/oS1dyKnb1PnUAD2ijHRa/WT3UBkmScHynYYpiIJS4+SQlS6qOvX21VX3rH98IrTech+R9KHYkxAq89U7XaffboOe8RfyVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607327; c=relaxed/simple;
	bh=gEgMkBU4WxtJ5COcKXI5DIYZlMPRdvHUdvbN021sfQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DjksGMfneYVU1SGvsZUA4PbpvFeDiREIrvRaX9JrKokf6V+lDSBxQ6pLnc8NLk9exZ4Sn6qAqaWgPa2mUbbcDqldtS20wjA5XtYysdyz0mRMKJuP0M9MWy9jVnX6+db736+o/LVGkuozlDQUs8IrVq99OZqKY9FHDzr1b8EH7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sRUYs-0001Y8-UU; Wed, 10 Jul 2024 12:28:34 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 0/2] Input: exc3000 - EXC81W32 controller support
Date: Wed, 10 Jul 2024 12:28:30 +0200
Message-Id: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5ijmYC/4XNwQqDMAwG4FeRnpfRpurqTnuPsUOtUXup0mrnE
 N991dNgjJFD+H/Il5UF8pYCu2Yr8xRtsINLQZ4yZnrtOgLbpMyQY85LLMG6cZ6AFiM55/tW4ik
 RCpWm1rmuVMvS8eiptcsB3x8p9zZMg38df6LY279kFCBAmxwbWauLbtvbSK6bJz84u5wbYrsb8
 dNSPy0EDgZrFFqWleHFl7Vt2xuYqFLaDQEAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15-dev-13183
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

EXC81W32 controllers use the same protocol and have the same resolution
as the EXC80 controllers. They can be supported by the exc3000 driver
with minimal changes.

Their featureset may differ, though. Looking at the messages, it appears
the EXC81 also supports touch pressure or area measurement, for example.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v3:
- mark exc81w32 as compatible with exc80h84
- Link to v2: https://lore.kernel.org/r/20240628-input-exc3000-exc81w32-v2-0-c2b21a369c05@pengutronix.de

Changes in v2:
- split device tree binding compatible update out of the driver patch
- Link to v1: https://lore.kernel.org/r/20240626-input-exc3000-exc81w32-v1-1-ac42d3b87aff@pengutronix.de

---
Philipp Zabel (2):
      dt-bindings: input: touchscreen: exc3000: add EXC81W32
      Input: exc3000 - add EXC81W32 support

 .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml  | 12 ++++++++----
 drivers/input/touchscreen/exc3000.c                          |  7 +++++++
 2 files changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240626-input-exc3000-exc81w32-58585ba4a98f

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>


