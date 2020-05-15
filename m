Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C7F1D56AE
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 18:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgEOQwi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 12:52:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgEOQwi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 12:52:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E3BBE2A32FD
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv2 5/7] platform/x86: thinkpad_acpi: Use input_device_enabled()
Date:   Fri, 15 May 2020 18:52:27 +0200
Message-Id: <20200515165227.28859-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515164943.28480-1-andrzej.p@collabora.com>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the new helper. Inspecting input device's 'users' member needs to be
done under device's mutex, so add appropriate invocations.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0f704484ae1d..8ae11b8c3ebb 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2671,9 +2671,10 @@ static void hotkey_poll_setup(const bool may_warn)
 	const u32 poll_driver_mask = hotkey_driver_mask & hotkey_source_mask;
 	const u32 poll_user_mask = hotkey_user_mask & hotkey_source_mask;
 
+	mutex_lock(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
 	    (poll_driver_mask ||
-	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
+	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);
@@ -2690,6 +2691,7 @@ static void hotkey_poll_setup(const bool may_warn)
 				  poll_user_mask, poll_driver_mask);
 		}
 	}
+	mutex_unlock(&tpacpi_inputdev->mutex);
 }
 
 static void hotkey_poll_setup_safe(const bool may_warn)
-- 
2.17.1

