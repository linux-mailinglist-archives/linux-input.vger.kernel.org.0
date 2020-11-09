Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB0E2AC233
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 18:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731358AbgKIR2q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 12:28:46 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:49742 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730315AbgKIR2q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 12:28:46 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CVHz103Wgz8p;
        Mon,  9 Nov 2020 18:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604942925; bh=k6HbcfJyFMKviEvHHtdNFxeoFr0JewPXEyVplOK1Gjw=;
        h=Date:From:Subject:To:Cc:From;
        b=cGpIOVILeAIXY9j4VSuPCNqVXIM9efaQ4SdJMjb6+dc40/onBs/6mCUx3vMTX84Mi
         fXfXR3kd/NB+alEVMAvmXzk0JesbXvb+V29Bifp+E71pZBc/qvzOX3gjQMfErjtuur
         CmWfQLwhREG1Y/EfKR0db7Ga6k9n7bACWkprshH2ELZonNSNRlFIQUBsl0JCTiyAju
         +MGkuLKiNNsnE2McsQKhuP9D0blWqPTrn1xVoLPh+pkimNvAn2Ms9MjeE5bPUiH7jH
         XMlBnNbpq1Q68oeda41piTp8by6PkBmj5ZqoN5EVYTq/HJ9eHqFufaf4Hip0X7xQPR
         tqRh/vummTi8w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Mon, 09 Nov 2020 18:28:41 +0100
Message-Id: <cover.1604942771.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND v8 0/4] input: elants: Support Asus TF300T and Nexus 7 touchscreens
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series cleans up the driver a bit and implements changes needed to
support EKTF3624-based touchscreen used in Asus TF300T, Google Nexus 7
and similar Tegra3-based tablets.

---
v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)
v3: rebased for v5.7-rc1
v4: rebased onto v5.7-rc2+ (current Linus' master)
    update "remove unused axes" and "refactor
      elants_i2c_execute_command()" patches after review
    add David's patch converting DT binding to YAML
v5: rebased onto dtor/input/for-linus
v6: rebased onto newer dtor/input/for-linus
    remove yet unused constants from patch 1
    added a new drive-by cleanup (last patch)
v7: rebased onto current dtor/input/for-next
v8: rebased onto current dtor/input/for-linus
---

Dmitry Osipenko (1):
  input: elants: support 0x66 reply opcode for reporting touches

Michał Mirosław (3):
  input: elants: document some registers and values
  input: elants: support old touch report format
  input: elants: read touchscreen size for EKTF3624

 drivers/input/touchscreen/elants_i2c.c | 149 +++++++++++++++++++++----
 1 file changed, 127 insertions(+), 22 deletions(-)

-- 
2.20.1

