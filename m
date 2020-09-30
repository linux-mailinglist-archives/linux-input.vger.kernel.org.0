Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C3D27F581
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 00:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbgI3WvB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 18:51:01 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:39265 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731816AbgI3WvB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 18:51:01 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9291792c;
        Wed, 30 Sep 2020 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=rmxCMxgjVwyPO2dr8MlSFoQOZ
        pk=; b=klLUXIlOtynAsTpg6gB75JYntVXafiN73obBafoLafjpBQDebSHBDTMmb
        837M6mj2ak/YpUj6z0AhwdO5ptvZCSpmIUOyga4VjA7ERDtfhvO8LkkchUBKqqn4
        E7LG3RcRz5K6e5eo/lZhd5ic7DeNmO4yNh11QtP9ZVOkLyiAVdvjUZBjCPc3SlJ0
        iap2aJeLW/vIfSS3WjeMGEimdc815NJ9fE5ZCV5/zwHFXKGs0H1KPw0p/rec047g
        qmP8iZh5rzLfxvjz04CCpL20Xbx+yQ10+21ysssavRFNz7PFbMfnEio45Mg+N6lw
        rJS0WvoB3saDseVC75ubO4UtztrwA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cdf88a96 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 30 Sep 2020 22:19:12 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3 1/2] Input: synaptics-rmi4 - support bootloader v8 in f34v7
Date:   Thu,  1 Oct 2020 00:50:45 +0200
Message-Id: <20200930225046.173190-2-Jason@zx2c4.com>
In-Reply-To: <20200930225046.173190-1-Jason@zx2c4.com>
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the recent addition of the F3A support, we can now accept
bootloader v8, which will help support recent Thinkpads.

Acked-by: Lyude Paul <lyude@redhat.com>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/input/rmi4/rmi_f34v7.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
index 74f7c6f214ff..8cfaa2f19ed5 100644
--- a/drivers/input/rmi4/rmi_f34v7.c
+++ b/drivers/input/rmi4/rmi_f34v7.c
@@ -1364,9 +1364,12 @@ int rmi_f34v7_probe(struct f34_data *f34)
 		f34->bl_version = 6;
 	} else if (f34->bootloader_id[1] == 7) {
 		f34->bl_version = 7;
+	} else if (f34->bootloader_id[1] == 8) {
+		f34->bl_version = 8;
 	} else {
-		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version\n",
-				__func__);
+		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version: %d (%c) %d (%c)\n",
+				__func__, f34->bootloader_id[0], f34->bootloader_id[0],
+				f34->bootloader_id[1], f34->bootloader_id[1]);
 		return -EINVAL;
 	}
 
-- 
2.28.0

