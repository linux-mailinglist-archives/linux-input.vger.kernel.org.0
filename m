Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83735C9BD
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 17:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242790AbhDLPYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 11:24:23 -0400
Received: from smtpcmd0987.aruba.it ([62.149.156.87]:39907 "EHLO
        smtpcmd0987.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238498AbhDLPYV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 11:24:21 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VyPxlWzubppTXVyPxls0RY; Mon, 12 Apr 2021 17:24:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618241042; bh=F75spvDPrGLK56GsG2uIcQcV5ho8yiSRhxmiVJCzFCw=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=HVBUAWtI2gC13gheKRG+gGjhIBm9BEyXi1/5ekgWsWLrFnFh/e7BT917CXbuit+D2
         NUZIiHdGWiQi3ozU4F00ubF2YBJfX1lLFTFr0gJ8Vr/PQ4aLyCXFpTYY3E+aPCj949
         YH0ax0ZzDVcq57XRZcosIv/iknYp/f+Ob41n7ujSnNvQGUdMSoAUK+A5Co8O9Hg6DI
         xo4JW1yvEBCTCRF2t/yxPSqAklAorkw8B/j6P+dZ54HrHghTY6upVxuUhNcHWHBSKw
         BmNP8PHKBelFzyLOdVmZCCyLF17OtkNfhwUQ+YnQJm2cSPzVrjlE0yIfr2EcVpJqtO
         STMCxGG16ZC2Q==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v6 0/2] Input: add Hycon HY46XX Touchscreen controller
Date:   Mon, 12 Apr 2021 17:23:58 +0200
Message-Id: <20210412152400.1587623-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412144624.GA3868831@robh.at.kernel.org>
References: <20210412144624.GA3868831@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJFLlVjNTSOowySM1XCPDyzj8JPIsNhjjV08JbsejMH/KsJgqlhoZ2X5sZCfeA+Ob3mbaV58MhEuqKTQbAf+8LYRL5Y4Ib8YFJJfpjec22W4BA71zveF
 eSFrMCR/5P1iVLvskRckfD7R1XKJuyUu8LBwxez5JNKyEYv5iDuRJ33BCX/bL9myf1i4bVOr9ZgkCT/zN3gdCH+8U8qb1365ZiUg07RkKtp+ywOWA+CYEOZ+
 FDraBHuOI2k2+3czHFfGlA8Of+3l34UFya1kh1IUEU6DIImQgNdyKEdADbUKkMd3Y01nM+YZZ+QuR3314Fpqr+/iWeZ7xguOdU2xZBLgIoGzAv4xWA+lttIY
 T+Kqm9dFK2GAZOaxr+ouyjVDIruWihiPLIFzNcuQWt+OaeYA1pAWj19WtkxkDX94GKpr2MHCNNbNRYGDRNMXEt9J1OzCU7xJQaCKcapzbMw90on70AYUXzaP
 mYhaQoDoTl1kRbOk
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
---

Giulio Benetti (2):
  dt-bindings: touchscreen: Add HY46XX bindings
  Input: add driver for the Hycon HY46XX touchpanel series

 .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c      | 591 ++++++++++++++++++
 5 files changed, 729 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

-- 
2.25.1

