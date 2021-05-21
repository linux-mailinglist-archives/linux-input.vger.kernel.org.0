Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC06538BD99
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 06:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbhEUErW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 00:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239277AbhEUErV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 00:47:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03924C061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 21:45:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ljx2d-0006Z3-9l; Fri, 21 May 2021 06:45:43 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ljx2b-0002DX-E3; Fri, 21 May 2021 06:45:41 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [PATCH v5 0/8] add z1 and z2 channels support for resistive-adc-touch driver
Date:   Fri, 21 May 2021 06:45:17 +0200
Message-Id: <20210521044525.7397-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

changes v5:
- fix validate for other DT examples.
- add Reviewed-by: Rob Herring <robh@kernel.org> to some of the patches

changes v4:
- resistive-adc-touch: remove unused variable

changes v3:
- yaml: fix validation for channel names
- yaml: add nodename validation

changes v2:
- add yaml conversion patch to this series
- reword commit message for the last patch
- fix possible overflow on the buffer dispatcher

Oleksij Rempel (8):
  dt-bindings: input: touchscreen: iqs626a: chnage node name to pass
    validation
  dt-bindings: input: touchscreen: edt-ft5x06: chnage node name to pass
    validation
  dt-bindings: input: touchscreen: goodix: chnage node name to pass
    validation
  dt-bindings: touchscreen: validate nodename
  dt-bindings: touchscreen: Convert resistive-adc-touch binding to json
    schema
  dt-bindings: touchscreen: add touchscreen-x/y-plate-ohms property
  dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and
    z2 channels
  Input: resistive-adc-touch: add support for z1 and z2 channels

 .../devicetree/bindings/input/iqs626a.yaml    |   2 +-
 .../input/touchscreen/edt-ft5x06.yaml         |   2 +-
 .../bindings/input/touchscreen/goodix.yaml    |   2 +-
 .../input/touchscreen/resistive-adc-touch.txt |  33 ----
 .../touchscreen/resistive-adc-touch.yaml      |  86 +++++++++++
 .../input/touchscreen/touchscreen.yaml        |   9 ++
 .../input/touchscreen/resistive-adc-touch.c   | 142 ++++++++++++++++--
 7 files changed, 226 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml

-- 
2.29.2

