Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9943BB522F
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 17:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfIQP6X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 11:58:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51775 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfIQP6X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 11:58:23 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFro-0005CG-Lf; Tue, 17 Sep 2019 17:58:12 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFrn-0007Md-J1; Tue, 17 Sep 2019 17:58:11 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/6] EDT-FT5x06 improvements
Date:   Tue, 17 Sep 2019 17:58:02 +0200
Message-Id: <20190917155808.27818-1-m.felsch@pengutronix.de>
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

this series adds pm support for the edt-ts devices. It also reorder the
include struct to be in line with the common rule. Finally it fixes the
wakeup-source assumption. Testers are welcome since the EDT-FT devices
reacts differently based on their firmware and I only have a evervision
based device here..

Regards,
  Marco

Marco Felsch (6):
  Input: edt-ft5x06 - alphabetical include reorder
  dt-bindings: Input: edt-ft5x06 - add disable wakeup-source
    documentation
  Input: edt-ft5x06 - add support to disable the wakeup-source
  Input: edt-ft5x06 - add deep sleep mechanism
  dt-bindings: Input: edt-ft5x06 - add vdd supply documentation
  Input: edt-ft5x06 - add supply voltage support

 .../bindings/input/touchscreen/edt-ft5x06.txt |   5 +
 drivers/input/touchscreen/edt-ft5x06.c        | 126 +++++++++++++++---
 2 files changed, 110 insertions(+), 21 deletions(-)

-- 
2.20.1

