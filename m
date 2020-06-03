Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C62A1ED1A4
	for <lists+linux-input@lfdr.de>; Wed,  3 Jun 2020 16:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgFCOEd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jun 2020 10:04:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52101 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCOEd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jun 2020 10:04:33 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgU0N-0005Bd-9F; Wed, 03 Jun 2020 14:04:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: elantech: remove redundant assignments to variable error
Date:   Wed,  3 Jun 2020 15:04:31 +0100
Message-Id: <20200603140431.131347-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/elantech.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..e4f394cc0520 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1897,7 +1897,7 @@ static bool elantech_use_host_notify(struct psmouse *psmouse,
 int elantech_init_smbus(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
@@ -2015,7 +2015,7 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 int elantech_init_ps2(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
@@ -2036,7 +2036,7 @@ int elantech_init_ps2(struct psmouse *psmouse)
 int elantech_init(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
-- 
2.25.1

