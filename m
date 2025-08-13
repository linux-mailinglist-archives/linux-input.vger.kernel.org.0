Return-Path: <linux-input+bounces-13996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCFB2545C
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCDD1C857BE
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D652FD7BA;
	Wed, 13 Aug 2025 20:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVvX2CNg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71B299947
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115825; cv=none; b=kwUUk4nnkPmjhuevguZd/GivSUCgOmNqv20JCdaAc7bNujLZ6IeOnMj8GWel9ZLz/4+heofaifwp6iWu2jCNgn1mVHeVCtZ/0OeGM6M9AbFss065eW1msivshWudFWZEOeafm+iq0RCAFp/oMaijGvsRZxny14LJlcNuCYR1fx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115825; c=relaxed/simple;
	bh=3BxJxZXbB5unfYwnDzhxIoXz6yB5FGiS4IgugSmolxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6imkgWtsTI2qtHB/3j3aCa5QRwdpbo8AXuyDhojK5AaXDyZGwNl0xtgKtwawupqYq6KFf7Q/e3oprpxhCHePmUGa32k0XyS5/QNkIpNZyyVxMaTe8v9zHaBAfdu+HuyrB0owokPz9QVQGsU56THVjf5x9fsoygC9wAqkSaen9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVvX2CNg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb79fb221so3183366b.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115822; x=1755720622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0MR75+1AF/iABvrz7m73mqJnwV5J6bUgQ3VjSaYfGs=;
        b=kVvX2CNgHyv7H1sjdtDvMFygNW1S+vHFlxiEdYBt4GIECG8UmqbK5n8CKTJtfNCckG
         AP5hUdDZuYwlpsmUfvTB2RsdxsRotsmZatM2qjWZX53bfi35Vv7iwMfvNVTBWds+Jqvv
         4SapCrfeYaABAyb1YQaue6MjfyzJAYeSFV/Iaa8Ky5+srSPEMfbNzpTH6tghVmEO04Tq
         IlwUVOoHDaNnOW3n7WfwdmnrCRh58+PCpX9Y4bRhVHrtbNpWSHbuS+NyIwrSqFTg9mj3
         sNqya8U+5DpB8cd8NGY1sWHSETN/6GpVQ1692AGtZu9ruFI2bDg+ycnw0YXgJUzjh82v
         8wJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115822; x=1755720622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0MR75+1AF/iABvrz7m73mqJnwV5J6bUgQ3VjSaYfGs=;
        b=QRRYKzzhY4q4RHKg0t0VzwTYAxCRIEnVADUAyuURvGFMBoBQJItam4KbirqI7Iuqdj
         0bbENRQvmBMFfcfI+Wi06m3DTht7xRraIsT1uM4dSlcD7roc8Ux9O/vNZHVQhNr3eHCl
         2tyXzjg9xRZPeq1/9pW4XciCDuiX+yclTYDXwb6VhnuZW/AOLLLT3TEycLdFNM+1ehIb
         my3RrONKGaq6sVECHcA9jnvaLrjZwhQc3ZGvcaENLAmWWbiNF+bGqR1Spu/WnrfdExZa
         +jgq9JFMRC6s/AlBWsZUdg/IL583DCyr9UCdPYgrAg81GIJylbDTUfxWWQvHMKKnclnZ
         H5Og==
X-Forwarded-Encrypted: i=1; AJvYcCW8mWSmgZfESo6qh3N5uxBpCnOEDtPnXnB3MwdyesuSBbdrFE9tvvVFeHo62tD647P+HU6z+mdBcsiv6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+u8LxFHTtdguMyVtgCKcKqE2w/XZ+b9BnZx3RwyCBHKfgTEZ
	gIjuUJsKHMjrRw5B8UVFviLFwQIhC5WtDVoFEbI2bt9DR1qMFZn1isTa
X-Gm-Gg: ASbGncs4U/0K5kN1QWZH7S/EG8d3XcuoHSn0AzquVaKQ+WtXBapfmzlvlgl6F4FipFV
	0MD2+EYA5zFJcMYfRZDnzzdWQ3KAmtwMIYnHpFd9XDXSqYv0EYjsrGWkCXeKZutltihkvJwK45n
	nq6MFC8Jtq0NZIi0LIp6nJxtOtV7A76QlZoxCfyHe33Jqzm7N2W75dbcJFG3H5f4I0yLMv6Ar1W
	duPUUubMEKhyjhwJhLiWiS9DRi0lZYnA9gPwDvx3OdmeS2chgsMvrmawweKng+a1GNfDu9plIZh
	dwBP0qP72weF+NOnaopUWcqHGzXrkhgY3R64jHZCAyjLUIy8++p3AuMiGI5SU+lkUe0oWL+p0sU
	EdWZSSaUOki5Ev+h5vptd4ATLLO/6T+9fdiqJPOwxpfZwQdcXAy7lBycqs41KV1Md2C/54Nh331
	E=
X-Google-Smtp-Source: AGHT+IEeC1Qnat5BCA3h+0oCS1yNEQrHKRml+7xLMDlL2xlH767VWxdNkg/183bNGO5+NVa7+zKH1w==
X-Received: by 2002:a17:907:704:b0:adb:2f16:7ba1 with SMTP id a640c23a62f3a-afcb97f3512mr19910966b.6.1755115821780;
        Wed, 13 Aug 2025 13:10:21 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:21 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 17/17] HID: pidff: Reduce PID_EFFECT_OPERATION spam
Date: Wed, 13 Aug 2025 22:10:05 +0200
Message-ID: <20250813201005.17819-18-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep track of effect's loop_count to reduce the spam of ffb play
commands coming from some games. This should speed up normal magnitude
etc updates and slightly increase max possible FFB refresh rate.

Helps games like Dirt Rally 2.0, F1 2023, WRC from KT

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 36 ++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 50a8924edfcc..0342c0a3f476 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,12 @@ struct pidff_usage {
 	s32 *value;
 };
 
+struct pidff_effect {
+	int pid_id;
+	int is_infinite;
+	unsigned int loop_count;
+};
+
 struct pidff_device {
 	struct hid_device *hid;
 
@@ -202,6 +208,8 @@ struct pidff_device {
 	struct pidff_usage effect_operation[ARRAY_SIZE(pidff_effect_operation)];
 	struct pidff_usage block_free[ARRAY_SIZE(pidff_block_free)];
 
+	struct pidff_effect effect[PID_EFFECTS_MAX];
+
 	/*
 	 * Special field is a field that is not composed of
 	 * usage<->value pairs that pidff_usage values are
@@ -230,8 +238,6 @@ struct pidff_device {
 	int operation_id[ARRAY_SIZE(pidff_effect_operation_status)];
 	int direction_axis_id[ARRAY_SIZE(pidff_direction_axis)];
 
-	int pid_id[PID_EFFECTS_MAX];
-
 	u32 quirks;
 	u8 effect_count;
 	u8 axis_count;
@@ -798,6 +804,12 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 	return -EIO;
 }
 
+static int pidff_needs_playback(struct pidff_device *pidff, int effect_id, int n)
+{
+	return pidff->effect[effect_id].is_infinite ||
+	       pidff->effect[effect_id].loop_count != n;
+}
+
 /*
  * Play the effect with PID id n times
  */
@@ -829,9 +841,14 @@ static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
 
+	if (!pidff_needs_playback(pidff, effect_id, value))
+		return 0;
+
 	hid_dbg(pidff->hid, "requesting %s on FF effect %d",
 		value == 0 ? "stop" : "playback", effect_id);
-	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
+
+	pidff->effect[effect_id].loop_count = value;
+	pidff_playback_pid(pidff, pidff->effect[effect_id].pid_id, value);
 	return 0;
 }
 
@@ -852,10 +869,9 @@ static void pidff_erase_pid(struct pidff_device *pidff, int pid_id)
 static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 {
 	struct pidff_device *pidff = dev->ff->private;
-	int pid_id = pidff->pid_id[effect_id];
+	int pid_id = pidff->effect[effect_id].pid_id;
 
-	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id,
-		pidff->pid_id[effect_id]);
+	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id, pid_id);
 
 	/*
 	 * Wait for the queue to clear. We do not want
@@ -906,12 +922,16 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *new,
 
 		pidff->effect_count++;
 		hid_dbg(pidff->hid, "current effect count: %d", pidff->effect_count);
-		pidff->pid_id[new->id] =
+		pidff->effect[new->id].loop_count = 0;
+		pidff->effect[new->id].pid_id =
 			pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	}
 
+	pidff->effect[new->id].is_infinite =
+		pidff_is_duration_infinite(new->replay.length);
+
 	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] =
-		pidff->pid_id[new->id];
+		pidff->effect[new->id].pid_id;
 
 	PIDFF_SET_REPORT_IF_NEEDED(effect, new, old);
 	switch (new->type) {
-- 
2.50.1


