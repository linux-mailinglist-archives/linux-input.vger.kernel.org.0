Return-Path: <linux-input+bounces-6706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F29985E21
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636061F25169
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED8020C78A;
	Wed, 25 Sep 2024 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edP5vxRg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1820C787;
	Wed, 25 Sep 2024 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266136; cv=none; b=utm8/900mcjEqFH/J34IiE3Z3Rrr9IlwCMugQZtZIPVAwVr4LW2UkLkfkSY60fiR3TGGYYNOdMVjE/NYhBvHqP1wwd3pPgGBrkrYX2wurWsWhdmHsdZmjMNdz16PNUq3q/f8r0nwrnnks4F+y35Q+4a64bz5i8bKiv1WK6lZMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266136; c=relaxed/simple;
	bh=EpYTKiszT8EXXiEtCG7qOsk3QEUOr1dArRHyIIFUh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHOykGRWoaIueFkDJx7YMwv3Pu4cWVacbonJnj0ZSxeJ8f7p3jtCzi8FrfUlIHwr1iIPpLEEGwlUlj3+bGaXy36oMPx98SM+nEHHh0g9xaxPG3sJzKd4uhrHE7F5KnNdgaNYBKnRMoLJMhAUmKs9v47UwitLYm857FnRWcsAlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edP5vxRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5366DC4CEC3;
	Wed, 25 Sep 2024 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266136;
	bh=EpYTKiszT8EXXiEtCG7qOsk3QEUOr1dArRHyIIFUh5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=edP5vxRgI7tjnAgDGygm+1CwIXtl1v7rtnoWdmgZ3zz89o+iuvYD13jJUvKKQK2XE
	 xRozPTZezRHBPYwcjAax3MkCRXCd0BKirt8PeJei+XLOwZPt4JIqkFu4r2jUbSo8SN
	 LjcU0kbvZ5rFv+cAe/16pxZE+fLg9N2rRU+xzSe5xe5TEcGHx21CVtH1+2nphxZsex
	 ROVWsfvYpjbGGFxcEvQJ24sQJPdpk63aD6KuzV5ngGxWy2UXs8KE6rfitAMysT8vB7
	 gmBKAk0F/Lkj1yJKq4W7nTesCVi9gP06x/iAfrJk37vHuWINrZ7Njv0vfX/tvCVpgu
	 QRMtVcDjDQVXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	dianders@chromium.org,
	kl@kl.wtf,
	namcao@linutronix.de,
	kai.heng.feng@canonical.com,
	johan+linaro@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 184/197] HID: i2c-hid: ensure various commands do not interfere with each other
Date: Wed, 25 Sep 2024 07:53:23 -0400
Message-ID: <20240925115823.1303019-184-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit b4ed18a3d56eabd18cfd9841ff05111e3cfbe8f9 ]

i2c-hid uses 2 shared buffers: command and "raw" input buffer for
sending requests to peripherals and read data from peripherals when
executing variety of commands. Such commands include reading of HID
registers, requesting particular power mode, getting and setting
reports and so on. Because all such requests use the same 2 buffers
they should not execute simultaneously.

Fix this by introducing "cmd_lock" mutex and acquire it whenever
we needs to access ihid->cmdbuf or idid->rawbuf.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 42 +++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 632eaf9e11a6b..2f8a9d3f1e861 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -105,6 +105,7 @@ struct i2c_hid {
 
 	wait_queue_head_t	wait;		/* For waiting the interrupt */
 
+	struct mutex		cmd_lock;	/* protects cmdbuf and rawbuf */
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
@@ -220,6 +221,8 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 static int i2c_hid_read_register(struct i2c_hid *ihid, __le16 reg,
 				 void *buf, size_t len)
 {
+	guard(mutex)(&ihid->cmd_lock);
+
 	*(__le16 *)ihid->cmdbuf = reg;
 
 	return i2c_hid_xfer(ihid, ihid->cmdbuf, sizeof(__le16), buf, len);
@@ -252,6 +255,8 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	/* Command register goes first */
 	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
 	length += sizeof(__le16);
@@ -342,6 +347,8 @@ static int i2c_hid_set_or_send_report(struct i2c_hid *ihid,
 	if (!do_set && le16_to_cpu(ihid->hdesc.wMaxOutputLength) == 0)
 		return -ENOSYS;
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	if (do_set) {
 		/* Command register goes first */
 		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
@@ -384,6 +391,8 @@ static int i2c_hid_set_power_command(struct i2c_hid *ihid, int power_state)
 {
 	size_t length;
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	/* SET_POWER uses command register */
 	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
 	length = sizeof(__le16);
@@ -440,25 +449,27 @@ static int i2c_hid_start_hwreset(struct i2c_hid *ihid)
 	if (ret)
 		return ret;
 
-	/* Prepare reset command. Command register goes first. */
-	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
-	length += sizeof(__le16);
-	/* Next is RESET command itself */
-	length += i2c_hid_encode_command(ihid->cmdbuf + length,
-					 I2C_HID_OPCODE_RESET, 0, 0);
+	scoped_guard(mutex, &ihid->cmd_lock) {
+		/* Prepare reset command. Command register goes first. */
+		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
+		length += sizeof(__le16);
+		/* Next is RESET command itself */
+		length += i2c_hid_encode_command(ihid->cmdbuf + length,
+						 I2C_HID_OPCODE_RESET, 0, 0);
 
-	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+		set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 
-	ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
-	if (ret) {
-		dev_err(&ihid->client->dev,
-			"failed to reset device: %d\n", ret);
-		goto err_clear_reset;
-	}
+		ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
+		if (ret) {
+			dev_err(&ihid->client->dev,
+				"failed to reset device: %d\n", ret);
+			break;
+		}
 
-	return 0;
+		return 0;
+	}
 
-err_clear_reset:
+	/* Clean up if sending reset command failed */
 	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
 	return ret;
@@ -1200,6 +1211,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	ihid->is_panel_follower = drm_is_panel_follower(&client->dev);
 
 	init_waitqueue_head(&ihid->wait);
+	mutex_init(&ihid->cmd_lock);
 	mutex_init(&ihid->reset_lock);
 	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
 
-- 
2.43.0


