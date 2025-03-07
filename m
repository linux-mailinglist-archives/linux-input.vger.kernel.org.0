Return-Path: <linux-input+bounces-10628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7FA56A80
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 15:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A6A1898261
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 14:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802521ABB6;
	Fri,  7 Mar 2025 14:37:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60911547C0;
	Fri,  7 Mar 2025 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358266; cv=none; b=K9z61x7aMokMFbKDHd+n5L9tFh01Sw0ttkj7SIvSY5mMob8/Z1cglCk+EVURyRu0Bo5KjzSvNBSA45IOSA/iCb00oVi0E//Gd7NTEDDbnBpk/eqXpkuHjfQFYMux3jb2TYTSMnHTwGTjVLjhxmDW+Xev0nHlorUUvxzpVp74LGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358266; c=relaxed/simple;
	bh=+4bVoAYVbZIBE6hbJ5hvBJykQMU0AOJJmPLxGGfRjQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYgmN/b33RocI31leFN/dyUd5CtO491Ko6p5mPRMWByXl8d6jU7XvPU5yi1oSBXeTEoyQbDmcNDlVV5EbkSLIq+BsQDZq2Qd4sGn2CxzuSz5P5f14dXiOqpzEWjokRsm4NxWpnLBDn7zyA9/J9iEitnckFiMrpMycqPyYN66V/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E32A44117;
	Fri,  7 Mar 2025 14:37:41 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] MAINTAINERS: Remove myself from the goodix touchscreen maintainers
Date: Fri,  7 Mar 2025 15:37:32 +0100
Message-ID: <20250307143740.960328-1-hadess@hadess.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffteektdejuddvhfdtfedtvdetgeeileethfetgfdtheekvefgueeifffhvefhfeenucfkphepjeekrdduleelrdeitddrvdegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejkedrudelledriedtrddvgedvpdhhvghloheptghlrghsshhitgdrrddpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsohhirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhgruggvshhssehhrgguvghsshdrnhgvth
X-GND-Sasl: hadess@hadess.net

Haven't authored any commits to that driver in 10 years, and haven't
had supported hardware for nearly as long.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..d076e2d34c5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9827,7 +9827,6 @@ S:	Maintained
 F:	drivers/media/usb/go7007/
 
 GOODIX TOUCHSCREEN
-M:	Bastien Nocera <hadess@hadess.net>
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-- 
2.48.1


