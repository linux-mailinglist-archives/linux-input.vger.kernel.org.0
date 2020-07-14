Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D404021EDD2
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 12:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGNKXk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 06:23:40 -0400
Received: from vps.xff.cz ([195.181.215.36]:46160 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgGNKXk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 06:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594722217; bh=b5ZA4YXSStj9NSEJKpR0EoBU9eCLYs5GBPxpk7Au4Jk=;
        h=From:To:Cc:Subject:Date:From;
        b=IOj2CJTFMM4foh6Z1bL6bN76aQ3IsZF6KzKGIuLDgwKASd6lE3sIDRQv/76ND9+BX
         rqLW9wJBgyvd5VA3nFg4GXphHvFr/pdQEdcE8Dv3y+q2cSLVgjuvs5B1SxBQxXIoUe
         tmTZaqUKBXg2vC69LsfMNpFnShBOCyhzHsK8LT9k=
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
Subject: [PATCH v4 0/4] Add support for vibrator motor for TBS A711 Tablet
Date:   Tue, 14 Jul 2020 12:22:59 +0200
Message-Id: <20200714102303.3007896-1-megous@megous.com>
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

Changes in v4:
- Added DT reviewed-by tag
- Fixed motor typo

Changes in v3:
- Changed dt-binding to require at least one of enable/supply, dropped ack
- Changed driver to bail out if neither supply nor gpio is given

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

 .../devicetree/bindings/input/gpio-vibrator.yaml   |  7 ++++++-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |  9 +++++++--
 drivers/input/misc/gpio-vibra.c                    | 14 ++++++++++----
 3 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.27.0

