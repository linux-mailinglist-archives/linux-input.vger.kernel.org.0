Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D81718C292
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 22:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgCSVup (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 17:50:45 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.72]:25045 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbgCSVup (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 17:50:45 -0400
X-Greylist: delayed 1252 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 17:50:44 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 8AB674018C
        for <linux-input@vger.kernel.org>; Thu, 19 Mar 2020 16:29:52 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2jgjY8kh8vkBF2jgjPAuP; Thu, 19 Mar 2020 16:29:52 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=clKI7nARFTFO5GFD0Ih3lvAENgeNhLrB6NvEoRgvUuk=; b=JviXO3L7PfFv8CDg2Dp7utxg+D
        B18IncsSGyIoi0uznb7dFep0uW5P2LsgTsPKW6GX64Fx42NbG7E3d2YI/MKU5txg0y+u3QRAmKKsv
        lJOe4o8TBduUkmHqKQYbNp9Mbq/jSLroljBO1P7DfdwjTPLIyDHWnnuVAPOLdzxtThxejHOJOcNGk
        PqKoO+8SfCkb8EYYB0yLqUPvDqrFjaPQVZdRMGx/+Ar2QDRpAzfuQRdBSi0ntYLQHS/KYY4wIukAF
        tP54Qi28yh4oiCLaB6nGi/Cpkjyl8vJUpQt9PidZZeYZHtW/4VoxMqRujdiGv/wpGdo5j1em+rk2g
        G+QDSBcg==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53318 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2je-001cPg-UB; Thu, 19 Mar 2020 16:29:51 -0500
Date:   Thu, 19 Mar 2020 16:29:50 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] intel-ish-hid: ishtp: hbm.h: Replace zero-length array
 with flexible-array member
Message-ID: <20200319212950.GA9155@embeddedor.com>
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
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2je-001cPg-UB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53318
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 19
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
 drivers/hid/intel-ish-hid/ishtp/hbm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.h b/drivers/hid/intel-ish-hid/ishtp/hbm.h
index bb85985b1620..7c445b203f2a 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.h
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.h
@@ -82,7 +82,7 @@ struct ishtp_msg_hdr {
 
 struct ishtp_bus_message {
 	uint8_t hbm_cmd;
-	uint8_t data[0];
+	uint8_t data[];
 } __packed;
 
 /**
-- 
2.23.0

