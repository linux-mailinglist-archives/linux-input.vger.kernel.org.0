Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6879B27EC17
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 17:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728805AbgI3PNL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 11:13:11 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:9476 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgI3PNI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 11:13:08 -0400
IronPort-SDR: Si8hhObSrCUiU9nSLmOb2bU4M/8kqAy/HW8DdQCC1U/Lc1aXvjHRfPpkR+EhOq9V6DvHk96vrA
 RVup3f+NNH4kUZu7ph9YWr5/UEIHyNdqw43tlWCXvrHTZJFj+oOrWzHsWuRn6xUXUXdSE0431q
 DL8es37AT+Im3xUQhrhbqp65kpXHSlmb5XzstTbc9f5V9qIa9+yk2f52ZuHT1XXXE4/kXZerbv
 4KY/TleDWeUdYjF4930g4IP3dzJSlBecCWYf6ATLpPU+xM9HIIA/DsCMj0XeD6dzaB7iI+mpBJ
 rc4=
X-IronPort-AV: E=Sophos;i="5.77,322,1596528000"; 
   d="scan'208";a="53484663"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 30 Sep 2020 07:13:07 -0800
IronPort-SDR: xggCLPVr10q4CRzAx6ntAx7Q/0wW2gfsDmfWcT9s9w15k6wr9Daz9F0Z0BODG4tQgpgA4B2vi3
 mkOpWna+DD7k7LxX0GArhyLII6xIS60ZhtE1J/U5UIbOu3e8zCOSsqoyMG5kg+JMVA8Dm2lxnD
 OMUMa2VNfGumQU+rQYOeVYq9NMyT/LRYWR/LUXSzVIsCKQvJT/vgAVIh0qfHA67+BqnGVPeekp
 MFT0mxjyNXho9G9imXoiPYpNQepeVHtQUglVQVZQx0iz7WKVU5fMeeGK+CLeadR+VJrPTBpi/E
 jeA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 1/3] dt-bindings: input: atmel: add compatible for mXT1386
Date:   Thu, 1 Oct 2020 00:12:57 +0900
Message-ID: <20200930151259.18119-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930151259.18119-1-jiada_wang@mentor.com>
References: <20200930151259.18119-1-jiada_wang@mentor.com>
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
index c88919480d37..fdff8a4cf5c0 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
 Required properties:
 - compatible:
     atmel,maxtouch
+    atmel,mxt1386
 
     The following compatibles have been used in various products but are
     deprecated:
-- 
2.17.1

