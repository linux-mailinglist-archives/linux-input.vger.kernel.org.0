Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98678199463
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgCaKyr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:54:47 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43589 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbgCaKwk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:40 -0400
IronPort-SDR: i2zbpogVhubMVvHdG3zxYQlLPYGS7p5gH89YnsVT+uRQzusC2HgEUE2CApiIjg+u34mvqNhv7K
 dQ5K/thphGOhU0hHbpY6Kqwl9ljdMFhRODdMpGnsnwqyqpHORNFjJae+bvxlL1MTyR5OWThXuK
 IOe8hdRfTSeYAjW12tozW4q+1uV5sa3PfDg7HukuKaMGhN1TtUI2foivLoZZCP6m7NCJyLrYoQ
 5rIAkSvGvNWrXF6E1eOhkpVHouRpZh9e+vY9drmMM7Stg+uMbcT+CbGDKZD30zWDH0BqPumtiQ
 a0s=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330778"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:24 -0800
IronPort-SDR: z1UqIzoq8yJDeWGNTItbf9aAO0Ya2BWj0J+5JN4DKrOWsFn4Cap/388dVBQfa1MBcvU+biaEjo
 pA3jFZKzCjOHyiX5BW7a6UIdz7NNbTzdJ1VL9s7Cy9yUqHwgF5+C7n4GnJerdyTBAwa78NVJol
 XJSBNrEqUUIAiZ0JHCFftgkZFW6ihFvRmNevIl4n/fPMFCyZnZmVHTSmZcXOAPEm+XJJinyrKV
 r9jcYujvRYglfH2+s3bNe45eZ4FjlkuJibaMWr/eHyl8HYtBmu9mvbp61Q6bG3+wgng2fGxxpZ
 rdk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 23/55] dt-bindings: input: atmel: support to specify input name
Date:   Tue, 31 Mar 2020 03:50:19 -0700
Message-ID: <20200331105051.58896-24-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 29bb84a920d6..126266891cdc 100644
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

