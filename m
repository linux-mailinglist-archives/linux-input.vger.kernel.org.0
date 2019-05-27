Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FAF2B8D7
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfE0QUM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:20:12 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:28603 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QUM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:20:12 -0400
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674793"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:20:11 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RGK32s002844;
        Mon, 27 May 2019 18:20:05 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:20:05 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 05/10] dt-bindings: input: touchscreen: stmpe: add XY mode
Date:   Mon, 27 May 2019 18:19:33 +0200
Message-ID: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.25.2.60]
X-KSE-ServerInfo: SUMMAIL01.UMK.KLS.zentral, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.05.2019 13:23:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change documents the support of another input data
acquisition mode (XY). This mode is mostly relevant in
the context of/combination with the tracking index.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index d20dc5a7d8ad..aee1abf06ddb 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -28,6 +28,9 @@ Optional properties:
 				5 -> 10 ms
 				6 -> 50 ms
 				7 -> 100 ms
+- st,op-mod		: Axis information acquisition operating mode (Default is 0)
+				0 -> XYZ
+				1 -> XY
 - st,fraction-z		: Length of the fractional part in z (recommended is 7)
 			  (fraction-z ([0..7]) = Count of the fractional part)
 - st,i-drive		: current limit value of the touchscreen drivers
-- 
2.21.0

