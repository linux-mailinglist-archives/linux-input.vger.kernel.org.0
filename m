Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCED62C345
	for <lists+linux-input@lfdr.de>; Wed, 16 Nov 2022 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiKPQAa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 11:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbiKPQA2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 11:00:28 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B8152894
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 08:00:28 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id s196so17080997pgs.3
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i89BGVlbzehc/Oa9bvx5u7dMs+GrYs+IOTjoZSFHhNY=;
        b=E1IJSEYE6RXpAGhcmxhA+ZFUaQuqFnz8FOtGnvIQqaNzJnLZpnxqaKC93tghajTApH
         7a6QW8BeSlo4PNOC+C35963I7ZujjTHm4uKu1jpBsopxNuppFMJ/IPFc/DuJtq+y6/S5
         juq+aHqiAUzWfdBdhGI1ZXhqYQBVawVJTxEb91jwsxOZNlzVUgd3k/Yhs56WM09Xx7yS
         4TMBsqcdoi2YqQWp9AD0mvNHK5t4PZ5ENzQqcSjprC2S8Cva+szq6pWU4R2b08vE9xgj
         guoMANbYGiaGXmN4n73odfnpYOyVSM6bBBV6C4gWeBf1Q5vSP+JXzH6+ytVIN8FfhIEy
         4x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i89BGVlbzehc/Oa9bvx5u7dMs+GrYs+IOTjoZSFHhNY=;
        b=yUq5SS/1/sFK4XbywFb9X1HM2dAEBh/IgWAXTR+4SxV/BA3AYWH8O8n1dZKW1CG/KF
         gLOOXIazfV355WVctpFgNUBkpJtl5Yqq5Of5SxY6y3ApsBkYcTKb5BAYaPJShW7BcpVC
         VsFMrgqYo+SS6O/ZJz0HDmG2efLocS5KqI9pF6cgqsqZkP4PoUvloy4Hlu9f55KT9vV3
         m14j+fNrHF5l/veNPiXMvYguezeEOSh56l74nv6yaXYPSrxNWve87RrhosH43gJdH29/
         xEcjHKC7N2T5QFR+k1pktpyB3HJh6ifmc7Ly3CmbltodTpprftcwFVyt4zGLXduAQSjg
         7T7w==
X-Gm-Message-State: ANoB5pnfQtt+ruTanCVyZG0k4dCjmFlXi2WdWXukgZN2ch9ejXzA/7RR
        dPDjo597/63UBnhrD9/EdmcNwTswUyqHBw==
X-Google-Smtp-Source: AA0mqf47GmNFalBF39bY2/V7oDPElNtpqjEjS8ibIPgspJn3IetZb4tb6Xy5/Q313q7CSe0czFHvdg==
X-Received: by 2002:a05:6a00:3492:b0:56b:a80f:38d4 with SMTP id cp18-20020a056a00349200b0056ba80f38d4mr24005963pfb.12.1668614427569;
        Wed, 16 Nov 2022 08:00:27 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902edc700b0018693643504sm12381854plk.40.2022.11.16.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:00:27 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] HID: playstation: fix DualShock4 bluetooth CRC endian issue.
Date:   Wed, 16 Nov 2022 08:00:22 -0800
Message-Id: <20221116160022.51829-2-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116160022.51829-1-roderick.colenbrander@sony.com>
References: <20221116160022.51829-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver was by accident reading the CRC directly from a hardware
structure instead of using get_unaligned_le32.

Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f5e0d06d3cd8..7b5aef538044 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2131,9 +2131,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
 			size == DS4_INPUT_REPORT_BT_SIZE) {
 		struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
+		uint32_t report_crc = get_unaligned_le32(&bt->crc32);
 
 		/* Last 4 bytes of input report contains CRC. */
-		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, bt->crc32)) {
+		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
 			hid_err(hdev, "DualShock4 input CRC's check failed\n");
 			return -EILSEQ;
 		}
-- 
2.38.1

