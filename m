Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111ED2B8CA
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfE0QP0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:15:26 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:19886 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfE0QP0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:15:26 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 12:15:19 EDT
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674682"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:08:19 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RG8Asg028506;
        Mon, 27 May 2019 18:08:12 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:08:12 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add resolution support
Date:   Mon, 27 May 2019 18:07:29 +0200
Message-ID: <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
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

This documents the support for specifying the screen size in milimeter
and its impact on resolution calculation.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index 04962e2e1ad0..d20dc5a7d8ad 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -39,6 +39,10 @@ Optional properties:
 				The given window also affects the value range (limits) set
 				within the input subsystem which, in turn, affects
 				the input resolution calculation on both axes.
+- touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
+				the input resolution calculation on the horizontal axis.
+- touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
+				the input resolution calculation on the vertical axis.
 
 
 Optional properties common with MFD (deprecated):
-- 
2.21.0

