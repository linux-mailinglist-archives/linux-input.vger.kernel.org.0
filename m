Return-Path: <linux-input+bounces-8763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B89FC334
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 02:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A11188405F
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 01:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EEF1E4AD;
	Wed, 25 Dec 2024 01:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="F/clu+KS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFB101E6;
	Wed, 25 Dec 2024 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735091718; cv=none; b=BvbGW/O6eJPyaZbkGSnLHHs4HB4eo+RrBswX37S/TYGy8ZkpikY9T8Er2tbm+1fBpkzEwNJgVfspRAl2xfAoA9o/LUwfO+FiAoyFv3EIc9kNVzpOP/a5eFVaTDm4V1Z7lFaHwjZ6JgLxdFGiWgNENrYZL7zvx1ISLVFy5YBv+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735091718; c=relaxed/simple;
	bh=c17/vyh2OiEb1043uXtjhRSxSgwPzp1q9MzhjVIwgdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEz46KjKBKzTuZjYWTkmwoD7IgtPFvd4OhvQpCElWcxHJCavCH0/Uh/h//yBCR9ilOuBrinati4CUf7nRZZirZ81GL2gUynCb6BdCxKSSmarEfm1CQ+ou9+7OoF+zqOT6Kz+U+qioATCJPvNnSPi8n2TTzaRLSC8Ac0MVSs1koQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=F/clu+KS; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=KGMyr0fXNIekp/8y4rKxbxKl8DB8GrzxWujmDNWtbiQ=; b=F/clu+KS0sl2MVox
	e6zaoPK3Lnhkfft+8e/2jYHLL8foTViPTEMRa7qoRHOf5NSvOi99cuAtX2NUcqz1K7VXQZylhgjN/
	ivtH0zQIoZ0zNgk1y6kEXMAva6+NL6N2cJWpXHBl1+FAxRhg1J1/49hnTCpIHn3TTAUeBFmoHs+lx
	3nbNOaWpTEMgo8dp/7+c+DEkKqfZWSdiKnhtmBWm1rul6pmopMAd5FMwi7zTk72A415x80uhTNzTW
	W2YNyBHqYQ0hzJ+TnTfdpafQOzEylYinp2PxIy4QDTGpHUqvRsWDJQIVuNmHamE6VvFN+DQ8NytIz
	D4CZkEAPbtPc3Am3+A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQGcB-0073l1-2Z;
	Wed, 25 Dec 2024 01:55:11 +0000
From: linux@treblig.org
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] HID: intel-ish-hid: Remove unused ishtp_cl_tx_empty
Date: Wed, 25 Dec 2024 01:55:08 +0000
Message-ID: <20241225015509.458032-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241225015509.458032-1-linux@treblig.org>
References: <20241225015509.458032-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ishtp_cl_tx_empty() was added in 2018 by
commit a1c40ce62fd2 ("HID: intel-ish-hid: ishtp: add helper functions for
client buffer operation") but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../hid/intel-ish-hid/ishtp/client-buffers.c  | 21 -------------------
 include/linux/intel-ish-client-if.h           |  1 -
 2 files changed, 22 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client-buffers.c b/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
index 513d7a4a1b8a..97f4026b1627 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client-buffers.c
@@ -251,27 +251,6 @@ int ishtp_cl_io_rb_recycle(struct ishtp_cl_rb *rb)
 }
 EXPORT_SYMBOL(ishtp_cl_io_rb_recycle);
 
-/**
- * ishtp_cl_tx_empty() -test whether client device tx buffer is empty
- * @cl: Pointer to client device instance
- *
- * Look client device tx buffer list, and check whether this list is empty
- *
- * Return: true if client tx buffer list is empty else false
- */
-bool ishtp_cl_tx_empty(struct ishtp_cl *cl)
-{
-	int tx_list_empty;
-	unsigned long tx_flags;
-
-	spin_lock_irqsave(&cl->tx_list_spinlock, tx_flags);
-	tx_list_empty = list_empty(&cl->tx_list.list);
-	spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
-
-	return !!tx_list_empty;
-}
-EXPORT_SYMBOL(ishtp_cl_tx_empty);
-
 /**
  * ishtp_cl_rx_get_rb() -Get a rb from client device rx buffer list
  * @cl: Pointer to client device instance
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index 771622650247..dfbf7d9d7bb5 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -100,7 +100,6 @@ void ishtp_cl_destroy_connection(struct ishtp_cl *cl, bool reset);
 int ishtp_cl_send(struct ishtp_cl *cl, uint8_t *buf, size_t length);
 int ishtp_cl_flush_queues(struct ishtp_cl *cl);
 int ishtp_cl_io_rb_recycle(struct ishtp_cl_rb *rb);
-bool ishtp_cl_tx_empty(struct ishtp_cl *cl);
 struct ishtp_cl_rb *ishtp_cl_rx_get_rb(struct ishtp_cl *cl);
 void *ishtp_get_client_data(struct ishtp_cl *cl);
 void ishtp_set_client_data(struct ishtp_cl *cl, void *data);
-- 
2.47.1


