Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A4A515940
	for <lists+linux-input@lfdr.de>; Sat, 30 Apr 2022 02:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbiD3AFi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Apr 2022 20:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiD3AFh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Apr 2022 20:05:37 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536C26B657
        for <linux-input@vger.kernel.org>; Fri, 29 Apr 2022 17:02:17 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t13so7605937pgn.8
        for <linux-input@vger.kernel.org>; Fri, 29 Apr 2022 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshua-dickens-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=figok7DkRFltGyTxP5Nz5BbOx0HgYSqPvBi9D+MhFSE=;
        b=twIvUfPmsvX+BvGmaw7oQ7lap013Mgvg48Qfi64W8+Gi3FM4yZLoHHMDElJQipNkdO
         GeGnO0GeLeAGJhPhTX6in6Ltv7XeLbKZJkG/P4MPVqTZcMhTBi2fVw793eCk7tDo2c+Z
         wQA9kdjUNHa67EvGBBpPl+lcBKfP57DaQ1LjgPrHScKQy77Iwm+CFJB5VKy+TUP+Z4XV
         ON5QlGN/MMzpixH83Pk8glOO9TxLvDwK88UbSurHwBAqLHh2paHwTlCBJFcbxyMU+b6r
         jWu9DQJwcN9OpSF8RyePEqcbxU0gSOxGXTl1+kwlVVhInoI84amnZNQErxudGqF8cTT4
         SdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=figok7DkRFltGyTxP5Nz5BbOx0HgYSqPvBi9D+MhFSE=;
        b=2xh7SoA1/3X19dJBAyXN178XrxYHNjipOKM9kUVX6XHq09Re4GIq1ni+RUqZ7/QG+w
         f0SVbFblEVaqYX81tZQ47J8qf0/pGeqTurmA+iLaNIdoCkWxV1R864GxLdvy7DcLdm8v
         rFAFJyDs7FVpOAhp3jyP5XQXtt8Vp/gdjR28n/Ifrw7BPR7puxon70JD++zdMFsEloUe
         V9gRB9CFuf3Nr0SRvRPs273CQHVksBppKbIz4Oe/vsUYMuWkLAOmU0tUSwtP7yptXBt/
         idJecZHt9G2pCO9kckTBSV2OgJpQ4ht4gSKSfIhm5IJ53zbxXCbYG9m6vsn5/TUUbz4L
         rY8Q==
X-Gm-Message-State: AOAM533P7v2djJJgX29xzQByBTUQSCed+heycRL16fGk6UJUKPtHRTqq
        7ElIWRz+ZBABLgFUi6Smy4x71uTlDgxCoOkUKw0=
X-Google-Smtp-Source: ABdhPJzl6szC5/QuB9f3+8YC8tz+U39bBtYH0DGa9CmQE8DWpVr1bTCUbJRLO257D0UxNSJvDYXG/Q==
X-Received: by 2002:a63:f857:0:b0:3ab:2243:4b1a with SMTP id v23-20020a63f857000000b003ab22434b1amr1278463pgj.163.1651276936661;
        Fri, 29 Apr 2022 17:02:16 -0700 (PDT)
Received: from fedora.. (c-76-27-202-13.hsd1.or.comcast.net. [76.27.202.13])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f71200b0015e8d4eb1bbsm165277plo.5.2022.04.29.17.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 17:02:15 -0700 (PDT)
From:   Joshua Dickens <joshua@joshua-dickens.com>
X-Google-Original-From: Joshua Dickens <Joshua@Joshua-Dickens.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Joshua-Dickens <Joshua@Joshua-Dickens.com>,
        kernel test robot <lkp@intel.com>,
        Joshua Dickens <joshua.dickens@wacom.com>
Subject: [PATCH] Hid: wacom: Fix kernel test robot warning
Date:   Fri, 29 Apr 2022 17:01:34 -0700
Message-Id: <20220430000134.608043-1-Joshua@Joshua-Dickens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua-Dickens <Joshua@Joshua-Dickens.com>

Kernel test robot throws the following warning -
>> drivers/hid/wacom_wac.c:2411:42: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                           hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
                                                   ~~~           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   %d

Explicitly casting the argument to unsigned short to silence the warning and retain the intended behavior.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
---
 drivers/hid/wacom_wac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 64fe573deb9b..9470c2b0b529 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2408,7 +2408,7 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		return;
 	case WACOM_HID_WD_SEQUENCENUMBER:
 		if (wacom_wac->hid_data.sequence_number != value)
-			hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
+			hid_warn(hdev, "Dropped %hu packets", (unsigned short)(value - wacom_wac->hid_data.sequence_number));
 		wacom_wac->hid_data.sequence_number = value + 1;
 		return;
 	}
-- 
2.35.1

