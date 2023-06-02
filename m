Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E78720405
	for <lists+linux-input@lfdr.de>; Fri,  2 Jun 2023 16:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235838AbjFBOKv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jun 2023 10:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbjFBOKs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jun 2023 10:10:48 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182E9197
        for <linux-input@vger.kernel.org>; Fri,  2 Jun 2023 07:10:40 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-528cdc9576cso1185109a12.0
        for <linux-input@vger.kernel.org>; Fri, 02 Jun 2023 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1685715039; x=1688307039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVK6hsAkr2t2TtBLH/UasFkOv83y2FFgyEi4rUpiTPY=;
        b=5hRIGvKGBI4Q/6isoE6tLWyNH6CT5/+uchB5fWu0dzJu7sanhCiuiixE7XQgIDvNOU
         RJwlYQKaWkRlFJ6orp1IUrWEpb7ormdJWXnMl2FR37z0PK6MTrcyhr/JGgmn69YAW/66
         OLZzMhgaAAzP+VC0xrm6DxxZdJkXiedQIgTQBIqG88FyfssIHQIAbsHyly9TnTfbXF/K
         5n97YjbLgRadx7mWXIupLOLjg3ppLhwUr0raM2BBz94USYeRnU01cKRW17PB+bfzYCLO
         r0BDobNUJYoYAsw1xvCNSXocybJjYCbF4vsqSheiCIUorrxFIeaZCtXp0Yb1l4IzUoQt
         Q3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715039; x=1688307039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVK6hsAkr2t2TtBLH/UasFkOv83y2FFgyEi4rUpiTPY=;
        b=PdYzQI5Uwu2mVw4py7rYezRSWI6tbxi8FZCaCQapBG1LBjagicf+ZVIhwNG0IgHLI/
         OTQlcPciwuHkPTOQ53a/z0qJOSOXYlPRsTjBd4iVmxi416JAE3BYjCQjIM09vh7QuTCc
         4geRymLmiZirr/31aZfaCCzzce5YooPQmEHf2+tHOWO4ViuD1PH5B98xu/sSL+wGjAcy
         qLM9HzCtbOKMxaYE/1RSQVhkM3JyDiE8vGZbNvrUvJxthc4YbOPRBMz50xgHJIrSYFQy
         Vvupt9eEfPAaWDZQoSU2espCicrP7H61JCyCSLeEu7AM/W2mnO/vgqVl8UKpMWvQsbi6
         1Eig==
X-Gm-Message-State: AC+VfDxqO/JEJ7AEow4vzAFzvZ1AvJ9FZ+cKb7yzuJhU1NpsOA4crEvd
        VioetEjnVKWEICMnbJmZXDsf2YTkvQHFCXZV3ic=
X-Google-Smtp-Source: ACHHUZ47rMkWSf8RU6yNVYqIGemVMae35FKf2485NhgAFsmoMvUsgA1ZCYUJcV1PB2Z2JJAc/et04w==
X-Received: by 2002:a17:902:d489:b0:1b0:46af:7f15 with SMTP id c9-20020a170902d48900b001b046af7f15mr23079plg.64.1685715039585;
        Fri, 02 Jun 2023 07:10:39 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902d48b00b0019e60c645b1sm1370878plg.305.2023.06.02.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:10:38 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH 0/2] Add ili9882t timing
Date:   Fri,  2 Jun 2023 22:09:46 +0800
Message-Id: <20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add ili9882t dt-bindings and timing

Cong Yang (2):
  dt-bindings: input: touchscreen: Add ilitek 9882T touchscreen chip
  HID: i2c-hid: elan: Add ili9882t timing

 .../bindings/input/elan,ekth6915.yaml         | 36 ++++++++++++++-----
 drivers/hid/i2c-hid/i2c-hid-of-elan.c         | 20 ++++++++---
 2 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.25.1

