Return-Path: <linux-input+bounces-4719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90A91C949
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11AC1C22203
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC3C134402;
	Fri, 28 Jun 2024 22:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af3tsJkk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2385285;
	Fri, 28 Jun 2024 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614863; cv=none; b=CCF5mBNp00VLL6A/HmNRskpKiCjTv81+23ppYeUkgKUj6exCWXUhciaPRJ1//W/9dV7HDORegsFXdLd0J3++x7jceh2/TAerV69d7oq3FvBqS5QKDoQdhPGXF8yn4CKwIiombdxPWard3VXX6Rf+mEZDANeUS0Mm9cvKv71P0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614863; c=relaxed/simple;
	bh=+8nNly24xuCx20eSYpE+qDD01oAcNayYe8T7Y/xuscw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlDw/8t4yVoNn2qCQ4cZC1jzddDLi8GpNDCV6bgY7ESO0J+75YN8OdOOh0frgePlCpAPZ79dduyyJQtrQNbVF+QwDwqFES/V+FEOZDX4q2juUHDoSFdrWQuqze0hDaTBgxdXKm1uxy5aQZ3aCzbfRjzvdgXihn3JbPqqTMFHfn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af3tsJkk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fa3bdd91c1so8259325ad.2;
        Fri, 28 Jun 2024 15:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719614860; x=1720219660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFNDKpw6QkRM2hybf3Ehw0BO3Qpr8ju6XyIUPGNVdl4=;
        b=Af3tsJkkleq4JJJ6U2ZTRjkj7uIHACZXG7EnvG33skojnLiCZTcN5c/d5I4fAHLh2V
         cMtTAkmAKExrfuXQFZyj5OvSSYCXMdMF+viyVdlTmWFnUmJAyOK5Cl5/jiJ5znv+y5e4
         WsGQPv1oxEk+enYmVRsPIbGLwJ9N3T3UON6LHAYFpWjKJVd4iDWx3glINt6ScUzNjivb
         vgwaMpW7ZnO3z0mjKhmcequuxd24EirPJOB/VNetnkCVtOrivNWcLSrjCGL651axeLFw
         LTUyJcZAV8/k+h3Yoov9EL/2rxg6jcKS3haEi4jxPis1AbO3/MF0If4e+1CB4H+fiFpk
         nL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614860; x=1720219660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFNDKpw6QkRM2hybf3Ehw0BO3Qpr8ju6XyIUPGNVdl4=;
        b=wUvDFoT0GP4P3Nfg9gy6FQ8CoHtLeavTYnZsA6i8scCPnPJXWdYhzKd5x/wBI6H/2V
         lGV+2WuCuqmKNjJAbtBng7Vne7RrVqy9PEs8RTq+vlgLNuwgPVZk4yvH3OwWZfCg5htj
         CATSby2PADuPYpcBo9J0MbQnGNzMPGA0NXnpfm5FojhnBDYqfYp++gKYQRkWGA62R+uT
         l/4Li5x4oEcWKXsJ8jFi+s9Lci9++++W8QC6n1cOr1dKhBZAy/mIjkuyDTbbHWWE44US
         PJgpp8m6oCKecd2r5HqwhvLZ7S5QoC0ecLHO+jo3chd/UlfDM8uUkOCecWE/vNBrMvvy
         /1iw==
X-Gm-Message-State: AOJu0YxMrxaro7n1S0PAynxka0zFcJ7MH1hezCnIgqdVkDHYgRObASAI
	b60X1Z1bpJ2FH37xOZ8Qd9/FA5y17szboPZkPKuWoMRq1i+DZGqVkHP5BA==
X-Google-Smtp-Source: AGHT+IH1RMusHDvaC5rsF76b8ZnLdMQucMVlLxtx2vgOFFp00lGuInrqSXv51dW4moylnLYoHtxirA==
X-Received: by 2002:a17:90a:d397:b0:2bf:9566:7c58 with SMTP id 98e67ed59e1d1-2c86141c69bmr15632363a91.41.1719614860509;
        Fri, 28 Jun 2024 15:47:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce58877sm2187163a91.24.2024.06.28.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:47:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Input: cypress_ps2 - use u8 when dealing with byte data
Date: Fri, 28 Jun 2024 15:47:27 -0700
Message-ID: <20240628224728.2180126-5-dmitry.torokhov@gmail.com>
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

When dealing with byte data use u8 instead of unsigned char or int.
Stop layering error handling in cypress_ps2_sendbyte() and simply
pass on error code from ps2_sendbyte().

Additionally use u8 instead of unisgned char throughout the code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cypress_ps2.c | 78 ++++++++++++++-----------------
 1 file changed, 34 insertions(+), 44 deletions(-)

diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index 87b87f14e749..b3c34ebcc4ef 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -32,32 +32,30 @@ static void cypress_set_packet_size(struct psmouse *psmouse, unsigned int n)
 	cytp->pkt_size = n;
 }
 
-static const unsigned char cytp_rate[] = {10, 20, 40, 60, 100, 200};
-static const unsigned char cytp_resolution[] = {0x00, 0x01, 0x02, 0x03};
+static const u8 cytp_rate[] = {10, 20, 40, 60, 100, 200};
+static const u8 cytp_resolution[] = {0x00, 0x01, 0x02, 0x03};
 
-static int cypress_ps2_sendbyte(struct psmouse *psmouse, int value)
+static int cypress_ps2_sendbyte(struct psmouse *psmouse, u8 cmd)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	int error;
 
-	error = ps2_sendbyte(ps2dev, value & 0xff, CYTP_CMD_TIMEOUT);
+	error = ps2_sendbyte(ps2dev, cmd, CYTP_CMD_TIMEOUT);
 	if (error) {
 		psmouse_dbg(psmouse,
 			    "sending command 0x%02x failed, resp 0x%02x, error %d\n",
-			    value & 0xff, ps2dev->nak, error);
+			    cmd, ps2dev->nak, error);
 		return error;
 	}
 
 #ifdef CYTP_DEBUG_VERBOSE
-	psmouse_dbg(psmouse, "sending command 0x%02x succeeded, resp 0xfa\n",
-			value & 0xff);
+	psmouse_dbg(psmouse, "sending command 0x%02x succeeded\n", cmd);
 #endif
 
 	return 0;
 }
 
-static int cypress_ps2_ext_cmd(struct psmouse *psmouse, unsigned short cmd,
-			       unsigned char data)
+static int cypress_ps2_ext_cmd(struct psmouse *psmouse, u8 prefix, u8 nibble)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	int tries = CYTP_PS2_CMD_TRIES;
@@ -71,7 +69,7 @@ static int cypress_ps2_ext_cmd(struct psmouse *psmouse, unsigned short cmd,
 		 * If sending the command fails, send recovery command
 		 * to make the device return to the ready state.
 		 */
-		rc = cypress_ps2_sendbyte(psmouse, cmd & 0xff);
+		rc = cypress_ps2_sendbyte(psmouse, prefix);
 		if (rc == -EAGAIN) {
 			rc = cypress_ps2_sendbyte(psmouse, 0x00);
 			if (rc == -EAGAIN)
@@ -79,9 +77,9 @@ static int cypress_ps2_ext_cmd(struct psmouse *psmouse, unsigned short cmd,
 		}
 
 		if (!rc) {
-			rc = cypress_ps2_sendbyte(psmouse, data);
+			rc = cypress_ps2_sendbyte(psmouse, nibble);
 			if (rc == -EAGAIN)
-				rc = cypress_ps2_sendbyte(psmouse, data);
+				rc = cypress_ps2_sendbyte(psmouse, nibble);
 
 			if (!rc)
 				break;
@@ -94,8 +92,7 @@ static int cypress_ps2_ext_cmd(struct psmouse *psmouse, unsigned short cmd,
 }
 
 static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
-				       unsigned char cmd,
-				       unsigned char *param)
+				       u8 cmd, u8 *param)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	enum psmouse_state old_state;
@@ -111,7 +108,7 @@ static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
 	pktsize = (cmd == CYTP_CMD_READ_TP_METRICS) ? 8 : 3;
 	memset(param, 0, pktsize);
 
-	rc = cypress_ps2_sendbyte(psmouse, 0xe9);
+	rc = cypress_ps2_sendbyte(psmouse, PSMOUSE_CMD_GETINFO & 0xff);
 	if (rc)
 		goto out;
 
@@ -136,8 +133,7 @@ static int cypress_ps2_read_cmd_status(struct psmouse *psmouse,
 	return rc;
 }
 
-static bool cypress_verify_cmd_state(struct psmouse *psmouse,
-				     unsigned char cmd, unsigned char *param)
+static bool cypress_verify_cmd_state(struct psmouse *psmouse, u8 cmd, u8* param)
 {
 	bool rate_match = false;
 	bool resolution_match = false;
@@ -167,31 +163,24 @@ static bool cypress_verify_cmd_state(struct psmouse *psmouse,
 	return false;
 }
 
-static int cypress_send_ext_cmd(struct psmouse *psmouse, unsigned char cmd,
-				unsigned char *param)
+static int cypress_send_ext_cmd(struct psmouse *psmouse, u8 cmd, u8 *param)
 {
+	u8 cmd_prefix = PSMOUSE_CMD_SETRES & 0xff;
 	int tries = CYTP_PS2_CMD_TRIES;
-	int rc;
+	int error;
 
 	psmouse_dbg(psmouse, "send extension cmd 0x%02x, [%d %d %d %d]\n",
 		 cmd, DECODE_CMD_AA(cmd), DECODE_CMD_BB(cmd),
 		 DECODE_CMD_CC(cmd), DECODE_CMD_DD(cmd));
 
 	do {
-		cypress_ps2_ext_cmd(psmouse,
-				    PSMOUSE_CMD_SETRES, DECODE_CMD_DD(cmd));
-		cypress_ps2_ext_cmd(psmouse,
-				    PSMOUSE_CMD_SETRES, DECODE_CMD_CC(cmd));
-		cypress_ps2_ext_cmd(psmouse,
-				    PSMOUSE_CMD_SETRES, DECODE_CMD_BB(cmd));
-		cypress_ps2_ext_cmd(psmouse,
-				    PSMOUSE_CMD_SETRES, DECODE_CMD_AA(cmd));
-
-		rc = cypress_ps2_read_cmd_status(psmouse, cmd, param);
-		if (rc)
-			continue;
-
-		if (cypress_verify_cmd_state(psmouse, cmd, param))
+		cypress_ps2_ext_cmd(psmouse, cmd_prefix, DECODE_CMD_DD(cmd));
+		cypress_ps2_ext_cmd(psmouse, cmd_prefix, DECODE_CMD_CC(cmd));
+		cypress_ps2_ext_cmd(psmouse, cmd_prefix, DECODE_CMD_BB(cmd));
+		cypress_ps2_ext_cmd(psmouse, cmd_prefix, DECODE_CMD_AA(cmd));
+
+		error = cypress_ps2_read_cmd_status(psmouse, cmd, param);
+		if (!error && cypress_verify_cmd_state(psmouse, cmd, param))
 			return 0;
 
 	} while (--tries > 0);
@@ -201,7 +190,7 @@ static int cypress_send_ext_cmd(struct psmouse *psmouse, unsigned char cmd,
 
 int cypress_detect(struct psmouse *psmouse, bool set_properties)
 {
-	unsigned char param[3];
+	u8 param[3];
 
 	if (cypress_send_ext_cmd(psmouse, CYTP_CMD_READ_CYPRESS_ID, param))
 		return -ENODEV;
@@ -221,7 +210,7 @@ int cypress_detect(struct psmouse *psmouse, bool set_properties)
 static int cypress_read_fw_version(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp = psmouse->private;
-	unsigned char param[3];
+	u8 param[3];
 
 	if (cypress_send_ext_cmd(psmouse, CYTP_CMD_READ_CYPRESS_ID, param))
 		return -ENODEV;
@@ -250,7 +239,7 @@ static int cypress_read_fw_version(struct psmouse *psmouse)
 static int cypress_read_tp_metrics(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp = psmouse->private;
-	unsigned char param[8];
+	u8 param[8];
 
 	/* set default values for tp metrics. */
 	cytp->tp_width = CYTP_DEFAULT_WIDTH;
@@ -338,7 +327,7 @@ static int cypress_query_hardware(struct psmouse *psmouse)
 static int cypress_set_absolute_mode(struct psmouse *psmouse)
 {
 	struct cytp_data *cytp = psmouse->private;
-	unsigned char param[3];
+	u8 param[3];
 	int error;
 
 	error = cypress_send_ext_cmd(psmouse, CYTP_CMD_ABS_WITH_PRESSURE_MODE,
@@ -418,9 +407,9 @@ static int cypress_set_input_params(struct input_dev *input,
 	return 0;
 }
 
-static int cypress_get_finger_count(unsigned char header_byte)
+static int cypress_get_finger_count(u8 header_byte)
 {
-	unsigned char bits6_7;
+	u8 bits6_7;
 	int finger_count;
 
 	bits6_7 = header_byte >> 6;
@@ -445,10 +434,11 @@ static int cypress_get_finger_count(unsigned char header_byte)
 
 
 static int cypress_parse_packet(struct psmouse *psmouse,
-				struct cytp_data *cytp, struct cytp_report_data *report_data)
+				struct cytp_data *cytp,
+				struct cytp_report_data *report_data)
 {
-	unsigned char *packet = psmouse->packet;
-	unsigned char header_byte = packet[0];
+	u8 *packet = psmouse->packet;
+	u8 header_byte = packet[0];
 
 	memset(report_data, 0, sizeof(struct cytp_report_data));
 
@@ -563,7 +553,7 @@ static psmouse_ret_t cypress_validate_byte(struct psmouse *psmouse)
 {
 	int contact_cnt;
 	int index = psmouse->pktcnt - 1;
-	unsigned char *packet = psmouse->packet;
+	u8 *packet = psmouse->packet;
 	struct cytp_data *cytp = psmouse->private;
 
 	if (index < 0 || index > cytp->pkt_size)
-- 
2.45.2.803.g4e1b14247a-goog


