Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00DF4A5520
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 13:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbfIBLko (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 07:40:44 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:43734 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729623AbfIBLko (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 07:40:44 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 3964EA3570;
        Mon,  2 Sep 2019 13:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1567424442;
        bh=MDtd2F62JHT8WOaFCYGMFa/tXssyRu3QFNYoIZeRUTk=;
        h=From:To:Cc:Subject:Date:From;
        b=aN+CYRv1ER7AduoRa/Aymjbtc3o+xCyFYI/xXjRELfIdU9trJkGU7QFnd5bwlfzN3
         Hv3Sfdxrb6WBklo+i0JGNpAa5r4jSLqVWXiDFpYUgvz4nbJJrY3rIYZomKIAhO8Sl8
         /qSEh/lU/bWe1urKMqnQs+OFKkWhyJhRemdrbXHo=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH input-next 0/4] Add polling mode to the MPR121 touchkey
Date:   Mon,  2 Sep 2019 13:40:13 +0200
Message-Id: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series is another attempt to use the MPR121 touch sensor
controller in polling mode. This version uses the brand new
input-poller API that is currently queued in input/next.

Michal Vokáč (4):
  dt-bindings: input: Convert mpr121 binding to json-schema
  dt-bindings: input: mpr121: Add poll-interval property
  Input: mpr121: Add polling mode
  ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey controller on Hydra

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 82 ++++++++++++++++++++++
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 --------
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         | 13 ++++
 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts           |  4 ++
 drivers/input/keyboard/mpr121_touchkey.c           | 68 +++++++++++++-----
 5 files changed, 149 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

-- 
2.1.4

