Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F565B7CBB
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 23:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiIMVcj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 17:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIMVci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 17:32:38 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D30D61113
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:37 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id f20so14978341edf.6
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WIlk0elq01WTpJN2+gMCpgMGwe5JtMCNnKdreCOgbs0=;
        b=gyDm6/B2bYqCs+ps2NBdaN3KTNS3+2xdS5sjGHYiWtf3tVmx7Vyx+9c7P64b+2aMIK
         EEAYq1FMjNC420YRypGLlmZhfRklo+xofOyNlgaqtc9morJqr2ayxfwpRy5sWym/nI/s
         mnmB7nArIgvDzB//kUv3H/mUmb9yZ8r4HRt2tjxCddRAavO3zqKlSfLVXi9iNYsdV5Fx
         W9ku+vldiC/GdmhuzMuuyHz1oZ7+/K1ihRMInnN78PgVncdEvxCoggivOb5LlTqQP4B2
         DQ4uwyF6VakFwWLjEv9b7EeeY46knD1xgPZIZkERvReo8SPwi2HhPIsl1R+cewQNkY38
         Mx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WIlk0elq01WTpJN2+gMCpgMGwe5JtMCNnKdreCOgbs0=;
        b=pRY+k0bqNTX+hn5Fl9Wu/Hl8Nl1ehh4m3h+9LwbMESdNRSMTVAMYrykjS0frWx7Ih3
         f9zqxWe6odlZC8kHbpbpwuK+D1YvddYSTv4tMmOGFG8LY5t4MYxXVUWMXpS8V2u3By9K
         CGb/9PvuKG0Pju+HrxZk32z7bN9EWdFusAZNKrX3meNC+XOMaD6fbfV7FUYF6SYS7gxd
         DSkcOLP5OM7kM3couX60hYWMtKNEeXLc1za6GVBDsAuZonDGzMX7o+5Ym4dPQDsJrhNx
         BW00cP7utrAZEqecOEVEYgxyGoq0xmwMiZy8xYW/0NtSIchX4riz0jPYQsnaCgwX6hfG
         hWSg==
X-Gm-Message-State: ACgBeo2RrIfmCK1DUUJQfotl3jGjHR4sRMeLnwqK8XjLC10D+4kOGfoi
        Obc+LNPgGdw8syiosYlgxHd7VBLVnhELhg==
X-Google-Smtp-Source: AA6agR7lU9fDf+HNeZJVkpnN4HEmurEGBRxqK8Mw/kLZRYBr+2Fj9eJWBDv7fl+gNnPfkByHDho/+w==
X-Received: by 2002:a05:6402:198:b0:442:da5a:6716 with SMTP id r24-20020a056402019800b00442da5a6716mr27887459edv.5.1663104755954;
        Tue, 13 Sep 2022 14:32:35 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2218:7900:8fcc:6ea7:4870:fd6b])
        by smtp.gmail.com with ESMTPSA id p26-20020a17090635da00b0073d5e1edd1csm6592819ejb.225.2022.09.13.14.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 14:32:35 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 0/2] Input: xpad - reduce amount of magic numbers
Date:   Tue, 13 Sep 2022 23:31:31 +0200
Message-Id: <20220913213133.584979-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pavel Rojtberg <rojtberg@gmail.com>

This patchset slightly refactors the code of the xpad driver.
These are only renames and no functional changes were made yet.

The first patch introduces the BIT() macro as promised in my last patchset.
The second patch introduces GIP_* defines to make the xboxone packets readable.

Pavel Rojtberg (2):
  Input: xpad - refactor using BIT() macro
  Input: xpad - decipher xpadone packages with GIP defines

 drivers/input/joystick/xpad.c | 211 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 125 insertions(+), 86 deletions(-)

-- 
2.34.1

