Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74F6DE06C
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 22:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfJTUec (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 16:34:32 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:32842 "EHLO
        7.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfJTUec (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 16:34:32 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Oct 2019 16:34:31 EDT
Received: from player770.ha.ovh.net (unknown [10.108.35.95])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 612591AFC28
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 22:29:13 +0200 (CEST)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
        (Authenticated sender: andi@etezian.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id 0779BB30ECF4;
        Sun, 20 Oct 2019 20:29:06 +0000 (UTC)
From:   Andi Shyti <andi@etezian.org>
To:     Linux Input <linux-input@vger.kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andi Shyti <andi@etezian.org>
Subject: [PATCH v2 0/2] Use smbus functions to communicate through i2c
Date:   Sun, 20 Oct 2019 23:28:54 +0300
Message-Id: <20191020202856.20287-1-andi@etezian.org>
X-Mailer: git-send-email 2.24.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14094296512003228230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeefgdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

this is the second version of [*] sent some times ago, but Dmitry
didn't feel confident enough in taking it in :P

Few changes in this second version.

Thanks a lot Seung-Woo Kim for his support!

Andi

Andi Shyti (2):
  Input: mms114 - use smbus functions whenever possible
  Input: mms114 - get read of custm i2c read/write functions

 drivers/input/touchscreen/mms114.c | 119 ++++++++---------------------
 1 file changed, 30 insertions(+), 89 deletions(-)

-- 
2.24.0.rc0

