Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 617527058B
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 18:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbfGVQhH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 12:37:07 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34688 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbfGVQhF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 12:37:05 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so6361361edb.1;
        Mon, 22 Jul 2019 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zv5P3sG9+ZJv6qEu/KaS4z9NGZFAnjaGhIzkAMUBCaQ=;
        b=p8X+3oiA5+9ppo2rmXogrEYaTVh3IEWj+2bhdn9esGgRk+8YrGDY/DHD2Gm6l0Ts/G
         TUbrIRr+61ggzklQQYF93B4cK7Hzdvd8KFUGRE+3tsHCv+Q2ujeQom297q4FVjYnzmaf
         JJUx5h1jMLB8oeW6QJoZXeuXZ0cR+u49h5gbhRSycXg/pfK0hsqPU7/VUlW3RDEl+MMw
         UI1aN/U5zygiNnOdWB3cL2Gk7d9dp3J2DTRgTQh04uFTDBVCRmfmf/kTjDqL2eb1iL6G
         sgtbsqEwOsV4wLBMPGGPhzjYUfcOCcPfdYg8QrjQv6RXHL8OYQ0aup9+DGl5z556oPyK
         68Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zv5P3sG9+ZJv6qEu/KaS4z9NGZFAnjaGhIzkAMUBCaQ=;
        b=DoDEHicuc/IW9N0KCgLHFxIK0rMXZJ/aQ7KolwD8OHvNFBVvPO7dJhO604gjs8XigH
         h5GTU1xk2ZwgI/HX/fJWkHXnARQfunIbmAziubwz5+tOS1LFv2Nqt/FBHT+2/UrT83CY
         kKDrJzEv1xPzfvVaQABVHQ2Kjgj+6YLdQJIurSBBuSDlOixs3T85WTzeIJ1SfHnbeutR
         UShozujQRcMSaylLiGsxFU4n6UWAjBCXzyB2jfioUNcoRZRjAs+alXpKWI74kC/N/QJZ
         coTEJGtjHWotZWT9neL1+a14dxp/8yYrif+vByj2N5jSWkT/hqVaYR6zoB1zz3vZYgOG
         ZqzA==
X-Gm-Message-State: APjAAAWRdaKVpytdeF2er+1Eu7ui7mBQags8nF8iD46cBPz8QvO6ww2p
        s4Lxv7d92ObqXNENFVnniEP03vFAxaYzXQ==
X-Google-Smtp-Source: APXvYqy//6eYirJj9ENgnNsMtreAbzkSSZkTpUKSr9MlD7pQa27bKgIDs8spyOpldtk86kIMnEn5gA==
X-Received: by 2002:a17:906:2409:: with SMTP id z9mr8411103eja.179.1563813423762;
        Mon, 22 Jul 2019 09:37:03 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id p23sm8058609ejl.43.2019.07.22.09.37.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 09:37:03 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH 2/2] HID: core: only warn once of oversize hid report
Date:   Mon, 22 Jul 2019 10:36:42 -0600
Message-Id: <20190722163642.10417-2-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722163642.10417-1-stillcompiling@gmail.com>
References: <20190722163642.10417-1-stillcompiling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

On HP spectre x360 convertible the message:
hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
is continually printed many times per second, crowding out all other kernel logs
Protect dmesg by printing the warning only one time.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 drivers/hid/hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 210b81a56e1a..7afd0422b280 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1311,7 +1311,7 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
 			unsigned offset, unsigned n)
 {
 	if (n > 32) {
-		hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
+		hid_warn_once(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
 			 n, current->comm);
 		n = 32;
 	}
-- 
2.21.0

