Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E55E411B6F8
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388794AbfLKQDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:03:23 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:56115 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731676AbfLKQDX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:23 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1tb1xdTz5w;
        Wed, 11 Dec 2019 17:03:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080201; bh=90bjP3KcNPVERTfUk7zkVb0pHwfcs06iFNoTESUfGAw=;
        h=Date:From:Subject:To:Cc:From;
        b=KsrXJrPPjKg9EEgfeA/iO8qCMmKYqoOJ17TQBSCYSwCGvkWJNyTKlsPlcMo5H3rE9
         uI1cbknYGlbOtw23mEGN8OSu1WnUXXaUdDTn4qcR3tAYREIN5yrQPJHXtB3nEi+Agb
         FrZEyYY/XUdbO+6D6PjkrYxHc142VtnnEyJH+NRSRVzatSWfxqM/YHYguZ4p+EzCv6
         TIrCt1vViMpLhC2Qxc4oAV/+5M82M/E/F7LqQxN4daEON1C+sS7Tod/0LRoS4ooC+R
         wJcQT2knByhYkY6oi33My6aLtgXNpieC3r/FyqS7Tj0W7W89ST90IKneDqzDbzbKjd
         phB1+ju1R/gOg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:18 +0100
Message-Id: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 0/9] input: elants: Support Asus TF300T touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Scott Liu <scott.liu@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series cleans up the driver a bit and implements changes needed to
support EKTF3624-based touchscreen used in eg. Asus TF300T tablet. 

---
v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)

Dmitry Osipenko (3):
  input: elants: support 0x66 reply opcode for reporting touches
  dt-bindings: input: elants-i2c: Document common touchscreen properties
  dt-bindings: input: elants-i2c: Document eKTF3624

Michał Mirosław (6):
  input: elants: document some registers and values
  input: elants: support old touch report format
  input: elants: remove unused axes
  input: elants: override touchscreen info with DT properties
  input: elants: refactor elants_i2c_execute_command()
  input: elants: read touchscreen size for EKTF3624

 .../devicetree/bindings/input/elants_i2c.txt  |   6 +-
 drivers/input/touchscreen/elants_i2c.c        | 358 ++++++++++++------
 2 files changed, 239 insertions(+), 125 deletions(-)

-- 
2.20.1

