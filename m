Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173FC1A6700
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbgDMNcZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:25 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:60593 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729860AbgDMNcZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:25 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918g81rBXzZH;
        Mon, 13 Apr 2020 15:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784743; bh=G1pFtE4P65M5M56WyT/pXSuRd1kPbP62NRWfXhMvP5A=;
        h=Date:From:Subject:To:Cc:From;
        b=IE856JHY9qM6nf/7vx6AdFsnH8qABLH9sHKPpfFMQuQ5tPM+4FMdT0KuZxzVXZruv
         wefITwyein0OU5cwFdD4rUOALUC1D27iyboawi13j9cttKlGt4k/ihJ0WoJFunA6Qr
         UEgNqpLD0UPmXp3Nw59mTSA8dWpAbqor/sUemizCHWbb7Z7TjqOOW8JDYHk3rWA51e
         diF54GQzopWJcltapKNr9/iYhFQogj77u/uwoYn4TwID9sWG+C1mK1+fG/AK78sW1p
         L7IW28nQDoBCA8eGhdnRhKrbq0qDXPpRTFCkuXYt7g5Ki9OYpHPIf8I/0dHDkFw+y9
         t7jy5IO++oZZA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:19 +0200
Message-Id: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 0/9] input: elants: Support Asus TF300T touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
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
 drivers/input/touchscreen/elants_i2c.c        | 365 ++++++++++++------
 2 files changed, 242 insertions(+), 129 deletions(-)

-- 
2.20.1

