Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A04481772
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 00:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbhL2XLq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 18:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhL2XLq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 18:11:46 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE00C061574
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:46 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id s1so18131568pga.5
        for <linux-input@vger.kernel.org>; Wed, 29 Dec 2021 15:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79xf6S5yfwQNC+z8XjsPO7PDMKovlZXbQZe0n1Z1jQM=;
        b=W8LrZcEAG3VVTzng/2EhFmyfvoFudwIR7s3NJx3CavoZYYg7rdcNGEu8RjazAsZbR/
         Hk+jrfNRswT0M/W3xMVmq3/b0O9ntJS7oDj4LWDtbSdhkoPkn1qWdK6QoWz4eM3LOfHk
         0NigCRe2YpbByyYttTf57B+l2A+JbmAYZiDRth/NbbNJ51eB1Lg1C1Qxe4SyOJ0pgoLs
         +4DinatR0r3Qs5N97Abprtzo7u0xK27Smb8ELXS/BrngrFSU3njBNZnCKaG73caWiVWw
         QQrzO6k3Nr8t/AHMJlVkwZXkCxci7yalYNI0Wetz1fhF3ppVjT6mGp5l4kO+49yJ/us5
         oR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79xf6S5yfwQNC+z8XjsPO7PDMKovlZXbQZe0n1Z1jQM=;
        b=AVCut2ctsgKGC2rs5+N1SAQQXJ8lqFnpxoo0RYZ+1eSzpIc/ZOxWRhrVC1KPBLVp0B
         m1A3dGzaMRBCtKYcrODwMjk4qKxUm46DBW3PNH2iE4Un8D0Je2Pu1L/Amj7e4eOZc7x9
         tmPpTfnIcCUR4Ji+xm46r8K8UuhQVFvCxgex8Zs8w4js9g2eW5IpT8VEG3lZInAJp8Ga
         1d4vAjdHXsyiIKMTiVZ9KDHmqvRmWT9gNK9aKdGWadOUgjEUEzyZthjEXmYwWG05OtCY
         htHOSdQcvyXqZJ5I2ZHeka1DExPOnVhtnstFg2NNp65REpqmyantKyFhPo63N4TJXkHW
         2yWw==
X-Gm-Message-State: AOAM530wtY8O9ONsUCepzs6KfjO9bQcUJfIFYU46v1XBWEEUIL0SVTjY
        K44wW5CsgZrPeaBYSEAvPrs=
X-Google-Smtp-Source: ABdhPJxM0jJ6QfVfg/ql2x1wSTnN/W+LKx8XTeHVnV0JdMUNQZb4a3M78SCDKOztrKkC178jsSzQ9w==
X-Received: by 2002:a62:7c58:0:b0:4bb:314b:86b9 with SMTP id x85-20020a627c58000000b004bb314b86b9mr28855524pfc.84.1640819505504;
        Wed, 29 Dec 2021 15:11:45 -0800 (PST)
Received: from thelio.corp.microsoft.com ([2001:4898:80e8:36:99f0:adae:413c:2890])
        by smtp.gmail.com with ESMTPSA id k6sm26058042pff.106.2021.12.29.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 15:11:45 -0800 (PST)
From:   Dmitry Antipov <daantipov@gmail.com>
X-Google-Original-From: Dmitry Antipov <dmanti@microsoft.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Subject: [PATCH v1 0/5] Add spi-hid, transport for HID over SPI bus
Date:   Wed, 29 Dec 2021 15:11:36 -0800
Message-Id: <20211229231141.303919-1-dmanti@microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Surface Duo devices use a touch digitizer that communicates to the main
SoC via SPI and presents itself as a HID device. This patch's goal is to
add the spi-hid transport driver to drivers/hid. The driver follows the
publically available HID Over SPI Protocol Specification version 1.0.

In the initial commits there are some HID core changes to support a SPI
device, followed by extensions to hid_driver and hid_ll_driver structs
to allow for some error-handling logic delegation from the transport
layer to the device driver, and finally the SPI HID transport driver.

Dmitry Antipov (5):
  HID: Add BUS_SPI support when printing out device info in
    hid_connect()
  HID: define HID_SPI_DEVICE macro in hid.h
  HID: add on_transport_error() field to struct hid_driver
  HID: add reset() field to struct hid_ll_driver
  HID: add spi-hid, transport driver for HID over SPI bus

 arch/arm64/configs/defconfig        |    1 +
 drivers/hid/Kconfig                 |    2 +
 drivers/hid/Makefile                |    1 +
 drivers/hid/hid-core.c              |    3 +
 drivers/hid/spi-hid/Kconfig         |   25 +
 drivers/hid/spi-hid/Makefile        |   12 +
 drivers/hid/spi-hid/spi-hid-core.c  | 1487 +++++++++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h  |  201 ++++
 drivers/hid/spi-hid/spi-hid_trace.h |  197 ++++
 drivers/hid/spi-hid/trace.c         |   11 +
 include/linux/hid.h                 |   24 +
 11 files changed, 1964 insertions(+)
 create mode 100644 drivers/hid/spi-hid/Kconfig
 create mode 100644 drivers/hid/spi-hid/Makefile
 create mode 100644 drivers/hid/spi-hid/spi-hid-core.c
 create mode 100644 drivers/hid/spi-hid/spi-hid-core.h
 create mode 100644 drivers/hid/spi-hid/spi-hid_trace.h
 create mode 100644 drivers/hid/spi-hid/trace.c

-- 
2.25.1

