Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F4344A82E
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 09:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241437AbhKIIOV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Nov 2021 03:14:21 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36623 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235389AbhKIIOV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Nov 2021 03:14:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 4EFD35C01FE;
        Tue,  9 Nov 2021 03:11:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 09 Nov 2021 03:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=SjIXu+fbTVyhVvYyok/wmJo7Fj
        2D2l4fiDH0dSI06V8=; b=hFtq9tC99Ivk9JS2Gtd0dAtNzsMTezVokKmmIGrOhl
        cnlWGUIJWZ1JLbn2Z6HbLZ7ekJA3wyLs9/N8ErVnswNhS0ZkKMYX6wS8DIsKn/eR
        x3hsbHciJfyDvkN3Yu3A5CZcytMVh9XP0pnATPCB1TLJ3w+ys0vsq/qXdHgJJuUm
        JzAwvI/zUXGPS+AU9GR2CrlUZIZh2DtnWbhWyXO8gsRjWsOb02xPcaGYQ1ymbAQ3
        5s7QDgPjRBW/EHL2+TCoSPtFJ2Tu3tU9A2zN31bBPtTWzK1fQdB4aF333Ui/ifAf
        xXh/ArXZnO1jAvsquN1dgVdup9ChjNnItfyKSYB4c24A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SjIXu+fbTVyhVvYyo
        k/wmJo7Fj2D2l4fiDH0dSI06V8=; b=cBxD//MFT0ERSxTHfWCNwobML3B/bzVBv
        qKQVGOtXkpR3pF97RaBH6Sl6m46AQQxk4TsCinzcSzSV7JjHW1fx5vhpss1b1aSa
        vKfOehjo1bUsLP735QfV84E7+SaiWI8aWKoAtikH8QoBcda/zHH+D0HNqwZmIV1R
        xj7Q0i/b6nRoRSxOM9WPIHI8jB8+sTRgc3QXZSiAAmIlixCmp8ZM1W58ujn3yFqa
        URgT2AdMrlusyD68vnrPiI/Cr5uJNHG9aJaEZkKG91+iaZb5deS1gSsKhY4O1jLs
        npNcYnQ6/Oa25JXs4Nruwkw6/4nVV0TPH12AB4S6Uhtz4gnUH6BNQ==
X-ME-Sender: <xms:Ny2KYaq4HDeW0ewS9jcUPlHm6HOKKzqtrPwfSCS9wuro0EXlybhkUg>
    <xme:Ny2KYYp40TXMTy13xsY-kl50KtJ9WbonRCWLu_7-oK-Bd8qMi0tLpcTAHlW9gP6hC
    FUOieMidx5lIpGneA>
X-ME-Received: <xmr:Ny2KYfOmFN8AYPV8lE5A-nc96mKzQqKaU0qkXfV-oHV4wE5DdzDjeICM0IoJRZdJ_9_jX5xbcqc3vp4uHS1ZS_HTfYvQtkBJhTgLtlmb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurggthhhiucfm
    ihhnghcuoehnrghkrghtohesnhgrkhgrthhordhioheqnecuggftrfgrthhtvghrnhepgf
    ejgeeijeelleekieekhfelveduheehhefguedutdehteehtedvvdefheejiedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgrkhgrthhose
    hnrghkrghtohdrihho
X-ME-Proxy: <xmx:Ny2KYZ7TsHAC-2bR_l7iuOjIWjjrqhAnmvNjbz0RQXqfPmBYMG05lg>
    <xmx:Ny2KYZ7SVS_X2U0-OtLnxnzcLB4hCW330nr17za7PRe54rvtlXnZxQ>
    <xmx:Ny2KYZg9U_G5Tlv8UQ_69xRZ6W7aHyhcnoumrRGIRCd_Ey3QZMugBw>
    <xmx:Ny2KYTm-nAP3VnBbvYbx2rf2NlbmSTZRpk8L3rAnoljFoOTIdWHQcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 03:11:32 -0500 (EST)
From:   Sachi King <nakato@nakato.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: soc_button_array - support AMD variant Surface devices
Date:   Tue,  9 Nov 2021 19:11:24 +1100
Message-Id: <20211109081125.41410-1-nakato@nakato.io>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The power button on the AMD variant of the Surface Laptop uses the
same MSHW0040 device ID as the 5th and later generation of Surface
devices, however they report 0 for their OEM platform revision.  As the
_DSM does not exist on the devices requiring special casing, check for
the existence of the _DSM to determine if soc_button_array should be
loaded.

Fixes: c394159310d0 ("Input: soc_button_array - add support for newer surface devices")
Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Sachi King <nakato@nakato.io>
---
 drivers/input/misc/soc_button_array.c | 33 +++++++--------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index cb6ec59a045d..4e8944f59def 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -474,8 +474,8 @@ static const struct soc_device_data soc_device_INT33D3 = {
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
  * devices use MSHW0040 for power and volume buttons, however the way they
  * have to be addressed differs. Make sure that we only load this drivers
- * for the correct devices by checking the OEM Platform Revision provided by
- * the _DSM method.
+ * for the correct devices by checking if the OEM Platform Revision DSM call
+ * exists.
  */
 #define MSHW0040_DSM_REVISION		0x01
 #define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
@@ -486,31 +486,14 @@ static const guid_t MSHW0040_DSM_UUID =
 static int soc_device_check_MSHW0040(struct device *dev)
 {
 	acpi_handle handle = ACPI_HANDLE(dev);
-	union acpi_object *result;
-	u64 oem_platform_rev = 0;	// valid revisions are nonzero
-
-	// get OEM platform revision
-	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
-					 MSHW0040_DSM_REVISION,
-					 MSHW0040_DSM_GET_OMPR, NULL,
-					 ACPI_TYPE_INTEGER);
-
-	if (result) {
-		oem_platform_rev = result->integer.value;
-		ACPI_FREE(result);
-	}
-
-	/*
-	 * If the revision is zero here, the _DSM evaluation has failed. This
-	 * indicates that we have a Pro 4 or Book 1 and this driver should not
-	 * be used.
-	 */
-	if (oem_platform_rev == 0)
-		return -ENODEV;
+	bool exists;
 
-	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
+	// check if OEM platform revision DSM call exists
+	exists = acpi_check_dsm(handle, &MSHW0040_DSM_UUID,
+				MSHW0040_DSM_REVISION,
+				BIT(MSHW0040_DSM_GET_OMPR));
 
-	return 0;
+	return exists ? 0 : -ENODEV;
 }
 
 /*
-- 
2.33.0

