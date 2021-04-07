Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D4F35737D
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 19:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355014AbhDGRtW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 13:49:22 -0400
Received: from smtpcmd11117.aruba.it ([62.149.156.117]:59703 "EHLO
        smtpcmd11117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354998AbhDGRtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 13:49:22 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id UCIflJuxlkeOqUCIfl3jFY; Wed, 07 Apr 2021 19:49:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617817750; bh=epAo27sNtYS1RCkbnQILB2jWSlpauVebSiAvMXwkk60=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=Tsqqrl6xTFX4dr7a4I/YzalvLQs+uHDs/0E9hoAYolpNK7S44+NYOYt0G+t27Or0+
         +j111ManCpeld8n2Oz5NiV9gqBbuO5iI5FuLaJJact9tUPqSQJxTEqUff0l9D8EjVL
         KZPFCimN0d2viwhSwxkLJFgAd1L7+UD9234kd8/51kh2drLplSEED0JbjpHz+2kKR9
         IShk0N1WXc/q4re7C2Hs3DVp08ZMAH7DbVD6eqS4BH4/Vzm5VISZJnzRwC/5QjL/tf
         sScloMp4HuzunzIT1g2rO4UTPZgxTVYclK20wHrN07y0+7oMulFVAEs69tl0O0aLY8
         /NfIUS5g9lSsg==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v4 0/3] Input: add Hycon HY46XX Touchscreen controller
Date:   Wed,  7 Apr 2021 19:49:06 +0200
Message-Id: <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YGxkB6icZSJfx/VB@latitude>
References: <YGxkB6icZSJfx/VB@latitude>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLPQ9TxkuDYZtue8US9cHQPJwzzkq0fPPAnYKDkhWnWO5s3bap5tH9K1nu57W79CJE1mZy5li3FV3pmM7ASF39ua+yyQaz8dbJOFKtRHRXbTaJgXtN+r
 SlLgSmahdarszhX1KOxPd7j1r9xqEf3f14OOE3HWSDYRf6kpb4n1nzOz3oInSKhymboefb/kevBIo3rfUP4F/Hr6J3ObXPbTDSIp19Ta09ygEFEbnJhOkCKC
 gPPLEvfyj2ZkzS91ghYWc/I+VPPtF3agOgSI+b4y+5oJbTwfqnyAeDklupQBTAYqUGjH9Xk79wvYDPKgcX+ObZlj62dzdutG1rGQUIoQtUJIt2r0v58xoPIy
 DK7u3giiX0uMObC/BvwvUVWQ1mwNN4cblLAI1QNzmbkp+Z6RUkWjPgM2BSJUqDVG8y4/geF0DAD49e1D8ywJHeqCmJPr56a+V+rDfJWj+e201jRbVIZ7OjdG
 ia8KwCqVUpSvtqeO
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
---

Giulio Benetti (3):
  dt-bindings: Add Hycon Technology vendor prefix
  dt-bindings: touchscreen: Add HY46XX bindings
  Input: add driver for the Hycon HY46XX touchpanel series

 .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c      | 591 ++++++++++++++++++
 6 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

-- 
2.25.1

