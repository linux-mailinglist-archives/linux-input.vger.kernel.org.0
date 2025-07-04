Return-Path: <linux-input+bounces-13370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F60AF85A8
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 04:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2C64A7702
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 02:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966481DF991;
	Fri,  4 Jul 2025 02:40:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080401DDA34;
	Fri,  4 Jul 2025 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596825; cv=none; b=Hdkx0X5SWMdeOynImh89t8IK3ehQ3atBuHX9HKnbYfzWLgaU4X6O85j77AXJmq1aeUlIs9LIUN01oGwfcJ9hRFYhRfnmX4u/uKzDJ8Uc655ZY9/WDoyVgOOy073FQMa2LopuTy02CqpB+37h290LVhUjLhoQv5d6saIaXWMzCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596825; c=relaxed/simple;
	bh=SAYN5VKjUnBLcKJkHCiVym3079UNk84BkRL08HA1A7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNQwQiZXtnYsYkWTJGvwUV3h2bkvOLPVIz0MR/LfqSPRbjDjXevusgd35Htx01nSirQ+drVwPWqkDwHNzx0nJg5MGSTwNvYb62cgCwrYbp3K726Es2ONhSj86DdP14mJI12LwfS7LzD0n658ToMpL7PjbzRJuVIfjNGDSoDKzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 368a0998588011f0b29709d653e92f7d-20250704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:034570ce-596c-429a-9efd-e80c6a0f942f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:33ba69fe0ab85910e7858a1ae5a8be6d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 368a0998588011f0b29709d653e92f7d-20250704
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1168541632; Fri, 04 Jul 2025 10:40:14 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 060C7E008FA2;
	Fri,  4 Jul 2025 10:40:14 +0800 (CST)
X-ns-mid: postfix-68673F0D-745718436
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 69236E008FA1;
	Fri,  4 Jul 2025 10:40:12 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	Yunshui Jiang <jiangyunshui@kylinos.cn>
Subject: [PATCH] Input: cs40l50: Fix potential NULL dereference and memory leak
Date: Fri,  4 Jul 2025 10:40:10 +0800
Message-ID: <20250704024010.2353841-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The cs40l50_upload_owt() function allocates memory via kmalloc()
without checking for allocation failure, which could lead to a
NULL pointer dereference when GFP_KERNEL allocation fails under
memory pressure.

Additionally, if any subsequent operation fails after successful
allocation, the allocated memory is not freed, causing a memory
leak.

Therefore, add a NULL check for kmalloc() and returns -ENOMEM on
failure. And use a goto cleanup pattern to ensure the allocated
memory is freed on any error path.

Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
---
 drivers/input/misc/cs40l50-vibra.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40=
l50-vibra.c
index dce3b0ec8cf3..c48b6c905112 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -238,25 +238,31 @@ static int cs40l50_upload_owt(struct cs40l50_work *=
work_data)
 	header.data_words =3D len / sizeof(u32);
=20
 	new_owt_effect_data =3D kmalloc(sizeof(header) + len, GFP_KERNEL);
+	if (!new_owt_effect_data)
+		return -ENOMEM;
=20
 	memcpy(new_owt_effect_data, &header, sizeof(header));
 	memcpy(new_owt_effect_data + sizeof(header), work_data->custom_data, le=
n);
=20
 	error =3D regmap_read(vib->regmap, vib->dsp.owt_offset_reg, &offset);
 	if (error)
-		return error;
+		goto free_owt_data;
=20
 	error =3D regmap_bulk_write(vib->regmap, vib->dsp.owt_base_reg +
 				  (offset * sizeof(u32)), new_owt_effect_data,
 				  sizeof(header) + len);
 	if (error)
-		return error;
+		goto free_owt_data;
=20
 	error =3D vib->dsp.write(vib->dev, vib->regmap, vib->dsp.push_owt_cmd);
 	if (error)
-		return error;
+		goto free_owt_data;
=20
 	return 0;
+
+free_owt_data:
+	kfree(new_owt_effect_data);
+	return error;
 }
=20
 static void cs40l50_add_worker(struct work_struct *work)
--=20
2.47.1


