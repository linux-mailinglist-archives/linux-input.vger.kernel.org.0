Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EDE302A35
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAYS14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbhAYS0K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBD0C061573
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:30 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YK-00041I-Bz; Mon, 25 Jan 2021 19:25:28 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 0/5] exc3000 firmware update support
Date:   Mon, 25 Jan 2021 19:25:22 +0100
Message-Id: <20210125182527.1225245-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

this series adds support for updating the firmware on exc3000 touchscreen
devices. The protocol has been reverse engineered from the proprietary
update tool.

Compared to the last posting of this series almost a year ago, the
biggest change is the rebasing on top of the conflicting changes that
went in in the meantime and some better documentation.

Regards,
Lucas

Lucas Stach (5):
  Input: exc3000 - split MT event handling from IRQ handler
  Input: exc3000 - factor out vendor data request
  Input: exc3000 - fix firmware version query for device in bootloader
  Input: exc3000 - add type sysfs attribute
  Input: exc3000 - add firmware update support

 .../ABI/testing/sysfs-driver-input-exc3000    |  29 ++
 drivers/input/touchscreen/exc3000.c           | 492 +++++++++++++-----
 2 files changed, 404 insertions(+), 117 deletions(-)

-- 
2.20.1

