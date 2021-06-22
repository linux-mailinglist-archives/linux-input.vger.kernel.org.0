Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9A83AFA1F
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 02:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhFVASA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 20:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhFVAR7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 20:17:59 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714C9C061574;
        Mon, 21 Jun 2021 17:15:44 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 21so1103pfp.3;
        Mon, 21 Jun 2021 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOxPqSpRsO8TR9SgcHctlHiXmgLRizBEA5DIx7tmrqQ=;
        b=NW/LnnJKoU5Qfxr1MZNVNAxSZM9m3KuDgXJ4DQrTaVIFChxKZjohuTDaZUn6JRUdsG
         a/nuVkWh6JuWVb7oM8XWngFjJKNHrTQ+dk1zEDCtqoH71wYJhvb/2Tg5CFjk3nWnOq5N
         +PY5KFJaqzxOu5jtIFh0EaZzPN1A4dlGkuqIZfTjeW62v+yQG2Uf2zDNbZN5H6shLR0f
         2Gvsr7dWkrkN5QeOPGTV8KrvrxJhxjoMeYMW0YioYzp3DxdyBtvwoZmzZWMmh0a0aV6e
         V+XlRkIa9+3AXNYdpnTMWDh+ITs5gRm9lePmUBpBA4hRqB3T1Otf4A646MKp5YJqoJsg
         ArnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOxPqSpRsO8TR9SgcHctlHiXmgLRizBEA5DIx7tmrqQ=;
        b=Ue3EyjsKAOdYZp3nMWW3BR1aE0biTlaewLScpyujYu3tzP7P+iaqSmP/sQZRDcG9lQ
         6d+ZM6Jpl/T7whNOiMY45eRXW4zqC7rS0p++2p7CaaHoVK223JW+5UDl9g+8fJzx0DTu
         nrzXKERDR/IyUpWMziLq4pc3edXpAVYjEDU2YOMXZdUomiSEBaDiYO9KRbk/kEBXLn6a
         AfiqturNRs2L/0bIg6R5/65rfecsrwpKCokmorsKroxZy+3mser32piwfd4t841bZJsY
         Pj0WuAAfFw5TCe5d3rybNGJZpiJORxXu0HVBgWOSW2I0iiTV/OQoesM3aFvvx3tlHAp+
         ADIA==
X-Gm-Message-State: AOAM533WWSVpehLNwZiTnApobrleuOs0a1Hq6ALHgspW2QDW6tAgld1P
        yF2L5sJlPWFjAOGC3mTPy9w=
X-Google-Smtp-Source: ABdhPJyN48GPVtft313utcOL8XS3oLOLmmHyU1X9kOC6rkpuwaAA/BlBCYxKFXagYMPV3A7V4CHMGA==
X-Received: by 2002:a63:e316:: with SMTP id f22mr1040307pgh.100.1624320944035;
        Mon, 21 Jun 2021 17:15:44 -0700 (PDT)
Received: from envious.. (c-71-236-190-222.hsd1.or.comcast.net. [71.236.190.222])
        by smtp.gmail.com with ESMTPSA id n63sm11142432pfn.140.2021.06.21.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:15:43 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: amd_sfh: Set correct DMA mask
Date:   Mon, 21 Jun 2021 17:15:01 -0700
Message-Id: <20210622001503.47541-2-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622001503.47541-1-ecstaticmorse@gmail.com>
References: <20210622001503.47541-1-ecstaticmorse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The AMDSFH driver uses coherent DMA allocations, but only sets the
streaming DMA mask. As a result, the kernel can't make use of the full
address space supported by the device.

Signed-off-by: Dylan MacKenzie <ecstaticmorse@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ddecc84fd6f..c2de650cd8e 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -155,9 +155,9 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->mmio = pcim_iomap_table(pdev)[2];
 	pci_set_master(pdev);
-	rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	if (rc) {
-		rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		return rc;
 	}
 	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
-- 
2.31.1

