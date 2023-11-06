Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C84A7E31BD
	for <lists+linux-input@lfdr.de>; Tue,  7 Nov 2023 00:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbjKFX4W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 18:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbjKFX4V (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 18:56:21 -0500
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F62125
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 15:56:18 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1B397580B6A;
        Mon,  6 Nov 2023 18:56:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 06 Nov 2023 18:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1699314978; x=
        1699318578; bh=dn7Gk104Q8LavAf8fMa3coEQD9FEWhg7/XznMibZ2ZE=; b=o
        q7EF9UCL0XMnl1LH1d0cbJhLEcEwmb22c96aIHjopp8NnytsDo+b2J9Tl5RDA+wO
        fJ4RHvOfqUDHWd75j8P3oukLRUKUoNxRz+tR8qZtuyGma1td6klQielxZLNfurtj
        C2cG+yPoJk2ZXTjcnDmGhOubABMp7/W1sIofEadB1hjNQMVWV+wtQEJR7aZN3l0t
        59CnEediQ2iGz9vNuFgLM2YzknipoLo3G54EiC56e8C7td5FK9sfT1IRcvPqwKIF
        BWnUlc/U1LdOmEeTXlbMk79gA8QVHQiPk13HrU4AOe0tcm0LMtENmpcbIyKrAw3X
        9ky9akB8kJAWOshym/9iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1699314978; x=
        1699318578; bh=dn7Gk104Q8LavAf8fMa3coEQD9FEWhg7/XznMibZ2ZE=; b=m
        TDcb5QhmhSI91Iu33ul+0TmAGFBzsvxneB0G9nM++oQ0cIu67YdxYI0ci5vZa6BC
        EvYvDxg0xDrI4Hx929+DDmrx/czRoSbI5Qkg9yJa544Jxnbq3+86u3CqMstTQQCK
        iwGMNJKAuYUi7PtAAxOo0GGt+HWBDNG1LBiEZrxhTad/JBilvia53feu2ucG0qj6
        sUDjIKdZ3NbsuOZHevmDpgxJOQz+PRN0EsF7Iw9moV/DSP6bfihqVdKLmPJkkQN5
        1FdxIThy6sxs3WWj6U3zIgvt/m4J5iJt1sLqrtMNvxzdYgb00sGk/oHd/RDMAysb
        rqFWsqXSsaZYZW6VRDWaw==
X-ME-Sender: <xms:IX1JZQtqYXmda_iujI-pzcLSwl44ZPtDM97SUUMYdEVZ7tjwF0dxWw>
    <xme:IX1JZdck2scmHnABeobu5gsamSKAdu7ZxL7gJY2mf-xbvpwa3S8kkKaHcJZ-Vvi-v
    dST3lYEih8h6Eg9-S8>
X-ME-Received: <xmr:IX1JZbwxj3SkmPXqFa7F8pqaWyGh9cD6R_Mou8PkegzP6-blH5xu4MlOuPfrkdOWs-jlDfJFUM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeeurhgvthhtucftrgihvgcuoegsrhgrhigvsehfrghsthhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhepffekieeihfekhefgfedtveekjedtvd
    euhfeiveelleejfeeiheeljeefvedvffdvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepsghrrgihvgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:IX1JZTOB2m2oax-6MJujgLNCwt0aJSlYTYDp7U0pndHg-td-14zOhQ>
    <xmx:IX1JZQ-ZZKdcjgcNe5GlwqTrNnZuGhVeb7ZfIj-iTLKqSu_YoLgWew>
    <xmx:IX1JZbVBE0SxTxXHDbCZ4TLaoW04s57uMl-IDYq8zoI_91f_CKWXnQ>
    <xmx:In1JZfZIHIyC0IWdxYwbG87QbSLZ2jKZ6Jn1yywm6pl_jb4aL6AIyA>
Feedback-ID: ice5149f5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Nov 2023 18:56:17 -0500 (EST)
From:   Brett Raye <braye@fastmail.com>
To:     jikos@kernel.org
Cc:     sergeantsagara@protonmail.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, Brett Raye <braye@fastmail.com>
Subject: [PATCH v2 2/2] HID: glorious: rename USB_VENDOR_ID_GLORIOUS
Date:   Mon,  6 Nov 2023 15:55:57 -0800
Message-Id: <20231106235557.8741-3-braye@fastmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231106235557.8741-1-braye@fastmail.com>
References: <20231106235557.8741-1-braye@fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

USB_VENDOR_ID_GLORIOUS is changed to USB_VENDOR_ID_SINOWEALTH. Glorious
seems to be white-labeling controller boards or mice from many vendors.
There isn't a single canonical vendor ID for Glorious products.

Signed-off-by: Brett Raye <braye@fastmail.com>
---
 drivers/hid/hid-glorious.c | 4 ++--
 drivers/hid/hid-ids.h      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index e44a39a17151..281b3a7187ce 100644
--- a/drivers/hid/hid-glorious.c
+++ b/drivers/hid/hid-glorious.c
@@ -76,9 +76,9 @@ static int glorious_probe(struct hid_device *hdev,
 }
 
 static const struct hid_device_id glorious_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 		USB_DEVICE_ID_GLORIOUS_MODEL_D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
 		USB_DEVICE_ID_GLORIOUS_MODEL_I) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c30bca343982..9ed9ec03ad1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -510,10 +510,6 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
-#define USB_VENDOR_ID_GLORIOUS  0x258a
-#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
-#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
-
 #define I2C_VENDOR_ID_GOODIX		0x27c6
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
@@ -1162,6 +1158,10 @@
 #define USB_VENDOR_ID_SIGMATEL		0x066F
 #define USB_DEVICE_ID_SIGMATEL_STMP3780	0x3780
 
+#define USB_VENDOR_ID_SINOWEALTH  0x258a
+#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
+#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
+
 #define USB_VENDOR_ID_SIS_TOUCH		0x0457
 #define USB_DEVICE_ID_SIS9200_TOUCH	0x9200
 #define USB_DEVICE_ID_SIS817_TOUCH	0x0817
-- 
2.40.1

