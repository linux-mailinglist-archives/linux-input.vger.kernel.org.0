Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74791241BA6
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 15:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgHKNkT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Aug 2020 09:40:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52540 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728619AbgHKNkH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Aug 2020 09:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597153206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=E8n/H5ukzPBGKyBzlxE1D27AGIMHtnnlzxgHO35N858=;
        b=dIiohJ7r4qyUPL51JUWHpzUQOFuKHMo24WH+wCO0zWNQeXsJI93KAR8ckHM3EYZRplOGo4
        ndcGcjvfRAW779FtQTf0S4FbaTX82bwW1ENAoieYXio3jJPFiDFplrmxycGv2Lc0FSQN9R
        jgbZlPxxSKz6w71/w4fWUIQx+uRzye4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-eYzw0miMMbW-PVQVFaaw_Q-1; Tue, 11 Aug 2020 09:40:04 -0400
X-MC-Unique: eYzw0miMMbW-PVQVFaaw_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD0080048A;
        Tue, 11 Aug 2020 13:40:02 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-214.ams2.redhat.com [10.36.114.214])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 149BB7C0E5;
        Tue, 11 Aug 2020 13:39:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, stable@vger.kernel.org,
        Andrea Borgia <andrea@borgia.bo.it>
Subject: [PATCH v3] HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands
Date:   Tue, 11 Aug 2020 15:39:58 +0200
Message-Id: <20200811133958.355760-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before this commit i2c_hid_parse() consists of the following steps:

1. Send power on cmd
2. usleep_range(1000, 5000)
3. Send reset cmd
4. Wait for reset to complete (device interrupt, or msleep(100))
5. Send power on cmd
6. Try to read HID descriptor

Notice how there is an usleep_range(1000, 5000) after the first power-on
command, but not after the second power-on command.

Testing has shown that at least on the BMAX Y13 laptop's i2c-hid touchpad,
not having a delay after the second power-on command causes the HID
descriptor to read as all zeros.

In case we hit this on other devices too, the descriptor being all zeros
can be recognized by the following message being logged many, many times:

hid-generic 0018:0911:5288.0002: unknown main item tag 0x0

At the same time as the BMAX Y13's touchpad issue was debugged,
Kai-Heng was working on debugging some issues with Goodix i2c-hid
touchpads. It turns out that these need a delay after a PWR_ON command
too, otherwise they stop working after a suspend/resume cycle.
According to Goodix a delay of minimal 60ms is needed.

Having multiple cases where we need a delay after sending the power-on
command, seems to indicate that we should always sleep after the power-on
command.

This commit fixes the mentioned issues by moving the existing 1ms sleep to
the i2c_hid_set_power() function and changing it to a 60ms sleep.

Cc: stable@vger.kernel.org
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208247
Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Reported-and-tested-by: Andrea Borgia <andrea@borgia.bo.it>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Fix Subject to say 60ms instead of 1ms

Changes in v2:
- Add Kai-Heng's case, with Goodix touchpads needing a delay after PWR_ON too,
  to the commit message
- Add a Reported-by tag for Kai-Heng
- Increase the delay to 60ms
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 294c84e136d7..dbd04492825d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -420,6 +420,19 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
 		dev_err(&client->dev, "failed to change power setting.\n");
 
 set_pwr_exit:
+
+	/*
+	 * The HID over I2C specification states that if a DEVICE needs time
+	 * after the PWR_ON request, it should utilise CLOCK stretching.
+	 * However, it has been observered that the Windows driver provides a
+	 * 1ms sleep between the PWR_ON and RESET requests.
+	 * According to Goodix Windows even waits 60 ms after (other?)
+	 * PWR_ON requests. Testing has confirmed that several devices
+	 * will not work properly without a delay after a PWR_ON request.
+	 */
+	if (!ret && power_state == I2C_HID_PWR_ON)
+		msleep(60);
+
 	return ret;
 }
 
@@ -441,15 +454,6 @@ static int i2c_hid_hwreset(struct i2c_client *client)
 	if (ret)
 		goto out_unlock;
 
-	/*
-	 * The HID over I2C specification states that if a DEVICE needs time
-	 * after the PWR_ON request, it should utilise CLOCK stretching.
-	 * However, it has been observered that the Windows driver provides a
-	 * 1ms sleep between the PWR_ON and RESET requests and that some devices
-	 * rely on this.
-	 */
-	usleep_range(1000, 5000);
-
 	i2c_hid_dbg(ihid, "resetting...\n");
 
 	ret = i2c_hid_command(client, &hid_reset_cmd, NULL, 0);
-- 
2.28.0

