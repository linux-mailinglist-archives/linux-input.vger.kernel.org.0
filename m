Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2DA16924C
	for <lists+linux-input@lfdr.de>; Sun, 23 Feb 2020 00:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgBVXV4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Feb 2020 18:21:56 -0500
Received: from vps.xff.cz ([195.181.215.36]:34182 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbgBVXVz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Feb 2020 18:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582413271; bh=O+L3Dgir8ylc0hRKhh+YvNvVJjhY/rU659XZD2GVYnY=;
        h=From:To:Cc:Subject:Date:From;
        b=fCtF4hhmMcBT3t3pgLRjHBXlVS22ppcJg2B6akTO8amSo0XYfOoIBYZvmUnQ9kXk2
         Z13/B3H07CMJb+3mz8qmpzNj4dRSfc4AGdUmb3rTIfhf3MCpnlrLYtKYCrB7XdSC8j
         QfzFykHW+lf7whEzPV56NJ5N/20/re4ljiLnX5+U=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Add support for vibrator motor for TBS A711 Tablet
Date:   Sun, 23 Feb 2020 00:14:24 +0100
Message-Id: <20200222231428.233621-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The tablet has a vibrator. Expose it via input subsystem (EV_FF).

Please take a look.

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
2.25.1

