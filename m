Return-Path: <linux-input+bounces-14164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6954AB2CF06
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 00:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5061899968
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 22:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C6531DD88;
	Tue, 19 Aug 2025 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="iPC5yTU1"
X-Original-To: linux-input@vger.kernel.org
Received: from outbound.qs.icloud.com (p-east3-cluster5-host11-snip4-4.eps.apple.com [57.103.86.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AD35082B
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755640517; cv=none; b=R/Vm45xYLXdpUzGLVmUpXP4X5IXxu9PadXqm8doS7/EzNooDv6pLfG+VLy6uDyAfcPOOtX31U5L4OrOyAkBXmUeE+xzWIP+HJAPnbLMBGWoK0EUZX0ypq0Ypxk/xrQ/z9dYzee+NxqZzn3HOc5QbUqnEMSXE/19FmT1Q+fu5sgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755640517; c=relaxed/simple;
	bh=u6nPwt5SBB04LarhYwast/iKV6Ieq/sxR6prY5B3y28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIPOSFVkmuOzfJ+nmIaELbmmnqCpCS19gAZ4gA22NDRA7N+/j/U69BHngEFJIwhViJHSwHf1ujttQfXbQ0i1zhee30hd+Kj8dBFfEwaRMdx8DlVDwsgd3hsNvIA85sJBR/032PU4HqsqB96Z9K0o8X+W1lGxeoF3x6dGQwGkvXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=iPC5yTU1; arc=none smtp.client-ip=57.103.86.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-5 (Postfix) with ESMTPS id CAAC6180013F
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 21:55:11 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=/2GOi6Fr4FVYWy6aCm3zyqxwyPXG/zo9cirwDz72x1M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=iPC5yTU1Tvh8REhsS80BE/kr0gNCm4gIap3+8T2mKUmoaou+bUvt3q3CHrGLR4vnbCsF32yr4NW0eR0W/u4cOzvrtMcOOk17XbPLuJW+Q+yMllIKZN73nclDeLMYxIl7/0gk8ulpobMJi7YM5RFGqvDqm/WBaVIwKbXCdHPuet/CRSKnisMvpzZUis2hdnFzb7bBQoMy8XjuusMlzMbluDsdjaS0hrfpSnrHo3GSrAr87enOCMwghjK2dBTbLFVG6AjaYZX34Rfs/t7/JndHK9X280xpq0T8DHszdEoDJE4U2/9JDLRh2fPrZxyJ1Xhy7ttpCIzhCtl82/WsV3flOw==
Received: from ProArtTux (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-5 (Postfix) with ESMTPSA id 051E7180014B
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 21:55:11 +0000 (UTC)
Received: from amitchaudhari (uid 1000)
	(envelope-from amitchaudhari@mac.com)
	id 241d41
	by ProArtTux (DragonFly Mail Agent v0.14 on ProArtTux);
	Tue, 19 Aug 2025 17:55:02 -0400
From: Amit Chaudhari <amitchaudhari@mac.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	Amit Chaudhari <amitchaudhari@mac.com>
Subject: [PATCH] hid-asus: add support for missing PX series fn keys
Date: Tue, 19 Aug 2025 17:49:19 -0400
Message-ID: <20250819214919.78610-1-amitchaudhari@mac.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P9RHTNWxynlWwultqCvNkuyB9dD-brzx
X-Proofpoint-ORIG-GUID: P9RHTNWxynlWwultqCvNkuyB9dD-brzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIwNCBTYWx0ZWRfX9sdVaP3trGZg
 1KLubnUW2VfbHBi8lCCZHfmBT4n5jS+FGnIaOFmczv5e7/GKrbS+zPYzd9/B0IlAI6KtHJnteQu
 pu0M9WFURAiHXle+zZckU8UU2xB5Fk5uoJpQ1nScsfHkw6phFpWXtLw4MKYieq56b6DpNkiS/cl
 kYIiAWfSmiAbWgSZ8lO9xKhoE/yxU89TMrjjQdtv6ZJoyCzOXgjHd2++zi2MSHs94bLXrAmLRJx
 vtXXtUiHoLQ9TsdkZpDi2cBTL5xAhcsXjbwTzy22NgnqHklL+8QSCsa0wHHjccYE5HzPu8H2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=820 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2508190204
X-JNJ: AAAAAAABRILEUG+x1r9z1UhTP1LPKP5AGcMbsvXYDNUTzT9pXoQeyGSiv+Madhg+S7E2zLtpZQ6Qa7FqAf1exgPrDnsLX9xleJmpcU4j4LofXFiUQYkCiC1AgG6xsQc+n901hE8e1qSHaN1NtYXZtRBMXs+X9wYzzwUysONCZAPhd2tUy67C1WfCI9kBquVWoxuO6lRVJWswWkPE+urCP6SajmQx9cdpLbPLdvHkxAFrOvmY1EcdMqAGmGcYYwqZo3l+Yqx5SSmUt4IC+0EX/QmXBVY0+BDbEbc6GKH7UtPSqnYIDzbz17h0Wl/rhmxaykWoWqmfeoD0ZFra0HVs2U61jKshWAZnO6qQGPCBosMc3kQ3xeYxc9Sb0z81SgPPe6OOBqXJU4RmwJ5gzg==

Add support for missing hotkey keycodes affecting Asus PX13 and PX16 families so userspace can use them.  

Signed-off-by: Amit Chaudhari <amitchaudhari@mac.com>
---
 drivers/hid/hid-asus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 4b45e31f0bab..a30627bd32a5 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -974,7 +974,10 @@ static int asus_input_mapping(struct hid_device *hdev,
 		case 0xc4: asus_map_key_clear(KEY_KBDILLUMUP);		break;
 		case 0xc5: asus_map_key_clear(KEY_KBDILLUMDOWN);		break;
 		case 0xc7: asus_map_key_clear(KEY_KBDILLUMTOGGLE);	break;
+		case 0x4e: asus_map_key_clear(KEY_FN_ESC);		break;
+		case 0x7e: asus_map_key_clear(KEY_EMOJI_PICKER);	break;
 
+		case 0x8b: asus_map_key_clear(KEY_PROG1);	break; /* ProArt Creator Hub key */
 		case 0x6b: asus_map_key_clear(KEY_F21);		break; /* ASUS touchpad toggle */
 		case 0x38: asus_map_key_clear(KEY_PROG1);	break; /* ROG key */
 		case 0xba: asus_map_key_clear(KEY_PROG2);	break; /* Fn+C ASUS Splendid */
-- 
2.50.1


