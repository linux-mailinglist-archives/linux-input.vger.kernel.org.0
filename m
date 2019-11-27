Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 040F510AF5B
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 13:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfK0MKN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 07:10:13 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37561 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfK0MKN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 07:10:13 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8k-0002K9-VT; Wed, 27 Nov 2019 13:09:50 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8j-0006Ib-IV; Wed, 27 Nov 2019 13:09:49 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 0/5] EDT-FT5x06 improvements
Date:   Wed, 27 Nov 2019 13:09:43 +0100
Message-Id: <20191127120948.22251-1-m.felsch@pengutronix.de>
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

this v2 address all comments made on [1]. See the patch based changelog
for further information.

During the discussion we all agreed to use the common wakeup-src device
property but I added all users of this driver again. So they can provide
their ack-tag.

Regards,
  Marco

[1] https://patchwork.kernel.org/cover/11149039/

Marco Felsch (4):
  Input: edt-ft5x06 - alphabetical include reorder
  dt-bindings: Input: edt-ft5x06 - document wakeup-source capability
  Input: edt-ft5x06 - make wakeup-source switchable
  Input: edt-ft5x06 - improve power management operations

Philipp Zabel (1):
  Input: edt-ft5x06: work around first register access error

 .../bindings/input/touchscreen/edt-ft5x06.txt |  2 +
 drivers/input/touchscreen/edt-ft5x06.c        | 85 ++++++++++++++++---
 2 files changed, 73 insertions(+), 14 deletions(-)

-- 
2.20.1

