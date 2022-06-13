Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D1F549F67
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 22:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235879AbiFMUfC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jun 2022 16:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbiFMUdc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jun 2022 16:33:32 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BCF2C0;
        Mon, 13 Jun 2022 12:24:03 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id v12-20020a4a314c000000b0041b65c7e100so1354685oog.8;
        Mon, 13 Jun 2022 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soDls7dCcz1ZPpwB8dw+TM3GeqzOJjJq6MJ6fYnP6Ac=;
        b=gVkDRTgET96s94Fj8AGMYQ7plsLzzIOrkFusvdkw+BE02VoTuo4Dtmp8l6rlbkAWSq
         3VLuxyouB2xA3n4K50uFEXHhKnEIm/R9iWM020KcfMEUbtk7VtKsUnBccI+5MNAw+MoM
         4SUG7jhkfrqQBh612YxOBdFP2UYXHNIq9Q6zWsFRVq6wRBRQusJb8TJ/Ec5nGft56KMY
         xRcH0RrykZX3qUye0dLhmd8pXJUieLSb+Tq0DPlbEt/UKsJwEf8LoJYg5ky2YMX/jUCR
         OzIhQo+YLtstI3dcF9dXVJhY7bE/sAzi8E3U/2KgaMBa6P/2iXsCs0dFR/zvQsW+on24
         qZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=soDls7dCcz1ZPpwB8dw+TM3GeqzOJjJq6MJ6fYnP6Ac=;
        b=xpsaLf1j/C5ZeqnBXhQHCpbL51qPSmTly3bRiBx5unf1cNWS8fzu1DxuES5sTfgT2P
         jelYqtZ8JvS2b8rN0uCOoWF8aaoLBUg3gcMBAwLXoolUD9BLi6IqL4ixmkNLDGv0Mbz+
         3rs1Bw4N6dhdFNwLeGJLvrOBEZavmcq8/u3u0hH2UYj+IBMWL200F/yuTTUtbs3uDNZV
         NlDXtp5f8pzSOFpb2WwjbnUcJ7qayaPJ+kHilyXTfcrBoWIu81SJjXlzIMdPB80igqDJ
         2Pbm36pFwTvUZ9RlP7/jJ4JDZdyBTSSvmZne7dWADUVfKO3QSKowJl37njPqnpZ2FlaQ
         JYXA==
X-Gm-Message-State: AOAM532bFS3eoM73fSohCla82FN/d1JZEfOJH97zrhOXxNEMX39X/z5H
        NKI4e6jAXqaxaF/PzYf2h+kExaBN3LQ=
X-Google-Smtp-Source: ABdhPJwydrZEwRLKV4EbIEDS5L4amqbACGianDmULDMTy1AqRJk11ANrlIktzehmdzexhBRCY2qwqw==
X-Received: by 2002:a4a:dd8b:0:b0:41b:92b4:c928 with SMTP id h11-20020a4add8b000000b0041b92b4c928mr531518oov.59.1655148242112;
        Mon, 13 Jun 2022 12:24:02 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id bf34-20020a056808192200b0032ba1b363d2sm3637274oib.55.2022.06.13.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 12:24:01 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 0/3] adc-joystick: Add polled support
Date:   Mon, 13 Jun 2022 14:23:50 -0500
Message-Id: <20220613192353.696-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support to the existing adc-joystick driver to support polling
rather than relying on triggered buffers. This is useful for devices
that do not offer triggered buffers in hardware. Code adapted from
changes made by Maya Matuszczyk <maccraft123mc@gmail.com>.

Changes from V2:
 - Changed parameter from "adc-joystick,polled" to
   "adc-joystick,no-hardware-trigger" as it is more representative of
   what the driver and hardware are doing.

Changes from V1:
 - Removed driver compatible string of "adc-joystick-polled".
 - Added new optional boolean value of "adc-joystick,polled".
 - Cleaned up if statements regarding polling behavior.


Chris Morgan (3):
  dt-bindings: adc-joystick: add adc-joystick,no-hardware-trigger
  Input: adc-joystick - Add polled input device support
  arm64: dts: rockchip: Update joystick to polled for Odroid-Go2

 .../bindings/input/adc-joystick.yaml          |  9 +++-
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  1 +
 drivers/input/joystick/adc-joystick.c         | 52 +++++++++++++++----
 3 files changed, 50 insertions(+), 12 deletions(-)

-- 
2.25.1

