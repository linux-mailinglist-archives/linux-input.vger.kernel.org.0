Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3094703CB
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 17:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfGVPa3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 11:30:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33121 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728802AbfGVPa3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 11:30:29 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60659)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <nikolas@gnu.org>)
        id 1hpaGi-0001wY-8d; Mon, 22 Jul 2019 11:30:28 -0400
Received: from maldive.ccnmtl.columbia.edu ([128.59.207.92]:37352 helo=maldive.columbia.edu)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.82)
        (envelope-from <nikolas@gnu.org>)
        id 1hpaGh-0000PR-BH; Mon, 22 Jul 2019 11:30:27 -0400
From:   Nikolas Nyby <nikolas@gnu.org>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        trivial@kernel.org
Cc:     Nikolas Nyby <nikolas@gnu.org>
Subject: [PATCH] Input: applespi: fix trivial typo in struct description
Date:   Mon, 22 Jul 2019 11:30:23 -0400
Message-Id: <20190722153023.9912-1-nikolas@gnu.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes a typo in the keyboard_protocol description.
coodinate -> coordinate.

Signed-off-by: Nikolas Nyby <nikolas@gnu.org>
---
 drivers/input/keyboard/applespi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index 548737e7aeda..8c7d12c95d2f 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -134,10 +134,10 @@ struct keyboard_protocol {
  * struct tp_finger - single trackpad finger structure, le16-aligned
  *
  * @origin:		zero when switching track finger
- * @abs_x:		absolute x coodinate
- * @abs_y:		absolute y coodinate
- * @rel_x:		relative x coodinate
- * @rel_y:		relative y coodinate
+ * @abs_x:		absolute x coordinate
+ * @abs_y:		absolute y coordinate
+ * @rel_x:		relative x coordinate
+ * @rel_y:		relative y coordinate
  * @tool_major:		tool area, major axis
  * @tool_minor:		tool area, minor axis
  * @orientation:	16384 when point, else 15 bit angle
-- 
2.22.0

