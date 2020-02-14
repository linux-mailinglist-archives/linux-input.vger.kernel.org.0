Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0014E15F1F7
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 19:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391537AbgBNSFM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 13:05:12 -0500
Received: from gateway31.websitewelcome.com ([192.185.143.40]:34048 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388160AbgBNSFL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 13:05:11 -0500
X-Greylist: delayed 1502 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 13:05:10 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id 323D0B096BA
        for <linux-input@vger.kernel.org>; Fri, 14 Feb 2020 11:18:56 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 2ecCjnKmsRP4z2ecCjEawi; Fri, 14 Feb 2020 11:18:56 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DwN0tYLKM1RUE+OhsFgDl42NF0xbevkKouk6StKQIoA=; b=VwgtKhOrt6SRVJsSNhvt9/B1du
        IE+tq+o28zw53WJfJDjyVUW433o7aCjpfOOH/vKQudVYLGhbO/KGOa/fAkmDoGBigzC7hcpfXVzwr
        wRpD/Rkg6U54x4GxK5QFFV+GnkwWYpNHY3m7yJco/gMbtzuk1wVzNx2RADn5lo73uyVuf9rlTei/A
        rvAITyy9oQftWRXCiaiqga7E/2SfjWZ9sAl/Gw8PzOn3njQYIxas3moOzQOMPhAYm4gk4FpDLaeWm
        KjFHoSo6Alta92+erukFnQ3S05vczLZDDdbYa9S0aFSsb+ecuYquIfGf8OtIDExTrFa3IJpcJNhdI
        4GK7cfSg==;
Received: from [200.68.140.137] (port=27873 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j2ecA-003i82-Kw; Fri, 14 Feb 2020 11:18:54 -0600
Date:   Fri, 14 Feb 2020 11:21:32 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: cyapa - replace zero-length array with flexible-array
 member
Message-ID: <20200214172132.GA28389@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.137
X-Source-L: No
X-Exim-ID: 1j2ecA-003i82-Kw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.137]:27873
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 31
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/mouse/cyapa_gen5.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/cyapa_gen5.c b/drivers/input/mouse/cyapa_gen5.c
index 14239fbd72cf..7f012bfa2658 100644
--- a/drivers/input/mouse/cyapa_gen5.c
+++ b/drivers/input/mouse/cyapa_gen5.c
@@ -250,7 +250,7 @@ struct cyapa_tsg_bin_image_data_record {
 
 struct cyapa_tsg_bin_image {
 	struct cyapa_tsg_bin_image_head image_head;
-	struct cyapa_tsg_bin_image_data_record records[0];
+	struct cyapa_tsg_bin_image_data_record records[];
 } __packed;
 
 struct pip_bl_packet_start {
@@ -271,7 +271,7 @@ struct pip_bl_cmd_head {
 	u8 report_id;  /* Bootloader output report id, must be 40h */
 	u8 rsvd;  /* Reserved, must be 0 */
 	struct pip_bl_packet_start packet_start;
-	u8 data[0];  /* Command data variable based on commands */
+	u8 data[];  /* Command data variable based on commands */
 } __packed;
 
 /* Initiate bootload command data structure. */
@@ -300,7 +300,7 @@ struct tsg_bl_metadata_row_params {
 struct tsg_bl_flash_row_head {
 	u8 flash_array_id;
 	__le16 flash_row_id;
-	u8 flash_data[0];
+	u8 flash_data[];
 } __packed;
 
 struct pip_app_cmd_head {
@@ -314,7 +314,7 @@ struct pip_app_cmd_head {
 	 * Bit 6-0: command code.
 	 */
 	u8 cmd_code;
-	u8 parameter_data[0];  /* Parameter data variable based on cmd_code */
+	u8 parameter_data[];  /* Parameter data variable based on cmd_code */
 } __packed;
 
 /* Application get/set parameter command data structure */
-- 
2.25.0

