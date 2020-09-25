Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5006278A06
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 15:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgIYNxP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 09:53:15 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:49986 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYNxP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 09:53:15 -0400
IronPort-SDR: 1zxjR6aU1wqtqEwNnpmfjB+oQLcpJDywk6i6B+ySeqaiCKiFdJlnarnMX4vi7mPyry8IBMd4Wz
 uKf//bOd4VMzZYBVYLSmz9s2U/+cHo1xmSnJc27NkD7GB8n7k6qw2vR1Ts3Tt/bh53AnLV41li
 YBR0cJSzXVPY0C/rmvWSGmKW88JA29fv3m8Wee+ukC1deIJMutPGF9KinkI6w05jLzhi/c9kye
 umATEOSbECvxjuFm7rhvxQ8wc39hAVSFoI9vZylOYdXhOEfNJu5nyzuXhwiuysZ5o3jH7N+6Bs
 1lE=
X-IronPort-AV: E=Sophos;i="5.77,302,1596528000"; 
   d="scan'208";a="53408342"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Sep 2020 05:53:14 -0800
IronPort-SDR: ygjXhL6+8NCxDqJN7Trb7w5lzg/qqcxjRCz9zJhBrUYbFR6wbZt+4zNgqpzCgPAmz6ToKJiHVJ
 uN3MxhJjOusAHY0KfvKvmiDlXlHkPblLnPyddI0r/te0po+kV85NtD+IOCWNUb21IwBDcr24F5
 hBai9T6jv1RqaVMbTOngupggUAltyeTmqQYpbXBPGDdyO5p6+TOHb4YdgaxoSbovFl1hw9DkGp
 UbVG4/Bvp9AdDOzINi/Gs7ig+AF1w2jPb32098JN3fuyp/RswmeHJp3+hJL/96HpZ4YbZl4q9k
 TRk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v2 3/3] ARM: tegra: add mXT1386 compatible
Date:   Fri, 25 Sep 2020 22:52:57 +0900
Message-ID: <20200925135257.21138-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925135257.21138-1-jiada_wang@mentor.com>
References: <20200925135257.21138-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add mXT1386 compatible for "touchscreen@4c".

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 2d683c9a1a5d..7915b6e9190e 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -428,7 +428,7 @@
 		};
 
 		touchscreen@4c {
-			compatible = "atmel,maxtouch";
+			compatible = "atmel,mXT1386", "atmel,maxtouch";
 			reg = <0x4c>;
 
 			atmel,cfg_name = "maxtouch-acer-iconia-tab-a500.cfg";
-- 
2.17.1

