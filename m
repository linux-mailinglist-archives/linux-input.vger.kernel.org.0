Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E95A4125F6
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 20:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385633AbhITSvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 14:51:19 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:39346
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1384890AbhITStR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 14:49:17 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id DA14740185;
        Mon, 20 Sep 2021 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632163668;
        bh=pudimRprKHdN4/qqulTzwk5MafxvF6f7MetF1EElfYY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=X7yJs3uBx9QI0k6reeuqzJX/UBqzQfiZ9jlgZqMuvamtkQr8CJEYwGYU2sR9WOJ0Q
         k+ODPVbsNs3y1zDLqEl7DI+5hpZ+1qOsy//HupvLtwqpot6Hbnh9C/36Ffiw36Ekat
         OMP/HGIYC0D0Sp92YqeZXAzIyqAXJR8HLY39ka2RC+w0OWeFyI5OAVUzrs3F8Py20B
         SnzJfacuqjcFYhes3a1QZj0sAdZiWw6VraKOIH7YnqHf8PnN6x/2XTve5a0HSgbOl1
         vIXF3ye9VzlUW5vk9TuMTqZ/43kdpZSIZmLW62EFUY06EfxXFadbMUc8+7tYYwI4CK
         BYPaSOaC9fCpw==
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: drivers/input/joystick: Fix spelling mistake "Millenium" -> "Millennium"
Date:   Mon, 20 Sep 2021 19:47:48 +0100
Message-Id: <20210920184748.18519-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the name  of a joystick. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/joystick/tmdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/tmdc.c b/drivers/input/joystick/tmdc.c
index f89e9aa6d328..7416de84b955 100644
--- a/drivers/input/joystick/tmdc.c
+++ b/drivers/input/joystick/tmdc.c
@@ -83,7 +83,7 @@ static const struct tmdc_model {
 	const signed char *axes;
 	const short *buttons;
 } tmdc_models[] = {
-	{   1, "ThrustMaster Millenium 3D Inceptor",	  6, 2, { 4, 2 }, { 4, 6 }, tmdc_abs, tmdc_btn_joy },
+	{   1, "ThrustMaster Millennium 3D Inceptor",	  6, 2, { 4, 2 }, { 4, 6 }, tmdc_abs, tmdc_btn_joy },
 	{   3, "ThrustMaster Rage 3D Gamepad",		  2, 0, { 8, 2 }, { 0, 0 }, tmdc_abs, tmdc_btn_pad },
 	{   4, "ThrustMaster Attack Throttle",		  5, 2, { 4, 6 }, { 4, 2 }, tmdc_abs_at, tmdc_btn_at },
 	{   8, "ThrustMaster FragMaster",		  4, 0, { 8, 2 }, { 0, 0 }, tmdc_abs_fm, tmdc_btn_fm },
-- 
2.32.0

