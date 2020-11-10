Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844922AD059
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 08:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbgKJHWh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 02:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJHWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 02:22:36 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79147C0613CF
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 23:22:35 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so10571923pfb.10
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 23:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HG6fQ6KNywoEbOA0cD3Y/aR1fh1NyyLoymuYZZrgbZw=;
        b=do5YO04lrX0/rF2F3YI4gmcmlfMn1MAaoEDMPj52HvMD+ux6sX9hue0lVly/0HLXzJ
         W179YVkPnk4/Gl63NMhADwR12WuJLVvbYg2o5HQVTqr7h9NZg3Els7HMLX92GiLGj5bE
         YQo6/Bn1DzQp/KnnIdVSV8LI9nkgRgEfUKQXYl5mN4n8FMhlMejkrCIDDfZyDKIcf7Nw
         9LIcqTR9WRA+reu187G+Nmaq3lMZxLur2PzT5Tr0Ugns9Aq3D2EehlpNhH/wddTFKy7t
         ryyfJ12D050PjR3FW+F7KzbmIQsQ72YCkON2uSYOyxyzC3T1iisFSNmfvtyT85o5Tc00
         qDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HG6fQ6KNywoEbOA0cD3Y/aR1fh1NyyLoymuYZZrgbZw=;
        b=SPV+WW4lF11v7RIuLnLUyPjdRGsE++yHUS+THILQAumQlKxhbAnkVLO0zkKz9UkE/H
         7/WY4fwPfoee0UMu7B1/iUMOstBtEj1Okegy+gwVSuzbTr4Ph2BlKMgZHbaNmvVDs34w
         Ip9YrVuMBjVHDpah0SP6NiY0JXdOy68W4p5lx+pH+nrq+YeuSAiNDQt1C00f/XWmmQYH
         CWIWK9p+w9feewoFCU5Lso/QQMqdOmUp+y81dn6Ks5UnDJJYxdFR8bB+kiyswVj+OxOb
         jSeZyNjicLTOCdgM9VpUbSkxfNUTIuWxiZJa7aeXXiRoqKksByva8B+FL9RdB/naGrQq
         PXTg==
X-Gm-Message-State: AOAM532YEMoBUm0NtXNs89W8V3Ze9qrvsdrIQTza0BNurzGxx6K2EUWc
        sUFalmVumdRFLxYMFg3W8B7OSw==
X-Google-Smtp-Source: ABdhPJxxPKjhqGVz6IOcopmEDWvy/qq4GcKC+i5/HaXw67N1hA+y9/JQUuK//ht9rcb7YHYdHzS/zw==
X-Received: by 2002:a63:221d:: with SMTP id i29mr16073353pgi.69.1604992955070;
        Mon, 09 Nov 2020 23:22:35 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id j11sm12908189pfh.143.2020.11.09.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:22:34 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 2/3] HID: sony: Workaround for DS4 dongle hotplug kernel crash.
Date:   Mon,  9 Nov 2020 23:22:28 -0800
Message-Id: <20201110072229.9112-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110072229.9112-1-roderick@gaikai.com>
References: <20201110072229.9112-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The hid-sony driver has custom DS4 connect/disconnect logic for the
DS4 dongle, which is a USB dongle acting as a proxy to Bluetooth
connected DS4.

The connect/disconnect logic works fine generally, however not in
conjunction with Steam. Steam implements its own DS4 driver using
hidraw. Both hid-sony and Steam are issuing their own HID requests
and are racing each other during DS4 dongle connect/disconnect
resulting in a kernel crash in hid-sony.

The problem is that upon a DS4 connect to the dongle, hid-sony kicks
of 'ds4_get_calibration_data' from within its dongle hotplug code.
The calibration code issues raw HID feature report for reportID 0x02.
When Steam is running, it issues a feature report for reportID 0x12
typically just prior to hid-sony requesting feature reportID 0x02.
The result is that 'ds4_get_calibration_data' receives the data Steam
requested as that's the HID report returing first. Currently this
results in it processing invalid data, which ultimately results in a
divide by zero upon a future 'dualshock4_parse_report'.

The solution for now is to check within 'ds4_get_calibration_data' to
check if we received data for the feature report we issued and if not
retry. This fixes bug 206785.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-sony.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 81d526a5d003..83a94ddbfa4e 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1618,16 +1618,38 @@ static int dualshock4_get_calibration_data(struct sony_sc *sc)
 	 * of the controller, so that it sends input reports of type 0x11.
 	 */
 	if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
+		int retries;
+
 		buf = kmalloc(DS4_FEATURE_REPORT_0x02_SIZE, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 
-		ret = hid_hw_raw_request(sc->hdev, 0x02, buf,
-					 DS4_FEATURE_REPORT_0x02_SIZE,
-					 HID_FEATURE_REPORT,
-					 HID_REQ_GET_REPORT);
-		if (ret < 0)
-			goto err_stop;
+		/* We should normally receive the feature report data we asked
+		 * for, but hidraw applications such as Steam can issue feature
+		 * reports as well. In particular for Dongle reconnects, Steam
+		 * and this function are competing resulting in often receiving
+		 * data for a different HID report, so retry a few times.
+		 */
+		for (retries = 0; retries < 3; retries++) {
+			ret = hid_hw_raw_request(sc->hdev, 0x02, buf,
+						 DS4_FEATURE_REPORT_0x02_SIZE,
+						 HID_FEATURE_REPORT,
+						 HID_REQ_GET_REPORT);
+			if (ret < 0)
+				goto err_stop;
+
+			if (buf[0] != 0x02) {
+				if (retries < 2) {
+					hid_warn(sc->hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
+					continue;
+				} else {
+					ret = -EILSEQ;
+					goto err_stop;
+				}
+			} else {
+				break;
+			}
+		}
 	} else {
 		u8 bthdr = 0xA3;
 		u32 crc;
-- 
2.26.2

