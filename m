Return-Path: <linux-input+bounces-17037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4279CD17B9B
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E331302E159
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D0038BDA0;
	Tue, 13 Jan 2026 09:26:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3E3876B6;
	Tue, 13 Jan 2026 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296377; cv=none; b=k8fVDacCkA+iP63CxKO4qttyqyYTm9LHLhbb1cscRsYpgdZ4ERX5PHxYwHgbOL2zQWBJ41cBj9q4SyjStL7BsysJ6U1Fe4lUqL44jFBh4Ksw+8+hXmDGUGFHUm46NpPAWL0zmfBTAA7CFMvLnhIWKZ6MqgJ1hhQ2ZaJkWOFYK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296377; c=relaxed/simple;
	bh=DmpAMJ+x+JimFZCuPTeyENeB0njvYGsJPPzOvVwn6wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wf/APl14q0cWyzYghpgzpF5O6Hexz9xuL2WnvZTQz72TFibUbF//ArQXC886kuzPu6a3QatiV92d6o0TueKJx6OkLWZAVQKjfOzN3LDKe2rumLhiarEuWBqHN/O+HjP8GRwM18O7XFFAE1fCLVUSx/jy9MryO6V37Z2o5cP9PVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 81090580EF5;
	Tue, 13 Jan 2026 09:26:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81C4B43378;
	Tue, 13 Jan 2026 09:25:57 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 03/11] HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
Date: Tue, 13 Jan 2026 10:24:51 +0100
Message-ID: <20260113092546.265734-4-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113092546.265734-1-hadess@hadess.net>
References: <20260113092546.265734-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevtefhleevjeffteekleehheeujeelhfdvheethefggefhkefgvdefhfegkeeiteenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeekudevgeeugeeffeejkedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-State: clean
X-GND-Score: -100

This increases build coverage and allows to drop an #ifdef.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-asus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 472bca54642b..0a4acdcb6386 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1434,10 +1434,8 @@ static struct hid_driver asus_driver = {
 	.remove			= asus_remove,
 	.input_mapping          = asus_input_mapping,
 	.input_configured       = asus_input_configured,
-#ifdef CONFIG_PM
-	.reset_resume           = asus_reset_resume,
-	.resume					= asus_resume,
-#endif
+	.reset_resume           = pm_ptr(asus_reset_resume),
+	.resume			= pm_ptr(asus_resume),
 	.event			= asus_event,
 	.raw_event		= asus_raw_event
 };
-- 
2.52.0


