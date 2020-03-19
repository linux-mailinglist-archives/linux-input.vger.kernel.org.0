Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7ABC18BA5B
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgCSPGw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:06:52 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5833 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgCSPGw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:06:52 -0400
IronPort-SDR: frHQI7gmou2DTYNl0SN9ICJNA/fa6VE4RSZ7FCwFgWGaCHe9WcYhpuK4dNO97ni09SeDupanRc
 Jq9vo/ZIg///D2XAuBwdQDLibR4lZqhhjyOvWlPhqL9sWPtwuW5p7flch3KP8svku67PoR0UU8
 2IGMwwbjru0JBV4Z7D0r2J6SgCKBGiHWjNorZHNWl2UnkS107jiL1k40v4jezDrS+BcE+qMVtd
 b0rmAXFWIPIaBqLaUANdSgw+NFQbm+6TdqiEmRx4AZFWh3N2HakCYxXMkwxEUYHciA4VXp8CKn
 o6s=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46927151"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:46 -0800
IronPort-SDR: a8I4DIKisE09+xItcWC9u5+rEINlZH9hGL9eUge0z0yPQei6GkZeDE1rwGTjZYLMKqHARP7bvr
 S/2p1m+rHzmxKWOhRmV6RemAepiJzMMNdiUJgNiWOmMOlWTueJXRnGd2vfAuhc2lTSa4qsAB/p
 Q+6weqw0FZ9OAL0H9SqXK4K+4fCfp97K+fABWFK8zkZ6So82MvO8sfwCFENcV84nqpHPqQqFT3
 iAvVQHqj7AguFrTC1IekVM8Y1241lvEtHyG+gbrzugjZeyd+B5ckjI8+j4FT4UWKdkzGfEsgTX
 UJU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 52/52] Input: atmel_mxt_ts - Fix compilation warning
Date:   Thu, 19 Mar 2020 08:00:16 -0700
Message-ID: <20200319150016.61398-53-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fix "make W=1" compilation warnings from Atmel driver
as per the compilation logs.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a8e80e77624d..b1e27a07de6a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2048,7 +2048,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.17.1

