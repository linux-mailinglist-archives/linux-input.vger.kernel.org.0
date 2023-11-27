Return-Path: <linux-input+bounces-268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281A7FAC03
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 21:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04A11B20DA5
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 20:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0383EA60;
	Mon, 27 Nov 2023 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="LwMZNHjP"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 488 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Nov 2023 12:50:27 PST
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57FA19D;
	Mon, 27 Nov 2023 12:50:27 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net [173.49.113.140])
	(Authenticated sender: zack)
	by letterbox.kde.org (Postfix) with ESMTPSA id 5A23D32F798;
	Mon, 27 Nov 2023 20:42:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1701117736; bh=wYChciMP/u7b3bVBtF5SUMzfxSiI5SlS5MrqMpbiQK8=;
	h=From:To:Cc:Subject:Date:From;
	b=LwMZNHjPKu3gQGUs2zBpToliB1ZzYCMuL34W2376Ck6cOVyI7BnjmkZLR8+7sFdJm
	 p0igcbnr2XaZs9e1C0xn9cljMXxomKf5+gzZwVGu+pNPGxTRfTCv2KAt8R+w211UUJ
	 kdtXbq8ylXxg8zp7lP3Cp1Byh9Tv0QsKCG3/QbqrhkC9rGvfGYDUT/EP/yTDHVO4FS
	 hWW6MiNpAMkHLIsnZjdQsmP+dJmUH26o/uR15Vc/Q7uysUC28Yt4N7wR/27GayWwD+
	 OaibKxWZA/5lrDJrP8/CqkH8Ay85xAw/sIJ3PGDlVMmJSepHXER1DZE98GJwFUqggF
	 0hjpDJUqqHUVQ==
From: Zack Rusin <zack@kde.org>
To: linux-kernel@vger.kernel.org
Cc: Zack Rusin <zackr@vmware.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Raul Rangel <rrangel@chromium.org>,
	linux-input@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] input/vmmouse: Fix device name copies
Date: Mon, 27 Nov 2023 15:42:06 -0500
Message-Id: <20231127204206.3593559-1-zack@kde.org>
X-Mailer: git-send-email 2.39.2
Reply-To: Zack Rusin <zackr@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zack Rusin <zackr@vmware.com>

Make sure vmmouse_data::phys can hold serio::phys (which is 32 bytes)
plus an extra string, extend it to 64.

Fixes gcc13 warnings:
drivers/input/mouse/vmmouse.c: In function ‘vmmouse_init’:
drivers/input/mouse/vmmouse.c:455:53: warning: ‘/input1’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
      |                                                     ^~~~~~~
drivers/input/mouse/vmmouse.c:455:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  456 |                  psmouse->ps2dev.serio->phys);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8b8be51b4fd3 ("Input: add vmmouse driver")
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Raul Rangel <rrangel@chromium.org>
Cc: linux-input@vger.kernel.org
Cc: <stable@vger.kernel.org> # v4.1+
---
 drivers/input/mouse/vmmouse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index ea9eff7c8099..7248cada4c8c 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -72,7 +72,7 @@
  */
 struct vmmouse_data {
 	struct input_dev *abs_dev;
-	char phys[32];
+	char phys[64];
 	char dev_name[128];
 };
 
-- 
2.39.2


