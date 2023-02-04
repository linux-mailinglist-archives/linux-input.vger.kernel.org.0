Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC9468A83A
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 05:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjBDEnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 23:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBDEnQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 23:43:16 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D53D1E2B0;
        Fri,  3 Feb 2023 20:43:15 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id g8so7783912qtq.13;
        Fri, 03 Feb 2023 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCH0D9YAdatvW6/BWSLKuxVD1JI/1n8TezjYWh9FOMw=;
        b=GFHG3vEGkv8AMa5k4oYUV6G1POb/eKf6KFWOsvdcuqJuKtAEmpMawbQINxkPYwiQwa
         6gX7dJxbL6WuTxbzqnduBlCKULuyEzYT+SUs7NPIrKhVmNeXud5ifMyUXy/jUH3BlidU
         vlJiwCx47wibDBXyf+FMHUOk7HlyW4xDtmJKKsTaDI5EffLK2pdP3G3kVpv861bhaX+I
         c8xQ7DDXrcpmaULL8U8Cjijj4EVQIs8tcQdxs626hwKRKqGbB8AswrFowETrFo+XoSnB
         ClG6Dc4GLvC0XcvoENh9MzKXnI3BQePfcFa2ODRSlkLfLxjYsAdWYi7GAeWHsiZmlzna
         W4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCH0D9YAdatvW6/BWSLKuxVD1JI/1n8TezjYWh9FOMw=;
        b=kfNWj88jZ3+shqDQbby3jWLL7EGq/lQADvWArGERkPqf+yxEfPvj37N5uKuW9kcwuR
         j3jCOoEwemYKN19txlGA+CfOAPKM+PbYNXzdmij+1XkSdAhYisRIQhoNnJCkYvAf0FAq
         IwPNYRGzLCHexP+nL1W7SSEfknGBAWcMTNgLGySAOmeeZ6mrGWkO7oqQFBGUo3KLtAj/
         qu9/6VI9EFpzAaL+R8HEAa64doNbTIwaXXPxdWrNv8T6Dhkcl46W7kcJ+2FNuaxPb/l/
         rTagfXh5AnCmRQ5uyArLnUiNcz2rRp+YrKlMECxFZpb3QCP5af03D3blhWV+RP79CFn1
         sqvg==
X-Gm-Message-State: AO0yUKVpZw2QkAGMfPHhtyBJ21ALiJTcGM8RcYsRkaHHvFNvn/6CH5F6
        dVPtVzerOkkjlGu5HK+7sFA=
X-Google-Smtp-Source: AK7set9x9HNxtTsChfhPORnD8deu13AJ2FIe5rRoeJUeU/CH38fhruUKI4jSyxbYyd4fKVNvn0cs8w==
X-Received: by 2002:a05:622a:2ca:b0:3b9:b1a1:73ec with SMTP id a10-20020a05622a02ca00b003b9b1a173ecmr24129869qtx.23.1675485794410;
        Fri, 03 Feb 2023 20:43:14 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id l23-20020ac84597000000b003b85ed59fa2sm2882135qtn.50.2023.02.03.20.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:43:14 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v2 0/4] DeviceTree Support for USB-HID Devices and CP2112
Date:   Fri,  3 Feb 2023 22:43:09 -0600
Message-Id: <20230204044313.364-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset allows USB-HID devices to have DeviceTree bindings through sharing
the USB of_node with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and interoperate with other drivers, and exposed the threaded
interrupt bug fixed in patch 0003.

Changes in v2:
 - Added more detail to silabs,cp2112.yaml dt-binding
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/input
 - Added support for setting smbus clock-frequency from DT in hid-cp2112.c
 - Added freeing of of_nodes on error paths of _probe in hid-cp2112.c

Danny Kaehn (4):
  dt-bindings: input: Add CP2112 HID USB to SMBus Bridge
  HID: usbhid: Share USB device devicetree node with child HID device
  HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
  HID: cp2112: Devicetree Support

 .../bindings/input/silabs,cp2112.yaml         | 114 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  23 +++-
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml

-- 
2.25.1

