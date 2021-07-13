Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0933C7A34
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 01:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbhGMXe1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jul 2021 19:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236769AbhGMXe1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jul 2021 19:34:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E98C0613DD
        for <linux-input@vger.kernel.org>; Tue, 13 Jul 2021 16:31:36 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h4so8668pgp.5
        for <linux-input@vger.kernel.org>; Tue, 13 Jul 2021 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c16B53AMzrWqTiLJqVq2Hwe2+BRNxLsTriDQMjogBPQ=;
        b=Vlkwk3jSv++iPplOk9ce1YlVuAo2Lg90N2BDr/zu36kSKAqLfiHkrBQKGt58D3yZI+
         WjMATj6GG87nYymuQy5LA5JdrnjpBy4dq4YZmBuIBB34EgtVMdSptnOeOWe5X7/dCQNM
         Kwu3ByyyiJNbaEZB0i5Ves7alvHDesCseQ9/ERqYP+YxylHyUQdNPr/CCcGO1g16qYXc
         ai9QfXCVq6FaIK26BiBOOYwI86ifT8bVYyhixw8mqFuH6XpIxRzbMqc0zHZJmHcElF7F
         asu8dnx8vrDwW6OsMESXyGTFZybCxvEVHbjh+dAFcmUJpU4c5JD3RSiQU1bzX84R2FVm
         a4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c16B53AMzrWqTiLJqVq2Hwe2+BRNxLsTriDQMjogBPQ=;
        b=EuvC1GKlblorwLnwQaVhjPAeTzs2NoEynSxkOzKBvk5VqAlTbSin2RwJ6/002sSZd1
         kZ6Tb5xA8xLmjh3vamJSyQeJJ4IQxEGRNcJp55p96T1oi9e87l4BF1eshKrBDT1Kx8hu
         2iqmfOdL13xw1+5/w28Mr7bhkWy+UzffJieawb1aKG2fNJYgwdemVyqeik5E2iR/8AB1
         CRkrYLqw/z6quH6rfuRNqbN3up0jwfbMfkE8EKg62pfrzmZXJtt1AzJs/Af9603+wSut
         BwXKWi+3VaZUOc37C3kSqn6ZhGpAtXXtaswfnTSoqwZCPuYqzo44qnwSVERr3Rx5I5wj
         0QiA==
X-Gm-Message-State: AOAM533YEGCIRXKz5lB3EkMFPAxYwTxw1Jr0drbCuz/IlIa/G9ACmBen
        GeIRytgWmJ3NmyyiSNKqFcc=
X-Google-Smtp-Source: ABdhPJx5q+Tm/4H8a1RMGtbthua5PKAi1Bqg5A3+Isk5WYmLDr7vkB4k56zW5MPpNOaO+PA5t3t8+Q==
X-Received: by 2002:a63:f44e:: with SMTP id p14mr6424618pgk.143.1626219096370;
        Tue, 13 Jul 2021 16:31:36 -0700 (PDT)
Received: from envious.. (c-71-236-190-222.hsd1.or.comcast.net. [71.236.190.222])
        by smtp.gmail.com with ESMTPSA id p53sm244508pfw.168.2021.07.13.16.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:31:35 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
To:     ecstaticmorse@gmail.com
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, shyam-sundar.s-k@amd.com
Subject: [PATCH] HID: amd_sfh: Use correct MMIO register for DMA address
Date:   Tue, 13 Jul 2021 16:31:07 -0700
Message-Id: <20210713233106.9168-2-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713041121.13418-1-ecstaticmorse@gmail.com>
References: <20210713041121.13418-1-ecstaticmorse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

amd_stop_sensor_v2 accidentally used a different MMIO register than
amd_start_sensor_v2 for the DMA address.

Signed-off-by: Dylan MacKenzie <ecstaticmorse@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 96e2577fa37e..8d68796aa905 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -58,7 +58,7 @@ static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
 	cmd_base.cmd_v2.sensor_id = sensor_idx;
 	cmd_base.cmd_v2.length  = 16;
 
-	writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
+	writeq(0x0, privdata->mmio + AMD_C2P_MSG1);
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-- 
2.31.1

