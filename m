Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258A767FAC9
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 21:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbjA1U0L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 15:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA1U0K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 15:26:10 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6DC974E;
        Sat, 28 Jan 2023 12:26:09 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id x18so6354093qvl.1;
        Sat, 28 Jan 2023 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhStsrBdkKIUL8s3yMha6c/wuTgNY2kKh3rA4nC+xy8=;
        b=htsBwaQqV7b8JyztbmfW3fq82Rc/YEvjysla+nGwSPKFXr3qynk6Rb9ANQwU4y6Efc
         CzgdHSlnkunoMnFdUthANh+hgnrrV/jIRrCLybfSdMi0772W19Uw0V4HMRM4vBWL/Bcr
         uVLPMUM5tZGFOaVVvH+OYtDPX7fSVTVsfyq2JTqIgnscBc/ulNWON8NL/X92qA7yv/NL
         VOaHY0Z32AOFqDAM8JUtFGcZIE+A94b4gUPh1pbz4BZno2mR9i7rJd6Iyeeu1VNc/7Hn
         YReW6CdxLOPcehx3NvXQFR7cEt9byHpvS4JQeavp/AdoHglsz3ftTAxBtJUM+xIJDnIq
         GJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhStsrBdkKIUL8s3yMha6c/wuTgNY2kKh3rA4nC+xy8=;
        b=KNwGJqulbMfX3ZbZwKBlZnD6SCWKT2d0G29ACHIzMhOjGp6xVQJW1steSfpHkP59Fz
         j1s5zQxsyMknICNkKXn4s7XCwqHTfHp8IaXnOfMfEc1NHCzJcPmVvGklp9XjlFQ+QO6J
         jqalW9Vyov0ykJbUyLqVIzC35fY9xawhtETc+kuMNUI2uxiDPtNBFqc1p0lr1SVHzLt2
         hyRaD4YGc+QRD4jS3CmtvGKZ534FuPuRBbbxjxFIQ0dksCVaP5+vBD0xH39Q6lUdzPxa
         rfLRMM4Q9vb3C22ey3wytK6ouxurqluplrmfqDV/fBr1KuPXrg1YyB4dZ3FgNLalWr5l
         Y7KQ==
X-Gm-Message-State: AFqh2krduttxH9O3pEACguG6WWHlfftEv5/BfjNBR+m50PVbrye1L+M0
        C6M5DhoaQ2xCr+vDNpokZiA4cuvV2pOdeK9h
X-Google-Smtp-Source: AMrXdXvAwtovn20WrfJ2QCClK5VDFWLw6RHSQIlc7JvLwFTy5utlEx81h6djMBxrkYN6a+lGsYRwvA==
X-Received: by 2002:a0c:fe46:0:b0:534:a530:e98a with SMTP id u6-20020a0cfe46000000b00534a530e98amr59451613qvs.8.1674937568419;
        Sat, 28 Jan 2023 12:26:08 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm52460qkn.49.2023.01.28.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 12:26:08 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH 0/4] DeviceTree Support for USB-HID Devices and CP2112
Date:   Sat, 28 Jan 2023 14:26:18 -0600
Message-Id: <20230128202622.12676-1-kaehndan@gmail.com>
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

Plese correct if the assumption made that there is a 1:1 correlation between
a USB device and its HID device is not always true. If so, patch 0002 would
then need to be reworked.


Danny Kaehn (4):
  dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
  Share USB device devicetree node with child HID device
  Fix CP2112 driver not registering GPIO IRQ chip as threaded
  CP2112 Devicetree Support

 .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++
 drivers/hid/hid-cp2112.c                      | 10 +++
 drivers/hid/usbhid/hid-core.c                 |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hid/silabs,cp2112.yaml

-- 
2.25.1

