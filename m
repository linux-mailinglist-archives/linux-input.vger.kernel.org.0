Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A437C21CC60
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 02:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgGMAYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jul 2020 20:24:55 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:59241 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728177AbgGMAYz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jul 2020 20:24:55 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B4ktX1YQ1z7B;
        Mon, 13 Jul 2020 02:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594599893; bh=xhvk99SN3527m3g4YnGeIUaNDus9Up7+40SxGGuWRos=;
        h=Date:From:Subject:To:Cc:From;
        b=Gw0mJPcO06pue35cYQ8qBHR1xuPRxHBJtFpBD5jfJWFqaW7lPArEs11L2+W/oKo0T
         6wh/5TsPtwC4CSljrkpcXX7tVP3m91ZxtNRVR/Viq1mHlKOd8+l9rPf4CWpWQJPcQV
         yIbRYsxREwAv1gOt+LOdxSPs8/Uyf9P3MYA0sD02+tIwTI3Q4+uJknVt0APUk856At
         DbYXlt0sLEVL4b90Kf71bVxAHoVar0XH2zVZfydUTEEQIs5jZL4Cz1KX9vealSMt+5
         QidDxlxKZJu39PBYC9a/UOpWxkjmJ3zd7s+W3iB4AnRBjs591JUREvudTQgfQHJjS2
         f2Cakv+c44HmQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Mon, 13 Jul 2020 02:24:51 +0200
Message-Id: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v6 0/5] input: elants: Support Asus TF300T touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series cleans up the driver a bit and implements changes needed to
support EKTF3624-based touchscreen used in Asus TF300T and similar
Tegra3-based tablets.

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

---

Dmitry Osipenko (1):
  input: elants: support 0x66 reply opcode for reporting touches

Michał Mirosław (4):
  input: elants: document some registers and values
  input: elants: support old touch report format
  input: elants: read touchscreen size for EKTF3624
  input: mt: cleanup open-coded __set_bit()

 drivers/input/input-mt.c               |   2 +-
 drivers/input/touchscreen/elants_i2c.c | 149 +++++++++++++++++++++----
 2 files changed, 128 insertions(+), 23 deletions(-)

-- 
2.20.1

