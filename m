Return-Path: <linux-input+bounces-3351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5A8B8BA0
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 16:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516221F21826
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E4212E1F7;
	Wed,  1 May 2024 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OPqw6FoH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA0433D4
	for <linux-input@vger.kernel.org>; Wed,  1 May 2024 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714572186; cv=none; b=HJKh7kqLo1RzYJQYJCbuv4gP4xc8pGQSLAlnfE5Vqf7Uu0y5ep6PKKfZh0ro6OT6580kSemHVKN9c3mfqVp1rHALO4oCB9+A4b3aNIVZE0J6ogS8wok+WFhMAg4Fie1RhYDu6NEfxfrsNLIh2VD2SUFHuPYBO9uk+4dCW+Znguk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714572186; c=relaxed/simple;
	bh=hflhYB4Noj4nERICqWqd6RQ5KHGcpSWf8R1+rSb3bnQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=E7KdafJVVmZzUj19wWflvDxiDzivDPw8cb+rMUmZYMqdTU7gzASJ/zcfGKjU3ZKAaF3Epo0Xa6NutVAPDzWWIs3//9WewP8uCaExEpWyjGB9NCtZikERVVlc94LncP7KWhpW2vl726rNBYvrd//KkDX5fR6w2vLVK0a/vKRJ6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OPqw6FoH; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-7ded69927d4so269210839f.2
        for <linux-input@vger.kernel.org>; Wed, 01 May 2024 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714572184; x=1715176984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WEz7e1nQ37hCn/3Xwr+FGVChoRELfC0yh3iJRprUV14=;
        b=OPqw6FoHZzr/b7RVyXVf9O2zlSARYPggemxysk6k1oDULs2scfW7pnDbT0DonJeUqW
         qXPx2WEz3lWL0Q7bpqswqLMCI67hxm6JNMNItHnMojU5zcc2TZYkN7Np0ayvuH1vWA/A
         5zFSrEdcoacb7rBsGsTRtetGgOk8zj/b5YqJPXUBCTOOJvdwzOkFlbWIOOKoSaYS6gLE
         ZSrl6kjRcv6gzzcnj825RwwC4Mu1ymTlJjkZBt+GvgJi0j2W6E1KLoMVSnDgX5u/Ib97
         utIsPhTrl+txJWndBXXsO7tHTPmLrV7DNpkDnJuejJsE8n3LXYbY4mXVMEHAs4V2oARC
         e/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714572184; x=1715176984;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEz7e1nQ37hCn/3Xwr+FGVChoRELfC0yh3iJRprUV14=;
        b=S2MHt9Nf1FQKJOjyRhFDW+LN9TWqMctWQudzKqn+LFiI9SNg+DUyI2V+lDRDsKAEFK
         jLhskRzjYHGW9dfjeyqq1UcwYua5mft3IG9sMoyKJF12GwF9AkAS1da39/vFmEKk2kHc
         VoUsSQqtu4FWA4gQge5Ob6I4175BytMxnK0vUAzrxShaqQiT/OLUXRlCQrCJ9PR6GQ7Q
         facS0zQDjv6xx5EgxVWzVhRwwmtxk+2TRR3Yr7kSiuoOgVH+3GvGFEs9Ko/dM41Oe5d6
         KbYJ/zEIAbKN5r7xcEJT1uT6rB2ocXMl55LysjhQ/q5GWC/HXnEPqAXxKT1V41Y8hy06
         rhJA==
X-Gm-Message-State: AOJu0YzAi3x0EDr/pBV4CHOszzsCYXuR6rVC+sUVkNyG4cROBMDBP1Yt
	WHbuqaoGaek91uto/ce+4Dzu9WaqccV/Ij2seVIJkpU1ihIjMcxm4SiD8tQJy1AOstIZaD52g1K
	6fluA9g==
X-Google-Smtp-Source: AGHT+IGTruoJbxEag2Zphrnj9aAkedb6FDf5j2791xk6DWblhokX7i4TGzOYSlerpjVnCD5w2qDi9foKJuQj
X-Received: from dynamight.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:17a])
 (user=jdenose job=sendgmr) by 2002:a05:6638:8c15:b0:487:8cf0:df03 with SMTP
 id jl21-20020a0566388c1500b004878cf0df03mr77559jab.5.1714572184397; Wed, 01
 May 2024 07:03:04 -0700 (PDT)
Date: Wed,  1 May 2024 14:02:32 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240501140231.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid>
Subject: [PATCH] Input: elantech - fix touchpad state on resume for Lenovo N24
From: Jonathan Denose <jdenose@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jeffery Miller <jefferymiller@google.com>
Content-Type: text/plain; charset="UTF-8"

The Lenovo N24 on resume becomes stuck in a state where it
sends incorrect packets, causing elantech_packet_check_v4 to fail.
The only way for the device to resume sending the correct packets is for
it to be disabled and then re-enabled.

This change adds a dmi check to trigger this behavior on resume.
Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/input/mouse/elantech.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 4e38229404b4b..e0f3095b4227e 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1476,6 +1476,23 @@ static void elantech_disconnect(struct psmouse *psmouse)
 	psmouse->private = NULL;
 }
 
+/*
+ * Some hw_version 4 models fail to properly activate absolute mode on
+ * resume without going through disable/enable cycle.
+ */
+static const struct dmi_system_id elantech_needs_reenable[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		/* Lenovo N24 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "81AF"),
+		},
+	},
+#endif
+	{ }
+};
+
 /*
  * Put the touchpad back into absolute mode when reconnecting
  */
@@ -1486,6 +1503,22 @@ static int elantech_reconnect(struct psmouse *psmouse)
 	if (elantech_detect(psmouse, 0))
 		return -1;
 
+	if (dmi_check_system(elantech_needs_reenable)) {
+		int err;
+
+		err = ps2_sendbyte(&psmouse->ps2dev, PSMOUSE_CMD_DISABLE, NULL);
+
+		if (err)
+			psmouse_warn(psmouse, "Failed to deactivate mouse on %s: %d\n",
+					psmouse->ps2dev.serio->phys, err);
+
+		err = ps2_sendbyte(&psmouse->ps2dev, PSMOUSE_CMD_ENABLE, NULL);
+
+		if (err)
+			psmouse_warn(psmouse, "Failed to reactivate mouse on %s: %d\n",
+					psmouse->ps2dev.serio->phys, err);
+	}
+
 	if (elantech_set_absolute_mode(psmouse)) {
 		psmouse_err(psmouse,
 			    "failed to put touchpad back into absolute mode.\n");
-- 
2.45.0.rc0.197.gbae5840b3b-goog


