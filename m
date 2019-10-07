Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1CECED94
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 22:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfJGUfT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 16:35:19 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:17066 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbfJGUfT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 16:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570480517;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=A5om20rumI794pjDhtusHn5kv3KIEIljC6Kd+PxZ3mQ=;
        b=I0zZFlzuyCzVwOnhUVCjPHA5AgnNrFMAStCgGk4RpSTyy6a4EldFgxz8++Pt4a0d+6
        5zo2WbX8GKVVN82QqlmxsZRDHwactNRis4MNTmKc+1vwsjfx3UnBdF2rs2o0byAKPmTA
        gD3c/E6tMtFPJP8Raqfq97vhCLkTHQ8v06GUFU8D8xIBRoIEfyMEnM5dg6Y+Np8/LDz4
        Jd+DwpH2L/uItfBIw5FlZCPJSATl2jU529+pCzPta/+zV+YnxGgs4tj5KlHA1pwYx9/r
        yffvjXE3eex/uxtrRSmN6gTVCa7026Kt9cgZ58yjBbvCkwyKgEDk1pWKaCigQ63AWNbP
        54BA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXt87vtBtcfg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv97KZD45T
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 22:35:13 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] Input: mms114 - use device_get_match_data
Date:   Mon,  7 Oct 2019 22:33:41 +0200
Message-Id: <20191007203343.101466-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007203343.101466-1-stephan@gerhold.net>
References: <20191007203343.101466-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

device_get_match_data is available now, so we can replace the call
to of_device_get_match_data and remove the FIXME comment.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/touchscreen/mms114.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index a5ab774da4cc..69c6d559eeb0 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -446,8 +446,7 @@ static int mms114_probe(struct i2c_client *client,
 	data->client = client;
 	data->input_dev = input_dev;
 
-	/* FIXME: switch to device_get_match_data() when available */
-	match_data = of_device_get_match_data(&client->dev);
+	match_data = device_get_match_data(&client->dev);
 	if (!match_data)
 		return -EINVAL;
 
-- 
2.23.0

