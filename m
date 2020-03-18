Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2071D18A05F
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 17:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgCRQTZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 12:19:25 -0400
Received: from orion.archlinux.org ([88.198.91.70]:43124 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgCRQTZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 12:19:25 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 8556C1A324B994;
        Wed, 18 Mar 2020 16:19:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.4
X-Spam-BL-Results: 
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Wed, 18 Mar 2020 16:19:21 +0000 (UTC)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <superm1@gmail.com>,
        Richard Hughes <hughsient@gmail.com>
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Subject: [PATCH] HID: logitech-dj: issue udev change event on device connection
Date:   Wed, 18 Mar 2020 16:19:06 +0000
Message-Id: <20200318161906.3340959-1-lains@archlinux.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As discussed in the mailing list:

> Right now the hid-logitech-dj driver will export one node for each
> connected device, even when the device is not connected. That causes
> some trouble because in userspace we don't have have any way to know if
> the device is connected or not, so when we try to communicate, if the
> device is disconnected it will fail.

The solution reached to solve this issue is to trigger an udev change
event when the device connects, this way userspace can just wait on
those connections instead of trying to ping the device.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-logitech-dj.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 48dff5d6b605..fcd481a0be1f 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1464,6 +1464,8 @@ static int logi_dj_dj_event(struct hid_device *hdev,
 		if (dj_report->report_params[CONNECTION_STATUS_PARAM_STATUS] ==
 		    STATUS_LINKLOSS) {
 			logi_dj_recv_forward_null_report(djrcv_dev, dj_report);
+		} else {
+			kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
 		}
 		break;
 	default:
-- 
2.25.1
