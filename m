Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0D0251124
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 06:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgHYE5L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Aug 2020 00:57:11 -0400
Received: from smtprelay0183.hostedemail.com ([216.40.44.183]:45624 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728691AbgHYE5F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Aug 2020 00:57:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id D3900837F24C;
        Tue, 25 Aug 2020 04:57:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1311:1314:1345:1359:1515:1534:1539:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3350:3868:5007:6261:7901:7904:10004:10848:11658:11914:12297:12555:12895:13069:13311:13357:13894:14096:14181:14384:14394:14721:21080:21627:30054,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: waste57_250ae2b27059
X-Filterd-Recvd-Size: 1609
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Aug 2020 04:57:03 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/29] Input: MT - Avoid comma separated statements
Date:   Mon, 24 Aug 2020 21:56:09 -0700
Message-Id: <02cb394f8c305473c1a783a5ea8425de79fe0ec1.1598331149.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/input/input-mt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index f699538bdac4..44fe6f2f063c 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -323,11 +323,14 @@ static int adjust_dual(int *begin, int step, int *end, int eq, int mu)
 	p = begin + step;
 	s = p == end ? f + 1 : *p;
 
-	for (; p != end; p += step)
-		if (*p < f)
-			s = f, f = *p;
-		else if (*p < s)
+	for (; p != end; p += step) {
+		if (*p < f) {
+			s = f;
+			f = *p;
+		} else if (*p < s) {
 			s = *p;
+		}
+	}
 
 	c = (f + s + 1) / 2;
 	if (c == 0 || (c > mu && (!eq || mu > 0)))
-- 
2.26.0

