Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C329DE0CE6
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388865AbfJVT4g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39520 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388791AbfJVT4g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id v4so11295255pff.6;
        Tue, 22 Oct 2019 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r0E4wpyrWRiaNA8auIL2vJERHfcV4z20I+V9gMG7Q6s=;
        b=q2LvZjByonNQdt6+6w10ovlIJ7nlIT54rYOZjPfhdasiCeHq/5pusFSVuUmzoeFlFC
         2Qtl/GHsdbA4YZvyOeNSSJSiy9P+lgwFFEKMtTS88KTtvQeAuR+oeeJlVCSqp/Yz59jE
         lgGXk9q98fAKqVpbgssb/Yi3C8Rj6I1bvrDJdF+/hQ+yuafkXbLsfw/JRi8pu4ZjmaJo
         U62N02YaLAzx3qE8+WYQfnZMQE34EdMd11JVvOgCZA9YL3x0wb+kvDsOMwSRuRASjqHe
         hrHntQZI8n1cEPlK/WTIUNhZnTitl22Pep+P6N46zxw62UyclACmizek1cDLEeEQ9p23
         /eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0E4wpyrWRiaNA8auIL2vJERHfcV4z20I+V9gMG7Q6s=;
        b=aO+Rps7/NK7KN7lM4CJi2KyNRZAcB6SjUZ4s+cSv2ejv78sbYaj+QQiC4VvpXYtLhy
         RtGJ1bnL7fbn26Iq9NgTuDH1HzSCP+gvZoyt+03vYiqpIA+52QDFsjNOqpcZ5lrRCpUz
         xCzdUQ3zVLTa4vMTbnXkfEx/TiKeyenIb8CJ8Snj45hZ4r+hpVnZBnUt9RMaP0Zw5IWA
         NqpJLcVOv8CKQbhRb3WKwDIV0Rmoi8AUamRl1e48lHxnOV7imJxM4p7ogxLWeHheskMR
         5SpeeZrSRnzOq/BiNo9rozZLV0XNxRFOkFRswtbeHJrvsUCxIV3KxZbrnRgs29W1y8Et
         qrdA==
X-Gm-Message-State: APjAAAXQGC5u4JxVy5zLuntQsDgo+5+7c3DuxL6YmhwcSsevU7h+W3mF
        NsDArQvKCJKFtgqEeYCzkZY=
X-Google-Smtp-Source: APXvYqxaVWtLbPEUwINiwwKiSkp7I36iWsAUBVv1/hXd2B+R2Wq65xCrIwlcdbI9EKxnVzlqszYczg==
X-Received: by 2002:aa7:908b:: with SMTP id i11mr6327445pfa.186.1571774193881;
        Tue, 22 Oct 2019 12:56:33 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:33 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] Input: st1232 - note that the receive buffer is DMA-safe
Date:   Tue, 22 Oct 2019 12:56:21 -0700
Message-Id: <20191022195622.66976-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The receiving buffer is allocated separately from the main driver
data structure, and is naturally DMA-safe, so mark it as such when
building I2C transfer message.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 0aee330731c9..a4a3b82ee69d 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -66,7 +66,7 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 		},
 		{
 			.addr	= client->addr,
-			.flags	= I2C_M_RD,
+			.flags	= I2C_M_RD | I2C_M_DMA_SAFE,
 			.len	= ts->read_buf_len,
 			.buf	= ts->read_buf,
 		}
-- 
2.23.0.866.gb869b98d4c-goog

