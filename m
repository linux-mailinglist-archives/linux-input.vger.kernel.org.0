Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8A61D024B
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 00:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731156AbgELW1U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 18:27:20 -0400
Received: from vps.xff.cz ([195.181.215.36]:41808 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgELW1U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 18:27:20 -0400
X-Greylist: delayed 309 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 May 2020 18:27:19 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1589322129; bh=aksRVakqDSRMDiBOMsQEeb7cYe+KvVtawuT/m/LsMLw=;
        h=From:To:Cc:Subject:Date:From;
        b=a4sGfe8TiOA9m6P1f52uIRd1Qz/6l7BIRj5HysqqXJ/uUZ2TSZAJsfW1P+lycE2Ft
         oy+lRYEB1O8ngnLh69vYyEWq8VVZOwEbBQJzZZiu6YF8mE8gKUHUwAu0AgAGChf906
         fPkKqov5gQFGHhdeukkosiS5Z4GHnT6xrh4SxQBY=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for vibrator motor for TBS A711 Tablet
Date:   Wed, 13 May 2020 00:22:01 +0200
Message-Id: <20200512222205.1456300-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The tablet has a vibrator motor. This patch series exposes it via
input subsystem (EV_FF).

I'd like to ask input maintainers to take the patches 1 and 2.
Patches 3 and 4 should go via the sunxi tree.

The change to the vibrator driver is meant to enable toggling the
vibrator motor just via a power supply itself. There's not additional
gpio driven switch on this tablet between the power supply for the
motor and the motor.

Please take a look.

Changes in v2:
- Added DT ack tag
- Add more information to the commit log (re use of LDO for the power)


thank you and regards,
  Ondrej Jirman

Ondrej Jirman (4):
  dt-bindings: input: gpio-vibrator: Don't require enable-gpios
  input: gpio-vibra: Allow to use vcc-supply alone to control the
    vibrator
  ARM: dts: sun8i-a83t-tbs-a711: Add support for the vibrator motor
  ARM: dts: sun8i-a83t-tbs-a711: Increase voltage on the vibrator

 .../devicetree/bindings/input/gpio-vibrator.yaml         | 1 -
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts                | 9 +++++++--
 drivers/input/misc/gpio-vibra.c                          | 3 ++-
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.26.2

