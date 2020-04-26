Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715421B9172
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgDZQLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:13 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:17927 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbgDZQLN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:13 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZN6VgbzDY;
        Sun, 26 Apr 2020 18:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917471; bh=lW+UudkTFUycbxUnIAx69LGP6rnC1AOjQDgAtlPusuo=;
        h=Date:From:Subject:To:Cc:From;
        b=WayrEexrtR0uCH3knxVoYQs2BV87/3dN/AdkV7TKMF/SU2gJyFdcHLJkmY8F4CypG
         ZI+PwH/jywZtHpiVXB7ejYj6lxScL1GaGuFHu8EQn3654eYODsmlJKKsD1Uxgk0utH
         tqA1AVJfENAmAqcgxccTLJHBS8Ia6BPn5HPBMbppKk571V3fd2DWLKO75FjRjMiUjr
         9ox58wHrkwAmTMw17rNfqVQO9km4aFvggoOnDEiDmG9OM4ZvLodHqIQsoc3W+HC5TR
         auyUhlpV4jEJMRHdxkIBlNGIi9/PNRajf1Z/AUrZaI5PIdq7aeEEn2hMWZ80g3W282
         v+I/n/fmdsodQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:07 +0200
Message-Id: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 00/10] input: elants: Support Asus TF300T touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
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
---

David Heidelberg (1):
  dt-bindings: input: touchscreen: elants_i2c: convert to YAML

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

 .../devicetree/bindings/input/elants_i2c.txt  |  34 --
 .../input/touchscreen/elan,elants_i2c.yaml    |  69 ++++
 drivers/input/touchscreen/elants_i2c.c        | 380 +++++++++++-------
 3 files changed, 314 insertions(+), 169 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml

-- 
2.20.1

