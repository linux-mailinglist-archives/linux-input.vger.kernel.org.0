Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20563491719
	for <lists+linux-input@lfdr.de>; Tue, 18 Jan 2022 03:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344906AbiARChz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jan 2022 21:37:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51560 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245169AbiARCeR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jan 2022 21:34:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9CE8A60A6B;
        Tue, 18 Jan 2022 02:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44533C36AEB;
        Tue, 18 Jan 2022 02:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642473256;
        bh=1eGvT1lId2539jG7iFL1ASpJvwAMqNQSqRD+eUPISvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u1hebQYD5ReqBk108AxBdnpoGetgTUNPmhWGswguHFlC2R7c6aX7oUEupTEBHhW4/
         KMSErc1P4jA3G1+ZYCcjX9cocKdEF56o28tGwC/OswxlClg801/hHMQcI+xQ9YxQ06
         pFWwf6Gyqklpym7jqi95PWUvmnBSIqaKyrGQ2Kb78fqDiLNQQVql+POkJkoDj+a6B2
         3MIPVhXCS+Hzire5LbcQaMvOcHjJaZLibdppS6n2kRmXtn99LksunG4/NWk3Y5OB3l
         nI2T3AJG2owkD3X5+r7jryveKYbckXJgFeslA8ZK8ep0YWd38FgBS54cDKUbwNjvnT
         mS8C1w+b8h89Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 043/188] HID: apple: Do not reset quirks when the Fn key is not found
Date:   Mon, 17 Jan 2022 21:29:27 -0500
Message-Id: <20220118023152.1948105-43-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: José Expósito <jose.exposito89@gmail.com>

[ Upstream commit a5fe7864d8ada170f19cc47d176bf8260ffb4263 ]

When a keyboard without a function key is detected, instead of removing
all quirks, remove only the APPLE_HAS_FN quirk.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6ccfa0cb997ab..b683c0e8557d4 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -429,7 +429,7 @@ static int apple_input_configured(struct hid_device *hdev,
 
 	if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
 		hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
-		asc->quirks = 0;
+		asc->quirks &= ~APPLE_HAS_FN;
 	}
 
 	return 0;
-- 
2.34.1

