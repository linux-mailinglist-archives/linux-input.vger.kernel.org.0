Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD94EB3C19
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 16:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388403AbfIPOED (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 10:04:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57661 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388405AbfIPOED (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 10:04:03 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbk-0000tB-Ff; Mon, 16 Sep 2019 16:04:00 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbj-0008G5-RG; Mon, 16 Sep 2019 16:03:59 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/4] DA9063 Onkey Improvements and Fixes
Date:   Mon, 16 Sep 2019 16:03:54 +0200
Message-Id: <20190916140358.30036-1-m.felsch@pengutronix.de>
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

this series adds the support the select the pmic onkey behaviour. While
on it i fixed to minor issues from the past.

Regards,
  Marco

Marco Felsch (4):
  dt-bindings: Input: da9062 - add key-opmode documentation
  input: misc: da9063_onkey: add mode change support
  dt-bindings: Input: da9062 - fix dlg,disable-key-power description
  Input: da9063 - fix capability and drop KEY_SLEEP

 .../devicetree/bindings/input/da9062-onkey.txt    | 12 +++++++++---
 drivers/input/misc/da9063_onkey.c                 | 15 +++++++++++----
 drivers/mfd/da9062-core.c                         |  1 +
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.20.1

