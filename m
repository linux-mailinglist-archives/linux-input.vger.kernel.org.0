Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7883642BEED
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhJMLcY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 07:32:24 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:14552 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhJMLcX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 07:32:23 -0400
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Oct 2021 07:32:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634124254;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XptmbXlpM3h7fhYWz3DQbghIL528PDytMp77zNP76OI=;
    b=WCOoteKIXy95dacThsGwCAsqbWttBq1HyC8eAXNJJXBlm1M0lafb93B8DiL6wQ3GJM
    v09iQiOJ/6860Bc7lw4NzJYWs0KGDXnn+15cfMD1a1YgT0h1Irr08xfU8+nQD1aUPJoC
    inO+TEUcDkc+bm5vuIcJ2/0zajJn1/9patbQz3BIwK3e6k+qNiBSIssDK3gkc0fXJe4J
    AY4PfNTIhKIVjyBpjPXPQJ+eLTgchx6Cy6GBN+9tmiCS3CDYdLDFDP2kmWtN/TtaDy4s
    ndo+/mTtJwM88cTX7nQKoZ8hPKTjaU42AiNHBFwQQqvcfteoaIa1VN90UoMFml5XR3p5
    rhOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZP6Q"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9DBOE7gJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 13 Oct 2021 13:24:14 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] Input: tm2-touchkey - allow changing keycodes from userspace
Date:   Wed, 13 Oct 2021 13:23:05 +0200
Message-Id: <20211013112305.41574-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013112305.41574-1-stephan@gerhold.net>
References: <20211013112305.41574-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment the touch keys have key codes assigned from the device
tree. In some cases, users might want to change the key code from
userspace. There is existing functionality for this in the input core
using the EVIOCSKEYCODE ioctl, which is integrated for example into udev.

Make it possible to use this functionality for tm2-touchkey by simply
making the input core aware of the array that holds the keycodes.
Similar code also exists in mcs_touchkey and mpr121_touchkey.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/keyboard/tm2-touchkey.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index ce40ea2d940f..632cd6c1c8d4 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -252,6 +252,10 @@ static int tm2_touchkey_probe(struct i2c_client *client,
 	touchkey->input_dev->name = TM2_TOUCHKEY_DEV_NAME;
 	touchkey->input_dev->id.bustype = BUS_I2C;
 
+	touchkey->input_dev->keycode = touchkey->keycodes;
+	touchkey->input_dev->keycodemax = touchkey->num_keycodes;
+	touchkey->input_dev->keycodesize = sizeof(touchkey->keycodes[0]);
+
 	input_set_capability(touchkey->input_dev, EV_MSC, MSC_SCAN);
 	for (i = 0; i < touchkey->num_keycodes; i++)
 		input_set_capability(touchkey->input_dev, EV_KEY,
-- 
2.33.0

