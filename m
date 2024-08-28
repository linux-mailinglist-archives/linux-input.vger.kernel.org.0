Return-Path: <linux-input+bounces-5915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99A962139
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7B5283917
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C58158DC3;
	Wed, 28 Aug 2024 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TKJ5IxP5"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1BB15AAB1;
	Wed, 28 Aug 2024 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830478; cv=none; b=RpUjtIwM/oalg3qWLzF/aSybXn11v9AiNE3fpWEVuQMUu2QyJZriS0r3w/frlePc0zVLGxwxL5JuxDtIm3DjkcPaccoW/T55hNo4/rgTpr4AwZ2ucsRqnXHa7W2MTClhKG9g/wJQ5BKEhYar2xvp+UlmqMllovSIPHTVZdmsrO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830478; c=relaxed/simple;
	bh=he98w3W8tuTHmszA6WAm4WeeAaMLRRprdKHjzufAXBE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HYeNtaux1opPbQjwEpebmeIZXZFa7kBFafDKO3A28kx+7ci+VvwKRJjt3tVaT3JU0lvmJZIxIa1PvuYrJVrtq2b03TXMPpO2Ai4RjD6rq4cp4QC9lORjZv1ANGODL70NSrLZf+4LJc1233HLla83HIQYmKj9j9RXiTCmQWs3gSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TKJ5IxP5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830475;
	bh=he98w3W8tuTHmszA6WAm4WeeAaMLRRprdKHjzufAXBE=;
	h=From:Subject:Date:To:Cc:From;
	b=TKJ5IxP5o82sdLGTQFuYPU4LUfBU3vv4i1iRp8a5H6N/g5WYYd9bNkLkDwePZkMy4
	 6ejluJ5Evl8yC9OOn6qIX/Q+9hgewfqD3njSIO75KuQ8tJ5cGGtQ5ye9TXF0/fimFf
	 p0hhWmzzob28oVmFByvEZkyGvse1NQbmyiqrF8U4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 00/14] HID: constify fixed up report descriptors
Date: Wed, 28 Aug 2024 09:33:19 +0200
Message-Id: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL/SzmYC/2XMuw6DMAyF4VeJPDeSk0C5vErFkItbvASaAKqEe
 PdGMHTo+Ns63w6ZElOGXuyQaOPMUyyhbgL8aOOLJIfSoFFX2KKRIwfpp5gX+eTPOkstG39H62v
 d1UZB2c2Jyus0H8PVid5roZfr+JN7cbqNwT+3dai8C1a5qus3DcNxfAGuL6eOrQAAAA==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=2675;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=he98w3W8tuTHmszA6WAm4WeeAaMLRRprdKHjzufAXBE=;
 b=cYh09XB0GWBSDQr/x+INmHRJf2D0i8SHeYd+ZSXfuuIYkEHLY9r5gmkmKEkv+lt+1Yu/qKPjz
 0CorEBxKh/FDFQWUMXTDHWHESijIpiWVM2fDWKnKZUD6qPIb43tRiy7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

This is based upon hid/for-6.12/constify-rdesc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (14):
      HID: bigbenff: constify fixed up report descriptor
      HID: dr: constify fixed up report descriptor
      HID: holtek-kbd: constify fixed up report descriptor
      HID: keytouch: constify fixed up report descriptor
      HID: maltron: constify fixed up report descriptor
      HID: xiaomi: constify fixed up report descriptor
      HID: vrc2: constify fixed up report descriptor
      HID: viewsonic: constify fixed up report descriptor
      HID: steelseries: constify fixed up report descriptor
      HID: pxrc: constify fixed up report descriptor
      HID: sony: constify fixed up report descriptor
      HID: waltop: constify fixed up report descriptor
      HID: lg: constify fixed up report descriptor
      HID: uclogic: constify fixed up report descriptor

 drivers/hid/hid-bigbenff.c       |  4 ++--
 drivers/hid/hid-dr.c             |  4 ++--
 drivers/hid/hid-holtek-kbd.c     |  4 ++--
 drivers/hid/hid-keytouch.c       |  6 ++----
 drivers/hid/hid-lg.c             | 31 +++++++++++++++++--------------
 drivers/hid/hid-maltron.c        |  4 ++--
 drivers/hid/hid-pxrc.c           |  2 +-
 drivers/hid/hid-sony.c           | 12 ++++++------
 drivers/hid/hid-steelseries.c    |  4 ++--
 drivers/hid/hid-uclogic-core.c   |  2 +-
 drivers/hid/hid-uclogic-params.c |  4 ++--
 drivers/hid/hid-uclogic-params.h | 10 +++++-----
 drivers/hid/hid-uclogic-rdesc.c  | 20 ++++++++++----------
 drivers/hid/hid-uclogic-rdesc.h  | 20 ++++++++++----------
 drivers/hid/hid-viewsonic.c      |  4 ++--
 drivers/hid/hid-vrc2.c           |  2 +-
 drivers/hid/hid-waltop.c         | 28 ++++++++++++++--------------
 drivers/hid/hid-xiaomi.c         |  4 ++--
 18 files changed, 83 insertions(+), 82 deletions(-)
---
base-commit: c1f9eff7b270861005c7ec8146b6ad398c40940b
change-id: 20240803-hid-const-fixup-2-7c60ac529531
prerequisite-change-id: 20240730-hid-const-fixup-8b01cbda1b49:v2
prerequisite-patch-id: 92216ced5d79ee5578fbe1c24c994b6fd550d1fb
prerequisite-patch-id: 4dd3e0fa6b0387f2a722c2bb924fc9c3b784f49d
prerequisite-patch-id: 7a5b42060b989b053d2bc71d52e0281815da542d
prerequisite-patch-id: 15809fd82225c2d44cdbed2d570d621ba7378cec
prerequisite-patch-id: baba272935e0f16c67170413cadb682b535b3a6d
prerequisite-patch-id: 4e6017ca6b8df87fe8270fffd43a585eddba88c7
prerequisite-patch-id: 06023fde4515232fdcc4044b252aa42ed9a47885

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


