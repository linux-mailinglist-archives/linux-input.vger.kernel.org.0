Return-Path: <linux-input+bounces-8047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E19C6C9A
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 11:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C568F283E84
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 10:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010281FB8A8;
	Wed, 13 Nov 2024 10:14:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209C1FA247;
	Wed, 13 Nov 2024 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492845; cv=none; b=mSISSaXdrV4yLDBwKfWE8W5huMP6HWM82In0w5QERRwzNxdb/omsZQoVlVHF9altIcs1oY3qSzY8ZwliHoUKboIezar1Cf4R+Wn/NZriD2ABnsWDuNKnXb6Qj4OnrmR2QW4USmq9CQdm7WAw6Ef8tDDg7o/9NPc+ytok0rNrOAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492845; c=relaxed/simple;
	bh=JyCCzIY02FNmE28fip/ygqKe8YBxE2SLFZl47VPYi7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fB6VZ97bNzyjd2vT+2r6v4tb9meXuygAy3HEyyXSQh8Dw5R25IWO23Ik8BYK8aQKe2OO5E5yAderW/006h1iE4rnLpX4T4su6ILk5RTAzBA/fZ6b5AFbmSHYcdPBM42nOryMSrn87NQicnmeult4q49f6/LQPYigdhCm2ZfNjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f8d0194ca1a711efa216b1d71e6e1362-20241113
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:6d641c25-af66-4df0-abf3-13c7c9f338d3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-INFO: VERSION:1.1.38,REQID:6d641c25-af66-4df0-abf3-13c7c9f338d3,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-10
X-CID-META: VersionHash:82c5f88,CLOUDID:895761041b18b159d86a1e388f23e7a7,BulkI
	D:241113181349DFBEXSYZ,BulkQuantity:0,Recheck:0,SF:17|19|66|841|102,TC:nil
	,Content:0,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: f8d0194ca1a711efa216b1d71e6e1362-20241113
X-User: xiaopei01@kylinos.cn
Received: from xiaopei-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1971577974; Wed, 13 Nov 2024 18:13:47 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xiaopeitux@foxmail.com,
	Pei Xiao <xiaopei01@kylinos.cn>,
	syzbot+3fa2af55f15bd21cada9@syzkaller.appspotmail.com
Subject: [PATCH] HID: core: s32ton always be 0 when n>=32
Date: Wed, 13 Nov 2024 18:13:42 +0800
Message-Id: <f74754f0d7d870ac8301eb8f5760d473bdd0270b.1731492709.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s32ton always be 0 when n>=32,add check n.

Reported-by: syzbot+3fa2af55f15bd21cada9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3fa2af55f15bd21cada9
Fixes: c653ffc28340 ("HID: stop exporting hid_snto32()")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hid/hid-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 81d6c734c8bc..ead1d338fa58 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -66,8 +66,11 @@ static s32 snto32(__u32 value, unsigned int n)
 
 static u32 s32ton(__s32 value, unsigned int n)
 {
-	s32 a = value >> (n - 1);
+	s32 a;
 
+	if (n >= 32)
+		return value;
+	a = value >> (n - 1);
 	if (a && a != -1)
 		return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
 	return value & ((1 << n) - 1);
-- 
2.34.1


