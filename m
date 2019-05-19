Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D34522887
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2019 21:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbfESTYG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 May 2019 15:24:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53819 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfESTYG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 May 2019 15:24:06 -0400
Received: from [61.149.195.63] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <aaron.ma@canonical.com>)
        id 1hSGEC-0004LW-CO; Sun, 19 May 2019 07:27:29 +0000
From:   Aaron Ma <aaron.ma@canonical.com>
To:     aaron.ma@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com
Subject: [PATCH 2/2] Input: synaptics - remove X240 from the topbuttonpad list
Date:   Sun, 19 May 2019 15:27:11 +0800
Message-Id: <20190519072711.2592-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519072711.2592-1-aaron.ma@canonical.com>
References: <20190519072711.2592-1-aaron.ma@canonical.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Lenovo ThinkPad X240 does not have the top software button.
When this wrong ID in top button list, smbus mode will fail to probe,
so keep it working at PS2 mode.

Cc: stable@vger.kernel.org
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/input/mouse/synaptics.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b6da0c1267e3..6ae7bc92476b 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -140,7 +140,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
 	"LEN002E",
 	"LEN0033", /* Helix */
 	"LEN0034", /* T431s, L440, L540, T540, W540, X1 Carbon 2nd */
-	"LEN0035", /* X240 */
 	"LEN0036", /* T440 */
 	"LEN0037", /* X1 Carbon 2nd */
 	"LEN0038",
-- 
2.17.1

