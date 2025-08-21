Return-Path: <linux-input+bounces-14240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C3B2FD4B
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 16:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A577A1CE42B7
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D45241136;
	Thu, 21 Aug 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4bT6Fcx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987C23A99D;
	Thu, 21 Aug 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787107; cv=none; b=VjPk7+Dl1q/dl1cJRawhUEHOSk22FW+ttrJVDxpVklUx1IIBH4qiO6tS0Pu/2AFABOR2YyQ++tRKjKUkjCTUPPLpSEo9Vn5C6YBY0LeUOHZ6ATO+wfj4MgkYChLQJkPcz/FbG4fHL1ITN2jkCcbDnwV19R5vaGQtlPaw0NSXH6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787107; c=relaxed/simple;
	bh=5rKXOaf+FjApOo2PM3ey29CU7EQXzCLVpo1BMPIg/HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGm91BPf1joZDKFrzMk4/Cg8iqsdQJ+02vpu3q1cCcGHQmThob4YpCq/b56c/LiKMqufyxo+y1ZUnkMwrHl/hsQYWnAm3p97lqt3MHbgirSCR8l+UgJL5AsLXBQs8s9w/TK5YYMg5H+fR1uxRdP+lomrzjnR8euPAPWPET5K7mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4bT6Fcx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8291C116D0;
	Thu, 21 Aug 2025 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755787106;
	bh=5rKXOaf+FjApOo2PM3ey29CU7EQXzCLVpo1BMPIg/HE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F4bT6FcxVFawBtmUVwyyMKGnU/dQZkzLv9I1vI2k7tpR6PRRml2DVv/7YEwFyOa5L
	 q63RLl4gChoNQbARH3lwhzzf/pkPHkzSDvPgAMl5tZlRyjkFeirkxCbcnE3FG4QDj6
	 WYfrNICb3HxvLsvY16qVlPWs91SgWlKM1OTErvCKJh90ZWYTtLAMhcftozwIJjE/qg
	 eWfKmlZ4HqdBRR/DmjDcdMHLIRKBnLOBEphcOXSsFfpw3WfvZ08WB6AoAWftmpKsUC
	 y2Z15B3CVwoNgMCaNGdcWP1fUNbTd6QjxeieM5s2B9o2TBmlF19TrV3djZLKNjv5y5
	 P7hplZaEpkqZQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 21 Aug 2025 16:38:14 +0200
Subject: [PATCH 2/2] HID: bpf: rescan the device for the group after a
 load/unload
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bpf-rescan-v1-2-08f9e2bc01bb@kernel.org>
References: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
In-Reply-To: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755787102; l=2497;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=5rKXOaf+FjApOo2PM3ey29CU7EQXzCLVpo1BMPIg/HE=;
 b=yzAF+cNccVC7WjbpG3YRz2KbpOHBRZh09QRqE1nl7hzgIx3xEiG5GS6nc3C5DR8TVUY92lLoo
 Z5k3GROwUdFCQwPsKT5T2VClPo6uY4823tDWrm+t2eItdhcyhILS9m8
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

When a BPF gets loaded, it was previously not possible to bind a
hid-generic device to hid-multitouch because the group was never
updated.

This change forces a rescan of the report descriptor after a bpf is
loaded/unloaded so we set up the proper group.

This was detected while Peter was trying to fix a Viewsonic device: the
HID device sending multiotuch data through a proprietary collection was
handled by hid-generic, and we don't have any way of attaching it to
hid-multitouch because the pre-scanning wasn't able to see the Contact
ID HID usage.

Suggested-by: Peter Hutterer <peter.hutterer@who-t.net>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index cf68fdffe0581eefb29a9d691f4acfc8f0d175d5..a5b3a8ca2fcbc868470dd50ec14e4c7829dd863b 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -943,6 +943,15 @@ static int hid_scan_report(struct hid_device *hid)
 	parser->device = hid;
 	hid->group = HID_GROUP_GENERIC;
 
+	/*
+	 * In case we are re-scanning after a BPF has been loaded,
+	 * we need to use the bpf report descriptor, not the original one.
+	 */
+	if (hid->bpf_rdesc && hid->bpf_rsize) {
+		start = hid->bpf_rdesc;
+		end = start + hid->bpf_rsize;
+	}
+
 	/*
 	 * The parsing is simpler than the one in hid_open_report() as we should
 	 * be robust against hid errors. Those errors will be raised by
@@ -2728,6 +2737,12 @@ static int __hid_device_probe(struct hid_device *hdev, struct hid_driver *hdrv)
 	int ret;
 
 	if (!hdev->bpf_rsize) {
+		/* we keep a reference to the currently scanned report descriptor */
+		const __u8  *original_rdesc = hdev->bpf_rdesc;
+
+		if (!original_rdesc)
+			original_rdesc = hdev->dev_rdesc;
+
 		/* in case a bpf program gets detached, we need to free the old one */
 		hid_free_bpf_rdesc(hdev);
 
@@ -2737,6 +2752,12 @@ static int __hid_device_probe(struct hid_device *hdev, struct hid_driver *hdrv)
 		/* call_hid_bpf_rdesc_fixup will always return a valid pointer */
 		hdev->bpf_rdesc = call_hid_bpf_rdesc_fixup(hdev, hdev->dev_rdesc,
 							   &hdev->bpf_rsize);
+
+		/* the report descriptor changed, we need to re-scan it */
+		if (original_rdesc != hdev->bpf_rdesc) {
+			hdev->group = 0;
+			hid_set_group(hdev);
+		}
 	}
 
 	if (!hid_check_device_match(hdev, hdrv, &id))

-- 
2.50.1


