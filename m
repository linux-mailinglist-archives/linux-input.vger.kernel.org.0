Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F63535B3C1
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 13:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235558AbhDKLsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 07:48:32 -0400
Received: from smtpcmd0642.aruba.it ([62.149.156.42]:55936 "EHLO
        smtpcmd0642.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235549AbhDKLsa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 07:48:30 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VYZRl4bJnZCSXVYZRlNrem; Sun, 11 Apr 2021 13:48:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618141686; bh=97EadDgKdyUoA6VVl+Cd1FWi5owl/0lXDLoBjqblX2M=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=idGPzRCodt1t10IPO5rXMNcGErPuMppykt4DLzg661tbvU15nHuBE1XbHrFQHZPOh
         xFB+dqcnznnVtl/jbooCtUv8tSTOitZnM5jFPPKSxvdvjb0sWEAqjxWjnRHyXrDkrE
         26FL9WvoNvbuVYZdOY3qIB5cG5i4gNCsBXrmmrYnHi9bsNYNTqdBdl0linrTJKcG1B
         94YN6aiJ4uDOdawvWvanp90JXSVcqVPwgF0WHfoxBtSoK4PzbNM7HdSundsYN7zwnQ
         DvrZQlPAdsP4Mk83QZrglxvuGX+yq3jfOEuF6FlgQBljmo6+ZUy5ckHcmMpq4cj2FQ
         Bk6v3lt5Qgw2A==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v5 0/3] Input: add Hycon HY46XX Touchscreen controller
Date:   Sun, 11 Apr 2021 13:48:01 +0200
Message-Id: <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408202137.GA1890401@robh.at.kernel.org>
References: <20210408202137.GA1890401@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJdBFV8gRcmhPgIJczoxbm88ALqio9MVOIxv1dH6IWrX1Mjdmz3h8Yb6uJuUwAhO0LnHgv6Ckae5/rOVvuebReDoKaw6yIDtrNqiz982HIRUxaOWV/Ht
 d1iqD8+eB4Ohe4vStDR6VDykQ+6pAXvmETYmAqrkjYMgph/vlLr4j3G9hkaG2yIelzlQVL0ExZ6iuZU24lXxg6OLLNgLBGfutgUfw24RArkEyuCWC7OW6JEQ
 SNaEOlu9RCK7f0yoXE1KXrU1vdw7KDV9uC/G1T/g3i+FWh3wf00QkDIJxsnplAzChS/0XcGYqztsFowDmnXQY4jiKGWtXgliXkPGRP/XWIS9JGtD6TDpL4tt
 +Ffy6MlNbo/ieCGiTaD4h0wjo+NnIq1u8VOT7YRI0c4zko3YNna8//2Vh+48Vv8i70oQ89QPKih0OjX/llDm6NuIgGIrLhnTMMczw6ZYxAgtR5ijZEwEDlCy
 962sfVF1c1X4SPn6
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

