Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAA8C770
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2019 04:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbfHNCYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 22:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:52952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730013AbfHNCYC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 22:24:02 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C297B20842;
        Wed, 14 Aug 2019 02:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565749440;
        bh=IOPdm9k3VPoaPXeXZ9z/V6zcLHMRjbCmVT1iw1qRiZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z40gwbWswNlF7/4PIM4VdxyICK4V0hk/I4zP+YztiAre1ZmoPw2MiI6QSYO5um+wq
         MY52bSwqPHCqWKR1gbcP81o5oH5m4VZY7QmS57+9UqjMcRhzeLzO1HdHx7g7ZsLE8H
         qJ1M4ZKfAFoyi7fB+qFIWABPnkZtvv28CdPu/dtk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 21/33] HID: input: fix a4tech horizontal wheel custom usage
Date:   Tue, 13 Aug 2019 22:23:11 -0400
Message-Id: <20190814022323.17111-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814022323.17111-1-sashal@kernel.org>
References: <20190814022323.17111-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

[ Upstream commit 1c703b53e5bfb5c2205c30f0fb157ce271fd42fb ]

Some a4tech mice use the 'GenericDesktop.00b8' usage to inform whether
the previous wheel report was horizontal or vertical. Before
c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
usage was being mapped to 'Relative.Misc'. After the patch it's simply
ignored (usage->type == 0 & usage->code == 0). Which ultimately makes
hid-a4tech ignore the WHEEL/HWHEEL selection event, as it has no
usage->type.

We shouldn't rely on a mapping for that usage as it's nonstandard and
doesn't really map to an input event. So we bypass the mapping and make
sure the custom event handling properly handles both reports.

Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-a4tech.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
index 9428ea7cdf8a0..c52bd163abb3e 100644
--- a/drivers/hid/hid-a4tech.c
+++ b/drivers/hid/hid-a4tech.c
@@ -26,12 +26,36 @@
 #define A4_2WHEEL_MOUSE_HACK_7	0x01
 #define A4_2WHEEL_MOUSE_HACK_B8	0x02
 
+#define A4_WHEEL_ORIENTATION	(HID_UP_GENDESK | 0x000000b8)
+
 struct a4tech_sc {
 	unsigned long quirks;
 	unsigned int hw_wheel;
 	__s32 delayed_value;
 };
 
+static int a4_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+			    struct hid_field *field, struct hid_usage *usage,
+			    unsigned long **bit, int *max)
+{
+	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
+
+	if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8 &&
+	    usage->hid == A4_WHEEL_ORIENTATION) {
+		/*
+		 * We do not want to have this usage mapped to anything as it's
+		 * nonstandard and doesn't really behave like an HID report.
+		 * It's only selecting the orientation (vertical/horizontal) of
+		 * the previous mouse wheel report. The input_events will be
+		 * generated once both reports are recorded in a4_event().
+		 */
+		return -1;
+	}
+
+	return 0;
+
+}
+
 static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
@@ -53,8 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
 	struct input_dev *input;
 
-	if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput ||
-			!usage->type)
+	if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput)
 		return 0;
 
 	input = field->hidinput->input;
@@ -65,7 +88,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
 			return 1;
 		}
 
-		if (usage->hid == 0x000100b8) {
+		if (usage->hid == A4_WHEEL_ORIENTATION) {
 			input_event(input, EV_REL, value ? REL_HWHEEL :
 					REL_WHEEL, a4->delayed_value);
 			return 1;
@@ -129,6 +152,7 @@ MODULE_DEVICE_TABLE(hid, a4_devices);
 static struct hid_driver a4_driver = {
 	.name = "a4tech",
 	.id_table = a4_devices,
+	.input_mapping = a4_input_mapping,
 	.input_mapped = a4_input_mapped,
 	.event = a4_event,
 	.probe = a4_probe,
-- 
2.20.1

