Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48CE133FF4
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 12:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgAHLLG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 06:11:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41353 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbgAHLLE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 06:11:04 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip9Ei-0003Uu-Tq; Wed, 08 Jan 2020 12:10:52 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip9Eh-0005TO-5S; Wed, 08 Jan 2020 12:10:51 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v3 0/6] EDT-FT5x06 improvements
Date:   Wed,  8 Jan 2020 12:10:44 +0100
Message-Id: <20200108111050.19001-1-m.felsch@pengutronix.de>
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

I added all given git-tags and Dmitry's comment on my v2 [1]. Patch
"Input: edt-ft5x06 - use pm core to enable/disable the wake irq" is the
result of Dmitry's preliminary patch request.

Regards,
  Marco

[1] https://patchwork.kernel.org/cover/11263911/

Marco Felsch (5):
  Input: edt-ft5x06 - alphabetical include reorder
  dt-bindings: Input: edt-ft5x06 - document wakeup-source capability
  Input: edt-ft5x06 - make wakeup-source switchable
  Input: edt-ft5x06 - use pm core to enable/disable the wake irq
  Input: edt-ft5x06 - improve power management operations

Philipp Zabel (1):
  Input: edt-ft5x06: work around first register access error

 .../bindings/input/touchscreen/edt-ft5x06.txt |  2 +
 drivers/input/touchscreen/edt-ft5x06.c        | 76 +++++++++++++++----
 2 files changed, 64 insertions(+), 14 deletions(-)

-- 
2.20.1

