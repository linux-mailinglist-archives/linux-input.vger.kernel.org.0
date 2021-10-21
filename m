Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B05435E4F
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 11:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhJUJxx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 05:53:53 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52379 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230269AbhJUJxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 05:53:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id D2F1E580CC1;
        Thu, 21 Oct 2021 05:51:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 21 Oct 2021 05:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=BuA1F8mAFopGpPNg7z7rb/m4d9
        yu2f2rm1X1F8Kqjmo=; b=ExFwvYtzbfpBTCEh6q5ftopLWkFTBC8SOZrEX4haf+
        sJ0hE4/QkQU8TLKW4nKNWoYAONa8gf5OsugrXOeuMSuSFhU5sYoiJU6VSDAlvI2u
        j3/gAG706Pf61KDvCOrsifbqenKXbBmyFCXIvgjM/gceKNpM85J57Q1vc0avwCJm
        sm1SUfq9rub274N3BO9/4BIEZIrxWUh/2hbvfU74QaI9f0eQ52nZjNkN6mrzBw7v
        me9t76p1KCghan7idapaxKuFBz3tA/US4iaFMP5Eg0X0x0+FRfpknsgJIw7HBw4m
        BjKnXay7CqWgqc7csIQlkLoqA82iNs0bS+v+994zjLOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BuA1F8mAFopGpPNg7
        z7rb/m4d9yu2f2rm1X1F8Kqjmo=; b=ilAzd8Y73dvNuv+Qyi0BjJQyZIFOXk60M
        CG14+Zi6VTWyyDJVVWhqWh9c9L+sC6slEdFL22U7EdZY3TbW59C2fmFEwX4mOfSA
        4rTT2hRPnpPIj3ja+9baGmYPCAhePh33482IAgVyl0YaQ51NpFwQaIIHedOKjwFv
        mQoNEtcOcv3NRs1X5XmGmv1hcYsJjNV1CwmczS+Mtmjx+PGso2f8877tKrvAfmJL
        z5SLrO6fSiDCYHpD0OkovlfJXtOlxUaTtyaTQjY1yI0X3tHYPYAG8KVwopyHw7yy
        LH/xBqRTo77/UODPq/zCbtqPXqNvNnJ7qx3LI+K6IBeWrklQXS2wg==
X-ME-Sender: <xms:KDhxYU8RwkGPAFydjMfaEKm8upJWWydQaayP-OxkPJayBY6L6qjkSw>
    <xme:KDhxYct0-Bkl6gpEBjHMRldc75eeaS8LwunvOzEguXm051DLjqVns2nb_FcMKWgFX
    8gfFBtqs24XHrW3wAk>
X-ME-Received: <xmr:KDhxYaB0PPRr53q4yCohcmAyu6vQOM6ZGGJcw0xd8KyIH-AIFqmJk0KBx1o9tJy4xPb_0leP955v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddviedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:KDhxYUfU6NaT61vDJzUXlXGER2G208Y4vlB9J61BGJGEIg4B7dVQpw>
    <xmx:KDhxYZPwkS_dVZLqhaBWHIrQqv4J6JyWloqjWzpPphucle334KVTaw>
    <xmx:KDhxYekcsiHXRZbFyOZIpgsEHMZWbBwaVO0dgitYsIt85ASXFUWkyw>
    <xmx:KDhxYaHN8eohn3wKaHt3o0xjS_nXh9HfOYqYxxaAHb-2rXGhk-pNVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 05:51:32 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v12 1/3] HID: quirks: Allow inverting the absolute X/Y values
Date:   Thu, 21 Oct 2021 19:51:05 +1000
Message-Id: <20211021095107.116292-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a HID_QUIRK_XY_INVERT quirk that can be used to invert the X/Y
values.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/hid/hid-input.c | 7 +++++++
 include/linux/hid.h     | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..0a9634473940 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1328,6 +1328,13 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 
 	input = field->hidinput->input;
 
+	if (*quirks & HID_QUIRK_XY_INVERT) {
+		if (usage->type == EV_ABS &&
+			(usage->code == ABS_X || usage->code == ABS_Y)) {
+			value = field->logical_maximum - value;
+		}
+	}
+
 	if (usage->hat_min < usage->hat_max || usage->hat_dir) {
 		int hat_dir = usage->hat_dir;
 		if (!hat_dir)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 9e067f937dbc..a6e91ee5b3de 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -349,6 +349,7 @@ struct hid_item {
 /* BIT(9) reserved for backward compatibility, was NO_INIT_INPUT_REPORTS */
 #define HID_QUIRK_ALWAYS_POLL			BIT(10)
 #define HID_QUIRK_INPUT_PER_APP			BIT(11)
+#define HID_QUIRK_XY_INVERT			BIT(12)
 #define HID_QUIRK_SKIP_OUTPUT_REPORTS		BIT(16)
 #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID		BIT(17)
 #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP	BIT(18)
-- 
2.31.1

