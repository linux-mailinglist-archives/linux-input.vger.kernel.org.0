Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7610310B013
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 14:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfK0NXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58711 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfK0NXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHe-0001hG-6L; Wed, 27 Nov 2019 14:23:06 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHd-00061v-OE; Wed, 27 Nov 2019 14:23:05 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 0/3] DA9063 Onkey Improvements and Fixes
Date:   Wed, 27 Nov 2019 14:23:01 +0100
Message-Id: <20191127132304.22924-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

this is v2 contains all comments made on [1]. Please check the patch
based changelog for further information. Patch "Input: da9063 - fix
capability and drop KEY_SLEEP"  is already applied mainline.

[1] https://www.spinics.net/lists/devicetree/msg309431.html

Marco Felsch (3):
  dt-bindings: Input: da9062 - add key-opmode documentation
  input: misc: da9063_onkey: add mode change support
  dt-bindings: Input: da9062 - fix dlg,disable-key-power description

 .../devicetree/bindings/input/da9062-onkey.txt   | 15 ++++++++++++---
 drivers/input/misc/da9063_onkey.c                | 16 ++++++++++++++++
 drivers/mfd/da9062-core.c                        |  1 +
 3 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.20.1

