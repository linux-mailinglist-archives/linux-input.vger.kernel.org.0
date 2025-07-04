Return-Path: <linux-input+bounces-13372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EAAF85D1
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 04:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43356188C165
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 02:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1871DDA3E;
	Fri,  4 Jul 2025 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l4/kMENZ"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201F64B5AE;
	Fri,  4 Jul 2025 02:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751597942; cv=none; b=aBLQyf2m1dGm/7/pn2PlXEAZCrpqVyjunDcIWKTfc/qdIabZ0d2iWK7d+/avbojBBLgWTpDFiK3ArmE3TeRRMUxb4QHgb9EyJuXeEd/aSMFrv7Aw2PtBGatcZTmiOItS2zYUWbjb2+V2oW76tZgUySK6RL129LjD+5lB91L6fQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751597942; c=relaxed/simple;
	bh=v9ZSaeRH6xsUbDphucE3stcYhLXtHMYDO+SbC5YTOzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rpWXBxvwCJLO28yvpu1oT7d1dR5swOrDeGu2DaNs8pjb3WSgSuXN2M4SGJt1bw5/CBpQxgBF7BMEqRtrjF/9h/lFMvZ6n3FesuM4EFZ+XTGI+zYFB3frJqDmbK72lte3iNN6mAGEyaNmnDpg1hOsNHJkZx8a7tsKI0C2K1VkUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l4/kMENZ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=fWUTasDZ77zNHMZTc9qdSgR+3p0hsCmRaegRW2WfdU4=;
	b=l4/kMENZIligMjiU7+FNAXfCSKhaxJ8cJ7K/7rb/RihrStQXXfTVXsMdCYQKZn
	Sh1xiIXxGvgaaFcZYPF2OHyad9KAjpkzJ0srhxrJ61sG5lPRf1jvox3Ma785hS3A
	h//2nLF3EWH+8RbMNi1HQ+Zdni8eLDwZ6DHKaEiCU58lQ=
Received: from SZ-jihb.starsmicrosystem.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD357JjQ2doqh++CQ--.43258S2;
	Fri, 04 Jul 2025 10:58:43 +0800 (CST)
From: Hongbin Ji <jhb_ee@163.com>
To: jogletre@opensource.cirrus.com
Cc: fred.treven@cirrus.com,
	ben.bright@cirrus.com,
	dmitry.torokhov@gmail.com,
	patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongbin Ji <jhb_ee@163.com>
Subject: [PATCH] Input: cs40l50 -  fix possible NULL pointer dereference
Date: Fri,  4 Jul 2025 10:58:38 +0800
Message-Id: <20250704025838.11810-1-jhb_ee@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD357JjQ2doqh++CQ--.43258S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF4xKF4DArykXrWUXr15twb_yoWfGrc_uF
	WrGrs2kryqk3yUKFs0qw47Zry8KF1Yvw4kZFnIg39rXry0gr4DW34IgF4qvrsrWFy7tF9x
	Gw47Wa4F9wnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNqXdUUUUUU==
X-CM-SenderInfo: 5mkesvrh6rljoofrz/1tbiYAWAfGhnPtCgeQAAsh

Add a NULL‐check and return ‑ENOMEM if allocation failed to prevent a kernel oops

Signed-off-by: Hongbin Ji <jhb_ee@163.com>
---
 drivers/input/misc/cs40l50-vibra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index dce3b0ec8cf3..61d87bc5f175 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -238,6 +238,9 @@ static int cs40l50_upload_owt(struct cs40l50_work *work_data)
 	header.data_words = len / sizeof(u32);
 
 	new_owt_effect_data = kmalloc(sizeof(header) + len, GFP_KERNEL);
+	if (!new_owt_effect_data) {
+		return -ENOMEM;
+	}
 
 	memcpy(new_owt_effect_data, &header, sizeof(header));
 	memcpy(new_owt_effect_data + sizeof(header), work_data->custom_data, len);
-- 
2.34.1


