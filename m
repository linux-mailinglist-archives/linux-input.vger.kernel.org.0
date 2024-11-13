Return-Path: <linux-input+bounces-8048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBA9C6E67
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 12:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC1F283B2A
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 11:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DEC205E28;
	Wed, 13 Nov 2024 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FR0i9kl9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBDE200C98;
	Wed, 13 Nov 2024 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731498817; cv=none; b=OqmC+blGDyVWSIGtnM/Uxh7hL2x24UESaNlyBJdMo92nCrCFohKCg9GXUhMCO+nGa6R4AIGwaMClRrXYSqSChiB5c7MBceFKhXE6hxp33FDZ+1VPlsRgdn4/NxUlqT2gT3A2WyPsZNcruO59zNjtP+1mlB9NhQkDqCL9Kja68jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731498817; c=relaxed/simple;
	bh=JcMC9E1ouK0FLdpvw6gtX/41VcRf/kXd7ufXNrhoIq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRwIpn/OcPIsbmGqKtGZegwfZ+0lTzQLoRLqPjcO37y8G49vh2BjYZukd2dEtHz4KzWTSb15RsOHwT4ykmNDuFnOh/Bk2kJRDLa0r7r+Ek6iJdMRymjE0ae1ge+YBYpkKHdsCLINSjNrEoofT0M5aKZii+NcPIyKlciqU9uvRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FR0i9kl9; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1731498743;
	bh=ggRdDU7iCZJOkTsKF0zJgrkrHsItDChMLE7lMfNv2kw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FR0i9kl9KViUsYRWJUgOAgKE15G1SZFWhKEEgGK9gyuKrRhxjlv928lZRX2wOJY48
	 rlKRpVqXboePkE8QdBACRrszgKLlhOCl5PGvW7S2QfTGXq12RcdhFCTDzVIorDztoT
	 RU6FKca1nUBegQrtpvJn1SlCkNqo44Z3c3+Gti6o=
X-QQ-mid: bizesmtpip3t1731498712t9idxh8
X-QQ-Originating-IP: zNDgcafP9tOrJI6aPGG7N94+rCjp5gId1t4KvU6tGFA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 13 Nov 2024 19:51:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18098386907033749766
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.tissoires@enac.fr,
	chatty@enac.fr,
	jkosina@suse.cz,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com
Cc: WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] HID: multitouch: Remove useless comment
Date: Wed, 13 Nov 2024 19:51:29 +0800
Message-ID: <021947F5C0C056AD+20241113115129.31921-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N8Jy6PtD39R8iMPyTic5VACbYVOsx9FyzjLTSgCZB6FCgqoOVDabdits
	OGu3cWrBwZ0xNBHYTA1d1GYx5Fl4sQgQcBJ+8NmbhzyEQoZvNyvN5hL8Unl58rrzQ4sMnrB
	Za+d5Rib2kGvJ7mCTJkY+7FQbBEHzbctJzJov0RB3pNCdOeUrgEK3Xq0GfGVdEE52zMJWDR
	tFTnUwHfjuHjQxTsily75ykUE2sas0Um/F7v0NWNlc+G6572HuqTdJbUm2OKnKuzfsRvBXi
	CUB7IxbnaWszFfgNfmkLa1rBdnqRvCaP1YM+6XFiKgcIrKOK38zl4nog9JBtu91tdwUVl8W
	DhFJ4q1RVzBALOSkYgvTWiiHx/9/+cT4PmdclFQDCQde9Xy2SSm4Zv8eChC6c/9iI0Z1sru
	HnLf2O7RbRXjeXK5XqOK8xT5jhPEdb09gayT1VT7qML7bVIeMH2HIAke24iG1rTfreJcRFe
	y3jPphrafWUQgfuP3Pso7cQLu3dSq0JOi4VwIxFkSYEwLmNq6K0Fc5VcBmopHy05ipE2mf7
	+FsQG61LfGAIVSnZWgSUZJPLJqeiFuqR5gi5/IZggT2RmPh0U0R7z776n4er3sKah/xo/ZW
	mXI0y0JGwjbfTF3e9NR5wIrzCSNiKfdRCjoNyZ9PGIuquOhXyUX6n9N5SPqfaiHVJRoBb9Y
	dLzQhGLBBUY0hxxoCx+yEpB9dEQuBoRuwUo3MokRbgloaGZpUvdJ+7pR8dVF9pdqBnxRwe0
	KYqx2gutt54d+/zcga678dCVDTWhCfS1I0BWMvI8OY8gPWJqWylgialOSDK0JmdGRoyezVY
	aImWqEI4YyVlt4NLl9CnXDOb277xR1XCnr1Tl58WIVhbDiAJ7NgZko5j27E8Kh5CjE3Qwlv
	C5uHOUBxkNRmVpL4QF/OYkbXGBAXKcLxtx9XJAmCB/tjbLrjt03iVAew4pchbwWGpCiIqx6
	OJxCrDm4NmVDtYeB6NfHwLBaB6M/c8kJd6ys7XGtN+Kj6TNY+0c0IlGkstFnmfZausBQ=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

There's an empty comment at the beginning of hid-multitoch.c.
Just discard it.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/hid-multitouch.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e936019d21fe..d6633eb003a4 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -20,9 +20,6 @@
  *  Copyright (c) 2010      Canonical, Ltd.
  */
 
-/*
- */
-
 /*
  * This driver is regularly tested thanks to the test suite in hid-tools[1].
  * Please run these regression tests before patching this module so that
-- 
2.47.0


