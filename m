Return-Path: <linux-input+bounces-8490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F79EC300
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 04:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4DB5284383
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 03:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506B1207A0C;
	Wed, 11 Dec 2024 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QcdNhCli"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C41FCFD2;
	Wed, 11 Dec 2024 03:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886734; cv=none; b=kq6eliMrahe2GaQhoMm5j/W7FTrCMBSGGWV/OOqJQC+yznIL98dG6DTxdKyrKj8+S56jsMIViReSQJuUVDYuH2mUJggoahDvhf+t1v57fPyDkFyigEr9X2bcyH5cg/TnJWQWKQQ+HeYl+NsYrkqNoKBpyDuhXjDZYdTS3Udkntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886734; c=relaxed/simple;
	bh=qYJzRWE+3uVciIuqK3V4uPex1ki2lRPnQxWEgtPZumk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jiM/2CDBv9oATEU0jk+jWzL5C1Xln1N9t02CXovHV8NhfEZ47JDTYPBY7juT5rgE8hyH9Cvc5ZecHK4VgkBHdK8VWLRMfwkGMV+xqQ9d30aKQNd5yAqpC2bGpcGuuUmhcbes1rEuDJuAafDrVNtVGI2JS6VS5RU5wtBeJuyx50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QcdNhCli; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=okvNd
	WzpFwWQcwxiZuJUPaKD0W4dwtx8rfWezARcsfs=; b=QcdNhCliMBsEss1+5iW2k
	NE/9LqWLsQYvjSl7fLNKJzw9WwPndrwK5VtsLWKL6YYFNNpRDodUIeZ5C9Cn2DVT
	Hx1zdAUlmwnHzBkU48qpIqa8I+Jcew4TNYRqXU5aecJVUQ6ztR/sSErkK8BxFxKN
	gtERAtjbO5V0BGdPhLGDhk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBXs1H4AllnUQh8AA--.9550S4;
	Wed, 11 Dec 2024 11:12:02 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: dmitry.torokhov@gmail.com,
	david@readahead.eu
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] Input: Check dev_set_name() return value
Date: Wed, 11 Dec 2024 11:11:50 +0800
Message-Id: <20241211031150.2244639-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXs1H4AllnUQh8AA--.9550S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyrJw43Ar4rKw4UCFW7Jwb_yoWDZwc_Z3
	40v3s7CFy0krs2yr1DCr1fZrW7tw10gFWSvr4IqryfWry5WrWDXr1jqrZ8A3yjqw17Gr1U
	CrnI9rsavr4xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREsXoUUUUUU==
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbizQayC2dY-Ae9xAAAsP

It's possible that dev_set_name() returns -ENOMEM. We could catch and
handle it by adding dev_set_name() return value check.

Cc: stable@vger.kernel.org
Fixes: 7f8d4cad1e4e ("Input: extend the number of event (and other) devices")
Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/input/evdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index b5cbb57ee5f6..c4dc280c4c49 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1361,7 +1361,9 @@ static int evdev_connect(struct input_handler *handler, struct input_dev *dev,
 	/* Normalize device number if it falls into legacy range */
 	if (dev_no < EVDEV_MINOR_BASE + EVDEV_MINORS)
 		dev_no -= EVDEV_MINOR_BASE;
-	dev_set_name(&evdev->dev, "event%d", dev_no);
+	error = dev_set_name(&evdev->dev, "event%d", dev_no);
+	if (error)
+		goto err_free_minor;
 
 	evdev->handle.dev = input_get_device(dev);
 	evdev->handle.name = dev_name(&evdev->dev);
-- 
2.25.1


