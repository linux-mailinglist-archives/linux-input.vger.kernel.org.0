Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEA55A1C39
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 00:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243477AbiHYWYj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 18:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiHYWYi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 18:24:38 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151F7C3F60
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id l3so21439plb.10
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/Bw09k1AMbuT0tfY/4oUQack0cVk+BSGCjvp9aK78hw=;
        b=NqlnVCafAjYXanDOwGwRqsOnSyiP5OaDrR4HrZjmkPe1pfbcL30gQXPfzKUbstWY3d
         n7h5lcoOMEPP5Sv17nu3QrPmjd8hKJt+nBKYodBS7u7bNZ0P7eh5FUmJefG5021lju3l
         a3yo5HaErJ9eX5kdHGLsoerouYNzBa6eyVqJmQgB3LgF7a2QqpNFzD0Wuft/XrtMtdK4
         moOhNMzGzZVjfOmIUSW5PuGb/K/5jvSJunckJ9zZKutMyoq3HHQs6oGzzWG2hfPlhUiZ
         J6rYCDX2jFA6HJ+Buo+arnZWy8cXUfY8DpYbZprGAEBdNGYPzDX93CZb4dvqKmjnz3pl
         5qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/Bw09k1AMbuT0tfY/4oUQack0cVk+BSGCjvp9aK78hw=;
        b=iEPpmEuP/tG7XLMqAVqDJagfJOi9oYY4AZw5r22CXwenq7k/opgd/+GpCFsXrhKZrF
         h+PZ9ZtJngiDrz0D6MCIhH3Q0YPyNVmph8AIiDlE4r2flHJTx5MIdOxkbG1X0MTsxKcm
         ZjBb185bfsMWs0AtWthiDEd/PR5Di1hkIrO33Kx5Xyw9L3rvmyh/9T6wkzH421enzGgq
         z+YdDPPpxTSXZr8bZpB6N3GR6mP2bUv3CVEJGK744OryBlE+GHDLc8P+mVlnkJjii7y9
         p4XfNErV9FYxXoYv9PwbZFiwxm5GmF0pev9ajd114srWiNWpzKuepactMMyJQUKU/YKo
         LVAA==
X-Gm-Message-State: ACgBeo2MkiI9MYNoci8Lc+X3Cc0nKzYqh1NM7O4e5UhvsJ7pkldQOqKI
        9lDQJSABpa3Zi+8QDq80C/FBS0WZdTltdw==
X-Google-Smtp-Source: AA6agR6WjBRO3E99Nr5Z3f47/LfoiCAkGHM3jAku2+F2ZbbXrXP9XARu3LaSB69I2ocfbi8M4Mxg1w==
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id mh12-20020a17090b4acc00b001f57f0512e8mr1195142pjb.92.1661466276475;
        Thu, 25 Aug 2022 15:24:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b00429b6e6c539sm81820pgg.61.2022.08.25.15.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 15:24:36 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v5 0/4] Input: joystick: xpad: Add X-Box Adaptive Controller support
Date:   Thu, 25 Aug 2022 15:24:16 -0700
Message-Id: <20220825222420.6833-1-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds support for the X-Box Adaptive Controller, which is protocol
compatible with the XTYPE_XBOXONE support in the driver with two deltas:

 - The X-Box button sets 0x02 as its activation ID, where others set
   0x01
 - The controller has an additional Profile button with 4 active states,
   which this change maps to an Axis control with 4 possible values

Patch series adds device to the supported table, adds support for the
Profile button, and adds support for the X-Box button as distinct
changes.

Signed-off-by: Nate Yocom <nate@yocom.org>

Nate Yocom (4):
  Input: joystick: xpad: Add X-Box Adaptive Controller support
  Input: joystick: xpad: Add ABS_PROFILE axis value to uapi
  Input: joystick: xpad: Add X-Box Adaptive Controller Profile button
  Input: joystick: xpad: Add X-Box Adaptive Controller XBox button

 v2: Fix warning Reported-by: kernel test robot <lkp@intel.com>
 v3: Break into multi-part and remove VID/PID check for XBox button
 v4: Rename Layer -> Profile as suggested by Bastien Nocera
 v5: Add new ABS_PROFILE axis to uapi and use it for the profile button
<hadess@hadess.net>

 drivers/input/joystick/xpad.c          | 15 ++++++++++++++-
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
-- 
2.30.2

