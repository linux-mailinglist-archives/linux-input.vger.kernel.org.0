Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01CA38B9A4
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhETWtA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhETWtA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:49:00 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4085EC061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:38 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id c13so8316156qvx.5
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7HnBAp7taX5fj/Y22sbYFru4HazAxOE4r4kpPAXFtzo=;
        b=BohA+CGGM1crQPfequOhgQ1f7ho8fPDoK6d5YBJMSd2kN+oAC6UMbWb7LHCLCCLStW
         SBJMs0VyRFsyye3QTnuyE01FFb+pIDxYk5c3EQZhAhjFVOzqB85D7TY/BWC2PJkCgyck
         8STS7A/4JbDXFJx1ReMlr0cwsl8+WjGMXNboV55xvJDQ+nf9AzPYTeM10WWkubgrJWow
         EY42BT1b6MI9zOLqC5Z3ExFCJMRr4xK9b+10poJvPPqMwzNF8GygOAk4e+5l8wfA0xKJ
         pgrqwq0m50LC9Ixvrgaezzx/HxevJlvxkNWvpKdV5elO0T894O7Nks+kgcpic//913Zw
         6IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7HnBAp7taX5fj/Y22sbYFru4HazAxOE4r4kpPAXFtzo=;
        b=VdGXC87ZkENIxBFTbdxtb40d8JBXgO8ne439fos7c6uduZTIzPEMiOdvRbWIK9XrDF
         0L/6qXBU+9480+3gZ3JqLvV5EPE3AhahBJbVCC5rN5XsSCsoVF59zjn7vvQt4ay4Oq0I
         FMow6wiIWkAK9PolAw6bGUUHnaHLuqmkDlCyUrtOctrUlSZTK25UtYNUHshMYxWVP3Tc
         NzgHPIO+Q4JHM+/9g2pV4c07J7ZXG9ri7Xp5dTUI5AYq52LAswczfst+pPlBv7p5iC3Q
         Ih6bNw0sHtYj5x00vmySqE7S3QulLs6iioOXpyFUnJr3APLezcwjZeY53Gw97MikimQT
         jJig==
X-Gm-Message-State: AOAM53148wavOPe2689nfi4iXD8NlUFVM5K4L90fBcQDoxhxmTMIUsSY
        l0v/qUnv6LebyNWNjWNazVHCNDHWda5zHg==
X-Google-Smtp-Source: ABdhPJwQpwg59lwyiMgQMAJzrWflDs5b3Jkoqb8q9/jqKn1RDe3qw1Dph4AGGIIMdRewTeSP/cpChQ==
X-Received: by 2002:a05:6214:702:: with SMTP id b2mr7490376qvz.43.1621550857372;
        Thu, 20 May 2021 15:47:37 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:36 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 09/15] HID: nintendo: patch hw version for userspace HID mappings
Date:   Thu, 20 May 2021 18:47:09 -0400
Message-Id: <20210520224715.680919-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch sets the most significant bit of the hid hw version to allow
userspace to distinguish between this driver's input mappings vs. the
default hid mappings. This prevents breaking userspace applications that
use SDL2 for gamepad input, allowing them to distinguish the mappings
based on the version.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 15cdcd9ef4f54..2eee21f275c9d 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1421,6 +1421,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_wq;
 	}
 
+	/*
+	 * Patch the hw version of pro controller/joycons, so applications can
+	 * distinguish between the default HID mappings and the mappings defined
+	 * by the Linux game controller spec. This is important for the SDL2
+	 * library, which has a game controller database, which uses device ids
+	 * in combination with version as a key.
+	 */
+	hdev->version |= 0x8000;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
 	if (ret) {
 		hid_err(hdev, "HW start failed\n");
-- 
2.31.1

