Return-Path: <linux-input+bounces-15142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8966FBA6A6C
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 09:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424F917D0F5
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 07:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C4629B793;
	Sun, 28 Sep 2025 07:53:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-m32118.qiye.163.com (mail-m32118.qiye.163.com [220.197.32.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8A293C44;
	Sun, 28 Sep 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759046015; cv=none; b=Mks7WuJMCiL3+9MXrSUN638b1RfxDgrZxqFbwJSOEIctIYqNHvzNydAoAMrrTmWyrk+pQuZGq2sMdec4/nWXl0bUKtMdpNeUk+2U0VH2f7vEpKM/9S/IS7LwNrZDrNFEdN3MVUxdUZTWCMcw4e+3LkYf0qI+kbYc8qakKNsQ1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759046015; c=relaxed/simple;
	bh=MuSXJso2/16J/hLjf99+D1+1TMtivnk22KhOqzvP/c8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pR+FdJg7MHMEMKcdRWjWjuynMc/8V8pv4U0kHn2RG4Tbz5sKyBudRO7uLZ2vJN7imJlGZ1PXYJkcnuYM1Xeiq+lkmGaKy4lsXW1jKEYvOhr/+ukySDZN5TwpHqtbimzqiBDctRDnZT4WL0+qptZQrjSMZs2w5pStWeqo6B9VrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.32.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10dca0170;
	Sun, 28 Sep 2025 14:37:46 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>,
	stable@vger.kernel.org
Subject: [PATCH] Input: uinput - zero-initialize uinput_ff_upload_compat to avoid info leak
Date: Sun, 28 Sep 2025 14:37:37 +0800
Message-Id: <20250928063737.74590-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a998f0ab1ce0229kunm56cc6fb454d0c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHktNVh5NGkwfSk5PGh0ZGlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

Struct ff_effect_compat is embedded twice inside
uinput_ff_upload_compat, contains internal padding. In particular, there
is a hole after struct ff_replay to satisfy alignment requirements for
the following union member. Without clearing the structure,
copy_to_user() may leak stack data to userspace.

Initialize ff_up_compat to zero before filling valid fields.

Fixes: 2d56f3a32c0e ("Input: refactor evdev 32bit compat to be shareable with uinput")
Cc: stable@vger.kernel.org
Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/input/misc/uinput.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 2c51ea9d01d7..13336a2fd49c 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -775,6 +775,7 @@ static int uinput_ff_upload_to_user(char __user *buffer,
 	if (in_compat_syscall()) {
 		struct uinput_ff_upload_compat ff_up_compat;
 
+		memset(&ff_up_compat, 0, sizeof(ff_up_compat));
 		ff_up_compat.request_id = ff_up->request_id;
 		ff_up_compat.retval = ff_up->retval;
 		/*
-- 
2.20.1


