Return-Path: <linux-input+bounces-3894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6288D1A74
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 13:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9CECB237AD
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAFB16C85E;
	Tue, 28 May 2024 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXU1iqvM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E84C97;
	Tue, 28 May 2024 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897487; cv=none; b=jbloxPblioVcOsZv8HKT+TP7pGublWq3GpygqhukfzOOWkiAUDufz3y5/WlPzve0A5PjM0hrMT24ZsVX1egb0dpxUG2EdIs/ohF11KSTrA4ZI78d8XGHz20g8Gp9tqcntGElfEq0Ixs9VFvlWG7l7C+krlovnnnbFNqzXLVEdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897487; c=relaxed/simple;
	bh=bVWQAYUpyK9YpqqeaTrdId8lboSQEV0GEqaTP7AtzUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzRvJa6PQudTgE76uTEM4NNBYaplPjTV4gl4712Gtklk5BPiX1VwvviC/R0bB42HxrDvdw+PlH7+MPahQrfmDGs4M4U6grpeUtUd+STCNzolSyjLNWFRavVM5Fl4M20fsiFko58EDmPXO7aET8TTjkOyfwzlMCPMqyfjQD2YQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXU1iqvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB8EC32781;
	Tue, 28 May 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716897486;
	bh=bVWQAYUpyK9YpqqeaTrdId8lboSQEV0GEqaTP7AtzUE=;
	h=From:To:Cc:Subject:Date:From;
	b=CXU1iqvM+KwXqCpsUvZtg6Y8tNJw5XYuUy08OnzwXBOjyYEw+FGW74BFx5kZRTNKw
	 4o5LU2x8cTaP67/NM4+gjjuslV0zUxfch+averONwsCxuf9dnpAHJgEW3zZJHyFhTZ
	 7P6q1SE4rYcp8hgS3vnQcMXI/ZBH0WfzNcsjGOqy8LG6cI+hxcHTSSL9p+TnKOgfog
	 thzn53aOXA3xVj0+BAYSv+AjGzECRB/e78/BEsu6S7epcAbm6WZXq7YFn73l8pCg7r
	 WP8u8sIMeaYp+cB7vB2y4q7gBYS9twwdlLB2MjLcsUNJxHdbnviMtskw9md6cOm8aj
	 2iKo+s02eoo2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Zhang Lixu <lixu.zhang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Date: Tue, 28 May 2024 13:57:53 +0200
Message-Id: <20240528115802.3122955-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The low-level cache operation on a coherent buffer is incorrect,
as coherent DMA memory may not actually be cached. Instead, use a DMA
barrier that ensures that the data is visible to the DMA master before
the address is and move the memcpy() before the reference.

Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from host feature")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I noticed this one while looking at the bug that was fixed in
236049723826 ("HID: intel-ish-hid: Fix build error for COMPILE_TEST")
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index 2785b04a2f5a..062d1b25eaa7 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -33,7 +33,6 @@
 
 #define dev_fmt(fmt) "ISH loader: " fmt
 
-#include <linux/cacheflush.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/dma-mapping.h>
@@ -175,10 +174,11 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 			return -ENOMEM;
 
 		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
+
+		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);
+		dma_wmb();
 		fragment->fragment_tbl[i].length = clamp(ish_fw->size - offset, 0, fragment_size);
 		fragment->fragment_tbl[i].fw_off = offset;
-		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);
-		clflush_cache_range(dma_bufs[i], fragment_size);
 
 		offset += fragment->fragment_tbl[i].length;
 	}
-- 
2.39.2


