Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70A3AA964
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 18:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731716AbfIEQyL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 12:54:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41040 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfIEQyK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Sep 2019 12:54:10 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5v1L-0006eF-4q; Thu, 05 Sep 2019 16:54:07 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: prodikeys: make array keys static const, makes object smaller
Date:   Thu,  5 Sep 2019 17:54:06 +0100
Message-Id: <20190905165406.24641-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array keys on the stack but instead make it
static const. Makes the object code smaller by 166 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  18931	   5872	    480	  25283	   62c3	drivers/hid/hid-prodikeys.o

After:
   text	   data	    bss	    dec	    hex	filename
  18669	   5968	    480	  25117	   621d	drivers/hid/hid-prodikeys.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-prodikeys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 21544ebff855..fb6841ebe4d9 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -516,7 +516,7 @@ static void pcmidi_setup_extra_keys(
 		MY PICTURES =>	KEY_WORDPROCESSOR
 		MY MUSIC=>	KEY_SPREADSHEET
 	*/
-	unsigned int keys[] = {
+	static const unsigned int keys[] = {
 		KEY_FN,
 		KEY_MESSENGER, KEY_CALENDAR,
 		KEY_ADDRESSBOOK, KEY_DOCUMENTS,
@@ -532,7 +532,7 @@ static void pcmidi_setup_extra_keys(
 		0
 	};
 
-	unsigned int *pkeys = &keys[0];
+	const unsigned int *pkeys = &keys[0];
 	unsigned short i;
 
 	if (pm->ifnum != 1)  /* only set up ONCE for interace 1 */
-- 
2.20.1

