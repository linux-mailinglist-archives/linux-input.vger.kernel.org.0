Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CB3C3755
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388927AbfJAO3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:29:55 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:56392 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388919AbfJAO3z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:29:55 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 00CD4A0676;
        Tue,  1 Oct 2019 16:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1569940193;
        bh=undku+yPDH9gPcVjQfrGAf+OOa9EemHHNpeidCTysEM=;
        h=From:To:Cc:Subject:Date:From;
        b=a+MNqrk6mjiluDiLthjKVkoWjTBBIRdc52/8R2uwbHAIZadg4lbXMnBv1uXxVN+uS
         ZTZsmJaJs2Ei9CN2geZhgdeh9dlC8WAog5mwxI2VrENeuUV5CIQXgAWcSFtRvsGImf
         fu3+ZVyMwLmWbzNvlx6JA15ZOuv29FiuW/w5t+QU=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2 0/5] Add polling mode to the MPR121 touchkey
Date:   Tue,  1 Oct 2019 16:29:35 +0200
Message-Id: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
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

Michal Vokáč (5):
  dt-bindings: input: Add common input binding in json-schema
  dt-bindings: input: Convert mpr121 binding to json-schema
  dt-bindings: input: Add poll-interval property
  Input: mpr121: Add polling mode
  ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey controller on Hydra

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 89 ++++++++++++++++++++++
 Documentation/devicetree/bindings/input/input.yaml | 29 +++++++
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 --------
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         | 13 ++++
 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts           |  4 +
 drivers/input/keyboard/mpr121_touchkey.c           | 69 ++++++++++++-----
 6 files changed, 186 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 create mode 100644 Documentation/devicetree/bindings/input/input.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

-- 
2.1.4

