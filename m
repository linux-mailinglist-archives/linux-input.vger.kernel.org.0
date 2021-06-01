Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF42397832
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 18:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhFAQjs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 12:39:48 -0400
Received: from mail.ispras.ru ([83.149.199.84]:34774 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhFAQjs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Jun 2021 12:39:48 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 29B9E40755C5;
        Tue,  1 Jun 2021 16:38:03 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
Date:   Tue,  1 Jun 2021 19:38:01 +0300
Message-Id: <20210601163801.17848-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_add_action_or_reset() can suddenly invoke amd_mp2_pci_remove() at
registration that will cause NULL pointer dereference since
corresponding data is not initialized yet. The patch moves
initialization of data before devm_add_action_or_reset().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ddecc84fd6f0..8394565c4d01 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -160,11 +160,16 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
 		return rc;
 	}
+
+	rc = amd_sfh_hid_client_init(privdata);
+	if (rc)
+		return rc;
+
 	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
 	if (rc)
 		return rc;
 
-	return amd_sfh_hid_client_init(privdata);
+	return 0;
 }
 
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
-- 
2.26.2

