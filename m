Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70B5578619
	for <lists+linux-input@lfdr.de>; Mon, 18 Jul 2022 17:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbiGRPRe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jul 2022 11:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbiGRPRe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jul 2022 11:17:34 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708FC26AEA
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v16so17500518wrd.13
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLELeHeOa7Pd0b3SA9cPD6bkC3OgHB3wz5/L9hFllp4=;
        b=gElIDZVDGKbNAV6GzZeR2EOPk8gKDbDrd+GUQR623VFI89eAm20+nRNr4A2ktujdll
         s+rQdk+xk1zM1Q796U6hjGRHNJGo59hORPA9P7T8T2cVD30XTLoGPZH//HvTSXplHG8h
         aj/2gmUH1DcE7lgQZEK1spOiXT69jYa6aw8j5XKs/LJ+oLWFBH0xj7QH/iFSesatqSIm
         ekri0qZQmKSKqhsy2lWQmX2I4Ye3mdJSeVyX38GrGjWZcGHLZ4suQtYORr3Tub+wkoMd
         xD7lkZfVfJ+ht48jXQVLjt0HuRPpPcmfvAa+u7ZKonYCPH2XUe7dwX623wXtE43FMJQd
         F1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLELeHeOa7Pd0b3SA9cPD6bkC3OgHB3wz5/L9hFllp4=;
        b=MvK1JcFhetCJKycCaFJ1Iit3nO3bbCY8/jkNIJNt/OdakGEHWOHkfhRW8AhiCItqGv
         c1t4s+TT3PGJoRhG5pdb/7QfpKxRstkN7MDPCRqC3d22PcsSbr6QkCAVQJl5PFqt7V3V
         8XFFgWZcWRPFGP7+KHOXOP4dIQKqDJI43HB/3hzDRGwrAEIV/XwPRjNCTL6uQQ4AA+b2
         Bp9hdJKxgSphM+5I/QS6BNMfEIhd6hZJ6zPgxFWQNSCpfZ9DevpT+WDBUhtKzzR3T2Oj
         FVPc9Qoup8GUXNTBtkRuoPcfZDOptyPLBnBiXzNigxAv8BI8OXLvgb2tq+x/YT4z0yI3
         aNeQ==
X-Gm-Message-State: AJIora9f0d5/abjIXZvN75dtzvEkAEMUsKqoZtcoggDATiImhDlYd+JB
        jop51qG1ecM4mB8jlqCgeqdnYnCRqBe407td
X-Google-Smtp-Source: AGRyM1skqbuIsoCt1ULXhWGJosWdhQHwScBW1muNxAoCkqM9L0+thW1bR4vywe5YUq64RnnPfHrAWg==
X-Received: by 2002:a05:6000:186f:b0:21d:96af:31ea with SMTP id d15-20020a056000186f00b0021d96af31eamr23684214wri.646.1658157451944;
        Mon, 18 Jul 2022 08:17:31 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003a308e9a192sm13346075wmi.30.2022.07.18.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 08:17:31 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, peter.hutterer@who-t.net,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 0/2] Input: Fix handling of inhibiting input device
Date:   Mon, 18 Jul 2022 15:17:13 +0000
Message-Id: <20220718151715.1052842-1-acz@semihalf.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sending as v2 since there is a dependency on another patch from the list:
"Input: properly queue synthetic events".

Changes from v1:
- Add "Input: Inactivate slots in input_inhibit_device()"

Angela Czubak (1):
  Input: Inactive slots in input_inhibit_device()

Dmitry Torokhov (1):
  Input: properly queue synthetic events

 drivers/input/input-core-private.h |  16 +++
 drivers/input/input-mt.c           |  48 ++++++++-
 drivers/input/input.c              | 150 ++++++++++++++++-------------
 include/linux/input/mt.h           |   1 +
 4 files changed, 142 insertions(+), 73 deletions(-)
 create mode 100644 drivers/input/input-core-private.h

-- 
2.37.0.170.g444d1eabd0-goog

