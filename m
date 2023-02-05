Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB9968B066
	for <lists+linux-input@lfdr.de>; Sun,  5 Feb 2023 15:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjBEOyw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Feb 2023 09:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjBEOyv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Feb 2023 09:54:51 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89861ABEC;
        Sun,  5 Feb 2023 06:54:50 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id h24so10434308qtr.0;
        Sun, 05 Feb 2023 06:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjcSqStCuN5BIIinHdXYJtbpb7OVNAUIe6HudY9Vp7Y=;
        b=hLs7wxeXj5FjoFbXakwtyVLmi+mgcYihEvK1n6eUQ5XIyYN+d67cRXlW9dv56QatVA
         aX5tWcAxElKTfpdR5TQ3oP4UhjUw/2eOoJx4RpQbp4Zm6kkjnSAca70WvcI9MNrXPvhw
         yyDpwi8tNLy3/OSD6VgwwbasmNVBW+3Vrwt9W4a1xP2fOluozgsJgJ3nfePg/Cg+wcda
         Vm4bDKOJcDV4qWyIMRjkVwlpisuJVmswW6cM6Wcu8rJdI+9vOqP99v6euX2qCeVg/VzW
         k0DCDp9wxEvtK0RxzomyXuxTxWSD7/iQEkugRSh9gbik2da7Rb8362c1Yy4Zp4DMmGY+
         xomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjcSqStCuN5BIIinHdXYJtbpb7OVNAUIe6HudY9Vp7Y=;
        b=tlsI2DbmBEgncjQx6HlDIh8N3z4ZdBZVXVIsRDJtZzG2qvqkpAqpEe1tI7IPJjrlGs
         I/AoIfz18G1PcDNzxEam5Hc6zXOcku0wSDeeJce83pEYqnwWMcxm6TY1S90eHbGyZ7p/
         XojsdjAlrqsqmjqDWBvDG1On26NOITLNfoELWBWdlsaGLTM2EjSZ9j52uzmmbHGf0Hab
         HWXF/bN8MssBejSyIueGxyW8QyLggaPbtTLdD9TKnBhPzUo4wtoE1FjNxP6pzmMXsNh+
         4Kd3CwTmVuhj3KIiq4I3XQKNT1Xew6fPvx2/acOfGpwwMRXJAkZZ7hZMXQcZX7lGrRdV
         AE9w==
X-Gm-Message-State: AO0yUKUe/LxeHsh0fuy8YLiYygRHUZ6FI1EKTWgn1blSd02+QsruUlRe
        hhOBbEzdjqQF8gZCWkSrCo4=
X-Google-Smtp-Source: AK7set83bgJQI1A3fEiGoSQfXaxQcbv6+t8mbiioCiONA9FDNz17pPn2X0mP66NJ6oeamf0eixYvNw==
X-Received: by 2002:ac8:5f46:0:b0:3b9:a63e:35c0 with SMTP id y6-20020ac85f46000000b003b9a63e35c0mr33296789qta.16.1675608889842;
        Sun, 05 Feb 2023 06:54:49 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm5560048qkf.91.2023.02.05.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:54:49 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v3 0/4] DeviceTree Support for USB-HID Devices and CP2112
Date:   Sun,  5 Feb 2023 08:54:46 -0600
Message-Id: <20230205145450.3396-1-kaehndan@gmail.com>
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

Changes in v3:
 - Additional fixups to silabs,cp2112.yaml to address comments

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

 .../bindings/input/silabs,cp2112.yaml         | 112 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  23 +++-
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 135 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml

-- 
2.25.1

