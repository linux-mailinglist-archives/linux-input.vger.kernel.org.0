Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839CE736B2
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2019 20:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfGXSij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jul 2019 14:38:39 -0400
Received: from gateway36.websitewelcome.com ([192.185.192.36]:17526 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727499AbfGXSii (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jul 2019 14:38:38 -0400
X-Greylist: delayed 1503 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jul 2019 14:38:37 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 7AC92400C903E
        for <linux-input@vger.kernel.org>; Wed, 24 Jul 2019 12:15:52 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id qLQqhTfMU2PzOqLQqhau5G; Wed, 24 Jul 2019 12:52:04 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RSrN+PMcoh98qQtwwEognyHoc2T7ZoZirz4tY6BRBgI=; b=IOHSZlOAgH6hJR4fh5oxhlyKKZ
        VhcXaq4oeio2K0v64cWLzVfl8USxaUBj7LA6C8m5/MVMpcl+Fw8hUvsNlsAEef5LNRyHTsKGTkQts
        VI6FZNumAYjDI/wNQP4WEYRNnN1hn+ApovLXz7gRB1MqsPqiPYnJzMX2T/XtybI76YUJJb2S3aQqH
        23SAA9MKMdK7hnFl3r0dJ+MyDejYMMgBax7G2jvNUlnzT2y+5ctWaU7sWJIyjuaHw5fg1wCiS/2EA
        cawOqA1WhuSVwrjtsquZq1+ihz9Au3jQ7k8Fh+uAm4GkTr3eK4/G0BiTYRYhRo8+I2jUG6uITuxKV
        lB9Q80rg==;
Received: from cablelink-187-160-61-189.pcs.intercable.net ([187.160.61.189]:50900 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hqLQp-000mes-J4; Wed, 24 Jul 2019 12:52:03 -0500
Date:   Wed, 24 Jul 2019 12:52:02 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: elantech - mark expected switch fall-through
Message-ID: <20190724175202.GA9583@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.160.61.189
X-Source-L: No
X-Exim-ID: 1hqLQp-000mes-J4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-189.pcs.intercable.net (embeddedor) [187.160.61.189]:50900
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warning:

drivers/input/mouse/elantech.c: In function 'elantech_use_host_notify':
drivers/input/mouse/elantech.c:1843:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (dmi_get_bios_year() >= 2018)
      ^
drivers/input/mouse/elantech.c:1845:2: note: here
  default:
  ^~~~~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Notice that -Wimplicit-fallthrough will be globally
enabled in v5.3.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/mouse/elantech.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 73544776a9ed..04fe43440a3c 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1842,6 +1842,7 @@ static bool elantech_use_host_notify(struct psmouse *psmouse,
 		/* SMbus implementation is stable since 2018 */
 		if (dmi_get_bios_year() >= 2018)
 			return true;
+		/* fall through */
 	default:
 		psmouse_dbg(psmouse,
 			    "Ignoring SMBus bus provider %d\n", info->bus);
-- 
2.22.0

