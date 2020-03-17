Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059A9187833
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgCQDaL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:11 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41194 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgCQDaL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:11 -0400
Received: by mail-qk1-f195.google.com with SMTP id s11so18915576qks.8
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4SuxFzsLcTGM1fQnkRfGx9GWJd0jDvAiq3Xt29QHDA=;
        b=VHT56xDeTBi7hpVZAtZAfs2pCAXq1p+OijCUx1HN1qHTqSiWXhsp6xhHcAggSzuzS0
         kOuJ6oWm58wj+KtlRa4++X+rJIAOr6L1+wZAkZa1MtiIuBh5CaVFeKCTQCxf1FD+EpW/
         9IJACGpw//8POThwwOrigvNnAfXMxFnheSmJ1p3Ub4Jbh7DNX+IRGSi4ESdPPkWjCO8i
         UkvF0nviPtkjRDfbgiKlLipn1WaQjG0/26/in1gq0UP8tJ4PZb5Y198WRgR48TVTVX3+
         UQwQfqqAb/gg3jPITVJ3qfSt0UMaC8akcsiZiC+BonNd73oEynTmWInzm8cTRR/96QcW
         18Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4SuxFzsLcTGM1fQnkRfGx9GWJd0jDvAiq3Xt29QHDA=;
        b=jLxSUITLZVwzmMIf9AQzsB7EM8KcG3ZtoB98Dne4sZXD/qeNtxpMAUATksBn1WVo0W
         sQdPotxczmwKZ1Lw3Fvv2seSI90nvdRiPlX0AFg0Kzdb28VTEmKPmpym0FzZ6P0L32mS
         3/ihyrLvpbMp2SFR7zEcvD9jPKV1u/XjM7D5RtQXnidvwrSbRpcz4gIxxYuqgq4vWHXf
         PEFOMQEw/mYrwE1cHnpEXkFzGqe1N9o+u/Gk3lV7RuCfQPtPuSa4orSDva1+1fBuGO3f
         /2+Z37JxC1vrCMWJXdVKkw8SAXXPY3RUmTFSa7kHyzmB2VRhkEfbcXVMummZ+rwU60ZL
         jY/w==
X-Gm-Message-State: ANhLgQ3ORM8+ONwf665QmKMxlta0i7N17ma97g+XzsZQzmk2h9JQcdUv
        0PQ3ABfY0p7OusmIrn5gD88ws1K4ajg=
X-Google-Smtp-Source: ADFU+vsTH9mh7FpyJL+6aTn+IeLdeSyKIoHTFjISx3EDkt1StENuO4UGar8bn3vk4AsYdVEJqm4KUQ==
X-Received: by 2002:ae9:efd0:: with SMTP id d199mr2756231qkg.406.1584415808373;
        Mon, 16 Mar 2020 20:30:08 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:07 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 09/11] HID: nintendo: patch hw version for userspace HID mappings
Date:   Mon, 16 Mar 2020 22:29:26 -0500
Message-Id: <20200317032928.546172-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
index abac0497b1cb..a56fa5ffee1a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1422,6 +1422,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.25.1

