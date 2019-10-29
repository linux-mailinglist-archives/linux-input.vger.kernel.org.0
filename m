Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBB8E7DB7
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 01:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfJ2A62 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 20:58:28 -0400
Received: from vps.xff.cz ([195.181.215.36]:51592 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727336AbfJ2A6Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 20:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572310692; bh=LdBB96lc5mOW3OGGRyo4GacYhMj29ptosU6PsgU7yus=;
        h=From:To:Cc:Subject:Date:From;
        b=j2jzhrSzyU+pwMB0jX47G/MPKaOl6Voi3i8XBUHZ7Q+R1QbwaF+De5qjyixRYigTg
         eNbcUvP0sO2piUoEHf7ijARp8d+GDmgGieTHRoZAUV9lAwc80qfdQ0OUaTe7GVJX8r
         cO4r00n5JGL7YMXtvqnhtkClmvFUs7Z9sw1/DBBI=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Ondrej Jirman <megous@megous.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add touchscreen support for TBS A711 Tablet
Date:   Tue, 29 Oct 2019 01:58:03 +0100
Message-Id: <20191029005806.3577376-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a resurrection of https://lkml.org/lkml/2018/7/25/143

Compared to v4 of Mylène's series I've dropped all attempts to
power off the chip during suspend. This patch just enables the
regulator during probe and disables it on driver rmmod.

I've tested the driver with suspend/resume and touching the
panel resumes my soc.

Please take a look.

thank you and regards,
  Ondrej Jirman


Changes since v4 of Mylène's series:
- slight whitespace improvements
- drop all modifications of suspend/resume hooks
- drop useless header include
- split the dt-bindings into a separate patch

Mylène Josserand (2):
  input: edt-ft5x06: Add support for regulator
  arm: dts: sun8i: a83t: a711: Add touchscreen node

Ondrej Jirman (1):
  dt-bindings: input: edt-ft5x06: Add regulator support

 .../bindings/input/touchscreen/edt-ft5x06.txt |  1 +
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     | 16 ++++++++++
 drivers/input/touchscreen/edt-ft5x06.c        | 30 +++++++++++++++++++
 3 files changed, 47 insertions(+)

-- 
2.23.0

