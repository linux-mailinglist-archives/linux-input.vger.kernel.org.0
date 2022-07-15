Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5410557621C
	for <lists+linux-input@lfdr.de>; Fri, 15 Jul 2022 14:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiGOMuz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 15 Jul 2022 08:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiGOMuy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jul 2022 08:50:54 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAB7255B8;
        Fri, 15 Jul 2022 05:50:53 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FAou7B026913;
        Fri, 15 Jul 2022 08:50:49 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37thv1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 08:50:49 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26FComHS062740
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jul 2022 08:50:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:50:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:50:47 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCoXmH002053;
        Fri, 15 Jul 2022 08:50:36 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-gpio@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 00/10] adp5588-keys refactor and fw properties support
Date:   Fri, 15 Jul 2022 14:51:28 +0200
Message-ID: <20220715125138.378632-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: CYrwXackNjzHddtLEq03LvJ2sMElfWii
X-Proofpoint-ORIG-GUID: CYrwXackNjzHddtLEq03LvJ2sMElfWii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=913 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150056
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The main goal of this patchset is to remove platform data and replace it by
firmware properties. Original discussion in [1].

While in here, some refactor was done to the driver. The most noticeable one
is to replace the GPIs events handling by irqchip support so that this gpi
keys can be "consumed" by the gpio-keys driver (also as suggested in [1]).
With this, the gpio-adp5588 can be removed. This change comes first so that
we can already remove some platform data variables making it easier to
completly replace it by firmware properties further down in the series.

As there's no users of the platform data, I just replace it in a single
patch as there's no point in having support for both (even though it might
be harder to review the patch as-is).

Special note to the gpio-adp5588 driver removal. I'm aware of some changes
to the driver in [2]. These changes are in the gpio tree and this patchset
is naturally based on the input tree which means that patch 2 will
not apply. So, I'm not really sure how to handle this. I guess in this
case the conflict is easy to handle :) but just let me know on how to
proceed in here if there's anything for me to do.

v2 changes:

[1/10]
 * Turn hwirq signed so we can compare < 0;
 * Replace WARN_ON with dev_warn();
 * Do not set of_node on gpiochip;
 * Moved to use a const irqchip within the gpiochip;
 * Set default handler to 'handle_bad_irq()' and change it
in irq_set_type;

[4/10]
 * Dropped "-keys" from compatible and added vendor prefix;
 * Fix -Wformat complains;
 * Don't use abbrev in comments (fw -> Firmware).

[5/10]
 * Be consistent on $refs;
 * Drop "-keys" from compatible.

[7/10]
 * Include bits.h;
 * Use GENMASK();
 * Use BIT() in KP_SEL();
 * Reflect code changes in the commit message.

[9/10]
 * One line for regulator_disable action.

[1]: https://lore.kernel.org/linux-input/20220504084617.36844-1-u.kleine-koenig@pengutronix.de/
[2]: https://lore.kernel.org/linux-gpio/20220628193906.36350-3-andriy.shevchenko@linux.intel.com/

Nuno Sá (10):
  input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'
  gpio: gpio-adp5588: drop the driver
  input: keyboard: adp5588-keys: bail out on returned error
  input: keyboard: adp5588-keys: add support for fw properties
  dt-bindings: input: adp5588-keys: add bindings
  input: keyboard: adp5588-keys: do not check for irq presence
  input: keyboard: adp5588-keys: fix coding style warnings
  input: keyboard: adp5588-keys: add optional reset gpio
  input: keyboard: adp5588-keys: add regulator support
  input: keyboard: adp5588-keys: Use new PM macros

 .../bindings/input/adi,adp5588-keys.yaml      | 110 +++
 MAINTAINERS                                   |   2 +-
 drivers/gpio/Kconfig                          |  14 -
 drivers/gpio/Makefile                         |   1 -
 drivers/gpio/gpio-adp5588.c                   | 452 -----------
 drivers/input/keyboard/Kconfig                |   3 +
 drivers/input/keyboard/adp5588-keys.c         | 719 ++++++++++++------
 include/linux/platform_data/adp5588.h         | 171 -----
 8 files changed, 588 insertions(+), 884 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
 delete mode 100644 drivers/gpio/gpio-adp5588.c
 delete mode 100644 include/linux/platform_data/adp5588.h

-- 
2.37.1

