Return-Path: <linux-input+bounces-12235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60756AB07E2
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 04:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A150A1BC229D
	for <lists+linux-input@lfdr.de>; Fri,  9 May 2025 02:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB3724418E;
	Fri,  9 May 2025 02:26:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775878F40;
	Fri,  9 May 2025 02:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757592; cv=none; b=HMT+Z4susmNv3Yh32C65SFiD7qYDq1DA9GkxJkkwo/jkdofiuKL0UJ+o0g2hfeJ8BHFa26LseHV+3r/IiphNWXhlCpWl67zTYY39JdGlri3wKcjxfhbcyIEK1pj6D8fvYXD1mPyOYRbUz3w/XVfO0C8sq+amMZNL+2tjR3oojx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757592; c=relaxed/simple;
	bh=VER+12QXfqxYIue65WdSZtW+L1OY7HqeUsJT8TMW4Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpPvY2FDqMrAZLvLrI17NFP9AbM4lLkxsTy2mIhRKHrl+tKxkhaN6VpSd93diNgVB3ZDNEKtHuXatMzMIatUe9VGff89fBMnFG52zHALCP/kD9fNBG/mF/cOL6/31vPX/PU7gZ/rhp49ury4QuWJl+GEYkMuUhUAC+P83Ym/+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fc1eb2922c7c11f0b29709d653e92f7d-20250509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7e8c4e92-a71a-495b-b81e-68320de956d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:1c327a930a21b9db05fa9a561ce26ccb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc1eb2922c7c11f0b29709d653e92f7d-20250509
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1499528728; Fri, 09 May 2025 10:26:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4F00AE006100;
	Fri,  9 May 2025 10:26:16 +0800 (CST)
X-ns-mid: postfix-681D67C8-148108656
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id C50D1E0080FF;
	Fri,  9 May 2025 10:26:15 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v1] HID: debug: Use the __set_current_state()
Date: Fri,  9 May 2025 10:25:54 +0800
Message-Id: <20250509022554.27001-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When detecting an invalid list->hdev, the process needs to manually set
its state to TASK_RUNNING and exit. In the original code,
set_current_state() (which includes a memory barrier) is used here, but
it is immediately followed by a mutex_unlock() call. Since
mutex_unlock() internally includes a memory barrier, this ensures that
all modifications within the critical section (including the process
state) are visible to other CPUs. Therefore, replacing it with
__set_current_state() (without an implicit barrier) avoids redundant
memory barriers.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 drivers/hid/hid-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 8433306148d5..00a73983ef19 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3726,7 +3726,7 @@ static ssize_t hid_debug_events_read(struct file *f=
ile, char __user *buffer,
 			 */
 			if (!list->hdev || !list->hdev->debug) {
 				ret =3D -EIO;
-				set_current_state(TASK_RUNNING);
+				__set_current_state(TASK_RUNNING);
 				goto out;
 			}
=20
--=20
2.25.1


