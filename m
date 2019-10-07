Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273E0CEDAB
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 22:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfJGUlR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 16:41:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:34923 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGUlR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 16:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570480875;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=uuqroTzM50azEECJ1HEdgYiUGp2O5PdxXW9NQmbp4l4=;
        b=BZ8Kc4ni/GGoGlAXfDRroFnUIlvo3oBWGgctewo8ati9hWrJulOMxpKDwJcpBxzfgd
        ORRkGAGMpGgb5uomElUdH7QDJ73Eomk55zO0a/KpwueWQ/xTRwBXLaBH7/JrQLpcKuOD
        p5AbbqB835La0rUDwIK5ebLfWH4IxmAUnVrH0RmhGMnUpsPx32Xu05yYL2xSnDkpxumP
        t2XDo5DoiT+BVfRcliTOKrXJbqdCTQbAzaG8BfbbuyttGyGShoc3fUA37uz6urqZ01hJ
        Ms8SWaQ+kT0LVo867MBfKsrSRHh5X3fD8LfoKJWj+rYbzWNCmLJjbd0YaJA03ytWKGa7
        bq4A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXt87vtBtcfg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv97KZ645Q
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 22:35:06 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/3] Add support for Melfas MMS345L touchscreen
Date:   Mon,  7 Oct 2019 22:33:40 +0200
Message-Id: <20191007203343.101466-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series adds support for the Melfas MMS345L touchscreen
to the mms114 driver.

MMS345L is used in the Samsung Galaxy A5 (2015) that has recently
gained mainline support [1].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1329c1ab0730b521e6cd3051c56a2ff3d55f21e6

Stephan Gerhold (3):
  Input: mms114 - use device_get_match_data
  dt-bindings: mms114: document melfas,mms345l binding
  Input: mms114 - add support for mms345l

 .../bindings/input/touchscreen/mms114.txt     |  3 +-
 drivers/input/touchscreen/mms114.c            | 44 +++++++++++++------
 2 files changed, 33 insertions(+), 14 deletions(-)

-- 
2.23.0

