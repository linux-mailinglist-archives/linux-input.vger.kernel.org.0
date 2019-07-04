Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC015FEE1
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2019 01:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfGDX54 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Jul 2019 19:57:56 -0400
Received: from smtprelay0161.hostedemail.com ([216.40.44.161]:38060 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727644AbfGDX5z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Jul 2019 19:57:55 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 61FAD181D33FB;
        Thu,  4 Jul 2019 23:57:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::,RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1359:1437:1534:1540:1567:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3865:5007:6261:8603:10004:10848:11026:11473:11658:11914:12043:12294:12297:12555:12895:13069:13138:13231:13311:13357:14096:14181:14384:14394:14721:14877:21080:21627:21796:30029:30054:30080,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: wood81_6207feb2edb1e
X-Filterd-Recvd-Size: 1558
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jul 2019 23:57:53 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/8] Input: synaptics: Fix misuse of strlcpy
Date:   Thu,  4 Jul 2019 16:57:41 -0700
Message-Id: <070330472a7314a21d85c42dd66cdd43222559c3.1562283944.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562283944.git.joe@perches.com>
References: <cover.1562283944.git.joe@perches.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Probable cut&paste typo - use the correct field size.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/input/mouse/synaptics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1080c0c49815..00a0cf14f27f 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -705,7 +705,7 @@ static void synaptics_pt_create(struct psmouse *psmouse)
 
 	serio->id.type = SERIO_PS_PSTHRU;
 	strlcpy(serio->name, "Synaptics pass-through", sizeof(serio->name));
-	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->name));
+	strlcpy(serio->phys, "synaptics-pt/serio0", sizeof(serio->phys));
 	serio->write = synaptics_pt_write;
 	serio->start = synaptics_pt_start;
 	serio->stop = synaptics_pt_stop;
-- 
2.15.0

