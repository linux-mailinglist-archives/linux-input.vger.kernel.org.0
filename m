Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDF54440AF
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhKCLkn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:40:43 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53537 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhKCLkm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:40:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 64634580680;
        Wed,  3 Nov 2021 07:38:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 03 Nov 2021 07:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=Bh+TVp5AmthS4YjYhwT0Gon4om
        Ev2M/f0yD7Lqts/Ww=; b=I18lUOorQbLua8S7MzWMzK297Wb4xWgYCtlmxJMHAz
        PgrysecQb5FRrzvgIBLtUGLq3D1haQObBYrblbQKpjpYK/hGJSHxCMusj+VZd2u3
        063dZsxnWcVH9hEuYdsrJHx43W1SDGzf4kF4eIb3u6Q6ldp1o8CWfC2iG4R30jYX
        s45A9DATLGhqBn0FqojTZaj+amCSM8IuZy+0ctKetg4BHdbGlUJ6ltTT3WFGo4cK
        Dmdlw48I+3zhZHIeILQq8Hicp/bg7gUZ1dkT/me3ifIQ+KwOV4QVG4gdjwR9ZGgH
        bFaQyzkdTf8E0Iv4lFnMrd+sculS9qp5ElBE7brqU2iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Bh+TVp5AmthS4YjYh
        wT0Gon4omEv2M/f0yD7Lqts/Ww=; b=LYLhHN5t2MXvDlMiSqFMmdOn/Ggm0JzgA
        117boKapBsJX11FsB+dDME76zNpiUmAHvDi22FwzNqXEA9BMkqrtgpZvAyIZqWRO
        j1OIMBLW8RO9yOPBMeotpOqZ6RtSDkcJR47rSr67pDFOLeZAQyOiFCiHYdKTFJuR
        3yrEjZE6c+PI/FkPzG+myG4jhueEcPKm6uj6p5m+xke2SoKdN2O++f0Ht+EIkBpI
        psiB+xd0IrxNRWTdOiCGCwHSRtV13HObBe5ynr2eDraQxl/2L3euotpxAOgRcBDU
        NUJHfPR9yfLenJenIAhHS2CKsYSQKn8R5VM2E6MjGoGExvkzbYbzQ==
X-ME-Sender: <xms:nXSCYYk20NLMQyghHFw0xJu9uYe7xFZeAWLevcJbl5DtNsKctNE_-g>
    <xme:nXSCYX1q6C8WD6Zt_AcZMAaTImT7IdwKCDXkY5stZw3PkqDnjAetBnPb3vBRPyl3v
    qB886amOvYcNRSVVyU>
X-ME-Received: <xmr:nXSCYWr9Pb6puFI09UuvSY0nK9nh86TTN2Jc5I8L4QT87ky-wtYLasgnyIM1p_uA91YddIVKRz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
    hirhdvfedrmhgv
X-ME-Proxy: <xmx:nXSCYUmOrYAYe2v64K3G23Pj_-PuTPEgWFaJO6TsLFpQm0MR1NbvRA>
    <xmx:nXSCYW3vSm3FbWeeGn15NtOMfp7rmkrFX9VUPMU6x2xh5M-SO68G0g>
    <xmx:nXSCYbt7ZpvQgECR7B9o21qdXL66Q9fsOcomjauYy3DUYTuMN4-RIA>
    <xmx:nXSCYfs2sENOh54shoa0n0l76-i9VunkPeP-4rmP2NiOGA0yfXyOHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:38:00 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v14 1/3] HID: quirks: Allow inverting the absolute X/Y values
Date:   Wed,  3 Nov 2021 21:37:46 +1000
Message-Id: <20211103113748.61046-1-alistair@alistair23.me>
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
index 4b5ebeacd283..173fcd3d92df 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1328,6 +1328,12 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 
 	input = field->hidinput->input;
 
+	if (usage->type == EV_ABS &&
+		(((*quirks & HID_QUIRK_X_INVERT) && usage->code == ABS_X) ||
+		 ((*quirks & HID_QUIRK_Y_INVERT) && usage->code == ABS_Y))) {
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

