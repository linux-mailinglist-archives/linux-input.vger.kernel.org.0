Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28EE91089FD
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 09:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbfKYIWm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 03:22:42 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:21048 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfKYIWm (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 03:22:42 -0500
X-Greylist: delayed 582 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Nov 2019 03:22:41 EST
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33019664"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 25 Nov 2019 16:12:57 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71509:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 25 Nov 2019 16:12:59 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101174:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 25 Nov 2019 16:12:58 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        <Dmitry.torokhov@gmail.com>
Subject: [PATCH] Input: elan_i2c - Add more hardware ID for Lenovo laptop
Date:   Mon, 25 Nov 2019 16:12:56 +0800
Message-ID: <001e01d5a368$24946950$6dbd3bf0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWjZOUZ82d17nMMTBCQUDb2k6LozQ==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy02MWZiNGU3MS0wZjViLTExZWEtYWExNC04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcNjFmYjRlNzItMGY1Yi0xMWVhLWFhMTQtODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSI4NzIiIHQ9IjEzMjE5MTQzMTc1ODgwNDI1MiIgaD0idCs3Z0xaRVM5TklZMVlvYWlDNFpiNGJoaTNvPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add more hardware ID for Lenovo laptop.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 include/linux/input/elan-i2c-ids.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/input/elan-i2c-ids.h
b/include/linux/input/elan-i2c-ids.h
index 1ecb6b45812c..247e3f75bae7 100644
--- a/include/linux/input/elan-i2c-ids.h
+++ b/include/linux/input/elan-i2c-ids.h
@@ -67,8 +67,15 @@ static const struct acpi_device_id elan_acpi_id[] = {
 	{ "ELAN062B", 0 },
 	{ "ELAN062C", 0 },
 	{ "ELAN062D", 0 },
+	{ "ELAN062E", 0 },
+	{ "ELAN062F", 0 },
 	{ "ELAN0631", 0 },
 	{ "ELAN0632", 0 },
+	{ "ELAN0633", 0 },
+	{ "ELAN0634", 0 },
+	{ "ELAN0635", 0 },
+	{ "ELAN0636", 0 },
+	{ "ELAN0637", 0 },
 	{ "ELAN1000", 0 },
 	{ }
 };
-- 
2.17.1

