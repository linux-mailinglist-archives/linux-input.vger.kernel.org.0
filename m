Return-Path: <linux-input+bounces-8764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BB9FC336
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 02:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6293316501F
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 01:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4883B45038;
	Wed, 25 Dec 2024 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="l6r+YCMi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E011CA9;
	Wed, 25 Dec 2024 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735091719; cv=none; b=MLUejKzZ+yFsrI6vNbwLm38PrF/mowE9jrUtWo5bsFS/isMFjeWbzNtiKEcmgwKBw3NEKEqd60OvJX44kBeKC3QDW5UcPVzTN7+bvne5+WrWBFvphv1oCYA6OSVvRz5GakXZpXyisEaLU16p7reME2TKQEjn8su3ldh5/PcR3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735091719; c=relaxed/simple;
	bh=0ffO5vltG0wynqoXzTYadkve5uqyEmVNWF0P9yFKeFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/2hp9FyEIGwYzhgk/zAdqbwhwUkXcS5PMTNOYRoGq/miaIHvqCQWryQrnXfI01Z4lSOitQsDeDnNnleefAFerrz0imWKUp2RmGeiRLQLiInt52EylL57PaPw8JtO1B1qexNvdeZULSTy4Hx7bKDx4RVVZkVWWKbsLqw3nN3CX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=l6r+YCMi; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=I9GWRlz/pSqRMSz9TawgLDAmPGbJeXKYmZJj+V6Sr0A=; b=l6r+YCMiA3HCwG7j
	hSAA/FFOrHzeMVhfQnEFDzx0v/StdmRCnhFU5utUm0e5/H6yzfiieNFcnBiHzNQCiSiLiWrSqjYuw
	VJYAJbosnEm4LCKYMjzeYryy2HbcfP/8tOjFqxowqJkiF8UNIJwObrNOSV/FqkffE1inJjU28qGkm
	v2Yi8YEf+fsAj/BYb9Op4pENA5x1D6DPIx8w8JB7lP36nfsetPY0vN3jd3MU+40vUJUGoKEmOjsdG
	g0qtjXmoIkAJpqB/UnqDw1lAVE1unmPuyUhgnOtQX2byWxAysOJ6AbcnMncPu8Xh4b2d04SDOM4lX
	YVED1DOdbNWQi7dYwQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQGcC-0073l1-1n;
	Wed, 25 Dec 2024 01:55:12 +0000
From: linux@treblig.org
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] HID: intel-ish-hid: Remove unused ishtp_cl_get_tx_*
Date: Wed, 25 Dec 2024 01:55:09 +0000
Message-ID: <20241225015509.458032-4-linux@treblig.org>
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

ishtp_cl_get_tx_free_buffer_size() and ishtp_cl_get_tx_free_rings()
were added in 2018 by
commit 18c0b5467498 ("HID: intel_ish-hid: Enhance API to get ring buffer
sizes")
but have remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 19 -------------------
 drivers/hid/intel-ish-hid/ishtp/client.h |  2 --
 2 files changed, 21 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index e61b01e9902e..21a2c0773cc2 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -14,25 +14,6 @@
 #include "hbm.h"
 #include "client.h"
 
-int ishtp_cl_get_tx_free_buffer_size(struct ishtp_cl *cl)
-{
-	unsigned long tx_free_flags;
-	int size;
-
-	spin_lock_irqsave(&cl->tx_free_list_spinlock, tx_free_flags);
-	size = cl->tx_ring_free_size * cl->device->fw_client->props.max_msg_length;
-	spin_unlock_irqrestore(&cl->tx_free_list_spinlock, tx_free_flags);
-
-	return size;
-}
-EXPORT_SYMBOL(ishtp_cl_get_tx_free_buffer_size);
-
-int ishtp_cl_get_tx_free_rings(struct ishtp_cl *cl)
-{
-	return cl->tx_ring_free_size;
-}
-EXPORT_SYMBOL(ishtp_cl_get_tx_free_rings);
-
 /**
  * ishtp_read_list_flush() - Flush read queue
  * @cl: ishtp client instance
diff --git a/drivers/hid/intel-ish-hid/ishtp/client.h b/drivers/hid/intel-ish-hid/ishtp/client.h
index d9d398fadcf7..0efd49dd2530 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.h
+++ b/drivers/hid/intel-ish-hid/ishtp/client.h
@@ -120,8 +120,6 @@ int ishtp_cl_alloc_rx_ring(struct ishtp_cl *cl);
 int ishtp_cl_alloc_tx_ring(struct ishtp_cl *cl);
 void ishtp_cl_free_rx_ring(struct ishtp_cl *cl);
 void ishtp_cl_free_tx_ring(struct ishtp_cl *cl);
-int ishtp_cl_get_tx_free_buffer_size(struct ishtp_cl *cl);
-int ishtp_cl_get_tx_free_rings(struct ishtp_cl *cl);
 
 /* DMA I/F functions */
 void recv_ishtp_cl_msg_dma(struct ishtp_device *dev, void *msg,
-- 
2.47.1


