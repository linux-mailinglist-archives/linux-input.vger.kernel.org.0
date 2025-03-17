Return-Path: <linux-input+bounces-10872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB0A6420A
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 07:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCE4B16E279
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 06:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657991D7E52;
	Mon, 17 Mar 2025 06:49:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A3154C0D;
	Mon, 17 Mar 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742194154; cv=none; b=tdTbewAm5mm7vREXlp6eK5FV2Xxf6AlbsDO+dPfzYab3LvZuUwFa6OPVk14BsjzWZBmotpXzPRSrmHrV3u/HUkIXl2M8kde11HKBn+yGYKcULclLreTttefvDIV2uXU//0a7FeVeDRFkbD4apoDTQ/gE3iOLNWWa9j5REmfo/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742194154; c=relaxed/simple;
	bh=665UeX38D7W2Tq83xs/96x3zccqTUs4GbpB90PhcaJE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=I6kwhmncRJ/H5SY5wz9MdzJ31F1B9bHzDaNQYHDUnOZVydyDsuuPxT6rmv5Knsj2s3V9+zsKETUd2BMFFEWJ6ELB/sE3B22L/B96OerpxPOUPhyAGVfjG4EJNVF1hgylRMyApq0FVzh6ugBU8BgfE4MRKkde9aoQm6f5PMcBSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZGQYZ49nvz4x6DH;
	Mon, 17 Mar 2025 14:49:06 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52H6n0H1032445;
	Mon, 17 Mar 2025 14:49:00 +0800 (+08)
	(envelope-from tang.dongxing@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 14:49:03 +0800 (CST)
Date: Mon, 17 Mar 2025 14:49:03 +0800 (CST)
X-Zmail-TransId: 2afb67d7c5df6c7-a9b82
X-Mailer: Zmail v1.0
Message-ID: <20250317144903174zOkphecnOt0ZMjif03iQV@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <tang.dongxing@zte.com.cn>
To: <jikos@kernel.org>
Cc: <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yang.guang5@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IGhpZC1sb2dpdGVjaDogdXNlIHN5c2ZzX2VtaXRfYXQoKSBpbnN0ZWFkIG9mIHNjbnByaW50Zigp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52H6n0H1032445
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7C5E2.001/4ZGQYZ49nvz4x6DH

From: TangDongxing <tang.dongxing@zte.com.cn>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: TangDongxing <tang.dongxing@zte.com.cn>
---
 drivers/hid/hid-lg4ff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index c0a138f21ca4..445623dd1bd6 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -823,7 +823,7 @@ static ssize_t lg4ff_alternate_modes_show(struct device *dev, struct device_attr
 	for (i = 0; i < LG4FF_MODE_MAX_IDX; i++) {
 		if (entry->wdata.alternate_modes & BIT(i)) {
 			/* Print tag and full name */
-			count += scnprintf(buf + count, PAGE_SIZE - count, "%s: %s",
+			count += sysfs_emit_at(buf, count, "%s: %s",
 					   lg4ff_alternate_modes[i].tag,
 					   !lg4ff_alternate_modes[i].product_id ? entry->wdata.real_name : lg4ff_alternate_modes[i].name);
 			if (count >= PAGE_SIZE - 1)
@@ -832,9 +832,9 @@ static ssize_t lg4ff_alternate_modes_show(struct device *dev, struct device_attr
 			/* Mark the currently active mode with an asterisk */
 			if (lg4ff_alternate_modes[i].product_id == entry->wdata.product_id ||
 			    (lg4ff_alternate_modes[i].product_id == 0 && entry->wdata.product_id == entry->wdata.real_product_id))
-				count += scnprintf(buf + count, PAGE_SIZE - count, " *\n");
+				count += sysfs_emit_at(buf, count, " *\n");
 			else
-				count += scnprintf(buf + count, PAGE_SIZE - count, "\n");
+				count += sysfs_emit_at(buf, count, "\n");

 			if (count >= PAGE_SIZE - 1)
 				return count;
-- 
2.25.1

