Return-Path: <linux-input+bounces-4718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616F91C947
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181611F23F8D
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B649386255;
	Fri, 28 Jun 2024 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb+chhMb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F581ADB;
	Fri, 28 Jun 2024 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614861; cv=none; b=i14HiMlxwejWANLDcxcwtg2ATXnE9jOnhInVO5+brRcqdHlw2FZgiXmluntmd5DxRb36R6HIMxOi6h0sdox0Bz/39Wx0AqBaJ+TXsxQtje5FI3W3fjZufTLUqckzDO+Tq8NLtAHqzTGsYC+JcNFgNpYTaOKZCsCLGgELW4WnKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614861; c=relaxed/simple;
	bh=bxWyiBWYPW2+buNmHaUgN3u/vnNpNcPGkK464MtKleM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGW+nTTvTzLerYw0wLQofkzK0l3QGnHZEYchZpzSu9Vi5Pijd6n1h8htD7KKgtRGAdHXyQifKJRumDYDpEMrgp4GsRltsN5r58d/jJjGf0OU71JNvMMs86t43fJN/c/zLQjDZcmFGw7Ml7pwYfxfBWLacvziRmDVOaXukzwbZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb+chhMb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c7b3c513f9so743094a91.3;
        Fri, 28 Jun 2024 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719614859; x=1720219659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grngmqCY15ZFkaN4yPlMDR3cMPW3TlCebrSNgkV3ENk=;
        b=Bb+chhMbmcEMyy/Q8sdQM17DpjBa9u+O4qNdRX5Xbj9sk/UXkpKhx6mfPm1f8aiDQN
         H6vsRCCL33e1b2SIJuYA6ph4AwUUJLZBW+IJtRJ9iPsldNHXUWU4lahwqqM0HHzFazKR
         Eqeb7i7uexB9tKChhp8VpkHgPxEYOzg9Zzh2TuVvo81nVSm6Bi8y3KhbkJvdTbMH2uKT
         5UKewVvSEcGuaYYZJ5a5XAXqR6c0xZ0MAR3FJpP0LrgssJyYjlFbP33dR3vEx05QOHPF
         f+vBDeLsEKB/ypdA7uwsJoK/Wd3g5sbOumi0gBAevsKFQZ3Vm3mDFwLeygVqcXEtCAAA
         Vqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614859; x=1720219659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grngmqCY15ZFkaN4yPlMDR3cMPW3TlCebrSNgkV3ENk=;
        b=G0uUcWHUUUNXqmpfc4B5U+zVdN1lqjPNxmMpAHVOgAG4m2vfxrIBoEKlJ1u30J2e8A
         C/jzCzsCkv70zXFHodR92L5rSAJsama7LffpkImFexUYR3S8lHY+tAwAm/TKqx2OYkIv
         YryShXvx0kXrDH8lzOVTa9dc0Yl9icTuS9PVHPIoOV7TOgdi0DgBhHbJBdBphEKioF0F
         zONSGdbNqJBdcWv7cGf/E+zY3Wca+bo0T3EsTPrt+FGjiAWq2Rkt4c8svjSQ6Jj7Tkyu
         5BhpJWCRT/Fd/HNZB6CVeduzE535qiAU0oYHmXd8sIkDLaHLbyZixXVvTzjdp6hPmfej
         qyTw==
X-Gm-Message-State: AOJu0YzmNsGRXzKz+00Wz6e9kJbJhAko5TPqT7Ihp0fajXo+yMjjCWXh
	Ln4dcn/k1o6TQDtHMUBcB7PgYnVeC3LZOwBjt0+nA1ImtxuAPqNefPJ7ig==
X-Google-Smtp-Source: AGHT+IFErHAjL8SN0MVSSUbo2xu2yuSye8VDkA/wXgIw9DoTE0ztbxvz5WvoFCTpkA55oUWttegjxw==
X-Received: by 2002:a17:90a:3fc6:b0:2c7:da20:524b with SMTP id 98e67ed59e1d1-2c8504c7dbamr15211307a91.10.1719614859146;
        Fri, 28 Jun 2024 15:47:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce58877sm2187163a91.24.2024.06.28.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:47:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] Input: cypress_ps2 - propagate errors from lower layers
Date: Fri, 28 Jun 2024 15:47:26 -0700
Message-ID: <20240628224728.2180126-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628224728.2180126-1-dmitry.torokhov@gmail.com>
References: <20240628224728.2180126-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not override errors reported by lower layers with generic "-1",
but propagate them to the callers. Change the checks for errors to be
in the form of "if (error)" to maintain consistency.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cypress_ps2.c | 62 +++++++++++++++++--------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index 8e17cd0bc437..87b87f14e749 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -97,10 +97,10 @@ static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
 				       unsigned char cmd,
 				       unsigned char *param)
 {
-	int rc;
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	enum psmouse_state old_state;
 	int pktsize;
+	int rc;
 
 	ps2_begin_command(ps2dev);
 
@@ -112,7 +112,7 @@ static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
 	memset(param, 0, pktsize);
 
 	rc = cypress_ps2_sendbyte(psmouse, 0xe9);
-	if (rc < 0)
+	if (rc)
 		goto out;
 
 	if (!wait_event_timeout(ps2dev->wait,
@@ -322,15 +322,15 @@ static int cypress_read_tp_metrics(struct psmouse *psmouse)
 
 static int cypress_query_hardware(struct psmouse *psmouse)
 {
-	int ret;
+	int error;
 
-	ret = cypress_read_fw_version(psmouse);
-	if (ret)
-		return ret;
+	error = cypress_read_fw_version(psmouse);
+	if (error)
+		return error;
 
-	ret = cypress_read_tp_metrics(psmouse);
-	if (ret)
-		return ret;
+	error = cypress_read_tp_metrics(psmouse);
+	if (error)
+		return error;
 
 	return 0;
 }
@@ -339,9 +339,12 @@ static int cypress_set_absolute_mode(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp = psmouse->private;
 	unsigned char param[3];
+	int error;
 
-	if (cypress_send_ext_cmd(psmouse, CYTP_CMD_ABS_WITH_PRESSURE_MODE, param) < 0)
-		return -1;
+	error = cypress_send_ext_cmd(psmouse, CYTP_CMD_ABS_WITH_PRESSURE_MODE,
+				     param);
+	if (error)
+		return error;
 
 	cytp->mode = (cytp->mode & ~CYTP_BIT_ABS_REL_MASK)
 			| CYTP_BIT_ABS_PRESSURE;
@@ -366,7 +369,7 @@ static void cypress_reset(struct psmouse *psmouse)
 static int cypress_set_input_params(struct input_dev *input,
 				    struct cytp_data *cytp)
 {
-	int ret;
+	int error;
 
 	if (!cytp->tp_res_x || !cytp->tp_res_y)
 		return -EINVAL;
@@ -383,10 +386,10 @@ static int cypress_set_input_params(struct input_dev *input,
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, cytp->tp_max_abs_y, 0, 0);
 	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 
-	ret = input_mt_init_slots(input, CYTP_MAX_MT_SLOTS,
-			INPUT_MT_DROP_UNUSED|INPUT_MT_TRACK);
-	if (ret < 0)
-		return ret;
+	error = input_mt_init_slots(input, CYTP_MAX_MT_SLOTS,
+				    INPUT_MT_DROP_UNUSED | INPUT_MT_TRACK);
+	if (error)
+		return error;
 
 	__set_bit(INPUT_PROP_SEMI_MT, input->propbit);
 
@@ -637,21 +640,22 @@ static void cypress_disconnect(struct psmouse *psmouse)
 static int cypress_reconnect(struct psmouse *psmouse)
 {
 	int tries = CYTP_PS2_CMD_TRIES;
-	int rc;
+	int error;
 
 	do {
 		cypress_reset(psmouse);
-		rc = cypress_detect(psmouse, false);
-	} while (rc && (--tries > 0));
+		error = cypress_detect(psmouse, false);
+	} while (error && (--tries > 0));
 
-	if (rc) {
+	if (error) {
 		psmouse_err(psmouse, "Reconnect: unable to detect trackpad.\n");
-		return -1;
+		return error;
 	}
 
-	if (cypress_set_absolute_mode(psmouse)) {
+	error = cypress_set_absolute_mode(psmouse);
+	if (error) {
 		psmouse_err(psmouse, "Reconnect: Unable to initialize Cypress absolute mode.\n");
-		return -1;
+		return error;
 	}
 
 	return 0;
@@ -660,6 +664,7 @@ static int cypress_reconnect(struct psmouse *psmouse)
 int cypress_init(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp;
+	int error;
 
 	cytp = kzalloc(sizeof(*cytp), GFP_KERNEL);
 	if (!cytp)
@@ -670,17 +675,20 @@ int cypress_init(struct psmouse *psmouse)
 
 	cypress_reset(psmouse);
 
-	if (cypress_query_hardware(psmouse)) {
+	error = cypress_query_hardware(psmouse);
+	if (error) {
 		psmouse_err(psmouse, "Unable to query Trackpad hardware.\n");
 		goto err_exit;
 	}
 
-	if (cypress_set_absolute_mode(psmouse)) {
+	error = cypress_set_absolute_mode(psmouse);
+	if (error) {
 		psmouse_err(psmouse, "init: Unable to initialize Cypress absolute mode.\n");
 		goto err_exit;
 	}
 
-	if (cypress_set_input_params(psmouse->dev, cytp) < 0) {
+	error = cypress_set_input_params(psmouse->dev, cytp);
+	if (error) {
 		psmouse_err(psmouse, "init: Unable to set input params.\n");
 		goto err_exit;
 	}
@@ -705,5 +713,5 @@ int cypress_init(struct psmouse *psmouse)
 	psmouse->private = NULL;
 	kfree(cytp);
 
-	return -1;
+	return error;
 }
-- 
2.45.2.803.g4e1b14247a-goog


