Return-Path: <linux-input+bounces-5304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373709469B3
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6936281EB3
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B3415253D;
	Sat,  3 Aug 2024 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FUs6RIJS"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3181514D3;
	Sat,  3 Aug 2024 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688482; cv=none; b=ouTpozT5R5ofp+FyndTF7EaW8vJZSV2+E6qAnmxrh1NHCHOXGc5kMmXY2D6MAAeAGWwvXCGwLjIXwKQKxDrSlEi3y3Ioh+y9ax0dQ+wh8nrtpNvIwSPEUSqdnZ6oqdWNoGsSTR+zbQjKrwZJcCOB3+lUNZCoNkbCQ2xn81qKwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688482; c=relaxed/simple;
	bh=dAgvryFidpiZDE27qRb8KiIyHZOOI71TXcIyjU7HAXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgwb99eOi3sFGvgXvDf53BOVf3DAnlOKRjEXhHTCYsMlwNRD9UtNhmpDQnAIV1ixA4kVuG/clon+XJYpouXSiNFnE1+wTszRsOiIfC6yxMq2QqfvjzU+qfUxjL0ScJkPcQCsDIqTwCLysGUQs5LHF3jXn2T572q7v8LeXRC8/jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FUs6RIJS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=dAgvryFidpiZDE27qRb8KiIyHZOOI71TXcIyjU7HAXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FUs6RIJSQVhPoKHAqtZJ5QugfRcHLOWdCSskyJF7MRVeCl/yyna7Agg/7DfZN566E
	 zr/qh5N1Coa/Oljuf0FJzpeg+MvGGTGIhke5op6xQRk6cq8r0CBXx2U8nc07eTbWro
	 eYVZkLPIL+Pn0pdsRc0cFB3m+AQU/VFNEzLcK/0U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:17 +0200
Subject: [PATCH v2 1/7] HID: bpf: constify parameter rdesc of
 call_hid_bpf_rdesc_fixup()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-1-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=2064;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=dAgvryFidpiZDE27qRb8KiIyHZOOI71TXcIyjU7HAXs=;
 b=n9p6/P8Cqr77gKUkg2Vnt+OSsX8xEb8g/SI9bUieeVE0x9YDfTxcObyz46lNFOIRwwFsz9N22
 pSzETcT/x+HBbe90i4F1QK8q1D4024BtRSMwZwrpLg6UyI1oBdxn8kW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The parameter is never modified, so mark it as const.
Also inline the return statement to avoid a type mismatch error.

This is a prerequisite for constification changes in the HID core.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/bpf/hid_bpf_dispatch.c | 6 ++----
 include/linux/hid_bpf.h            | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index a272a086c950..8420c227e21b 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -148,7 +148,7 @@ int dispatch_hid_bpf_output_report(struct hid_device *hdev,
 }
 EXPORT_SYMBOL_GPL(dispatch_hid_bpf_output_report);
 
-u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size)
+u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc, unsigned int *size)
 {
 	int ret;
 	struct hid_bpf_ctx_kern ctx_kern = {
@@ -179,9 +179,7 @@ u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *s
 		*size = ret;
 	}
 
-	rdesc = krealloc(ctx_kern.data, *size, GFP_KERNEL);
-
-	return rdesc;
+	return krealloc(ctx_kern.data, *size, GFP_KERNEL);
 
  ignore_bpf:
 	kfree(ctx_kern.data);
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index d4d063cf63b5..6a47223e6460 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -212,7 +212,7 @@ int hid_bpf_connect_device(struct hid_device *hdev);
 void hid_bpf_disconnect_device(struct hid_device *hdev);
 void hid_bpf_destroy_device(struct hid_device *hid);
 int hid_bpf_device_init(struct hid_device *hid);
-u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size);
+u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, const u8 *rdesc, unsigned int *size);
 #else /* CONFIG_HID_BPF */
 static inline u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type,
 						u8 *data, u32 *size, int interrupt,

-- 
2.46.0


