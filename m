Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A98406132
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 02:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhIJAmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 20:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230026AbhIJAUl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Sep 2021 20:20:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2478361167;
        Fri, 10 Sep 2021 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233171;
        bh=yGuilPzB3SgtdzzoSg7XiCNb4flBJJj26ADLOK1uBE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SE8kLUGEtQdm516am7JSM0vrSeLstn4EaaDs5sIKqLABRLT3cZupqAKL7jGlkjz2I
         JGbcBMaA/kmMXGjLoAjq+IElN9867OkksvHHnKQe8e2Y7Fbf8GNTECJyVUVMlnrKto
         /5zOLyO4KCVTjQXmdLBBFJSoyzgoUI/PknZVjNbeghAJV+H/kb9Krlf0s5s/jMP+GO
         P9krdFQvLU6RlLE/Q2elLh8CHtF312tRsAq9SkEnFK5FMjpg4iff81FOYLfYIi7x7b
         OY527ZIBK7BOiEy/nCZgUSmbtaX37fehKA0MvjDWDxC0mwRvPZfSZp/1bJVglAv/2k
         hqT475sU3IswQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Ulrich=20Sp=C3=B6rlein?= <uqs@FreeBSD.org>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 50/88] HID: sony: Fix more ShanWan clone gamepads to not rumble when plugged in.
Date:   Thu,  9 Sep 2021 20:17:42 -0400
Message-Id: <20210910001820.174272-50-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001820.174272-1-sashal@kernel.org>
References: <20210910001820.174272-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ulrich Spörlein <uqs@FreeBSD.org>

[ Upstream commit bab94e97323baefe0afccad66e776f9c78b4f521 ]

The device string on these can differ, apparently, including typos. I've
bought 2 of these in 2012 and googling shows many folks out there with
that broken spelling in their dmesg.

Signed-off-by: Ulrich Spörlein <uqs@FreeBSD.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-sony.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b3722c51ec78..a2fef59063a6 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2974,7 +2974,8 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (!strcmp(hdev->name, "FutureMax Dance Mat"))
 		quirks |= FUTUREMAX_DANCE_MAT;
 
-	if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
+	if (!strcmp(hdev->name, "SHANWAN PS3 GamePad") ||
+	    !strcmp(hdev->name, "ShanWan PS(R) Ga`epad"))
 		quirks |= SHANWAN_GAMEPAD;
 
 	sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
-- 
2.30.2

