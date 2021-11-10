Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEAA44C119
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 13:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhKJMTv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 07:19:51 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:35805 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhKJMTv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 07:19:51 -0500
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636546622;
        bh=GHoGBpI/7Ww3lV2tjGUcrMHObJ3JBrS7JijlpX7Q/W0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SMEEjlwpDHPfsZB+lGcohnS+GvUJBoeUfiV/kpxHOiq5xRLQyi8ml327+0vUHtQ/U
         8IE4mjJs7ZOE1n6/PCWk2Cy/dcpritoiDI0O8It6jMU1c6l6zVGhJnK6XcSeSjVqlh
         v7eroqFV+QPVDOMc4w+2BFhRJA6XnPKYGoD2i8Hk=
To:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: [PATCH] mod_devicetable: fix kdocs for ishtp_device_id
Date:   Wed, 10 Nov 2021 13:16:55 +0100
Message-Id: <20211110121655.675664-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110150639.7db57ae2@canb.auug.org.au>
References: <20211110150639.7db57ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The kdocs were copied from another device_id struct and not adapted.

Fixes: fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/mod_devicetable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index befbf53c4b7c..c70abe7aaef2 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -901,8 +901,7 @@ struct dfl_device_id {
 
 /**
  * struct ishtp_device_id - ISHTP device identifier
- * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
- * @context: pointer to driver specific data
+ * @guid: GUID of the device.
  */
 struct ishtp_device_id {
 	guid_t guid;

base-commit: 7fb0413baa7f8a04caef0c504df9af7e0623d296
-- 
2.33.1

