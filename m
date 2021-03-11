Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C459337196
	for <lists+linux-input@lfdr.de>; Thu, 11 Mar 2021 12:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbhCKLnG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Mar 2021 06:43:06 -0500
Received: from 176.12.98.74.MAXnet.ru ([176.12.98.74]:53608 "EHLO
        shell.ipa.basealt.ru" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbhCKLm1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Mar 2021 06:42:27 -0500
Received: by shell.ipa.basealt.ru (Postfix, from userid 709000081)
        id DF1BF27232; Thu, 11 Mar 2021 14:42:22 +0300 (MSK)
From:   Nikolai Kostrigin <nickel@altlinux.org>
Cc:     nickel@basealt.ru, Nikolai Kostrigin <nickel@altlinux.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - fix a typo in parameter name
Date:   Thu, 11 Mar 2021 14:41:43 +0300
Message-Id: <20210311114146.1977616-1-nickel@altlinux.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

s/max_baseliune/max_baseline/

Signed-off-by: Nikolai Kostrigin <nickel@altlinux.org>
---
 drivers/input/mouse/elan_i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index e12da5b024b0..55cdf60fe231 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -73,7 +73,7 @@ struct elan_transport_ops {
 	int (*calibrate_result)(struct i2c_client *client, u8 *val);
 
 	int (*get_baseline_data)(struct i2c_client *client,
-				 bool max_baseliune, u8 *value);
+				 bool max_baseline, u8 *value);
 
 	int (*get_version)(struct i2c_client *client, u8 pattern, bool iap,
 			   u8 *version);
-- 
2.29.2

