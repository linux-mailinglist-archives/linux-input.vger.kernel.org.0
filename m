Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E19756459
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 15:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjGQNTx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 09:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjGQNTk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 09:19:40 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6311E3C14;
        Mon, 17 Jul 2023 06:18:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173149935"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 22:18:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3AF9341B465F;
        Mon, 17 Jul 2023 22:17:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        linux-input@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] exc3000 driver enhancements
Date:   Mon, 17 Jul 2023 14:17:54 +0100
Message-Id: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series is based on the code improvement work done for
rtc-isl1208 driver and is just compile tested.

Biju Das (2):
  Input: exc3000 - Simplify probe()
  Input: exc3000 - Drop enum eeti_dev_id and split exc3000_info[]

v1->v2:
 * Added Rb tag from Geert for patch#1
 * Added patch#2 for dropping enum eeti_dev_id and split the array
   exc3000_info[] as individual variables, and make lines shorter by
   referring to e.g. &exc3000_info instead of &exc3000_info[EETI_EXC3000].

 drivers/input/touchscreen/exc3000.c | 54 ++++++++++++-----------------
 1 file changed, 22 insertions(+), 32 deletions(-)

-- 
2.25.1

