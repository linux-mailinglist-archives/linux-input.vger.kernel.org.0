Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBFB50E2E3
	for <lists+linux-input@lfdr.de>; Mon, 25 Apr 2022 16:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiDYOWn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Apr 2022 10:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242420AbiDYOW0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Apr 2022 10:22:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524491FA43
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id y21so9379196wmi.2
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
        b=2wZ7xxmndjI9NQJiBzvZ+9oMRSULwSsVZpMGKupZt4eoKXKcTrRG9ejghP6/CpyUuf
         J6GPivos0E0L1129DN23cCqKBulz4lsYlAPrpGnZ6FtWBesfKQ3dmZq47aZhBsvw1W0d
         XOBMBfRyII3XmWBbe2KvNrz4IVvlkNYoXEwxqphQoEOgA6OTnO4rTn/yENtnTY1ubKc1
         f6I+t24EcPrzRxmScY8seonziTlLJu+Ax7/kIJh4kvduJFvqVQg+P0tFvxfZBQen24xq
         pDwZgEepmZLygNr3idt9hH87SHj3JDbcc1047POsgs6eSmd/o2pGeWIMpYfT+SKHYHVV
         Cgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
        b=wyi0IZmMI9UbD3Wf5ZnBY8hN27cMemUUc65cZzpvsvYmRBTL/y7mrjdPDPaLUHVPAa
         zvxlOjx9zpkzvWJGxGxDAeMei3B/+8o0AIYamJRVFeL/a3qmlfxR4HqTF+1k95TjSpQm
         wK5KoPaS1WWZJ8d0CzQ5fV2UMxleI4bTgzAW7WJysHRbojoKWgxzCvg+6AVV1WPOyQfz
         qjTU1lA4vdDPTYxewyFTuR3+K3ELR1AZNGI8yJKyUCL/fc5se0xZB7xmeE3Zf/hew3lv
         3YgaXsXMqxQ8K2pBmZpyWvILTFveZdBYsNe8wxlaEjj0fp+qsGjfRNRm8FIIsGkFhMWF
         VYGg==
X-Gm-Message-State: AOAM533tsYaen+UvT8mLidkwG0DI4IvdAt8JEg1Kn8P2YFg+F9aIbSql
        2EK+++YJ3hixEX2A6zDnWqnzYw==
X-Google-Smtp-Source: ABdhPJwTt4DIcem5kvWlreKWpNVp5wVoIc2dUHMFQQOhMqjw6b7upbwNhmMWnsokCbGLHmVbmoRsdQ==
X-Received: by 2002:a05:600c:4f53:b0:392:e99:3002 with SMTP id m19-20020a05600c4f5300b003920e993002mr16952741wmq.35.1650896357823;
        Mon, 25 Apr 2022 07:19:17 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:19:17 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date:   Mon, 25 Apr 2022 16:19:12 +0200
Message-Id: <20220425141914.158959-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
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

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: b243018eafeb69bf074ef013c54504632fd161ec
-- 
2.32.0

