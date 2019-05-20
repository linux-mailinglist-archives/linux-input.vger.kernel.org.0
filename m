Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0E22304D
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 11:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732119AbfETJ1X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from sauhun.de ([88.99.104.3]:49458 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730445AbfETJ1X (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id 6B9632C2761;
        Mon, 20 May 2019 11:27:21 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-input@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND 0/2] input: da9063 updates
Date:   Mon, 20 May 2019 11:27:09 +0200
Message-Id: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series removes the unused pdata interface and updates the header to
SPDX. Last time, a similar and bigger da9063 series was meant to go in
via MFD. This resend, however, was rebased to v5.2-rc1 and regrouped, so
it can go in via the input tree directly.

Wolfram Sang (2):
  input: da9063_onkey: remove platform_data support
  input: da9063_onkey: convert header to SPDX

 drivers/input/misc/da9063_onkey.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

-- 
2.19.1

