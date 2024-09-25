Return-Path: <linux-input+bounces-6701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C2F985BD3
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 14:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF94288527
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A431C6888;
	Wed, 25 Sep 2024 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2DQOHs8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FF1A01C4;
	Wed, 25 Sep 2024 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265187; cv=none; b=J45mNn+Z9+6s+mERbe9EOhx98kpRnnKiZFpOETJN4eYKf0hk8smd1aLZLcT3PySCggOCoYdTpY5/eIcZMOhrhVcp2dUQmWx+y6DR1e4gKFnDGzOd0plEPsoAPwhIl/xK5RCmDEHoYkR+VLJ9HP3VyLOFG+CwurcYGe2WWUWDX/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265187; c=relaxed/simple;
	bh=EpYTKiszT8EXXiEtCG7qOsk3QEUOr1dArRHyIIFUh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kpePqQEUqsfmnL4C+8LIOGvhtkhc4N14uOTbh3W7HWkF3jOEIOJ7ga9xSFbnBFjPFrBQ+6tVumgdcFq5YpwWDi41CT7AAYymg6rSnUsrEYn0cQIQb13SCTZKDsZeicjGnubrsxGepXvbssVwPxokY5MpHVElmV770lX1sx+Uh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2DQOHs8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B76C4CEC7;
	Wed, 25 Sep 2024 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265186;
	bh=EpYTKiszT8EXXiEtCG7qOsk3QEUOr1dArRHyIIFUh5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2DQOHs8Q/F5hiBm70zeZ/UmLXV3x7P2a7wblBBhrExn6eiIYMGU22hGPw0x5RdhI
	 tlrw7rTvgCmXpjKaPOZqR6trepDfvVljxEAiGWfD6hTFR2TnJxG0qbte4dv1ZeidoB
	 RuQe6eYjcHmVWu67iT71Yp+wR31zZLzhB1SZ/4RsKQQ1pNLjmsLGaLGa55TH6Yh1Dc
	 A1jWcTqUI4eG1hnlx/ewrpquJNdpCU512tZZNDKkpvNwMFLTx3PxKYfG2Kmjk4biIN
	 CklP99f7+KuO/rZgy+70EkCkucoHIby3Gy1bLABa9yUdg3Cd9dNRIljwvVbMaZHdhA
	 qLrXnbOUZofSQ==
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
	johan+linaro@kernel.org,
	namcao@linutronix.de,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 228/244] HID: i2c-hid: ensure various commands do not interfere with each other
Date: Wed, 25 Sep 2024 07:27:29 -0400
Message-ID: <20240925113641.1297102-228-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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


