Return-Path: <linux-input+bounces-12687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CAACBAE6
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 20:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D05423BE3EE
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 18:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF483224882;
	Mon,  2 Jun 2025 18:11:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7C22A1C5
	for <linux-input@vger.kernel.org>; Mon,  2 Jun 2025 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887901; cv=none; b=kHzhLJCTH3rpf5xsm9e7G/5JFpFSnluM25t+4raBgS7XMyBu2gksWyvoPLm7wH4Mz5DpgzyzYqPjB2izRAItXVxftvtR0ZHDopri2kWI0L4mZ4rA2ekfDXQYn4xHXBX2YMbuvxqiTN6oCs1T+ZkJCKe+/3Hx8/9PGgy5nUCshBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887901; c=relaxed/simple;
	bh=jhhGNNCriAuvrB123e0wSzXJE81JtQrlhtX+0CrbqlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fst1Wv/6YHq7LhP8MDiX0ZwZ+IkqIHeVCA3uFguc8wl6cI2E6D+Hq4klP5tnlEbR+hoX64rr4DuW3SYiIMwi2LsnebkyGxqvVsgZnszWHwIOlq1432YRMqk3njC7Kys66grS4ymlheAsSWrGf5s5jYcnIQT3KJkHekmLLIsqt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net; spf=pass smtp.mailfrom=notsyncing.net; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notsyncing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notsyncing.net
Received: from kronii.fritz.box ([88.130.217.12]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBDvU-1uAZO023Xq-00HYsr; Mon, 02 Jun 2025 19:58:26 +0200
From: Markus Koch <markus@notsyncing.net>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Markus Koch <markus@notsyncing.net>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] Input: fsia6b: Suppress buffer truncation warning for phys
Date: Mon,  2 Jun 2025 19:57:13 +0200
Message-ID: <20250602175710.61583-4-markus@notsyncing.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <wei2gdgywkub42bfbm7b7koh5ln2d2akz72vxo6vcqbfd53bse@4edazsdbkrha>
References: <wei2gdgywkub42bfbm7b7koh5ln2d2akz72vxo6vcqbfd53bse@4edazsdbkrha>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Mn5GucPVjCI1AqopztRI6umxIkrwfPSAsAD8NFTPQo8QWdT4BL/
 9HyAdJr13Q/7WSmZXxIqf8QunwKxDxSmaw3hCRDel/PKmXbTtST1BL2FrK29GGqHMUIgWfH
 XKSSPcfIwI407EIgIgvFWVBq+SxoIak3sY7AdaDaMEPaM7eeNGrXwbydJHbOM5c7mzEykN0
 7vR+IRRoquFxBJmreIAQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gVXD7pII2ww=;oOthMBhqs+qjlME7NoQuGeiQWPu
 Y7desNC5GYkgeSecM4luhQQeKkxdaX/Ivs4555zsiTyy5NnOcg9qpUuAxPvIQPnvq4Qiyft9u
 QayPmrsGCcdn7Y0a+lG/YWVFeK+Eobty9P8ezV1oLtWnUt+HdQrYkIJLHXVjgtaEF44Khq4mK
 YqKh656/wTGLoIkYHCSXUbT7if/bSBjKo91Mst2Zww//K9HuBcJOpEnMhFRNwDkufbPLOoQiM
 6UcT1uiu7pzw8PP3sFvUvE98J3Pawi8gEaI4dIajnZFMsV+HH59v2jsfredbk3vVfZCSRNXx2
 daiNSflIgQhPJp+whQCF7ZJCJbf/MyY1S1MX5/aIVZ9jUtdqHjWjQIL1uSocL0Rwj4NInXE8t
 bxzyHO8u3TmYwdMwWXdOHqmGKdyB7v59MFwVVZMLB17M44yvlIBaAyfRruch8/ogY0J6d+ed/
 WRGdBgijRc4Qftc5CiRv7s2MPGoe/28hfIM4Ze1ht8hrPE3bjPUm8VMRnpHdb+TvyhSJr9WbR
 95sY0pSwEU78XMd9+b/5ZJflW2onLAv9eJzKEhDYv+YUzbjqPbHnPwoF+e3HlmedFD9LaCJEU
 vtAMCFj+CLFfb69TP8qQAM5PqJTDhOTrFvKA6VKYh3GIHTFLmXcuiYmv5FhRnQvk+//mRmmfD
 DaGmIhes4IR5rPvmFlO1YazRYsl8HlQYSimKkepdwmvidPNRr6QUKTxEZtuE0hZr6Ogub+RYq
 afNR1YsqvdpEjnPWfctShgNGh7Ir32oFaJj/URJDgoHmh4bGea/LEXoXng/iQvAWrTp8TTa9n
 4GMX+NLYR6FZ/qRQ7S3d63zqmHAClmXyGUkxvebQNgN+mNQ9NozbqvXGWrtGOhzdkgOvv8ueo
 4zPDAPYG8KIXeDr+WnVwqYQXly5ecJdomAr5fFyTwS/SJ1Mu9tI4HoJPkxedEowglWgQyjZHH
 sgZ2IxXxedCswmOEbLBYQNOqMsPV8lm84E4nMSDI3DrCz9k+bBGj3e8McltRr6Nw7prMlEKxc
 yHU/kgIyCu4Q59TJAkjNGTBDGdrzxUPlHynprKAFxrol4I49zO6DtDuobIBBdDlkYa0dxPgtt
 IkY39kRBDwSAcRjjHGW7KLD2cyvrfd2tycEKyCIJzPNXOEp/BDHBaTQ/D9H40122iL0iyflNJ
 9VxDhL39Epp4Kkst+7mFSA5A77+2EAqax6lYwqD3NrOSgcRYwbQb8dgdKG93B7aaN9wUAoYUG
 yoXADkbtH2lPOC8cRlp1wf8Joap30yJFL3p+GJf5Nq+Z0NUitssBlu84gE38B5UW845DaU/1j
 2WdaBhvxgOS2ziDwuV6HzjAPhGVzblIJfloz3GJKmN01ILRQmiwNIGAxcxZvkw2e4NiLy9kk8
 QcspJn09AvApmJMp4DGwD6rqYpTf1hJt2Kjor0XzwDtM+WErFAjWXn3hYp

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501020303.1WtxWWTu-lkp@intel.com/
Signed-off-by: Markus Koch <markus@notsyncing.net>
---
v2: As suggested, I changed snprintf to scnprintf, which removes the warning.

 drivers/input/joystick/fsia6b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/fsia6b.c b/drivers/input/joystick/fsia6b.c
index 76ffdec5c183..7e3bc99d766f 100644
--- a/drivers/input/joystick/fsia6b.c
+++ b/drivers/input/joystick/fsia6b.c
@@ -149,7 +149,7 @@ static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
 	}
 	fsia6b->dev = input_dev;
 
-	snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
+	scnprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
 
 	input_dev->name = DRIVER_DESC;
 	input_dev->phys = fsia6b->phys;
-- 
2.49.0


