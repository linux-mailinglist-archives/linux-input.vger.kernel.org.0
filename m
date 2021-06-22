Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE43AFA21
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 02:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhFVASG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 20:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhFVASF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 20:18:05 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47480C06175F;
        Mon, 21 Jun 2021 17:15:49 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e20so15574005pgg.0;
        Mon, 21 Jun 2021 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjeQ6YHL6C4BqKPQsAy2CGN9kW0jUoC6gb89fv76eR4=;
        b=lJKwe1abb+L5bLxskk94f1F66Uxn5v6KczAseBu7Duqjm9j/fPiaCkWgEXkwvduGsT
         b58uAdDqWFUmuwe76igsrS40kaNCJBTST9cY2tf5lDdAob0JYBY8VpElUZA7j8EQETzU
         tvSCZg97Lg3KhFTid2Q7NEpm+7LM6MDEJS+KdyOfFJ2fPNm3Q7VuO9Ov0uNQAN98O7hh
         Hu01Ds+PpU1OjpTfxHAF3fPDCbs2+rrJUQzWnzZ2HtpPrs4rlNsIgvXUgDpOMocOElWu
         NNGsWVb/OyfWs5LW3hPPQ5CtZvfGAgkTk/VxsRyEsARblpg6gbPCWF85AFJZ2A8RmWSg
         0P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjeQ6YHL6C4BqKPQsAy2CGN9kW0jUoC6gb89fv76eR4=;
        b=kz2Wk1M84fxERQdElorLNFKP2/kEDuyvhfpW3przgmlZNo8PossK0Z0LJN6gdMN7EH
         s6PcDfGEN785aK7Xf9MNrqoKY97AtuxOYX0Mm+4zxtHsbMZAkaETyfT1uQN8q99QMDPN
         7w7AliK0SasXZxZ2jikXDExsoBLVHfCKNfF3K7nOd00tEwbaCihTT/sMcwW0AEsf0ACu
         /N4tuIrttit4NqZzFKWZcFHLi4kweTnbXpZ9o/Enx+/7CmQNsOz/9TBM1nauTBpTxwzB
         yfIVRKX3tGyDR46ZUxKJUxbUHZR7x2X07S/n0A3NfKXFtECZ/jA5CUWMO4tdQuvElIeQ
         XR2g==
X-Gm-Message-State: AOAM533twZTWWHSk16OBZDJY9bup8IIr6MuftDP3JPCjxXMl5o0Czx9H
        wbikjyntN9cJ1meBVfATMFM=
X-Google-Smtp-Source: ABdhPJwiFUjJJjoOnF8GlTN0ANSH8aIcBswriSUu9jYDNN+E1YUN/0a+kWr4CCRhfPHAn2/H332sCQ==
X-Received: by 2002:a63:5756:: with SMTP id h22mr989096pgm.377.1624320948888;
        Mon, 21 Jun 2021 17:15:48 -0700 (PDT)
Received: from envious.. (c-71-236-190-222.hsd1.or.comcast.net. [71.236.190.222])
        by smtp.gmail.com with ESMTPSA id n63sm11142432pfn.140.2021.06.21.17.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:15:48 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: amd_sfh: Continue if fallback DMA mask is accepted
Date:   Mon, 21 Jun 2021 17:15:02 -0700
Message-Id: <20210622001503.47541-3-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622001503.47541-1-ecstaticmorse@gmail.com>
References: <20210622001503.47541-1-ecstaticmorse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, if a call to `set_dma_mask(DMA_BIT_MASK(64))` fails, the
driver calls `set_dma_mask(DMA_BIT_MASK(32))` and immediately returns
regardless of the result. If that second call were to succeed, the SFH
would not get initialized (defeating the whole purpose of falling back
to a 32-bit address space) but the driver would remain registered
(since `probe` returned 0).

Signed-off-by: Dylan MacKenzie <ecstaticmorse@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index c2de650cd8e..a4f363d082c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -155,11 +155,15 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->mmio = pcim_iomap_table(pdev)[2];
 	pci_set_master(pdev);
+
 	rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
-	if (rc) {
+	if (rc)
 		rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (rc) {
+		pci_err(pdev, "Failed to set DMA mask");
 		return rc;
 	}
+
 	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
 	if (rc)
 		return rc;
-- 
2.31.1

