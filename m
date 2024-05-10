Return-Path: <linux-input+bounces-3672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD48C2DAA
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 01:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057081F212AF
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 23:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBFB4F1F2;
	Fri, 10 May 2024 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joshua-dickens-com.20230601.gappssmtp.com header.i=@joshua-dickens-com.20230601.gappssmtp.com header.b="ExfGNFv5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB3918EA1
	for <linux-input@vger.kernel.org>; Fri, 10 May 2024 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715384616; cv=none; b=H9oT7HNDx7VnNPILr2TuZsRafdlyJg8+QlL/wt9fOKzQT8mu2Dv31abbN+VXFJCH8NTmoPKB7AnvEOhpaJM1vV4RWRCGLEiKioOsJ6ZCYCpoRyokfW3vaXBbtPEJPyKeaa5p+LeyueAgVcH902Bw9WiVFO9kpanLq4XXtBaqbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715384616; c=relaxed/simple;
	bh=/tpdzZfc7PfSXuzlIcKQEJNpziCkuy7gOGAd7RDm1JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tprgln06lxiDWEWRMpSXyduqymszgvdOWgnbmDhRuQEuF1B5h7T1cm4H7UXw++7gSEBc98gpbooOPCTGaTdcrwzLCE6VoZbvmR221qJB0pclMMQu9NYRB3GfN7sZjcnlbJuntyfqvF3Y8Sd6YZyBliBahTgwnsGSUbdwHfYsuo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshua-dickens.com; spf=none smtp.mailfrom=joshua-dickens.com; dkim=pass (2048-bit key) header.d=joshua-dickens-com.20230601.gappssmtp.com header.i=@joshua-dickens-com.20230601.gappssmtp.com header.b=ExfGNFv5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshua-dickens.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=joshua-dickens.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so2190100b3a.2
        for <linux-input@vger.kernel.org>; Fri, 10 May 2024 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshua-dickens-com.20230601.gappssmtp.com; s=20230601; t=1715384614; x=1715989414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trGdlosVOWlGVjSJUZ+mMquAep7OtT9u/9p8UqDc47Q=;
        b=ExfGNFv5/0oPGUvG/hb46WVWt0EBRo+pFLW7yFNbdwtRd8ohwaGU5ur6i0sCgA5m+K
         LIVjpSZrqwTLK4Tmh2CKCsl0SCXZt8fF43P0tivb2qFS2g2hskcHU1diKOZzxY1JaLWp
         vTo34xSrVYutIKAebxbHC3G8/MOtcvsXmItJn15KK9KfTR5oEcLmrVMK6GOXt/i6KQTZ
         Vln1TECNk2YTk7E5SkcexkZ4VFQT4szO6Rsd0F65dPVluIN4jT4cbiYuQvvtWHMdMHSH
         jkg8sYbY2pYSy+5YzPAzeFahK+2XJQ8emNn+MkHIUG0IcqKLQU6FJxeSBZXkgcsP8/OC
         PPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715384614; x=1715989414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trGdlosVOWlGVjSJUZ+mMquAep7OtT9u/9p8UqDc47Q=;
        b=L2sLC1Otfv2LykrNW2xLdkc6X/ijYVaEPFYNMIbiT+akwX4eaZkbQXC7xIyTTwBvK/
         c/gShuoDUP60L/ij+S291FQAR++F+OI1s030ivPkVNiBaVfW5TE8IxD1ELVEmGn1hkZE
         6t7Nikcu5MEJaALrIM0vMr5v367jGFWNJhT/l6ibIUIUpxnoHWgNGfpUvJ4WUvMN3Aur
         BfLd4/MBJM/wvX0PTV7+iFl7QGZRquhBk8100apvSVfEvPka4pOf0arP9qMO6RwiYSBC
         MbNG73sCsPb7q98olRWkvhp2pbEGVge6u9DZtPANqQXmQ4H0RfOIbL4cIHY4O8T4V1FZ
         A3Ow==
X-Gm-Message-State: AOJu0YxHjKmUN6Atrbp3U9HUiJpkR0EnIkFBWB1glXJUkuyEc9ZESFg9
	qTllBcvujlU0twFiicubBEw0mO/8KGGBNOB2qi2yaw/My/Pxt6ERWZdeuGX8qzejQRRsIpX4rH6
	J9GU=
X-Google-Smtp-Source: AGHT+IGFiWS2j3N1/pGzien1koQe0imcGMuEDntAHWQGeqLsGf7rdmS3cLksCzXSBGIQV0XpAjqwqQ==
X-Received: by 2002:a05:6a00:1407:b0:6ec:fdfe:9bea with SMTP id d2e1a72fcca58-6f4e0347e16mr4347297b3a.26.1715384613819;
        Fri, 10 May 2024 16:43:33 -0700 (PDT)
Received: from fedora.. ([50.46.160.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade2b3sm3450860b3a.115.2024.05.10.16.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 16:43:33 -0700 (PDT)
From: joshua@joshua-dickens.com
X-Google-Original-From: Joshua@Joshua-Dickens.com
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Joshua Dickens <joshua.dickens@wacom.com>
Subject: [PATCH] Input: wacom_w8001: Check for string overflow from strscpy calls
Date: Fri, 10 May 2024 16:43:32 -0700
Message-ID: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Dickens <Joshua@Joshua-Dickens.com>

The strscpy function is able to return an error code when a copy would
overflow the size of the destination. The copy is stopped and the buffer
terminated before overflow actually occurs so it is safe to continue
execution, but we should still produce a warning should this occur.

Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
---
 drivers/input/touchscreen/wacom_w8001.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index 928c5ee3ac36..b8acf196a09a 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -625,7 +625,10 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	/* For backwards-compatibility we compose the basename based on
 	 * capabilities and then just append the tool type
 	 */
-	strscpy(basename, "Wacom Serial", sizeof(basename));
+	if (strscpy(basename, "Wacom Serial", sizeof(basename)) < 0) {
+		dev_warn(&w8001->pen_dev->dev,
+			"String overflow while assembling basename");
+	}
 
 	err_pen = w8001_setup_pen(w8001, basename, sizeof(basename));
 	err_touch = w8001_setup_touch(w8001, basename, sizeof(basename));
@@ -635,7 +638,11 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	if (!err_pen) {
-		strscpy(w8001->pen_name, basename, sizeof(w8001->pen_name));
+		if (strscpy(w8001->pen_name, basename,
+			sizeof(w8001->pen_name)) < 0) {
+			dev_warn(&w8001->pen_dev->dev,
+				"String overflow while assembling pen_name");
+		}
 		strlcat(w8001->pen_name, " Pen", sizeof(w8001->pen_name));
 		input_dev_pen->name = w8001->pen_name;
 
@@ -651,7 +658,11 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	if (!err_touch) {
-		strscpy(w8001->touch_name, basename, sizeof(w8001->touch_name));
+		if (strscpy(w8001->touch_name, basename,
+			sizeof(w8001->touch_name)) < 0) {
+			dev_warn(&w8001->touch_dev->dev,
+				"String overflow while assembling touch_name");
+		}
 		strlcat(w8001->touch_name, " Finger",
 			sizeof(w8001->touch_name));
 		input_dev_touch->name = w8001->touch_name;
-- 
2.45.0


