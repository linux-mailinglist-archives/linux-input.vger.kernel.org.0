Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD4C504846
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 18:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbiDQQSM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 12:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiDQQSL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 12:18:11 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E076EEB7
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:35 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id s25so14730187edi.13
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SISKkS0cM/8F6+LTqrldpOs/1uQ26pMEK8+wZoC+QmI=;
        b=amtFz3iiKilr3eJQQH1nh1Rcnbz//FzqwQq8E/s+qy4/djDoVFqjy9LjVZ0Lr+T1fg
         eaN/I02WPGZYkLqJK070WRJ+qwetjnX+tMGQPJJQsNw/3yzhPYUJ/5ONcCaQ24oix8i+
         VauU9u3VWqZi1QBtdGx0dngcV3BeVpTYKVctUfip4iiTp3B3E1aIKsMZmTMYbKCS/J4z
         IxYXtPG0aIlkhFZmRhYyYc0o2hbYADiKt0rurR6H/4sBNanESntVwz6K3aAxMueHs31t
         hBVD0cnUwJdz94xfuub0kpJzLCbYmnmfWGuy6jbPJTIMml0RsiQXUfIIeN3NKWazAUZr
         wV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SISKkS0cM/8F6+LTqrldpOs/1uQ26pMEK8+wZoC+QmI=;
        b=nzD30IKFrBKN56W/CjM3cRBUmeeDxzVIPVlDUol8reqhJQWqAda6CioNsdafWFfele
         azH6Bh4h0txZumTpf6ijfZyLvZpRNp1MOSCNh17vnRrLOxoTZYFLrGovIEnfB3fF+ZLc
         oKSZV/ijgNXN4KrntNZO2uFg8LADh+S0LeiAYwvSXwZzw+ZeI/gwzSPO/g3+rgtJwxlE
         Xa25vcnNNV5D9iihT/S7qFypwhMOTbdn+xN/tlTsAyJdkmvsjG1AF8zJlbRZypMjer+W
         3zi5DKBw8kmch1D0AczyJ1WUPKQNOV3f94ywFHz3pqrYw+J7Kidp17fGzNVgpklDJKu1
         63KA==
X-Gm-Message-State: AOAM532havvEoUkl6Ns+AGLR4iHauBIG8fW1ladoyuen7wkBVFLrOodN
        CgWBsUfM/M0uLjMbCCw6duKJiHO28qccMQ==
X-Google-Smtp-Source: ABdhPJySb4rVfMBF9RzUv+qBCTivnRzGnJsb5HLN9JwzA5r9M05Zff8xJ8MvsMPuwgwvLO6fI7t7cg==
X-Received: by 2002:a05:6402:1e88:b0:423:d43d:8c65 with SMTP id f8-20020a0564021e8800b00423d43d8c65mr6329960edf.226.1650212134311;
        Sun, 17 Apr 2022 09:15:34 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2225:cd00:b8d9:eba8:6309:ac66])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b0042062f9f0e1sm5772130edw.15.2022.04.17.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 09:15:33 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 0/3] Input: xpad - sync with github fork
Date:   Sun, 17 Apr 2022 18:15:23 +0200
Message-Id: <20220417161526.138019-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This upstreams some changes contributed on github.
The first patch merely updates the list of supported devices.
The remaining patches improve xbox360w gamepad support.
Those were verified by me, as I own that device.

Cameron Gutman (1):
  Input: xpad - fix wireless 360 controller breaking after suspend

Pavel Rojtberg (2):
  Input: xpad - add supported devices as contributed on github
  Input: xpad - Poweroff XBOX360W on mode button long press

 drivers/input/joystick/xpad.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

-- 
2.25.1

