Return-Path: <linux-input+bounces-5848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F195E219
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD071C2125C
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA8E2CCB7;
	Sun, 25 Aug 2024 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iexwCyFr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3B1D69E;
	Sun, 25 Aug 2024 05:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563568; cv=none; b=tJwkEO3JO8vO5Uk5b4uIKTZVRq+zBeoT9yKyoEcBhc2CZ8nUpnLtM6ECEbKTrC1bPTabiasZgc3Eu0VWdFnuchOYtiBam2on6pXf+9lcQM92I48Q7rrmLrfFf7bDK0W8LzpxX7TEZ9k4x4VF8p4btDphXZ8RdqjnVyw3zgIsFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563568; c=relaxed/simple;
	bh=07+Ryy0JkGurLBiLujsncnmnwWHpRqDb/NjlKAE+N2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ik4QbG46ivTZIHpztrvFwEioU0xU8GwHFbON5Ltygu8ziiHWtsiZXeaDdLE0fDjuKT2OskoRiuTUtKgpLSIa77fLKAJC8xlKm9RV6Vl8XmciARkGNpXKbuF5g55ehJenElk3ueWRnD68Tz5Mq+oGqvh1AdspZhD3zTWrfY0PoEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iexwCyFr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc47abc040so27857995ad.0;
        Sat, 24 Aug 2024 22:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563567; x=1725168367; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/LtAaIvBgcmQw+ekF0vlg2mZWZG07niT6YfE2QREmg=;
        b=iexwCyFrXnQQazJTG341iTgRyH2T6HuwO3m59LFW8mxZUXQQuHt9OuObTgjQxeLqm5
         QBG1lDaunpshf0O5ws85I6g+hfnMi8BLxvAsfbrVUl2kJvygRC5Qyxg6jICFTv49tDEW
         n46tB1ezpDR+fsqehkgaaCXG3aEC2IiVbO7icqT5o7FPTN2GOjaqAJu1PxrsVRa0RzSO
         TVvg6pANr4epdA/f/DxZ1h/oaNOioxxqho8N/vq1L3piudCc209/yM/WZIC4LdaipcDT
         7LdYpWL8yssG3edhKkTpz+x59aiBl32izETa6u9jsiCXcpP3Ao8q0H+fcmlX8ZG4Sb+V
         +zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563567; x=1725168367;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/LtAaIvBgcmQw+ekF0vlg2mZWZG07niT6YfE2QREmg=;
        b=Q2Avnrjrv1gP+mxaZMRyCDlud9Z/xIUSUI4L3m0SQoKGhOmA+3K35n+gwvC9DuKVs7
         OjweR7NFU54PhBDiGf+f+H1C+y62TOOntr43i5YtdCtheZH7bIu0B2XIa+KeY8IBtESb
         SzE4cRyTbtSeOGxWlKfIz0rSWIzNHsHkj2WlReHNMv9cQlWG5eiksancBXpu6lSLTfnG
         tpcHSLh9BhxHkkdQjdIIAq4u5wyhSnilssfehy0JD+3jjPeBYHjnVuJu7WBac1v13j8N
         2Mm99P2AQsBmWBiT5at8XeBHbLMTAV2/nnvFINVnxO5VKvrfX+87ypwusb3e6gPYJska
         l/4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFO9c71HWQMPfWrrERf9Ms+2dQ+iW4OFHBTbpf5GZZ39Y6A0JmPv2Oro9dcNVG4L/SRJ0iStz/saUHzPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXbnT4k9IBL+X/wWOgFKJpwpzMvXehWhXX4K2TNbXLdyE4TAf
	L3oSwrvKro7frScuQcEsEsdOn/EKFRQle7pWtMauL41II4FnPWeG
X-Google-Smtp-Source: AGHT+IHGsZU6S+O83iGx8zwcyCIqyDnwbHQ4O5YCyolqwh5kPT5YVWQUD94X3mceyKzPpCRKi5znPQ==
X-Received: by 2002:a17:903:228c:b0:203:a154:e23f with SMTP id d9443c01a7336-203a154e269mr99419355ad.2.1724563566481;
        Sat, 24 Aug 2024 22:26:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dc2d1sm49433805ad.158.2024.08.24.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:26:06 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:26:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: psmouse-smbus - use guard notation when acquiring
 mutex
Message-ID: <ZsrAa9XcDvHeIs9T@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/psmouse-smbus.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
index 2a2459b1b4f2..93420f07b7d0 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -35,7 +35,7 @@ static void psmouse_smbus_check_adapter(struct i2c_adapter *adapter)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
 		return;
 
-	mutex_lock(&psmouse_smbus_mutex);
+	guard(mutex)(&psmouse_smbus_mutex);
 
 	list_for_each_entry(smbdev, &psmouse_smbus_list, node) {
 		if (smbdev->dead)
@@ -55,15 +55,13 @@ static void psmouse_smbus_check_adapter(struct i2c_adapter *adapter)
 			    "SMBus candidate adapter appeared, triggering rescan\n");
 		serio_rescan(smbdev->psmouse->ps2dev.serio);
 	}
-
-	mutex_unlock(&psmouse_smbus_mutex);
 }
 
 static void psmouse_smbus_detach_i2c_client(struct i2c_client *client)
 {
 	struct psmouse_smbus_dev *smbdev, *tmp;
 
-	mutex_lock(&psmouse_smbus_mutex);
+	guard(mutex)(&psmouse_smbus_mutex);
 
 	list_for_each_entry_safe(smbdev, tmp, &psmouse_smbus_list, node) {
 		if (smbdev->client != client)
@@ -85,8 +83,6 @@ static void psmouse_smbus_detach_i2c_client(struct i2c_client *client)
 			kfree(smbdev);
 		}
 	}
-
-	mutex_unlock(&psmouse_smbus_mutex);
 }
 
 static int psmouse_smbus_notifier_call(struct notifier_block *nb,
@@ -171,7 +167,7 @@ static void psmouse_smbus_disconnect(struct psmouse *psmouse)
 {
 	struct psmouse_smbus_dev *smbdev = psmouse->private;
 
-	mutex_lock(&psmouse_smbus_mutex);
+	guard(mutex)(&psmouse_smbus_mutex);
 
 	if (smbdev->dead) {
 		list_del(&smbdev->node);
@@ -186,8 +182,6 @@ static void psmouse_smbus_disconnect(struct psmouse *psmouse)
 		psmouse_smbus_schedule_remove(smbdev->client);
 	}
 
-	mutex_unlock(&psmouse_smbus_mutex);
-
 	psmouse->private = NULL;
 }
 
@@ -219,7 +213,7 @@ void psmouse_smbus_cleanup(struct psmouse *psmouse)
 {
 	struct psmouse_smbus_dev *smbdev, *tmp;
 
-	mutex_lock(&psmouse_smbus_mutex);
+	guard(mutex)(&psmouse_smbus_mutex);
 
 	list_for_each_entry_safe(smbdev, tmp, &psmouse_smbus_list, node) {
 		if (psmouse == smbdev->psmouse) {
@@ -227,8 +221,6 @@ void psmouse_smbus_cleanup(struct psmouse *psmouse)
 			kfree(smbdev);
 		}
 	}
-
-	mutex_unlock(&psmouse_smbus_mutex);
 }
 
 int psmouse_smbus_init(struct psmouse *psmouse,
@@ -267,9 +259,9 @@ int psmouse_smbus_init(struct psmouse *psmouse,
 	psmouse->disconnect = psmouse_smbus_disconnect;
 	psmouse->resync_time = 0;
 
-	mutex_lock(&psmouse_smbus_mutex);
-	list_add_tail(&smbdev->node, &psmouse_smbus_list);
-	mutex_unlock(&psmouse_smbus_mutex);
+	scoped_guard(mutex, &psmouse_smbus_mutex) {
+		list_add_tail(&smbdev->node, &psmouse_smbus_list);
+	}
 
 	/* Bind to already existing adapters right away */
 	error = i2c_for_each_dev(smbdev, psmouse_smbus_create_companion);
@@ -293,9 +285,9 @@ int psmouse_smbus_init(struct psmouse *psmouse,
 	smbdev->board.platform_data = NULL;
 
 	if (error < 0 || !leave_breadcrumbs) {
-		mutex_lock(&psmouse_smbus_mutex);
-		list_del(&smbdev->node);
-		mutex_unlock(&psmouse_smbus_mutex);
+		scoped_guard(mutex, &psmouse_smbus_mutex) {
+			list_del(&smbdev->node);
+		}
 
 		kfree(smbdev);
 	}
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry

