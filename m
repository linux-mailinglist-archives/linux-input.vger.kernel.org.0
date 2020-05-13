Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944921D0466
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 03:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731695AbgEMBhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 21:37:21 -0400
Received: from onstation.org ([52.200.56.107]:35604 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728313AbgEMBhT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 21:37:19 -0400
Received: from tp-x1.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3687B3E8F9;
        Wed, 13 May 2020 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1589333507;
        bh=B+H20NEAsBxVq9dR1S+OzvWqKqZ/flzrrfq6qjDiS7U=;
        h=From:To:Cc:Subject:Date:From;
        b=utHyRH1cxlSWJ2sp4CbTavFFXvuWSDnkgqufwwmjrYg4ZegePUhoMagD3Hov2E1AY
         WKWkezi0EaAwAAiKOpaFhAD8sTRx30tR10bmXLrmCdUAxcf6rlNvxUknE9Z8cVNVCc
         4Mi/UzV4hjBujGc2tCrNoHjFdRzbpLGar8KUfa2A=
From:   Brian Masney <masneyb@onstation.org>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org
Subject: [PATCH v2 RESEND 0/2] Input: remove msm-vibrator driver and bindings
Date:   Tue, 12 May 2020 21:31:38 -0400
Message-Id: <20200513013140.69935-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Here's a small patch series that removes the msm-vibrator driver and
bindings. These two patches are broken out from this patch series from
December:

https://lore.kernel.org/lkml/20191205002503.13088-5-masneyb@onstation.org/

And a resend of what I sent out in February:

https://lore.kernel.org/lkml/20200211121318.144067-1-masneyb@onstation.org/

In a nutshell, the address referenced by this driver is within the
Qualcomm Clock namespace and needs to be managed by the clk subsystem.
This driver needs to go away to clean up the upstream kernel.

I'm waiting for someone from Qualcomm to either post a patch to support
setting the clock duty cycle or someone to post information about the
m,n,d registers for the clocks. Once that's done, no other changes
will be needed in the input subsystem.

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

