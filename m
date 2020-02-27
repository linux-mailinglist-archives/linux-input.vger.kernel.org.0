Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE08D1715EC
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgB0L22 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47057 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728896AbgB0L21 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:28:27 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL4-0000p4-Gu; Thu, 27 Feb 2020 12:28:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL3-0001k0-8j; Thu, 27 Feb 2020 12:28:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/4] EDT-FT5x06 Fixes and improvments
Date:   Thu, 27 Feb 2020 12:28:15 +0100
Message-Id: <20200227112819.16754-1-m.felsch@pengutronix.de>
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

first this series fixes a possible undefined register access for
ev-ft5726 devices.

This series also includes the v4 of the improved pm ops. Please check
my notes I made on the patch.

Last but least it adds the support for async probe which is important
for fast booting because devices having a reset-pin specified sleeps
300ms..

Regards,
  Marco

Ahmad Fatoum (1):
  Input: edt-ft5x06 - prefer asynchronous probe

Marco Felsch (3):
  Input: edt-ft5x06 - fix get_default register write access
  Input: edt-ft5x06 - move parameter restore into helper
  Input: edt-ft5x06 - improve power management operations

 drivers/input/touchscreen/edt-ft5x06.c | 179 ++++++++++++++++++++++---
 1 file changed, 157 insertions(+), 22 deletions(-)

-- 
2.20.1

