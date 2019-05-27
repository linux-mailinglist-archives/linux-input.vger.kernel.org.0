Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B067A2B8E0
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfE0QUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:20:23 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:28603 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QUX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:20:23 -0400
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674797"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:20:22 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RGKFII003476;
        Mon, 27 May 2019 18:20:17 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:20:17 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add tracking index
Date:   Mon, 27 May 2019 18:19:37 +0200
Message-ID: <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
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

The tracking index is a "minimum" distance two touch
points need to have in order for the second to be valid.
This adds the corresponding binding property documentation.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 .../bindings/input/touchscreen/stmpe.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index 09d2d4f288cc..8696af35a7b8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -42,6 +42,21 @@ Optional properties:
 				The given window also affects the value range (limits) set
 				within the input subsystem which, in turn, affects
 				the input resolution calculation on both axes.
+- st,tracking-index	: Minimal distance between the current touch position and the previous
+				touch position. If the distance is shorter than the tracking
+				index, it is discarded. The tracking is calculated by summation
+				of the horizontal and vertical movement.
+				If pressure reporting is enabled (X/Y/Z), an increase in pressure
+				override the movement tracking and report the new data set, even
+				if X/Y is within the previous tracking index.
+				0 -> disabled
+				1 -> 4
+				4 -> 8
+				3 -> 16
+				4 -> 32
+				5 -> 64
+				6 -> 92
+				7 -> 127
 - touchscreen-inverted-x: X axis is inverted (boolean)
 - touchscreen-inverted-y: Y axis is inverted (boolean)
 - touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
-- 
2.21.0

