Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60810312825
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 00:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBGXWE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 18:22:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36875 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBGXWE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 18:22:04 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l8tMm-00013l-9Z; Sun, 07 Feb 2021 23:21:20 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: logitech-dj: fix unintentional integer overflow on left shift
Date:   Sun,  7 Feb 2021 23:21:20 +0000
Message-Id: <20210207232120.8885-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the integer value 1 is evaluated using 32-bit rithmetic
and then used in an expression that expects a 64-bit value, so
there is potentially an integer overflow. Fix this by using th
BIT_ULL macro to perform the shift and avoid the overflow.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 534a7b8e10ec ("HID: Add full support for Logitech Unifying receivers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 45e7e0bdd382..747f41be0603 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1035,7 +1035,7 @@ static void logi_dj_recv_forward_null_report(struct dj_receiver_dev *djrcv_dev,
 	memset(reportbuffer, 0, sizeof(reportbuffer));
 
 	for (i = 0; i < NUMBER_OF_HID_REPORTS; i++) {
-		if (djdev->reports_supported & (1 << i)) {
+		if (djdev->reports_supported & BIT_ULL(i)) {
 			reportbuffer[0] = i;
 			if (hid_input_report(djdev->hdev,
 					     HID_INPUT_REPORT,
-- 
2.29.2

