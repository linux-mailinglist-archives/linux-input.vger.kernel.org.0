Return-Path: <linux-input+bounces-10905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A172A66F8D
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 10:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A201189196E
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 09:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F60206F2B;
	Tue, 18 Mar 2025 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YeiSX+H4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1F206F12
	for <linux-input@vger.kernel.org>; Tue, 18 Mar 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289552; cv=none; b=aoQaF7rdFeyaP4YfftIcYqAOQsRt36BaUMYEqVDD3l6GZZiUtaCfEIcEYdaqEupM2v/loeH5Qmb+eEGEuRUqi0pYXNWHOSUChAgw7NYeLwO1YRPGuDZtVty94VcDO0kUaO5gH4kX/gQmfF6i922MOCoBPEYfH1NiIabJ+hb2Agw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289552; c=relaxed/simple;
	bh=P4lroIrdjW+wWo+cj0mN2WGn6w305766fFhpOj+Gm1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPyES72uIgB1ROaJDWJTHMKg76lXdFs4ev3TQ4XTRdvaD2e4dz8SSwoKaanY8eJs2GLHPz3xh1RJ/Zv/D8NSHl6bj0yqNEOyYNM2xaCZ05u+jEmA5xT+roUdPdU9fKWB7BobLA/eS8jRsbPdHRqbvz+oz5uR76nfivr4QG00yDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YeiSX+H4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=LO9Bbrk77YxKzi
	fj7EKPXFN6fdXvBJl+Jb+cXqZg9EQ=; b=YeiSX+H4EZQr7xMEpvWp0cJbnqSFf6
	H1lctCg8L8fbsZwcEC8CwYg4nyAyf7VrwrvvhAWe3VypWKT7zJ1m0Bo3JA4KekJy
	tje8gxFuNkeou61RXTV/dAzcnrii4AOetz93GGdDj1Jb3fPyFzupGgJro2suJX5r
	5Ofp8bRBceLSkBInvkYCKcwSYTXIWJVIBC8rutNQYYATM5bx+2DFYMhC5GYQ6nhH
	7jGa8/j1O2S5/0ab8U40LOr39QYVRu5r9z4GwYPzPWJhuL/2FJSL4USlkl9aN+id
	ibHReB3t82GglOYIW7C604tjt66NYqDP3ZUtGW7RRyfFpTdJKWZ+4tug==
Received: (qmail 3664335 invoked from network); 18 Mar 2025 10:19:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 10:19:08 +0100
X-UD-Smtp-Session: l3s3148p1@LqyaZZow1JMgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH] Input: edt-ft5x06 - use per-client debugfs directory
Date: Tue, 18 Mar 2025 10:17:41 +0100
Message-ID: <20250318091904.22468-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now provides a debugfs entry for each client. Let this
driver use it instead of the custom directory in debugfs root. Further
improvements by this change: support of multiple instances.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only, by me and buildbots. Trying to cleanup the debugfs a
little. But not sure if this is too complicated for users. Opinions?

 Documentation/input/devices/edt-ft5x06.rst | 21 +++++++++++++++++++--
 drivers/input/touchscreen/edt-ft5x06.c     | 20 ++++++++------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/Documentation/input/devices/edt-ft5x06.rst b/Documentation/input/devices/edt-ft5x06.rst
index 1ccc94b192b7..e410d73d4841 100644
--- a/Documentation/input/devices/edt-ft5x06.rst
+++ b/Documentation/input/devices/edt-ft5x06.rst
@@ -29,8 +29,25 @@ The driver allows configuration of the touch screen via a set of sysfs files:
 
 
 For debugging purposes the driver provides a few files in the debug
-filesystem (if available in the kernel). In /sys/kernel/debug/edt_ft5x06
-you'll find the following files:
+filesystem (if available in the kernel). They are located in:
+
+    /sys/kernel/debug/i2c/<i2c-bus>/<i2c-device>/
+
+If you don't know the bus and device numbers, you can look them up with this
+command:
+
+    $ ls -l /sys/bus/i2c/drivers/edt_ft5x06
+
+The dereference of the symlink will contain the needed information. You will
+need the last two elements of its path:
+
+    0-0038 -> ../../../../devices/platform/soc/fcfee800.i2c/i2c-0/0-0038
+
+So in this case, the location for the debug files is:
+
+    /sys/kernel/debug/i2c/i2c-0/0-0038/
+
+There, you'll find the following files:
 
 num_x, num_y:
     (readonly) contains the number of sensor fields in X- and
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 0d7bf18e2508..abc5bbb5c8c9 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -120,7 +120,6 @@ struct edt_ft5x06_ts_data {
 	struct regmap *regmap;
 
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *debug_dir;
 	u8 *raw_buffer;
 	size_t raw_bufsize;
 #endif
@@ -815,23 +814,21 @@ static const struct file_operations debugfs_raw_data_fops = {
 	.read = edt_ft5x06_debugfs_raw_data_read,
 };
 
-static void edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata,
-					  const char *debugfs_name)
+static void edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata)
 {
-	tsdata->debug_dir = debugfs_create_dir(debugfs_name, NULL);
+	struct dentry *debug_dir = tsdata->client->debugfs;
 
-	debugfs_create_u16("num_x", S_IRUSR, tsdata->debug_dir, &tsdata->num_x);
-	debugfs_create_u16("num_y", S_IRUSR, tsdata->debug_dir, &tsdata->num_y);
+	debugfs_create_u16("num_x", S_IRUSR, debug_dir, &tsdata->num_x);
+	debugfs_create_u16("num_y", S_IRUSR, debug_dir, &tsdata->num_y);
 
 	debugfs_create_file("mode", S_IRUSR | S_IWUSR,
-			    tsdata->debug_dir, tsdata, &debugfs_mode_fops);
+			    debug_dir, tsdata, &debugfs_mode_fops);
 	debugfs_create_file("raw_data", S_IRUSR,
-			    tsdata->debug_dir, tsdata, &debugfs_raw_data_fops);
+			    debug_dir, tsdata, &debugfs_raw_data_fops);
 }
 
 static void edt_ft5x06_ts_teardown_debugfs(struct edt_ft5x06_ts_data *tsdata)
 {
-	debugfs_remove_recursive(tsdata->debug_dir);
 	kfree(tsdata->raw_buffer);
 }
 
@@ -842,8 +839,7 @@ static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 	return -ENOSYS;
 }
 
-static void edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata,
-					  const char *debugfs_name)
+static void edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata)
 {
 }
 
@@ -1349,7 +1345,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
+	edt_ft5x06_ts_prepare_debugfs(tsdata);
 
 	dev_dbg(&client->dev,
 		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
-- 
2.47.2


