Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5303272680
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 16:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgIUOBA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 10:01:00 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55479 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgIUOBA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 10:01:00 -0400
IronPort-SDR: YqBQv/eA7RessGcWYZtqZJDPC77SPefAQ61LM53Cb+1haU4HZkTDsQHuSUb7tjnZJaX6TGXIvL
 w2vJCDyVOnYu6UPBCNCyz0sSin12R6X0ZwCDu9jHjVQDegh3pus3KurkxsFXlcHsjLAfEs8Kji
 GnqcR16p26x+1T8o+99IjqNyCCskz43sA0HGi6w1N4sKyK2H/xTKWar7DV1eCGtSER2CEFbsPL
 u5KGibz4hHNm2gm7IfkA/MIPoL1WvTkY+Urqam1nw5IhQiJiv5msWpwr/klRV5dANLdXJsxj9Z
 U34=
X-IronPort-AV: E=Sophos;i="5.77,286,1596528000"; 
   d="scan'208";a="55324397"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 21 Sep 2020 06:00:59 -0800
IronPort-SDR: H2DawD3NCdyoPkZsVFF2GiE++ULvq+D92chuTH4mdaA/mlQjVuDKIbkZWywmDebP2Pzwgn/vQL
 5ZarG8uq1Bo/adXyyw9MTGmQmvUreHxXm5Tb/zsYZPbMkJuX1CXpjeQYNAqqitteYc8QaIi5gi
 GTC3/6z3EkgU2Dvyp6Ub4fnVDD8d2Q+ympOm0Xi2TnZo+XYqvzKVN+tc7Y5YZw3u75tBPo7Foy
 ZtXU7hB2qIxSA4oj84eyoz9QUdeXbDq8B0Ih0tea3b0B/ANcJlFY2kv47VP/HzH8MOWVMU+Jdo
 s1E=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v1 1/3] dt-bindings: input: atmel: add compatible for mXT1386
Date:   Mon, 21 Sep 2020 23:00:52 +0900
Message-ID: <20200921140054.2389-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Document the mXT1386 compatible string.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..c13fc0f3f00b 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
 Required properties:
 - compatible:
     atmel,maxtouch
+    atmel,mXT1386
 
     The following compatibles have been used in various products but are
     deprecated:
-- 
2.17.1

