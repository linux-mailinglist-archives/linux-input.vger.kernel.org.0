Return-Path: <linux-input+bounces-6123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05896AFD4
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19C41C2351A
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AA6823AF;
	Wed,  4 Sep 2024 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz/nGyNx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786DA4DA13;
	Wed,  4 Sep 2024 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424277; cv=none; b=mJOAoesremU49NX3z+nDNemUWABNBQlNRGJJ596QppEKXDysLamiK2x0W6X1RRtbSYZWiN1sVwpEkpg6Ppne6gCU7mK+dI7cSmvGvYo8XirPr8zwwI7UAhLE6P14cbwOBVNKV5Rk8XIEPEZiQW9sQHZX+wQyqjL5wS+Emu0kV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424277; c=relaxed/simple;
	bh=jlqX7lEvPPP7Gwii7g4gUqajw+l5/BJ/1iZbrTUNHio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1KhMJGaHEAkJgHaFIiBTQrJRJFq+NeSwp2rDCW4ty4o5rxXjSu9nzs5ctPMKt2EvT+HvS2YYEUfuN4GxN0kEHlrWbi2W19hlPjUiCfWw/LN8hvUQyG8ynm+pqOfOJDJiv2dqQgluhSLfSpdcnDpu7m5Lx9MA8Rwmb+v1XQJMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz/nGyNx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2059204f448so18647235ad.0;
        Tue, 03 Sep 2024 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424275; x=1726029075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuvbdLqDOw3GR1ip2WHJLn3qAyxYmXThLI8hRYt2OZ4=;
        b=gz/nGyNxjKf2uUQ61xDE8c/IbdunZ9s1C+v6KVAKqIgwoG9hwoGmXACmZkrOcFY0mD
         0RVAJ3ViSEqlOl2KKQOeFqWLpJxoN6bev8GC9HioMCcqvf2BIUUR2wgKWjmN7K/AvFQu
         S3Y0g1qI7tTZQkTXsX+NFJm+T3/gmen2EIhYB4r0hsTy3nubYzsSbTaEdQfQbIR8+waJ
         gqbMXMkTbGeJa6oCuF+9kQkIaHZzazq11ibzeast7KW1eSGOaXkpiovlc2PlmWfT2WCP
         /oKZQpTbeqhtJZ/DeD5Ku4FYsldwgkhhPAnzKqdjxRDPWaNlNd9GPi9nC9UNNg9w/cYt
         pdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424275; x=1726029075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuvbdLqDOw3GR1ip2WHJLn3qAyxYmXThLI8hRYt2OZ4=;
        b=AGgqUtdpJ8Q5+B+h6/UEOIdwxxwr21Eil5q0Kiqpe6hnhiOyiovkpU0Xmg50szVY6m
         hHyZsb24n7I3lth9fu7h247QJazXGbWIJuitx5+b2QsnLvOfxG2Houwoss2YcJuJ+gu2
         EjN51ya8LZKg/yYR1Ot01E5YlfXkV4NtKlDZpDnSO5BzYLxkOfa2Z4L2jCaDCK/HWrc9
         nqrvHSHnGAxYKMwA4FPGl/KkxJuG/ThAc276aZkypiCPiXL3YunEJNUwQteOiY1iPzbF
         4DXKg1KOi3XM5YNhm+wgjlUtaNCx18pdYA9sbo0Ohytkv5KG7qwPf7sgCIshJ/ErMnL0
         PEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgdY0Kkqr0RHDoMT1YECZhiDlLnLtCRDrJP4vGWJW1XjZSYhzX/ASC3EGHZOwIH9p9AsvU+peDMtZUx+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZbdJFcy4F748ZSlMDXa3v3ZfmFyZdh/h4sXIP/LcGHFz6KlQ
	mEr4Iz3MafIO/d0Qz70eU24+x3G1LjGnSXQ4dZmrAqTwUNsrYaEJU3qv/A==
X-Google-Smtp-Source: AGHT+IF/fOXrTzItgYgQEqWVhU4cjrRoZX8g/kHy1+pt1MNXw6HrR0jRWbQBtZAPz5aYoQy1olu10w==
X-Received: by 2002:a17:903:292:b0:1fd:9d0c:998c with SMTP id d9443c01a7336-205447a43e5mr107822345ad.56.1725424275130;
        Tue, 03 Sep 2024 21:31:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] Input: db9 - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:30:58 -0700
Message-ID: <20240904043104.1030257-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/db9.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
index 682a29c27832..7ac0cfc3e786 100644
--- a/drivers/input/joystick/db9.c
+++ b/drivers/input/joystick/db9.c
@@ -505,24 +505,22 @@ static int db9_open(struct input_dev *dev)
 {
 	struct db9 *db9 = input_get_drvdata(dev);
 	struct parport *port = db9->pd->port;
-	int err;
 
-	err = mutex_lock_interruptible(&db9->mutex);
-	if (err)
-		return err;
-
-	if (!db9->used++) {
-		parport_claim(db9->pd);
-		parport_write_data(port, 0xff);
-		if (db9_modes[db9->mode].reverse) {
-			parport_data_reverse(port);
-			parport_write_control(port, DB9_NORMAL);
+	scoped_guard(mutex_intr, &db9->mutex) {
+		if (!db9->used++) {
+			parport_claim(db9->pd);
+			parport_write_data(port, 0xff);
+			if (db9_modes[db9->mode].reverse) {
+				parport_data_reverse(port);
+				parport_write_control(port, DB9_NORMAL);
+			}
+			mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
 		}
-		mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
+
+		return 0;
 	}
 
-	mutex_unlock(&db9->mutex);
-	return 0;
+	return -EINTR;
 }
 
 static void db9_close(struct input_dev *dev)
@@ -530,14 +528,14 @@ static void db9_close(struct input_dev *dev)
 	struct db9 *db9 = input_get_drvdata(dev);
 	struct parport *port = db9->pd->port;
 
-	mutex_lock(&db9->mutex);
+	guard(mutex)(&db9->mutex);
+
 	if (!--db9->used) {
 		del_timer_sync(&db9->timer);
 		parport_write_control(port, 0x00);
 		parport_data_forward(port);
 		parport_release(db9->pd);
 	}
-	mutex_unlock(&db9->mutex);
 }
 
 static void db9_attach(struct parport *pp)
-- 
2.46.0.469.g59c65b2a67-goog


