Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00462352333
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 01:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbhDAXLK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Apr 2021 19:11:10 -0400
Received: from smtpcmd0872.aruba.it ([62.149.156.72]:40004 "EHLO
        smtpcmd0872.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhDAXLJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Apr 2021 19:11:09 -0400
Received: from ubuntu.localdomain ([146.241.168.220])
        by Aruba Outgoing Smtp  with ESMTPSA
        id S6M3lCwpyHTbyS6M3lYQyT; Fri, 02 Apr 2021 01:04:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617318243; bh=Smfqp5AjnbqZc0Kl/fWbBBo84E0RCZCWyIKDBTINsi0=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=k3cy3BzCVN9XEO+ErWczjyH67khkcbC9n6GVmZZshz514Xu0ilV2mDjUCJ5EdQ7fB
         w8OnjuhKVMeIdKskowfF6g+4AlHEy8khuTRxGEbD7ovxy7rdtRRPVdCBCyprbKv2pg
         EHuv9Z+sUxVuXbJsj4NmR5DWQ2vcddouJg3SrjggqUC3c8jzxwJ9yw6Bjou3n1ixAZ
         BpVXgkPhMDktouQX9XiYBmGTs+htJ/iZib+C0k2W3Nf8VlUDLzREU+SYDUwAWeB1Jf
         6aZckaeosxKxLEUgJRZ8lPPpQ6Sdy3NiMoqOngV7tx+xnfiQtLt3ZUNAM6oHWj90FX
         /2rFx2vago7sA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: [PATCH v2 0/3] Input: add Hycon HY46XX Touchscreen controller
Date:   Fri,  2 Apr 2021 01:03:55 +0200
Message-Id: <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306194120.GA1075725@robh.at.kernel.org>
References: <20210306194120.GA1075725@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPI8q7PPoHuBDgszldsBC5l9QWtjpHgziZZ1oWL1Y9aBJ20ZKCIUKdHeRe79gH5oD6k8FsKtkxgfdm4z78hGgGVmZbp1Pyi+pFK9n1uxnAZCXgMyiDGL
 y8XyeRFDZtcLpfKdph5QT97mJ5tL0bb8GXGSo7tp3K3EYvJ+KNNlBDJyCVd6CjYorM2skEFfTy/msuDZCNmFPyfT7ITKzU4gLD5F3XiFmEv8z602R0NsRYAe
 tmZ+CV49iR7SwFbePU/qxi9ppPC1N0GZS3c5+Bl3MkKjnnWfn/ha6hCp9vc3q3MiQ8eCLWWWGipH06ZxSu25vksYdei8VxyzgMdGi2Ivxs7PXaIY4RmdJ9Ug
 RwfybKcYQ+seh+fEuCTLq4Uhs7hQ1xYmENAZWuswrmZ7bCKG4X3FMWQFmm0tkw+lIKzfmh5tuTLVqpndVja1rEB/03gohibKpeE8hgMNksboh8OJFrPSCSw9
 Zy8b/R+T+aXkQfg8
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
---

Giulio Benetti (3):
  dt-bindings: Add Hycon Technology vendor prefix
  dt-bindings: touchscreen: Add HY46XX bindings
  Input: add driver for the Hycon HY46XX touchpanel series

 .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c      | 591 ++++++++++++++++++
 6 files changed, 733 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

-- 
2.25.1

