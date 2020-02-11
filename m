Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B6F158E12
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 13:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgBKMNa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 07:13:30 -0500
Received: from onstation.org ([52.200.56.107]:58246 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728635AbgBKMNa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 07:13:30 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 513463E955;
        Tue, 11 Feb 2020 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1581423209;
        bh=Yaag2vNG13oaTjnQhFARRRVSPgpOAMZBTu/94Jo7vwE=;
        h=From:To:Cc:Subject:Date:From;
        b=aUXniMUDkl5e2GeGgFVmFYepCVWDbUUVUpMWyyBptqL+TKp9kxYQ+2a42wzSbF3M4
         vCnE7bjI6l51LscHQgEO5w4c2mr4YGELt41I7LMRyAjho9RbftX5PwMavr6aav6KeU
         aB4imnNm65+zEaUi7r9Vs4fzNhauSTjWGFwiWXTc=
From:   Brian Masney <masneyb@onstation.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] Input: remove msm-vibrator driver and bindings
Date:   Tue, 11 Feb 2020 07:13:16 -0500
Message-Id: <20200211121318.144067-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Here's a small patch series that removes the msm-vibrator driver and
bindings. These two patches are broken out from this patch series:

https://lore.kernel.org/lkml/20191205002503.13088-5-masneyb@onstation.org/

In a nutshell, I'm waiting for someone from Qualcomm to either post a
patch to support setting the clock duty cycle or someone to post
information about the m,n,d registers for the clocks. Once that's done,
no other changes should be needed in the input subsystem.

In the mean time, the msm-vibrator driver needs to be removed from
upstream.

Changes since v1:
- Updated commit messages to remove references to clk-vibrator.

Brian Masney (2):
  dt-bindings: Input: remove msm-vibrator
  Input: remove msm-vibrator driver

 .../bindings/input/msm-vibrator.txt           |  36 ---
 drivers/input/misc/Kconfig                    |  10 -
 drivers/input/misc/Makefile                   |   1 -
 drivers/input/misc/msm-vibrator.c             | 281 ------------------
 4 files changed, 328 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/msm-vibrator.txt
 delete mode 100644 drivers/input/misc/msm-vibrator.c

-- 
2.24.1

