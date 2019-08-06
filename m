Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A637828B3
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 02:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfHFAa2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 20:30:28 -0400
Received: from gateway30.websitewelcome.com ([192.185.160.12]:31755 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728870AbfHFAa1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 20:30:27 -0400
X-Greylist: delayed 1426 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Aug 2019 20:30:27 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 8357B291F
        for <linux-input@vger.kernel.org>; Mon,  5 Aug 2019 19:06:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id umzwhx3vX2qH7umzwhy2Zh; Mon, 05 Aug 2019 19:06:40 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=koLpWuT5DW1ydHP7Hd6CN3OPz230NOB+Koz/yZnfNw4=; b=rzsiGCpTfEX6aUerRPFERR6Eux
        NnT9o7NWvcz9xv1PpufltCUSU8I7MncwqQd82/kDf+NH7aaqLYsBrjxpJ3hoBAHzrytmZH5QGbDyP
        xZnXPMnBhfAeYhfhNorCNQfOfAJ1fJF/WdA4cT5Ovo5GIp6XxFJwQgb7dg1I+2BUBF596RBqpHl2p
        9ByYd0S/ERtvlSjUbfDUJ/frf55oU/G/WvM/XE3qEcRcU4XayIrKdCD++nO2Zmi3ihyVb+EGLE+rU
        JcUj3cvMqB0uwjMm13I6KfZb1K3Tnn4UwAmsi5+sbX1xV/nFRW7o+Sa6joK2vjyg5Wq5rgMS20l6A
        YWafolkg==;
Received: from [187.192.11.120] (port=40864 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1humzv-00177M-Dt; Mon, 05 Aug 2019 19:06:39 -0500
Date:   Mon, 5 Aug 2019 19:06:38 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: applespi - use struct_size() helper
Message-ID: <20190806000638.GA4827@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1humzv-00177M-Dt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:40864
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct touchpad_protocol {
	...
        struct tp_finger        fingers[0];
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(*tp) + tp->number_of_fingers * sizeof(tp->fingers[0]);

with:

struct_size(tp, fingers, tp->number_of_fingers)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/keyboard/applespi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index acf34a5ff571..584289b67fb3 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1494,8 +1494,7 @@ static void applespi_got_data(struct applespi_data *applespi)
 		size_t tp_len;
 
 		tp = &message->touchpad;
-		tp_len = sizeof(*tp) +
-			 tp->number_of_fingers * sizeof(tp->fingers[0]);
+		tp_len = struct_size(tp, fingers, tp->number_of_fingers);
 
 		if (le16_to_cpu(message->length) + 2 != tp_len) {
 			dev_warn_ratelimited(&applespi->spi->dev,
-- 
2.22.0

