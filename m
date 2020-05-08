Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F441CA35B
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgEHF7x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:53 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:25985 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgEHF7w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:52 -0400
IronPort-SDR: STiOOJXeWZKXeRzXPYQLsywoYdlfshIlr1iJMcyYB1B32YPES7Lot90E4DgGR7CtX99hHga401
 uoWbFS/m+IpC5ZLCbnS2an+TLQmBOyU5D7KoKXYMsd8e4GOjfMMbzKRmHQZkKJy8WezaaV3iZ3
 v+wA2N5T3OtmpWeAoVK1oHXgBHtHp1rP5w44dWEo7Hu1CZuCfgBmHUwCIZHUYjy9sAKPVnwl7s
 STiC5UXCs4lpH/JVHX4eIKRVZBzYQIMvkYDT0CcAeXjtjKziw+rK1twu2z05C3w+YffJ94/IZE
 Gjs=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589144"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:51 -0800
IronPort-SDR: rqzIu02eyh5EBRONiywVoH9QD3pw6+rrncbQ77fDMee993IcW/9etuc0XbM11HNwfEUGT018zf
 0/fQ58a5RcE/GSIzFyjQsizKubCJe5TB0WsX1KndUOqbf/7suSOevUD1rHNznNYdjepBzWQrpi
 dnrB7T5vsq+ioh14YfywFJBMqtdSPuNG9IYYYPWL28/UDKE5fRo4Sr3XvPlE7OU+k5NJtftPpc
 Q8Wenp/TtPDFuCyGDpx0ImKdEsu+g9W4wWF6MHFaWY6Y9GJAuFUz1FYbi131GCQUY6uyCSDHzr
 RTE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 45/56] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Thu, 7 May 2020 22:56:45 -0700
Message-ID: <20200508055656.96389-46-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dean Jenkins <Dean_Jenkins@mentor.com>

mxt_process_messages_until_invalid() failed to propagate the error
code from mxt_read_and_process_messages() so return the error code.

Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ed850a0bae69..7c530ffac1ba 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1563,6 +1563,8 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	/* Read messages until we force an invalid */
 	do {
 		read = mxt_read_and_process_messages(data, count);
+		if (read < 0)
+			return read;
 		if (read < count)
 			return 0;
 	} while (--tries);
-- 
2.17.1

