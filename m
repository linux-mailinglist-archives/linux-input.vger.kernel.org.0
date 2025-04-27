Return-Path: <linux-input+bounces-12019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB9A9DE9C
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 04:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7542F171835
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 02:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414A91FDA8C;
	Sun, 27 Apr 2025 02:12:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408E37081E;
	Sun, 27 Apr 2025 02:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745719946; cv=none; b=bW0X6aJe6c9zEa3ufEp91uwwgEOSXCYYaPw/SHWgrXK0lprkfk6yotEPVBDVcKSPp2qvPWfS6PqPC7MEBqY3GvYg2nQT5rvYdvDesJMYUM9n+2KmRNx+Zmz7b43oL+8tYlNrryQKWqYvTdSayoTZ1XtPBbm8o0esr4ztl7lbXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745719946; c=relaxed/simple;
	bh=8SlZx8IDK4mrOVwOhaBkfuNILVycHluTOoS33F7tk/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTm35kQdo8XKm+9FqeTHkPsdqnuSkyQqwBtbB8efgtfPIBO+ACRVtOfZzTmlTcE+gPjWUXLeLY2z1JU38r10vqqSFMG4tdMOP+XxpaVBESCqdF2Uoqp+DQsyZqj0wecNwwCqy2eIDiJjZcHkJr2N6OEMsKrPI3STwH8qIW/U0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 051703be230d11f0b29709d653e92f7d-20250427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f5da28e7-f15c-4baa-b8d3-4f661a13e098,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:26e37ef5d2fd9291bbbd5166ffbfe02f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 051703be230d11f0b29709d653e92f7d-20250427
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 562180624; Sun, 27 Apr 2025 10:12:07 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 5C05016003841;
	Sun, 27 Apr 2025 10:12:07 +0800 (CST)
X-ns-mid: postfix-680D9277-121054143
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id A643A16003840;
	Sun, 27 Apr 2025 02:12:06 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] Input: MT - add input sync to refresh touch points after screen locked
Date: Sun, 27 Apr 2025 10:12:03 +0800
Message-ID: <20250427021203.1888063-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If the touchscreen support ten-figers press it to lock touchscreen. When
the touchscreen is locked, the ABS_MT_TRACKING_ID event remains
buffered. We need to used input-sync to refresh the event buffer.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/input/input-mt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 337006dd9dcf..659d752ca830 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -147,6 +147,7 @@ bool input_mt_report_slot_state(struct input_dev *dev=
,
=20
 	if (!active) {
 		input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
+		input_sync(dev);
 		return false;
 	}
=20
--=20
2.47.1


