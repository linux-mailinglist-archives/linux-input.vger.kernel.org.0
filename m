Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4483A70A577
	for <lists+linux-input@lfdr.de>; Sat, 20 May 2023 07:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjETFHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 May 2023 01:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjETFHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 May 2023 01:07:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D31E3
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 22:06:59 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ae507af2e5so11810435ad.1
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 22:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1684559219; x=1687151219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU/pv0kTEcagJIJWXxzDSMCsq8XGlWmDQe4VgY//ges=;
        b=yccjr8hoJfHTXVEjuyNZ6BstaE4N3BugBy0mhCipAm1Z8U3LC15Xz6irDj0L8YJMYv
         12i80dwaX2evTc6IYYtB70EiyHhYqmB4QNTAMJq8LVUO/N4b/tyNZ6kvf/BXEQnqyLQU
         QZrDwuSNCYJdUVCZHrfiJFCQlvUUGcq8d2OWu6QfoXqrob9BCOkdeBkVQ5zTEwonx5Ab
         NcGMNq9Y3fsRzLGggCa6WmiBXEm4pWS9VhQrAWfyVqHzWrQLyUDczBAKkDpNR7Da0axR
         JOVB66I/NllLFa4xvPCc2p0eNYKdmGgtHRNvq+Oo4qPWgbPHa2SOwMG7Yru2ALtQDJzd
         TjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684559219; x=1687151219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XU/pv0kTEcagJIJWXxzDSMCsq8XGlWmDQe4VgY//ges=;
        b=JIL+bfLdkoEDM6PSqa4iuMMub+LoOmIBiraHpZaOQzFNAg06tApF3ki0+kB2DxIjN4
         kIUzl2Y8+xdk9jWGcbMPtVHByagcyC5hUlJcgBa3X+2Ri+Yfa1xDtQ+u9pqkCARfVvMe
         ueNAZ/tnfNsZwQCub+sVTyi+FPjtCsL5l4KkDI3Bqnk8e2fDx4ust09isHrColezl8Sv
         RkaFwBpC2acWvzw/7pDMPzRMv/tLsx6lN0O2MPT+SoCS1RXaIKUo2qfVY/ifNQY5VOeg
         lbsEi4dG6FOtZaj8rzth8yvaFE+CXxUVdqQkTALiRiP5UpDhCeF0R4mmgzrAtHxYFD7A
         Gn7A==
X-Gm-Message-State: AC+VfDzsmUDhqqMotbI7WgrS1xdQJQeJftXygdkTVfFr2DfaD2Lw/UXK
        xSCd+67xhBV0IC0ZaBlIslvfvg==
X-Google-Smtp-Source: ACHHUZ5IWj/KR5q3HhDGOO0w/I/22WVkGAan8gANtws/XwU5o4xPA7gRZQXMVrq2OPgd2svEGOSjLw==
X-Received: by 2002:a17:902:db86:b0:1a2:749:5f1a with SMTP id m6-20020a170902db8600b001a207495f1amr8228078pld.26.1684559219435;
        Fri, 19 May 2023 22:06:59 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b0019e60c645b1sm476725plb.305.2023.05.19.22.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 22:06:58 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     dianders@chromium.org
Cc:     benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, yangcong5@huaqin.corp-partner.google.com
Subject: [v2 0/2] Add ili9882t timing
Date:   Sat, 20 May 2023 13:06:47 +0800
Message-Id: <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Compare V1,move ili9882t timing to the "i2c-hid-of-elan.c" driver.
Add "ilitek,ili9882t" compatible string to bindings document.

Cong Yang (2):
  HID: i2c-hid: elan: Add ili9882t timing
  dt-bindings: input: touchscreen: Add ilitek 9882T touchscreen chip

 .../devicetree/bindings/input/elan,ekth6915.yaml         | 9 +++++++--
 drivers/hid/i2c-hid/i2c-hid-of-elan.c                    | 7 +++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.25.1

