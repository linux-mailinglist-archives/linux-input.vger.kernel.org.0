Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6AF767955
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfGMIrp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:47:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40402 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfGMIro (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:47:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so5917092pla.7;
        Sat, 13 Jul 2019 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=fWRcujJ//uCWQKTdkoitSJrzi01msecwL5g2+M67Vew=;
        b=BYDLQ9B1mTudC8gql3p/7I7ufOb+h4dh95A7Huoa0EVvgXCF5/ao1t/fl/DnVA6x4S
         TKt83mNI1dWP3m5o6HT/1APfPgMPc37RWs8hvPqpoh7IFR005tRF1NpgG/OXWwUfQCPl
         8US9su2UOi6eUXoGOtprLjqd7qTU6QrMb81wZ6TXx3k7VmdvToQg7mWo/ncyfA9usRzo
         nLG37wdKt5lAicVouTVXNTyJNO+R2DpJlUjwRaRLBheAmCsaJiBrjguzOOAgM28jUT7h
         VFjctHIkwuTwsqmcy22MQb2XbfqxLdrJiGNgpmfBQC5StIySENhVDQmDDAcyu3iw5o1x
         pC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=fWRcujJ//uCWQKTdkoitSJrzi01msecwL5g2+M67Vew=;
        b=NcNq6m7LglHleFPgq+byO2EDFE1vJWaU7BBATzzZMUh1TJ5zYUPCZdgX8pzRVBQYU3
         QTc/pZu43CXYEtq7x73Oq5eJaGg4WgII8Ngn4PPSS0TsduIZ2xfJldaTtXQfhysNmJaW
         JyEHdLGl49NozL1z1oR5MMJ9sHlkUHd1e3o3hj3vDo1t3sC5ColsSWSqx4MAN4iYDVDU
         LFSnhH/WfyTQuATAL9ZwAD6WXYorVe+JY2cKv/Bb8MZQCd8gALaVqGGzqlkfpXQDu45y
         kng46CH571SFzjyknqRN5eSeqOIpiM/jwVmrw4fDiljbGqGrtVixIZJtZZWfF1lf2YHo
         g/yQ==
X-Gm-Message-State: APjAAAUjVSe8U6LIH5fKkDnBSYe4XHDGmrmCblPxfPGlRtwWNB0WLu1d
        7m3SoHnh3UHbiNAjeH64kxiEA/XwKfM=
X-Google-Smtp-Source: APXvYqwp4yOcoy97CoeD2SnqhzEEQKGJ7ONxYGDWVztZ3HRATWgjDinpxZGNEh9n24lDxo3OQObnRw==
X-Received: by 2002:a17:902:20e9:: with SMTP id v38mr16845369plg.62.1563007663482;
        Sat, 13 Jul 2019 01:47:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id br18sm9311838pjb.20.2019.07.13.01.47.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:47:43 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:47:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        KT Liao <kt.liao@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - switch to using devm_add_action_or_reset()
Message-ID: <20190713084741.GA103533@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of manually disabling regulators when devm_add_action() fails we can
use devm_add_action_or_reset() which does it for us.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index b549d032da93..8719da540383 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1187,9 +1187,8 @@ static int elan_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_add_action(dev, elan_disable_regulator, data);
+	error = devm_add_action_or_reset(dev, elan_disable_regulator, data);
 	if (error) {
-		regulator_disable(data->vcc);
 		dev_err(dev, "Failed to add disable regulator action: %d\n",
 			error);
 		return error;
-- 
2.22.0.510.g264f2c817a-goog


-- 
Dmitry
