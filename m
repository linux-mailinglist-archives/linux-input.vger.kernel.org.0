Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A96297C6C
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 14:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761493AbgJXMqm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 08:46:42 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:46784 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761484AbgJXMqm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 08:46:42 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CJLSv5Rg7z5H;
        Sat, 24 Oct 2020 14:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1603543600; bh=zm9GVLE1fSZCtFvipcUroOm/jMPtTgjksOYrVRgqJVQ=;
        h=Date:From:Subject:To:Cc:From;
        b=Fa8ioTpImEgVnyd63h4k4FchqNghaWEr+vHQf5Z6A8f0AJzzK1nZkmyAmOJlZAQBj
         uVCr9FNWC24XHm2SCeae4t3KQx6zAajd+XIgpMhmUvwMNskX63a9TBv8DoL+1nBABv
         oPwpt9C8yExecQ2QzOmJEcxbWfKQL+/mNK51HAdHmjl8CeTtygoN/LbZf7GEPHR/l5
         rKbrdjNCfhkCmBtVXCn7bPT5wf5FGJWiFx+9cyy9IGmtor+2k9h/usQbImhiZiIC4j
         9RA94NthNXYwC8Q+/laTzYQO5Ty+Ym26+RMlGsBxm7q4WEJ3ofduG12IWKoWTC5ZKI
         8yeJ44n6LyMmQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 24 Oct 2020 14:46:36 +0200
Message-Id: <cover.1603543323.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v8 0/4] input: elants: Support Asus TF300T and Nexus 7 touchscreens
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
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
v8: rebased onto current dtor/input/for-linus again
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

