Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28301B6216
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 19:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgDWRil (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 13:38:41 -0400
Received: from ip-78-45-52-129.net.upcbroadband.cz ([78.45.52.129]:46436 "EHLO
        ixit.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729973AbgDWRil (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 13:38:41 -0400
Received: from localhost.localdomain (227.146.230.94.awnet.cz [94.230.146.227])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7DD752491C;
        Thu, 23 Apr 2020 19:33:25 +0200 (CEST)
From:   David Heidelberg <david@ixit.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/1] dt-bindings: input: touchscreen: elants_i2c: convert to YAML
Date:   Thu, 23 Apr 2020 19:32:52 +0200
Message-Id: <20200423173253.711725-1-david@ixit.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Depends elants_i2c series from Michal [1].

[1] https://patchwork.kernel.org/project/linux-input/list/?series=270071

David Heidelberg (1):
  dt-bindings: input: touchscreen: elants_i2c: convert to YAML

 .../devicetree/bindings/input/elants_i2c.txt  | 34 ---------
 .../input/touchscreen/elan,elants_i2c.yaml    | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml

-- 
2.26.2

