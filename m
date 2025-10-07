Return-Path: <linux-input+bounces-15275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB9BBFE8E
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 03:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D01D3C4806
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 01:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D421E47B7;
	Tue,  7 Oct 2025 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="cscQp/ct"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EB191F91
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799522; cv=none; b=VCpEkpFnKSE5q2SUOtSzgOajqa/pxbwretlPrGKHSgkbjaK0Fs/I/Kir/F6Vx318W4cwACvQ1XRSDBUM60n3V71E1l0iXv7rOtPfA3EnTUrKq5vpyaXjnzVNE3J30lzTAT/kTUZRYSM1pyxxYZNnP3+8z6dmwMGOtQS5l8UV830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799522; c=relaxed/simple;
	bh=D37s9Qdh3+xj++8JIsKUuE2NtKSSWLZZrXUm1AEI3Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJG4kinMWxOFJINg0sRXGdtf5ei8NPgrZ3ZFHUH5PvYAjCcVrfAgctyIS2ZkIFI9nh96IX8limkWGPojBB08JZnXI3HCbeD2HpLDNSZElzBvs0U/XGSEcGL/2U9cBfFxvIP5FZgYoESSYahFryMOR690SgVWL88Yk6n1IZ/RTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=cscQp/ct; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1759799174; bh=D37s9Qdh3+xj++8JIsKUuE2NtKSSWLZZrXUm1AEI3Tc=;
	h=From:To:Cc:Subject:Date:From;
	b=cscQp/ctDoGgkOrcoUS/t9HBgoUHZlTKJhCagyK8M6NbskaLPgLqM6A1bHF7Qd4e5
	 KJ9nHcWbdQPGqfWXDH+CHR//w0g3H1qW4MHahGBT0uWd8wjLBzg8UZjGtsAu3lQjdO
	 60K3uWRJvfFGSI2Er5+XcbGE7ZNro8tjIK7mJJAiaV9RXnQ/XMYH85R/05ZxmgN858
	 m3kCWu6zi5edfRdGfmrfRfySqxtAY3FLxurbUVg9P5Gg71HkEg6/oHM9OR4L3JHnhL
	 aBab/RGqNiAcvgvDgYoKwmVlNNicBAZiACb9kQmaDyk5Wv8hISM5evlQ70jwBrVpIe
	 1U7WZz6+bQCUg==
Received: from nebulosa.vulpes.eutheria.net (97-113-254-202.tukw.qwest.net [97.113.254.202])
	by endrift.com (Postfix) with ESMTPSA id 781B3A041;
	Mon,  6 Oct 2025 18:06:11 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/3] HID: core: Add printk_ratelimited variants to hid_warn() etc
Date: Mon,  6 Oct 2025 18:05:31 -0700
Message-ID: <20251007010533.3777922-1-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hid_warn_ratelimited() is needed. Add the others as part of the block.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 include/linux/hid.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 2cc4f1e4ea963..bd66cf6164941 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1261,4 +1261,15 @@ void hid_quirks_exit(__u16 bus);
 #define hid_dbg_once(hid, fmt, ...)			\
 	dev_dbg_once(&(hid)->dev, fmt, ##__VA_ARGS__)
 
+#define hid_err_ratelimited(hid, fmt, ...)			\
+	dev_err_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice_ratelimited(hid, fmt, ...)			\
+	dev_notice_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_ratelimited(hid, fmt, ...)			\
+	dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info_ratelimited(hid, fmt, ...)			\
+	dev_info_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg_ratelimited(hid, fmt, ...)			\
+	dev_dbg_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+
 #endif
-- 
2.51.0


