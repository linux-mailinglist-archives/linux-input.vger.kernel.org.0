Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8835522A9D4
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 09:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgGWHna (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 03:43:30 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33746 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgGWHna (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 03:43:30 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5880C200070;
        Thu, 23 Jul 2020 09:43:28 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 495C1200015;
        Thu, 23 Jul 2020 09:43:28 +0200 (CEST)
Received: from fsr-ub1864-014.ea.freescale.net (fsr-ub1864-014.ea.freescale.net [10.171.95.219])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9AE21202B6;
        Thu, 23 Jul 2020 09:43:27 +0200 (CEST)
From:   =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v3 0/3] input: i.MX snvs powerkey updates
Date:   Thu, 23 Jul 2020 10:43:11 +0300
Message-Id: <20200723074314.3304-1-horia.geanta@nxp.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Herbert, Dmitry,

This is a resend of v2 patches 1,5,6 that were not picked up
https://lore.kernel.org/linux-input/20200225161201.1975-1-git@andred.net
with collecting Acked-by, Reviewed-by.

I skipped Robin's Reviewed-by since I prefer avoiding misintepreting
the discussion between him and André.

Thanks,
Horia

André Draszik (3):
  dt-bindings: crypto: fsl-sec4: add snvs clock to pwrkey
  Input: snvs_pwrkey - enable snvs clock as needed
  Input: snvs_pwrkey - only IRQ_HANDLED for our own events

 .../devicetree/bindings/crypto/fsl-sec4.txt   | 17 +++++++++
 drivers/input/keyboard/snvs_pwrkey.c          | 38 ++++++++++++++++---
 2 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.17.1

