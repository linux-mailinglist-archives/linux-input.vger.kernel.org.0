Return-Path: <linux-input+bounces-4716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC0291C942
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4681D1C2224F
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D5581AC7;
	Fri, 28 Jun 2024 22:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glDK0p7p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B91878;
	Fri, 28 Jun 2024 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614860; cv=none; b=Lgf1pjGDMyu2XBKHxHcJeZtfBLxk5rmFW+/Ys7ag4CDwao9b1W9cF6xUAEvEfZecZDuI657v8d0YV6RbTd/MAd1aFdys0gKYO1m4ZL5VfTcknRfNQ2JBnglKlXm+gvcUuUpiPr6Iz02E5Qzp5EAWZLFarqGZGxP+sKuXGAnRJa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614860; c=relaxed/simple;
	bh=3HIqvIYUAQL50HyfJ4OI6Kxr8Eqop7cMJtS61eP4Sck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRZ9qmBHU04fde2x7kVMvQ9WwjLLj98/m8oNXjXdltDBWYJKmAO3+FuqKp4MGCCFiTT9mkQ342fKm+0SXhsQ8sgTKbZ0S/yCyl45ItM8UmoUjQHam+vOEk+V+2TjnKpvJaQ22ZV7ObhCpslzAP1cVc+Z5LA+xSnvHED1ePGATYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glDK0p7p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f65a3abd01so8016375ad.3;
        Fri, 28 Jun 2024 15:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719614857; x=1720219657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eru8IeZwD6XePaAEBRnTFg580BiWX6RJC2I+6NuvGFY=;
        b=glDK0p7pitK1kkNqx6o8UwmMDpvXQY+T/v4agcNnQIncNcmCVANCG614cwTRC7Br+N
         gZt7SBFwjTPQIksV/PcjkgQFZx60jEnZ/P2Z+a/y7og/l9k7ShW2aRD9mSZOxT9LOVly
         9OxIks8+8s3SQrUEp1fLN6NIVci58R4DLjP7DoPCT+kUc28jRWN8R+IgkJv/0EzE+l/I
         cDJ3bKDPwfw0bVkENM+ETC9ANUiXJ3KCrACnJJVNga4WsxtnyQiqEoy1pY+zs2u6n0YO
         Y5BwbmC+mOKHVSvMAqUaNw8PhQxxziLQTjTI1apr00LBrsP2nlgUkK66vsX/fgFdoxq5
         VNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614857; x=1720219657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eru8IeZwD6XePaAEBRnTFg580BiWX6RJC2I+6NuvGFY=;
        b=ie4lkF2gmPu2hh+mzX2PToKzDwG3hlizfO3faMf9uX1z3g50jLaUe8ZNMgK75N+2ef
         LpV90VG5FObLzogK01ybjOqGRkrujfs6wdS0jxOB1hw++YJfV6ZnGNIJ4/xoFORzuu/A
         /aTkXkWLQ5JXkMcNPiDlk5afzUCjbUmSl7/Y8iSbBE0R/ZHZAQ0dRdcerZIhnRXmNFZT
         vuQo/5pFYMfQqccNFo9nt+ZTqeTR8jaO3jGPGC8pjETt/rtaO0SLzhAb25k50gUXoNDc
         xKCx4axiW6moBuEFXFlVpqocYiMG69VaOU8EEoVG5VZK7XMkYyyGu5LlnGp5zy725Ydg
         21Mg==
X-Gm-Message-State: AOJu0YzI36alv5I888DIuD3l1NvBMsYIKV86pliXSjw0loiQWrZpgryv
	o73//jqa7jfjmcdZDZ1eB1XRIDu1TxBFUNHnGX3d3R1ejj8DmiZWG6T0AQ==
X-Google-Smtp-Source: AGHT+IGdczk/zd9Cfyxa9Tm4aTvvfasnp2SxFSkrROiPFSDGPpPOAQkOXAnR492T0B/wLaubwvtIAg==
X-Received: by 2002:a05:6a21:99a7:b0:1bd:2d02:b219 with SMTP id adf61e73a8af0-1becd4c0663mr10103866637.1.1719614857163;
        Fri, 28 Jun 2024 15:47:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce58877sm2187163a91.24.2024.06.28.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:47:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Igor Artemiev <Igor.A.Artemiev@mcst.ru>
Subject: [PATCH 2/5] Input: cypress_ps2 - fix error handling when sending command fails
Date: Fri, 28 Jun 2024 15:47:24 -0700
Message-ID: <20240628224728.2180126-2-dmitry.torokhov@gmail.com>
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

Stop layering error handling in cypress_ps2_sendbyte() and simply
pass on error code from ps2_sendbyte() and use it in the callers.

This fixes mishandling of error condition in
cypress_ps2_read_cmd_status() which expects errors to be negative.

Reported-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cypress_ps2.c | 32 +++++++++++++++----------------
 drivers/input/mouse/cypress_ps2.h |  6 ------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index 32b55b2b9b76..fcc3921e49e0 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -38,15 +38,14 @@ static const unsigned char cytp_resolution[] = {0x00, 0x01, 0x02, 0x03};
 static int cypress_ps2_sendbyte(struct psmouse *psmouse, int value)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	int error;
 
-	if (ps2_sendbyte(ps2dev, value & 0xff, CYTP_CMD_TIMEOUT) < 0) {
+	error = ps2_sendbyte(ps2dev, value & 0xff, CYTP_CMD_TIMEOUT);
+	if (error) {
 		psmouse_dbg(psmouse,
-				"sending command 0x%02x failed, resp 0x%02x\n",
-				value & 0xff, ps2dev->nak);
-		if (ps2dev->nak == CYTP_PS2_RETRY)
-			return CYTP_PS2_RETRY;
-		else
-			return CYTP_PS2_ERROR;
+			    "sending command 0x%02x failed, resp 0x%02x, error %d\n",
+			    value & 0xff, ps2dev->nak, error);
+		return error;
 	}
 
 #ifdef CYTP_DEBUG_VERBOSE
@@ -73,21 +72,20 @@ static int cypress_ps2_ext_cmd(struct psmouse *psmouse, unsigned short cmd,
 		 * to make the device return to the ready state.
 		 */
 		rc = cypress_ps2_sendbyte(psmouse, cmd & 0xff);
-		if (rc == CYTP_PS2_RETRY) {
+		if (rc == -EAGAIN) {
 			rc = cypress_ps2_sendbyte(psmouse, 0x00);
-			if (rc == CYTP_PS2_RETRY)
+			if (rc == -EAGAIN)
 				rc = cypress_ps2_sendbyte(psmouse, 0x0a);
 		}
-		if (rc == CYTP_PS2_ERROR)
-			continue;
 
-		rc = cypress_ps2_sendbyte(psmouse, data);
-		if (rc == CYTP_PS2_RETRY)
+		if (!rc) {
 			rc = cypress_ps2_sendbyte(psmouse, data);
-		if (rc == CYTP_PS2_ERROR)
-			continue;
-		else
-			break;
+			if (rc == -EAGAIN)
+				rc = cypress_ps2_sendbyte(psmouse, data);
+
+			if (!rc)
+				break;
+		}
 	} while (--tries > 0);
 
 	ps2_end_command(ps2dev);
diff --git a/drivers/input/mouse/cypress_ps2.h b/drivers/input/mouse/cypress_ps2.h
index bb4979d06bf9..47d538a49089 100644
--- a/drivers/input/mouse/cypress_ps2.h
+++ b/drivers/input/mouse/cypress_ps2.h
@@ -72,12 +72,6 @@
 #define CYTP_DATA_TIMEOUT 30
 
 #define CYTP_EXT_CMD   0xe8
-#define CYTP_PS2_RETRY 0xfe
-#define CYTP_PS2_ERROR 0xfc
-
-#define CYTP_RESP_RETRY 0x01
-#define CYTP_RESP_ERROR 0xfe
-
 
 #define CYTP_105001_WIDTH  97   /* Dell XPS 13 */
 #define CYTP_105001_HIGH   59
-- 
2.45.2.803.g4e1b14247a-goog


