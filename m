Return-Path: <linux-input+bounces-3581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC638BEFF7
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 00:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B519281B2E
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 22:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D067E59F;
	Tue,  7 May 2024 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKc0PXdk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E27E112;
	Tue,  7 May 2024 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715122648; cv=none; b=IBZn3LZeFhjL4UkAc+N/nO59LujgyTnJFkBNgasi6zl6amoqLwMGebuoyiycKJFuX9PZNHbogeycFzbgVjibrndqEmArr07uMTkHOjEpyW/c/f1apm64f85hT9SpIDQ5QpNfKYdH6VDO+daaHykxXp0b/9YhVItr2myI6SgV1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715122648; c=relaxed/simple;
	bh=QGtUVOE9/CgDIc5ostJalO8E2HHFGOn1/f1N88nAV5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1g/vB0UERyky++aRSfRnWxEIF6l2kwDgQeqpLhJrupfLqW4hdPwJLgaqhen5YIECTJ3ru1EnxGa+CjgOquUdi9JwVbSL2PkpM/ShyI+8KxxfdK4kRK+WtYvQEA2xE9v92B3jClG6z4hnTJ/kXHNc2MSdRpOiXDj/7ZQFzY105o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKc0PXdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DF2C2BBFC;
	Tue,  7 May 2024 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715122648;
	bh=QGtUVOE9/CgDIc5ostJalO8E2HHFGOn1/f1N88nAV5k=;
	h=From:To:Cc:Subject:Date:From;
	b=GKc0PXdkr8iQ9Cmf2aj4lCpTn/aMVcF2CWUI5gNp7NIrQfgfvETAo0D9flSBoH/dl
	 yYpQAVdbGXPlc3DVewgyfZwC6m+mtk8CcXxyt0kYIdF5NNd7Re/t5g9vuU1vPxjyQN
	 zEwZFY/fOf0+jTXEEGhxg1rCGEv8RedNP9hBqYoQF6U6I6agV1gz03IQKYly9lgZb9
	 rjzSTh3625X8JndT79I7BndhdtmGGmuEMvhSHGS0FMX0su90m6AIaTS735gyhA5VVR
	 Dg+UD3B8vEeveqkuBOafkviUW4SBXBHgJmmeoMfIRrG6hz3eJJVYQUGgPn26gGmZxS
	 KYH9N1xlOe+Lg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nuno Pereira <nf.pereira@outlook.pt>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	djogorchock@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 01/23] HID: nintendo: Fix N64 controller being identified as mouse
Date: Tue,  7 May 2024 18:56:27 -0400
Message-ID: <20240507225725.390306-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit

From: Nuno Pereira <nf.pereira@outlook.pt>

[ Upstream commit 8db8c77059e75a0f418b10ede39dd82a9eb031fa ]

This patch is regarding the recent addition of support for the NSO
controllers to hid-nintendo. All controllers are working correctly with the
exception of the N64 controller, which is being identified as a mouse by
udev. This results in the joystick controlling the mouse cursor and the
controller not being detected by games.

The reason for this is because the N64's C buttons have been attributed to
BTN_FORWARD, BTN_BACK, BTN_LEFT, BTN_RIGHT, which are buttons typically
attributed to mice.

This patch changes those buttons to controller buttons, making the
controller be correctly identified as such.

Signed-off-by: Nuno Pereira <nf.pereira@outlook.pt>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-nintendo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index ccc4032fb2b03..4b2c81b49b80e 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -481,10 +481,10 @@ static const struct joycon_ctlr_button_mapping n64con_button_mappings[] = {
 	{ BTN_TR,		JC_BTN_R,	},
 	{ BTN_TR2,		JC_BTN_LSTICK,	}, /* ZR */
 	{ BTN_START,		JC_BTN_PLUS,	},
-	{ BTN_FORWARD,		JC_BTN_Y,	}, /* C UP */
-	{ BTN_BACK,		JC_BTN_ZR,	}, /* C DOWN */
-	{ BTN_LEFT,		JC_BTN_X,	}, /* C LEFT */
-	{ BTN_RIGHT,		JC_BTN_MINUS,	}, /* C RIGHT */
+	{ BTN_SELECT,		JC_BTN_Y,	}, /* C UP */
+	{ BTN_X,		JC_BTN_ZR,	}, /* C DOWN */
+	{ BTN_Y,		JC_BTN_X,	}, /* C LEFT */
+	{ BTN_C,		JC_BTN_MINUS,	}, /* C RIGHT */
 	{ BTN_MODE,		JC_BTN_HOME,	},
 	{ BTN_Z,		JC_BTN_CAP,	},
 	{ /* sentinel */ },
-- 
2.43.0


