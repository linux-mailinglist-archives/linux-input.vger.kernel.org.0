Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6E4406125
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 02:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhIJAmD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Sep 2021 20:42:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232123AbhIJASn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Sep 2021 20:18:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF51A610E9;
        Fri, 10 Sep 2021 00:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233033;
        bh=oFz61alXTOW06JOhzSWsngaa9cI/LzWBSyT5PC3YZqU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P0HfgsEzbX3mhEF6T5acNO+vZYafO6JAQ4kbD+PQRvEVHHTqCk4gMH8eWIFj+AXFu
         JsbRPzAW50RuJA06zf5szkFhLIU5wU4+5dQiefdYdUnniLWchh4QPVECzwrki5TqiR
         RFX0VDK4AkPC6/oCA4Xj5tR7GzYAqoXz1LwQ96eyQCB45PcZkQMW94xWk+vjtMkPNu
         Wu4+NucJb+k9Ec2ON0QShzWrPjb/bYJkYa0Bds3yAvM1R6gdy8QIpkD6gGfMZ0P+7l
         xK3cUkwsegy22jipTljhFGxl74umSxbOFtU5S/Z6O9SgTOh9qlBpLOWsQLD9URBa1I
         5UdHKJZxI7M/g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Evgeny Novikov <novikov@ispras.ru>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 54/99] HID: thrustmaster: Fix memory leak in remove
Date:   Thu,  9 Sep 2021 20:15:13 -0400
Message-Id: <20210910001558.173296-54-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit df3a97bdbc252d3421f1c5d6d713ad6e4f36a469 ]

thrustmaster_remove() does not release memory for
tm_wheel->change_request. This is fixed by the patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index e94d3409fd10..9cb4248f95af 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -253,6 +253,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 
 	usb_kill_urb(tm_wheel->urb);
 
+	kfree(tm_wheel->change_request);
 	kfree(tm_wheel->response);
 	kfree(tm_wheel->model_request);
 	usb_free_urb(tm_wheel->urb);
-- 
2.30.2

