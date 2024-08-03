Return-Path: <linux-input+bounces-5305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EB9469B4
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5747C1C20B5B
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1444B152798;
	Sat,  3 Aug 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="siYVdbzy"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F10139D03;
	Sat,  3 Aug 2024 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688483; cv=none; b=tSRa2w8sMxZ3ZdTyG15f1TuK0v9mxUY1exg3FfyaZ3YZdfFkbOJ5EQhXpOJt7budED3opBo/+zmZp44fXPC0Hv5AK+qKSG3OIyTvd9TtvkbPJ2CDtXo/yhE4MpMuMfIzPjvAVrLnHkqVHe53kAp+gaoH0aqN6TTQeWl6NPecmi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688483; c=relaxed/simple;
	bh=6Nqfk/irpb5e+NHTn9Fs9bSdLUKMux5A7tiT4Pv0zeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9GJzhAJAZaeJYjTBlEHgVMPOqDN0G9Z86e9SrKpqX5Xt62sHY9htch2ahESkVFe3qzRXW3u1d3uD57tDxcijIB4a6AbAGo1Uk2GSoAlKxhuYFB8xfweTRVeOlZHg6raO/1JY+tKc+qop29xC3TatfHbwSzsHlwdDuaaNCgWqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=siYVdbzy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=6Nqfk/irpb5e+NHTn9Fs9bSdLUKMux5A7tiT4Pv0zeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=siYVdbzy5DXUHu7vmnlgu4Sjkh9rLaGWk6BWwV+DW0GvkHvm/vLVnM85bYYKEY+B3
	 GIebe0utZHOhfIYpnia7SqQrpF87puBz5oZp36FyN+SV+k3iF+qKmhoj+Gq783KC7w
	 E4LQMvgUBVgoIWO1Ojtko0I8jbF9ZDf/YJku/zN0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:18 +0200
Subject: [PATCH v2 2/7] HID: constify parameter rdesc of hid_parse_report()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-2-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=1630;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6Nqfk/irpb5e+NHTn9Fs9bSdLUKMux5A7tiT4Pv0zeA=;
 b=mCioqPbeyrxBvM9v0mcJjMGDog+Bx/KDfZLGgbwJTKU9MKsAHsmzmCPOlEFL9/rhOK0XGjFXl
 kaWnH1i1c24BQb2mjS4rDpGwrVD0cKBrPlrqOSdpdk55GQ+oaRYwvax
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The parameter is never modified, so mark it as const.

This is a prerequisite for constification changes in the HID core.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-core.c | 2 +-
 include/linux/hid.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 988d0acbdf04..0d2cbe491708 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -946,7 +946,7 @@ static int hid_scan_report(struct hid_device *hid)
  * Allocate the device report as read by the bus driver. This function should
  * only be called from parse() in ll drivers.
  */
-int hid_parse_report(struct hid_device *hid, __u8 *start, unsigned size)
+int hid_parse_report(struct hid_device *hid, const __u8 *start, unsigned size)
 {
 	hid->dev_rdesc = kmemdup(start, size, GFP_KERNEL);
 	if (!hid->dev_rdesc)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1533c9dcd3a6..e7a5d6f2f2eb 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -953,7 +953,7 @@ struct hid_device *hid_allocate_device(void);
 struct hid_report *hid_register_report(struct hid_device *device,
 				       enum hid_report_type type, unsigned int id,
 				       unsigned int application);
-int hid_parse_report(struct hid_device *hid, __u8 *start, unsigned size);
+int hid_parse_report(struct hid_device *hid, const __u8 *start, unsigned size);
 struct hid_report *hid_validate_values(struct hid_device *hid,
 				       enum hid_report_type type, unsigned int id,
 				       unsigned int field_index,

-- 
2.46.0


