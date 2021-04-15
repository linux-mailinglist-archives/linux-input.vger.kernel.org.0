Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48C73613C1
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhDOU6n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 16:58:43 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:54784 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbhDOU6n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 16:58:43 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d21 with ME
        id t8yH2400C21Fzsu038yJlb; Thu, 15 Apr 2021 22:58:18 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 Apr 2021 22:58:18 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] Input: evbug - Remove an empty comment block
Date:   Thu, 15 Apr 2021 22:58:16 +0200
Message-Id: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a left-over from commit 1a59d1b8e05e ("treewide: Replace GPLv2
boilerplate/reference with SPDX - rule 156")

Axe an empty and useless comment block.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/evbug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/input/evbug.c b/drivers/input/evbug.c
index c0d0b121ae7e..e47bdf92088a 100644
--- a/drivers/input/evbug.c
+++ b/drivers/input/evbug.c
@@ -7,9 +7,6 @@
  *  Input driver event debug module - dumps all events into syslog
  */
 
-/*
- */
-
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/slab.h>
-- 
2.27.0

