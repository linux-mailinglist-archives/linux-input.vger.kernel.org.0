Return-Path: <linux-input+bounces-13437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC711AFECA4
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692BC645F6E
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E532E762E;
	Wed,  9 Jul 2025 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9Ek7Pgz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F682E716D;
	Wed,  9 Jul 2025 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072738; cv=none; b=fwVuwdZoCTr+3YSn1yYQjRntZUVr1mGrpzMlbY7KgRmYu0qoma2mjaFpOV0UtYL9eJCopR3YvmWvNOG0vLWUVXWlgsq+smQY+s5Ac0suBErgYpWXc+cruWj5MdER8X6+6othQgPohEEawabCZGvDCe7Xi98BPZtfkgYK83101Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072738; c=relaxed/simple;
	bh=ln3XynQ38sbyzJkbc6ukGWTXFvmEi9JBe++zC7jvuHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hv7idOAvJuEpBBHqLjqbBns9uqx5GfCEmOYORnwJILSaVgdJADmA3t/RfJI1XHL+2cI2b+1MQ2h2GP1VDNgX3CdT9XSyL1nZb56ittjNYoitqGEdp/Rg8zbpUUBtYvrre6UZLCrqMWRx1ffDMLNcT2AZwlE1liYsERQ1HfBps+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9Ek7Pgz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F90C4CEF6;
	Wed,  9 Jul 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752072737;
	bh=ln3XynQ38sbyzJkbc6ukGWTXFvmEi9JBe++zC7jvuHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T9Ek7PgzKNjVD3CkxCMxj/2J5HkWInbtFNGUozv/0HX2Mx2WfJd5VafZPKwu0U9jd
	 Zhl5dNzqjXf6wPi6XJ0HKBB3ru1vj++EkyxdccBuFm+uqABELz4jDcy/tTUgXO4D7X
	 idvf2hhuacbz/sC2tQLnQ7aqAXQw/cq+XRArk4iu3GZ+SZhGMfG6fkxwpDE8Av/4vq
	 C74gWDUYlyj/urzuLN8zo50iOEobtG3H2PE2Kod0Oq1c8SNS4YUPQeLPskJgTvOwiN
	 p8fC19bmE7WMdn6dLUclYJmc/VK8tSWMn3E5JJ0pIPxSiktWkPi5W5uyRD4vCBEs6d
	 6uf1OC+gGl8Ow==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 09 Jul 2025 16:51:48 +0200
Subject: [PATCH 3/3] HID: core: do not bypass hid_hw_raw_request
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-report-size-null-v1-3-194912215cbc@kernel.org>
References: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
In-Reply-To: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072731; l=1215;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=ln3XynQ38sbyzJkbc6ukGWTXFvmEi9JBe++zC7jvuHA=;
 b=BuBg+3WPYhrI6CwtVtA9byh4pHRvIQs9zPGPXK8kHBp9B3UA0B6tunbYuskoA5Bav/Ht/0KyA
 YBIrUuFptjKDk3HPGlj7wRum5G4DWxkiIZoD97U1XyHStvjfw8Gqr/C
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

hid_hw_raw_request() is actually useful to ensure the provided buffer
and length are valid. Directly calling in the low level transport driver
function bypassed those checks and allowed invalid paramto be used.

Reported-by: Alan Stern <stern@rowland.harvard.edu>
Closes: https://lore.kernel.org/linux-input/c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu/
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 320887c365f7a36f7376556ffd19f99e52b7d732..b31b8a2fd540bd5ed66599020824726e69d10d75 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1996,8 +1996,7 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
 	if (reqtype == HID_REQ_SET_REPORT)
 		hid_output_report(report, data_buf);
 
-	ret = hid->ll_driver->raw_request(hid, report->id, buf, len,
-					  report->type, reqtype);
+	ret = hid_hw_raw_request(hid, report->id, buf, len, report->type, reqtype);
 	if (ret < 0) {
 		dbg_hid("unable to complete request: %d\n", ret);
 		goto out;

-- 
2.49.0


