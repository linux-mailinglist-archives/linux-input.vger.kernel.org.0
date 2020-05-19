Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAEF1D9F62
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 20:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgESSZt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 14:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgESSZt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 14:25:49 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE4FBC08C5C0
        for <linux-input@vger.kernel.org>; Tue, 19 May 2020 11:25:48 -0700 (PDT)
Received: from zenbar.fritz.box (pd95ef292.dip0.t-ipconnect.de [217.94.242.146])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 1E56F298AD5;
        Tue, 19 May 2020 18:22:52 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 0/3] Input: ads7846: pdata cleanups and devm init
Date:   Tue, 19 May 2020 20:25:37 +0200
Message-Id: <20200519182540.219027-1-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is v4 of the patches to bring devm initialization to the ads7846
driver. I left the gpiod conversion patch out for now as it needs more
work, and it's also independent of the other changes.

v3:

* Added a patch to remove custom filter handling from pdata
* Added devm_add_action_or_reset() for regulator state maintaining
* Addressed minor nits pointed out by Marco Felsch

v4:

* Call ads7846_stop() rather than ads7846_disable() in the unbind
  path to avoid regulator refcount confusion, Thanks to Marco Felsch.

Daniel Mack (3):
  Input: ads7846: Add short-hand for spi->dev in probe() function
  Input: ads7846: Remove custom filter handling functions from pdata
  Input: ads7846: Switch to devm initialization

 drivers/input/touchscreen/ads7846.c | 187 +++++++++++-----------------
 include/linux/spi/ads7846.h         |  15 ---
 2 files changed, 73 insertions(+), 129 deletions(-)

-- 
2.26.2

