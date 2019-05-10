Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763E719DF9
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2019 15:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfEJNR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 May 2019 09:17:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43120 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfEJNR0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 May 2019 09:17:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hP5Os-0005ov-RR; Fri, 10 May 2019 13:17:22 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: HID: make const array consumer_rdesc_start static
Date:   Fri, 10 May 2019 14:17:22 +0100
Message-Id: <20190510131722.5023-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array consumer_rdesc_start on the stack but instead
make it static. Makes the object code smaller by 88 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  59155	   9840	    448	  69443	  10f43	drivers/hid/hid-logitech-hidpp.o

After:
   text	   data	    bss	    dec	    hex	filename
  59003	   9904	    448	  69355	  10eeb	drivers/hid/hid-logitech-hidpp.o

(gcc version 8.3.0, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 72fc9c0566db..df960491e473 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2862,7 +2862,7 @@ static u8 *hidpp10_consumer_keys_report_fixup(struct hidpp_device *hidpp,
 					      u8 *_rdesc, unsigned int *rsize)
 {
 	/* Note 0 terminated so we can use strnstr to search for this. */
-	const char consumer_rdesc_start[] = {
+	static const char consumer_rdesc_start[] = {
 		0x05, 0x0C,	/* USAGE_PAGE (Consumer Devices)       */
 		0x09, 0x01,	/* USAGE (Consumer Control)            */
 		0xA1, 0x01,	/* COLLECTION (Application)            */
-- 
2.20.1

