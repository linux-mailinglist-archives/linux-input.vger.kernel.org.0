Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5124393EF
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 12:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhJYKsh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 06:48:37 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41615 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230342AbhJYKsh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 06:48:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4F59858054C;
        Mon, 25 Oct 2021 06:46:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Oct 2021 06:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=tVeVTD/n1RNuci2s4vL/2pyEqm
        YGY1CKKlCMxISrbSc=; b=SMRKL39Ml96zqcGCn1DFiTCfB9cbXRVo7c3q9J1NVy
        +TgiCZb+oqueOV54YvGuGdZm7SWsxU9nIzyZ+89mzxw2ShzGxhaqKqnTFYBoDZh8
        LnkkPBiuCUlMt5VzL5fzgLWPCUdwvoe16XN7SyA2AY5GGadG4SFnpfrcwRK3oQZi
        AWRlP3OZpF8/nNZKjWpAfLMtyx6rN5xekySNCqX2dFb1DWT67Xp5TGvhF3FsaaOV
        u9M5lbT9uMwIIbDPe32vb+ZtCCbFJuNUCnXw9cgUMMH4nWByLROyLO982/W9R0mm
        oOWfJl3Qdlc9/Z0QUPgJqNvfnHJ2eqBpHiqFlQ8VhkUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tVeVTD/n1RNuci2s4
        vL/2pyEqmYGY1CKKlCMxISrbSc=; b=VmueU+s7C2JLOPGRuPslq8y/Qo1B5ubXI
        qpV84SspJ6prSbJ0zGUzEWiMx9bUbUKH6xVRxbLRNor+rDrFdvP5oJuoq+4kbCOT
        QnJHMIUzLv+vqa513C43gBt45H5itZ/Yq7Q56O6g6vsEDod1veLOhkm4wCqRzAoO
        mskaR/tfn6z10Csuf+mHVgqfWpk8enigjIiI4MaTk/sy/Fy5Ku87k1XqiQycb0Uv
        47ZgYAoCejqtasol2ARpg/XB0SNtSZ5C+TszfQxhCPhGtN6uQHsmJhoA1aywnrIP
        5rrQ6G0yLu82R8okuX/UycTYn+pr9LZDZ7F3ERBhjkcle1JtfxIVQ==
X-ME-Sender: <xms:9Yp2YY1HgA9LAua0Mzj1pQ31c3j3EBK7RD--dMfal9RRURaI0vClIQ>
    <xme:9Yp2YTFB2V1uhadSx-mU8v5pN5wLzqHefxQWyDBU16jnXJgxjvK24Q31agDZr9JIq
    0UYgk4j43Pk7zvaNLc>
X-ME-Received: <xmr:9Yp2YQ4gn7Redee08Bbjx3QUdqZs8wq6NMa7Wh8fD26aciZbHF31bSaJ1FU-75XRPiVdomvYL4Ay>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:9Yp2YR2mWNQNXVv0UrX026Rg7r2w4QXl98q5eJ5PrNL-6xolAhqzcA>
    <xmx:9Yp2YbGM_JMpxluNG4t5RaHKhBhqnf2vw8JWjnZB-dfLu4lgXQDtqQ>
    <xmx:9Yp2Ya-JAZtIPG9yHDJzD1uOVxHpENyvU33yq0kSMDTyB7yf4MbWaA>
    <xmx:9op2YT-t0zxEtF2Sb--KrElp_b6NBEMSYXdIrHnrw45eSrAWfyqckA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 06:46:08 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     s.hauer@pengutronix.de, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org
Cc:     alistair23@gmail.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jikos@kernel.org, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v13 1/3] HID: quirks: Allow inverting the absolute X/Y values
Date:   Mon, 25 Oct 2021 20:46:03 +1000
Message-Id: <20211025104605.36364-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a HID_QUIRK_X_INVERT/HID_QUIRK_Y_INVERT quirk that can be used
to invert the X/Y values.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/hid/hid-input.c | 6 ++++++
 include/linux/hid.h     | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..4babf369184f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1328,6 +1328,12 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 
 	input = field->hidinput->input;
 
+	if (usage->type == EV_ABS &&
+		((*quirks & HID_QUIRK_X_INVERT) && usage->code == ABS_X ||
+		 (*quirks & HID_QUIRK_Y_INVERT) && usage->code == ABS_Y)) {
+			value = field->logical_maximum - value;
+	}
+
 	if (usage->hat_min < usage->hat_max || usage->hat_dir) {
 		int hat_dir = usage->hat_dir;
 		if (!hat_dir)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 9e067f937dbc..4959385ca588 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -349,6 +349,8 @@ struct hid_item {
 /* BIT(9) reserved for backward compatibility, was NO_INIT_INPUT_REPORTS */
 #define HID_QUIRK_ALWAYS_POLL			BIT(10)
 #define HID_QUIRK_INPUT_PER_APP			BIT(11)
+#define HID_QUIRK_X_INVERT			BIT(12)
+#define HID_QUIRK_Y_INVERT			BIT(13)
 #define HID_QUIRK_SKIP_OUTPUT_REPORTS		BIT(16)
 #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID		BIT(17)
 #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP	BIT(18)
-- 
2.31.1

