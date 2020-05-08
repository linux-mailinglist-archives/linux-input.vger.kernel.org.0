Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8641CA331
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgEHF6h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:37 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38715 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgEHF6d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:33 -0400
IronPort-SDR: KgNruznJZ/0w0iVfdO7ogZzeAS2cIw1TzSLnFA1oREOHYxb9xQgkpg/Oe0T7+clGDM+Zudh/Q2
 p7myzX03cDBG8B9mg+Q8mWEioR+ylzMiwXRObiDm7BxQgjobPUSae4VyTJFOlLPctzS2bJ5sBV
 EkrBcshiQDMZCRT/BxyLMaXJRmKGW5mmmhuhCAgVe6hZdGHng9+wejIsmsP+h/RI3mxRZdAa3m
 IRwBMc7HrIcvBPVIvtZQEzsBkYGUU8L0mj81+ZtWDfKw8Edc6NWGiI+fFCPkfu8do2BMFCohbg
 0eQ=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670091"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:31 -0800
IronPort-SDR: aYayti0Wg97Eu5aBqHeYbAMonggtq/Qbg5AkRD9aq/IKmgX1BZVhEJlk4x6NuqkqN3HpcbgBQM
 yoRDpphgUgTmxUJoWByuqssjn+lNtSZhZwDGIU9E5d4oo+K7VKSxuHgHLwmE2PcPvQUvYpb762
 lqhKpOis3XnvLVoXumNdwlDz6ZRXJMQicjl+kIws6KWGTskj06je8VWdltM9AIcw6upNigVECM
 Oz22NTcAq8k5TxnE13BTPfieh3GpC2n0dJc1pHJhD70ZPFuN4xVO58Z/A7lvXzJ8GxUwwtnVxu
 OwI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 24/56] dt-bindings: input: atmel: support to specify input name
Date:   Thu, 7 May 2020 22:56:24 -0700
Message-ID: <20200508055656.96389-25-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support to specify input name

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index 4705d7753c54..f084afa1660e 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -43,6 +43,8 @@ Optional properties for main touchpad device:
 - atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
     will be downloaded from the firmware loader on probe to the device.
 
+- atmel,input_name: Override name of input device from the default.
+
 Example:
 
 	touch@4b {
-- 
2.17.1

