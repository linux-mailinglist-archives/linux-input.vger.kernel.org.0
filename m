Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE33352D92
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbhDBQQh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 12:16:37 -0400
Received: from smtpcmd12131.aruba.it ([62.149.156.131]:41815 "EHLO
        smtpcmd12131.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDBQQg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 12:16:36 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id SMTElkkEVik8wSMTElXAND; Fri, 02 Apr 2021 18:16:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617380194; bh=m13GAYsHNmluDy30JkKZAaaoyOxCHUEz0RY6LlOxN24=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=cSGgyYnxq2EDqmDNa4Qa+LiSe0Hr11DtKt/uHkS9qUlItD5UqM7xfuVEn/9AHCpXT
         mVehoI0Bua58p6sD72O0l5Z9HuvXkG3zEm3w+VDT0fyuuJf2vJAHmFsK46iEX7L9ba
         hO//TTVgGIqu69H/dIerfLxyupG5Cf4H+qO3n9NxxuDR3ayddI7ATWwCP0ey0BDFua
         0A3/Nv/yTvVDqCTcvqxMGlz1sDxAM8tiv64tzkO0R6DMX1ix2sDoo1xaKJQZLxhwO9
         gsQI/a0fnrxFtXITnW3n5LQyit7SmF4PWfWIfHTouiry5zvcqcG1rn/26kfa5nKTXy
         aenloCGE2BUqQ==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Input: add Hycon HY46XX Touchscreen controller
Date:   Fri,  2 Apr 2021 18:16:24 +0200
Message-Id: <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YGbc7Qbu6s659Mx4@latitude>
References: <YGbc7Qbu6s659Mx4@latitude>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAn22ZS6640d6wQU0xrLwtdcW2w0XJWRg6Hs7GkbH8TubKuFKt8xogcjquEDySuKr8IIvqh/w5/MZ4qUw9klDEvbxluHQUZp5P50C49C6EprEmIxGUlD
 TrBvIhc0px3O19edTVJSAM2ZYpapyOW8jefuO9vnmMqe1Pk1cTAZ8tGBjd9BeW5uWRiHcw664T8jiNZWP/e22JGSKx5Xt8ch6LD/ItBYv3nClPsCDYWVz3AH
 1PJB5OAlw8qUBY9WYefXkuNA4jmN4smpm5H/46QKuAMSuVZRF+6eEnyx+Vh/XSJtzP+NWc+43wYSYaIhghyNUOiGOBG19Z3y0yfsLyZ6tB3RvKmSIej9kkKl
 zqbpadX6ND74yhoGtNyFnOllgrY2nWao6Wxm09Qpo3K8YjC7l+QXeKvvc9+PYJaoxp0id2hFvSyz3UKyJDsAQ0EY/Eap2nj63BXgyvcXXd4o+bcHHjU=
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

