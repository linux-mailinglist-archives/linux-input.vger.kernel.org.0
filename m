Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56ABB6D3A25
	for <lists+linux-input@lfdr.de>; Sun,  2 Apr 2023 22:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjDBUKP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Apr 2023 16:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjDBUKO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Apr 2023 16:10:14 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A98E3586
        for <linux-input@vger.kernel.org>; Sun,  2 Apr 2023 13:10:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id cn12so109554352edb.4
        for <linux-input@vger.kernel.org>; Sun, 02 Apr 2023 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680466211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeS/K6Vgqovzy5IrEj4kKLQF6NPWoliB9Z+vqp09t2o=;
        b=bY8hUBO+rCdsyAGIYLZBsm+0DU+1MCE2UVtl7UI75LohQBQzyszIIGGHeSZXHxv7hO
         0U3uAcGSFMpUr/7Gvt95CMAaDDGVHUlK0pENcWopedTAK40iUxyADnckvtnyktdjHr3t
         ADaYwi/icfQ0i+xwnVpG8O3H12rpsdSHG/9+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680466211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeS/K6Vgqovzy5IrEj4kKLQF6NPWoliB9Z+vqp09t2o=;
        b=Cc6ID0aK8NbKmg5k+17y8kxj7W5DuRSgZOt+ALqXIjknNkiTMQBqNyFG7uJq8717j4
         PlkxyQQZH3NwiEDei/U32JFCPba6D8OFKAS6Lem/EUNJLXXpcyliiJrqK8ye8kHPO40v
         d2aLePNLUofZMmuozgjA90nvBnfisFLkDRjNECLWl3tabDCDVlWuwgLnu1BMZ9Dg29gz
         Ii12i7prVAFhHm6tw3j3WG9HVmYl/aCgdvF3nLlpl6GqdnqgHzoHuKN0IgzFMUn413xR
         1/jRuDzfv+pR2kf3NNk+dIjFut6C/uVK41vQi7YyoV6E5F9+ZOE9dXPd8+DjKAgyEx5o
         9/RQ==
X-Gm-Message-State: AAQBX9d7Jfm1+R/7pFdiOMQnpMEyGlah4AJ68Fzgyi3oPgtJoYzyoEms
        sAdL8zuR4Pr3/8VrMF3nrSgU+A==
X-Google-Smtp-Source: AKy350a1vSodAG/tA7cFsuKSJchqyQPcLm3dsPvLg9Y1l3eGdYyK9240gFQuDos4og+HzB0FcYYU9A==
X-Received: by 2002:a17:906:25d5:b0:932:40f4:5c44 with SMTP id n21-20020a17090625d500b0093240f45c44mr33576716ejb.36.1680466211712;
        Sun, 02 Apr 2023 13:10:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-248-31-153.retail.telecomitalia.it. [95.248.31.153])
        by smtp.gmail.com with ESMTPSA id gl18-20020a170906e0d200b00924d38bbdc0sm3553127ejb.105.2023.04.02.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:10:11 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/9] Input: edt-ft5x06 - convert to use regmap API
Date:   Sun,  2 Apr 2023 22:09:42 +0200
Message-Id: <20230402200951.1032513-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


This series converts the driver to use the regmap API for accessing the
registers of the different models it manages, making the driver code more
generic.
The series has been tested on the following touchscreen models:
- M06
- M09
- M12
- EP0430MLF0M
- generic ft5x06 (05)

The series also includes some code cleaning and optimization patches.


Dario Binacchi (9):
  Input: edt-ft5x06 - fix indentation
  Input: edt-ft5x06 - remove unnecessary blank lines
  Input: edt-ft5x06 - add spaces to ensure format specification
  Input: edt-ft5x06 - don't recalculate the CRC
  Input: edt-ft5x06 - remove code duplication
  Input: edt-ft5x06 - don't print error messages with dev_dbg()
  Input: edt-ft5x06 - convert to use regmap API
  Input: edt-ft5x06 - unify the crc check
  Input: edt-ft5x06: Calculate points data length only once

 drivers/input/touchscreen/edt-ft5x06.c | 496 +++++++++++++------------
 1 file changed, 251 insertions(+), 245 deletions(-)

-- 
2.32.0

