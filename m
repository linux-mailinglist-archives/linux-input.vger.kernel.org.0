Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EAA225466
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 00:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgGSWMX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jul 2020 18:12:23 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57701 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgGSWMX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jul 2020 18:12:23 -0400
X-Originating-IP: 195.189.32.242
Received: from pc.localdomain (unknown [195.189.32.242])
        (Authenticated sender: contact@artur-rojek.eu)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C6362FF805;
        Sun, 19 Jul 2020 22:12:18 +0000 (UTC)
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v8 0/2] input: ADC joystick driver & DT bindings
Date:   Mon, 20 Jul 2020 00:11:01 +0200
Message-Id: <20200719221103.91644-1-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

this series is a continuation of adc-joystick changes split from:
https://lore.kernel.org/linux-iio/20200709152200.10039-1-contact@artur-rojek.eu/

Rob, the bindings example in patch 1/2 depends on changes introduced
in another patchset, still to be merged:
https://lore.kernel.org/linux-iio/20200719205307.87385-4-contact@artur-rojek.eu/  
Your scripts will most likely fail to validate this. You have already
reviewed this patch when it was still part of the aforementioned series.

Cheers,
Artur

Artur Rojek (2):
  dt-bindings: input: Add docs for ADC driven joystick.
  input: joystick: Add ADC attached joystick driver.

 .../bindings/input/adc-joystick.yaml          | 121 +++++++++
 drivers/input/joystick/Kconfig                |  10 +
 drivers/input/joystick/Makefile               |   1 +
 drivers/input/joystick/adc-joystick.c         | 253 ++++++++++++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adc-joystick.yaml
 create mode 100644 drivers/input/joystick/adc-joystick.c

-- 
2.27.0

