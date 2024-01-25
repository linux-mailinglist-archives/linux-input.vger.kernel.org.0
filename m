Return-Path: <linux-input+bounces-1465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B683C3D2
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 14:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9E81C23737
	for <lists+linux-input@lfdr.de>; Thu, 25 Jan 2024 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384E356B66;
	Thu, 25 Jan 2024 13:37:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489C04F61E;
	Thu, 25 Jan 2024 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189869; cv=none; b=urgctFj+b1X0OhDV0wRGWVq6z8EnUPxRa2a8xK+ZDrLHJitbNhnwg7LMtYf0GxghVu7uuJSbbsoTh+yafu1XtX404SqHJ/XajH74BkV8qrpvKfpLFdpMnwjBEVumVVbhV/Shau1uiP8U1oN3fyelHLrKCuwZTyo40WWUzk3+E9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189869; c=relaxed/simple;
	bh=vNX5J1BNoN/oAmge8GNeHC9GvvNw97+uOXAjoi/WzK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n8hpOw4PDlA/kBuBuGyD/84vAfbAXsjLmFT4i7XtY7r+UW1E6h/TlWiHTfuM8RS3f12BkVDjO1zunFUiDHxzYAFasxVjsEzyiyMhjvA3DhXgDK6hyICLTATF63W2f6OW+Brl7re6B1mArTVODP2WZHY7B+y/9wSNNBuKm8hubaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191712562"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2024 22:37:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.215])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B8CED42C93AB;
	Thu, 25 Jan 2024 22:37:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] Add polling support for DA9063 onkey driver
Date: Thu, 25 Jan 2024 13:37:30 +0000
Message-Id: <20240125133733.95081-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no
onkey IRQ populated by default.

This patch series aims to add polling support.

v2->v3:
 * Created patch#1 and patch#2 for removing work.
 * Updated commit description as cleanup is done in patch#1
 * Dropped scheduling work instead start using polling as in the polling
 * case scheduling any additional works will create confused state for
 * driver if we repeatedly open and close input device.
v1->v2:
 * Updated commit description
 * Fixed the logical mistake for optional IRQ handling.

Biju Das (3):
  Input: da9063_onkey - Add da9063_onkey_report_key()
  Input: da9063_onkey - Drop scheduling work
  Input: da9063_onkey - Add polling support

 drivers/input/misc/da9063_onkey.c | 130 +++++++++++++++++++-----------
 1 file changed, 82 insertions(+), 48 deletions(-)

-- 
2.25.1


