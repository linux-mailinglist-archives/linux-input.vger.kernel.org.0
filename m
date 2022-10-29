Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DD46124F2
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJ2StK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ2StJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15534459B3
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:09 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id m2so7259861pjr.3
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1b7LfWZ2ITMD1+SmMQvapY5vGNVmve0DctXm2sGHjB0=;
        b=Pl8kJSSIm3/8pIu8TrRkAggjiHH69NDpYttH5FJD5dnEINt5FPe+VrX1IG7FpF9JFz
         +4temhn8cx3y9T1W171ddDvF3D578rUEzEXtlkuKFFT5KtXxPpeyIjfMmwlJd61f6vKF
         1bnUN7Hhyp4Dxj/ybMtEJzKMLT5JZL84PIo6DEoGAYP19bFHCJ768fadnQm510+Na52B
         ffDvANMd37R3/Ksl+zMOydDeIxR9FATDAxcyMEFdkp6/hE30zE6D3rY4CRAzbi3zAhQJ
         CIRTO7TaYSggErsElvh2Z+BTsqBuKv1S/S8/Id5wmxBCBdkawUpZ9piPoIpOGrywi7js
         JgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1b7LfWZ2ITMD1+SmMQvapY5vGNVmve0DctXm2sGHjB0=;
        b=OlD7BA0I7nCHXNceuICUKs7yYnfSXyGVCbt6M4YybbjCbscbHAgP78q9jxNdM5VTfF
         7q7pd5KHw/HcX7XO69ulPGuV9qI/LLbQ91DvrMAeFzVezBTVZK78cTeIwJHwtphL40LA
         L9uynPPNXSZGd3sC2x7si2/umiYhOvUtUwvQ6E9be1Xi9PCs+TJ/Mh9A7Yk6lUGcjcS+
         Hr7ZF4fUuEUOXbmGFuezhhF+WCJol9cTEq7pjJqlqgUxO38p4ZM4feA+lfzpHCN3hLBx
         NzQMeib6pLenVhIu4hyXJf31ktuQ3vs70emssk5VyT8rBxnlMX1SE8i6+XBXB5PUoA1f
         inNw==
X-Gm-Message-State: ACrzQf2RAJqVZY2cC/2/AVaS6WY6AToGzBCynTS/hJjO5sXK/CmtCuTc
        n4P0/z30mH7XKwNSjbsBeGFOzg==
X-Google-Smtp-Source: AMsMyM7zomF9hC5LF+WnkyzjyznpKrSxxMDyjN94J3Kvi7RBPXF87mjw8rln+/Yh+kKJGfCdHg2gLg==
X-Received: by 2002:a17:90b:3e88:b0:213:6442:5614 with SMTP id rj8-20020a17090b3e8800b0021364425614mr17408107pjb.58.1667069348553;
        Sat, 29 Oct 2022 11:49:08 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:07 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 00/13] hid: playstation: add DualShock4 support
Date:   Sat, 29 Oct 2022 11:48:38 -0700
Message-Id: <20221029184851.282366-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
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

Hi,

Last year, we introduced hid-playstation as the start of a new driver
for officially supported PlayStation peripherals. The driver initially
only supported DualSense devices, but we promised to also bring support
for at least DualShock4 as well.

This patch series adds DualShock4 support to hid-playstation. It should
be considered a brand new driver written from scratch in the same design
as hid-playstation. The driver is more documented and uses structures
instead of byte offsets with magical values. The driver should be more
clear and easier to follow. A few little sections of code cary over, which
Sony contributed before for sensor calibration or dongle support.

Functionality wise the driver is equivalent to hid-sony. The only subtle
change is in the naming of the lightbar LEDs. Previously they used a naming
scheme like '<mac_address>:<color>", which doesn't follow the LED class standards.
The new scheme uses '<device_name>:<color>' (e.g. input10:red), which is more
compliant. Due to backwards compatibility in particular for Android, we couldn't
make it fully compliant. Nor were we able to use the new multicolor LED class.

Aside from the LED code, the other features behave the same way. The hid-tools
tests all pass as well. One small change is that we use a different HID report
0x12 to get the MAC address in USB mode. This report is the official one even
though other ones can get the info too, but e.g. clone devices don't tend to
support it.

Thanks,
Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (13):
  HID: playstation: initial DualShock4 USB support.
  HID: playstation: report DualShock4 hardware and firmware version.
  HID: playstation: add DualShock4 battery support.
  HID: playstation: add DualShock4 touchpad support.
  HID: playstation: add DualShock4 accelerometer and gyroscope support.
  HID: playstation: Add DualShock4 rumble support.
  HID: playstation: make LED brightness adjustable in ps_led_register.
  HID: playstation: support DualShock4 lightbar.
  HID: playstation: support DualShock4 lightbar blink.
  HID: playstation: add option to ignore CRC in ps_get_report.
  HID: playstation: add DualShock4 bluetooth support.
  HID: playstation: set default DualShock4 BT poll interval to 4ms.
  HID: playstation: add DualShock4 dongle support.

 drivers/hid/hid-playstation.c | 1135 ++++++++++++++++++++++++++++++++-
 1 file changed, 1120 insertions(+), 15 deletions(-)

-- 
2.37.3

