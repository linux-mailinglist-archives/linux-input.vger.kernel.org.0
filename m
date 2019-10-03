Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB6C9822
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 08:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfJCGND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:44152 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfJCGND (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id AA06FA095A;
        Thu,  3 Oct 2019 08:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570083180;
        bh=kXQqqbMcLtxZ0koE7VMl0eu2FUL7HocEmrY3mYk6RTU=;
        h=From:To:Cc:Subject:Date:From;
        b=QI5pd1ounZWXtaJ/embrSU2SeTYIX6nOwDtxweJq6erJ50Yyhfsj3kmUoSIGnYH6q
         mu8pZFdEJsCf1Jf05I7jc75Hi3x1q6R21Qh3EH/ahWVzc+EgVqPzYm5rWK+f52FWBz
         SIUOBEOPC0beC01aApu77lnVwBE5zRZcUPsx+Frw=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v3 0/5] Add polling mode to the MPR121 touchkey
Date:   Thu,  3 Oct 2019 08:12:51 +0200
Message-Id: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
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
input-poller API.

First of all, create a common input binding schema that assosiates some
existing input device properties.
In second step, convert the existing MPR121 freeform text binding into
a json-schema. Then the binding is enhanced with the poll-interval
property. The ability to work in the pollig mode is then added to the
mpr121_touchkey driver and enabled on a imx6dl-yapp4-hydra platform that
uses this controller.

Michal Vokáč (5):
  dt-bindings: input: Add common input binding in json-schema
  dt-bindings: input: Convert mpr121 binding to json-schema
  dt-bindings: input: Add poll-interval property
  Input: mpr121: Add polling mode
  ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey controller on Hydra

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 89 ++++++++++++++++++++++
 Documentation/devicetree/bindings/input/input.yaml | 36 +++++++++
 Documentation/devicetree/bindings/input/keys.txt   |  8 --
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 --------
 .../devicetree/bindings/input/mtk-pmic-keys.txt    |  4 +-
 .../devicetree/bindings/input/st,stpmic1-onkey.txt |  2 +-
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         | 13 ++++
 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts           |  4 +
 drivers/input/keyboard/mpr121_touchkey.c           | 69 ++++++++++++-----
 9 files changed, 196 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 create mode 100644 Documentation/devicetree/bindings/input/input.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/keys.txt
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

-- 
2.1.4

