Return-Path: <linux-input+bounces-17032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8428D17A84
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB65312407F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8203387379;
	Tue, 13 Jan 2026 09:26:13 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991013624B9;
	Tue, 13 Jan 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296371; cv=none; b=QStQuLq0MLX3XDth8zSBjfrhUt18r1wmwiVth1oKePLPesMZMCi9rvr7petT+M4YS0A7+zeqVBYwYWaKm8D+dD285lZwyj2zeOVnjZcI4SR7mqNoV9Kq9fLpfxgSI9XF+PHG/ZWYr8TEfWQRVr1h6I04ZauLRWjouMo4g7Ov64k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296371; c=relaxed/simple;
	bh=ivCyF7mZvnBU9CvEMY4sUaGB0sLQyuwJPMiWcknREsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQ9ZrUOSnGc6fz2pvx4KN2QALt2C5sdo9VhWmv2F5Bt1oP44TjdKoGHpvvklnbdYRmrt2Vr9UrNNm+rKIj+dLu3mGq4QGSEqbFYmTolIw0bQhHv7K3LZZaFglV4iE/1HDbvbW2nI8sceTgC1onkBKJbQ/jpcPL3X9THwpd8cnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9105A580EDB;
	Tue, 13 Jan 2026 09:26:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72C3E4336F;
	Tue, 13 Jan 2026 09:25:55 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 00/11] HID: Use pm_*ptr instead of #ifdef CONFIG_PM*
Date: Tue, 13 Jan 2026 10:24:48 +0100
Message-ID: <20260113092546.265734-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffteektdejuddvhfdtfedtvdetgeeileethfetgfdtheekvefgueeifffhvefhfeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeejvdevfefggeeffeeihfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

Changes since v1:
- Fixed most patches to build
- Removed surface patch

All changes were compiled successfully with CONFIG_PM disabled.

Bastien Nocera (11):
  HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: lenovo: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
  HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM

 drivers/hid/hid-alps.c         |  6 ++----
 drivers/hid/hid-appletb-kbd.c  |  8 ++------
 drivers/hid/hid-asus.c         |  6 ++----
 drivers/hid/hid-lenovo.c       |  6 +-----
 drivers/hid/hid-logitech-dj.c  |  6 +-----
 drivers/hid/hid-nintendo.c     | 11 ++---------
 drivers/hid/hid-picolcd_core.c | 10 +++-------
 drivers/hid/hid-sensor-hub.c   | 10 +++-------
 drivers/hid/hid-sony.c         | 12 +++---------
 drivers/hid/hid-uclogic-core.c |  8 ++------
 drivers/hid/wacom_sys.c        |  8 ++------
 11 files changed, 23 insertions(+), 68 deletions(-)

-- 
2.52.0


