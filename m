Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6119402F6F
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 22:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346356AbhIGUO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 16:14:29 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37112 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346350AbhIGUOX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Sep 2021 16:14:23 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Sep 2021 16:14:23 EDT
Received: from hq-00021.Speedport_W_724V_01011603_07_006 (p200300d83f0164a4ac70ae0545232a4f.dip0.t-ipconnect.de [IPv6:2003:d8:3f01:64a4:ac70:ae05:4523:2a4f])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 5478932E6FB;
        Tue,  7 Sep 2021 20:07:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 0/3] Input: ads7846: pdata cleanups and devm init
Date:   Tue,  7 Sep 2021 22:07:23 +0200
Message-Id: <20210907200726.2034962-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is v5 of the patches to bring devm initialization to the ads7846
driver. I left the gpiod conversion patch out for now as it needs more
work, and it's also independent of the other changes.

There are no functional changes in this compared to v4, so it's just a
rebased resend.


v3:

* Added a patch to remove custom filter handling from pdata
* Added devm_add_action_or_reset() for regulator state maintaining
* Addressed minor nits pointed out by Marco Felsch

v4:

* Call ads7846_stop() rather than ads7846_disable() in the unbind
  path to avoid regulator refcount confusion, Thanks to Marco Felsch.

v5:

* Rebased on top of current linux-input/master


Daniel Mack (3):
  Input: ads7846: Add short-hand for spi->dev in probe() function
  Input: ads7846: Remove custom filter handling functions from pdata
  Input: ads7846: Switch to devm initialization

 drivers/input/touchscreen/ads7846.c | 187 +++++++++++-----------------
 include/linux/spi/ads7846.h         |  15 ---
 2 files changed, 73 insertions(+), 129 deletions(-)

-- 
2.31.1

