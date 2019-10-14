Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A16ED58FD
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbfJNAW6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45744 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfJNAW6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:58 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so34192049iot.12
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBVWVEdkboPAA3iihI+JJu9nacCyjjXiF867XSdRscM=;
        b=ab5DdCD/lp72FHZXfX2AtAheuVtJi63SQxOzOWqZ7zphibN9/5IB8KYLzfkpu5F4AK
         7wfulWIvB6ARabxkSQd4UhpMjrfk/kHsiCZqrjlGrY0qG1mk58LNY3w/ZhScDjvjcOWF
         qtNMDUdNSt6mWzLg1OO/LDZU2dWHMEkCktv3wQ4j41598muGLcyL0w2Kw6tCdGQ2gV/H
         tFFsaibA3GD43F6ro1n1uxi5QgmLmZEYzmpuKF6xU3sk7R5nrfbpFC7uf2S6dw6Ma6gE
         cnFYSlwvbV3vPIW20aRZmVBecZ28l1NTBwJXd2WtgI4HaSXyQtJd6f25Jlo6DaJP2USj
         E7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBVWVEdkboPAA3iihI+JJu9nacCyjjXiF867XSdRscM=;
        b=cN3FK7psddPBtsVu9utp2cmqZFBBZfhoTQhY9xeeoNP5yqs05e+ynLOTtvm+BGCJop
         IsjlDOM5nAvDH2xEdOOALtD3OhEgI20bnQpUOGaRGQnCSWzTveoJl1uGKk7JzZp0lNRb
         nDaVpdm4tTsbWIOzoLsqebXejW7YsdWSyeqwAV4r67bIOFI82UO9QkeUUY9y4IV/B6XO
         6qX4hps5GXfibyF1xOKqGtayF18fVSu2gTq/mJnZxNfPfm2EfidFnJ9VEITK+8WpIjqA
         WLhJFPVHch5Tln1cgxaW0TiloFqEw/sb8oJYBrooJfUIGhKt4/uCNmY5nqNbxM6wcQWL
         aNMg==
X-Gm-Message-State: APjAAAUvkHUE/pmTG6QcUXViUx4ruDai1mJ9uNdyEp5bZsgimgUmCP6d
        US3cdLXNnukRCaD2qHDJDJNjc0hztqU=
X-Google-Smtp-Source: APXvYqwGvVOcXRerGQVwXSN0BvMucxW5Y9C75RPh4LCpBk+SNPJp9dTFMTDmKlLXlf76eeUCWQHG6g==
X-Received: by 2002:a02:40c6:: with SMTP id n189mr34933660jaa.121.1571012575715;
        Sun, 13 Oct 2019 17:22:55 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:55 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 9/9] HID: nintendo: patch hw version for userspace HID mappings
Date:   Sun, 13 Oct 2019 19:22:41 -0500
Message-Id: <20191014002241.2560195-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014002241.2560195-1-djogorchock@gmail.com>
References: <20191014002241.2560195-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index 333d1e0d07d6..2992a0d6831c 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1361,6 +1361,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.23.0

