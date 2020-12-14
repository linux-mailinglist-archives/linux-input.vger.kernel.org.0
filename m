Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750622DA36D
	for <lists+linux-input@lfdr.de>; Mon, 14 Dec 2020 23:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440586AbgLNWbw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Dec 2020 17:31:52 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39483 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440571AbgLNWbw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Dec 2020 17:31:52 -0500
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kowN4-0007Xv-An; Mon, 14 Dec 2020 22:31:10 +0000
From:   Colin King <colin.king@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] Input: da7280: fix spelling mistake "sequemce" -> "sequence"
Date:   Mon, 14 Dec 2020 22:31:09 +0000
Message-Id: <20201214223109.82924-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/misc/da7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 9fdbae2edffe..37568b00873d 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -642,7 +642,7 @@ static int da7280_haptics_upload_effect(struct input_dev *dev,
 					   val);
 		if (error) {
 			dev_err(haptics->dev,
-				"Failed to update GPI sequemce: %d\n", error);
+				"Failed to update GPI sequence: %d\n", error);
 			return error;
 		}
 		break;
-- 
2.29.2

