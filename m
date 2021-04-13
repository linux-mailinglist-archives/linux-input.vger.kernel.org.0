Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAF035E1C9
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 16:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344769AbhDMOpK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 10:45:10 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:55520 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344609AbhDMOpJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 10:45:09 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WKHXlmrLILwkNWKHXlJXst; Tue, 13 Apr 2021 16:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618325088; bh=U0Qd1ET85p5b68Y13MpIUPlK1rDZzbVefoF3xvqLDOU=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=NBaMcotXY70bC56EXyeoFnz3RCJ29sJl6g+TIIkxSELVlyJ7hfeHsJIyXfHuz/1Pp
         keWgoiX6aQOIBx0JsvcWNlalUktwwkGg2QiZE6hZYK744XETkEPz+8+Dx1G2tBhIum
         5fJNawsLqx3kU70SzDqKhZHNux9d+sFSZegxT304amEObSI6JU90CDeItptugt50N7
         V0FrIjGe4TjFOvJl38524xiUzfJY+/YYqM4Bhl/CFAYqBp1yZjSIOeovVcuZHHtRp4
         mrbUnmOnriZNejgRkQLN4Ko9CyxJQu1f2x7gcywfy0bTH4FFy+/xpR6siQrRoUTfVd
         RJr4x3k0QgJeA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v7 0/3] Input: add Hycon HY46XX Touchscreen controller
Date:   Tue, 13 Apr 2021 16:44:43 +0200
Message-Id: <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB+HwW2y5aybo6pZitV3RXOKGVSD8WEGtMAvMUoYxMPIR8MXShWixvm+OpeQtwmrpIYCjyoMziiHttrgE2F51MTZOCHNk4CLae/gqgZUPH2dfyqw2RQc
 qn1nSafpPFia4c3LZOkT/F20xEsKv91Tm6LbSuXj7pASrSSzoT9GXvD/8vTBPIjB38R9zBBqhhe0BwQieaQOM1cyJDpj31r6IJaA3Bc0OE8UneoeHx5eTiLi
 swJ7nzKHcXGO6jlmhHbfsZnYv4eR79gAAyFLrfBG2CQNst/scecMLvtzqDzfJEZ1dtj72eFK1ElOYbkeTGRkUWfGOrX8cAGygfQLYwYZ5IiSCRjxlADrmqjv
 zDoD4M5UpLaT3odQwLa9Lxeg+NfnDyqY8x+IcrZSIr0nhvvtSEdICV0eUcVGa3WpXI8YAB8QlrbuXWP0FwMT+pNNqwWZqHY0yxFNGvW8odWDCbdiFD4sRVgT
 bPGeSFOuu0xN/PqCfDZgWyoHavcrjzK6uuxiGg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset adds Hycon vendor, HY46XX touchscreen controller driver
and its .yaml binding.

---
V1->V2:
* changed authorship and SoBs to @benettiengineering.com domain
* fixed vendor commit log according to Jonathan Neuschäfer's suggestion
* fixed hy46xx bindings according to Rob Herring's suggestions
* fixed hy46xx driver according to Dmitry Torokhov's suggestions
further details are listed in single patches
V2->V3:
* fixed hy46xx bindings according to Jonathan Neuschäfer's suggestion
* fixed hy46xx driver according to Jonathan Neuschäfer's suggestion
further details are listed in single patches
V3->V4:
* fixed binding compatible string as suggested by Jonathan Neuschäfer
V4->V5:
* fixed hy46xx bindings and driver according to Rob Herring's suggestions
further details are listed in single patches
V5->V6:
* changed report-speed property name into report-speed-hz according to
Rob Herring's suggestion
V6->V7:
* added missing patch to series
---

Giulio Benetti (3):
  dt-bindings: Add Hycon Technology vendor prefix
  dt-bindings: touchscreen: Add HY46XX bindings
  Input: add driver for the Hycon HY46XX touchpanel series

 .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c      | 591 ++++++++++++++++++
 6 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

-- 
2.25.1

