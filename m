Return-Path: <linux-input+bounces-8430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 825559E84E5
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 13:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682E91884AE2
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2042B1422C7;
	Sun,  8 Dec 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CnbmYd9W"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D622C6C5;
	Sun,  8 Dec 2024 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659325; cv=none; b=WPKgATdmfoSuREtfHWi5w4YaJw3eNWfWgh8/3gU9ZuFvMBNG/Dl0a1RBc64Ap151AOfuLepsQ/9YX3VBVmDWu/+5+UwGy/RN9fbQdqaBTcVgmMshTgcdnfcMbRvlnF12/317G8MH0d8qiheWxUVzYxcK/e6QKkUSwGGuUAp2Z7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659325; c=relaxed/simple;
	bh=mnSX4vohEOEiQgc9+DGZSRJ4mFoUvOYA9B0aVaPEJ+I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VrsbH723CGmVimEN5OBMKLLRDV1wiFqgnyEUpZwmtUwL+4hg1iOB/h/SfV41QBJCxqUjgkINDYYv1DaxM9XKK/5mdIVjBm3PerVrT5njmMHmVLy0vxSwB4mrHfqc4PaJO0U6dVkreQ9gOo/sF+yRWyHxEi42flhMiA41itCp30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CnbmYd9W; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733659312;
	bh=mnSX4vohEOEiQgc9+DGZSRJ4mFoUvOYA9B0aVaPEJ+I=;
	h=From:Subject:Date:To:Cc:From;
	b=CnbmYd9WncPb3frgmjJ3LxAsq0jSLpT1H2V3g7MziZSWPWfv7SEcus6PUQ9qW1Fhy
	 NRqPubkTgNhsQCeCh6FdJoedfuA81pozgh/jgeH3Kz0kata/zydF+uc0qZvdX5NJ8T
	 GApNy7yM+HJROUNA9yiCzfM+5A2Vh3oemSCCBTf0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] HID: fix test for CONFIG_HID_KUNIT_TEST=m
Date: Sun, 08 Dec 2024 13:01:50 +0100
Message-Id: <20241208-hid-ifdef-kunit-v1-0-cbea6077a233@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK6KVWcC/x3MTQ5AMBBA4avIrE3CaP1dRSzQKRNJSYtIxN01l
 t/ivQcCe+EAbfKA50uCbC4iTxOYlsHNjGKigTJSOWU1LmJQrGGL6+nkwEqXqhg1UdEMEKvds5X
 7P3b9+3703xP2YQAAAA==
X-Change-ID: 20241208-hid-ifdef-kunit-75643b52239a
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733659312; l=685;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mnSX4vohEOEiQgc9+DGZSRJ4mFoUvOYA9B0aVaPEJ+I=;
 b=ZtsiPHFKnq8G0DLSaE0yd01J21yoN2GoSLGdpH2A86jjh9aFdxvdjIF548mAzKcREKb8Usvt4
 O6QTVQu1MG/Bqn0E3JDBad3JimJNXHwIA5TMfn+Y8yJyv5uA2Dzn127
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If CONFIG_HID_KUNIT_TEST is set to "m", the #ifdef test does not work.
Switch to IS_ENABLED() which works for both "m" and "y".

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      HID: input: fix test for CONFIG_HID_KUNIT_TEST=m
      HID: uclogic: fix test for CONFIG_HID_KUNIT_TEST=m

 drivers/hid/hid-input.c          | 2 +-
 drivers/hid/hid-uclogic-core.c   | 2 +-
 drivers/hid/hid-uclogic-params.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 7503345ac5f5e82fd9a36d6e6b447c016376403a
change-id: 20241208-hid-ifdef-kunit-75643b52239a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


