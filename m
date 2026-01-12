Return-Path: <linux-input+bounces-16967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB5D121E8
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 12:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECA5130F956B
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACF4354AF3;
	Mon, 12 Jan 2026 10:58:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E48352C53;
	Mon, 12 Jan 2026 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215487; cv=none; b=fZrB2nG0RIVXcYDYrgbdYrHIf+rlabaGf5CNgoFvl//UypZaGeJyYefZjfGc8dkvTtiOppGkR5TZtGmgrj+T/uJktpJtAoZ56yWmfTha9QWccwaVF9Pl+BusrrUVYYIuVe3BiEKky/bHlYGT0kZPaEgM+2KnaEL+E1Jx06Q6JCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215487; c=relaxed/simple;
	bh=P2YbqftynhVQf+aFiKVoL6DaUfmwnuMZfNrdlYqELxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2roMR+oDNrWdDJnVzniMQjoeljA5xhZDW1TiwpyHzBXuztFo0ayndU84m6TGe+20r/kwK3exb4DhtVGG2E7aWO63AmIEzp13xroK6+kEiB9JxVujdkTNRHnNwbmQXyNP+c29Z68JDjDKJbxv4JHmSBRpilWkQqWnZ8ytNv7zc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9892D580C92;
	Mon, 12 Jan 2026 10:55:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDB7243B68;
	Mon, 12 Jan 2026 10:55:12 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 06/12] HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Mon, 12 Jan 2026 11:52:55 +0100
Message-ID: <20260112105500.3664834-7-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112105500.3664834-1-hadess@hadess.net>
References: <20260112105500.3664834-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeuffeujedvgeefueeikedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-nintendo.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c2849a541f65..95b6df7b9b13 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2826,11 +2826,8 @@ static struct hid_driver nintendo_hid_driver = {
 	.probe		= nintendo_hid_probe,
 	.remove		= nintendo_hid_remove,
 	.raw_event	= nintendo_hid_event,
-
-#ifdef CONFIG_PM
-	.resume		= nintendo_hid_resume,
-	.suspend	= nintendo_hid_suspend,
-#endif
+	.resume		= pm_ptr(nintendo_hid_resume),
+	.suspend	= pm_ptr(nintendo_hid_suspend),
 };
 static int __init nintendo_init(void)
 {
-- 
2.52.0


