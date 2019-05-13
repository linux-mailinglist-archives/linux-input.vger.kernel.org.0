Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B3A1BF58
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 00:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEMWGU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 18:06:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37041 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfEMWGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 18:06:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id e6so7467178pgc.4
        for <linux-input@vger.kernel.org>; Mon, 13 May 2019 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ATRowXd7ipMmgvB8lyB4O5HcMo+A1bzkWKXt9bScEU4=;
        b=Eel2qDLNAo6NsGHWt1d/VXGsyvrURyD6LVgqznjvdn1UQqI0gtHQrhLfgCZ/xGRZ21
         xj8SDqqHBUHQe6VeYTiu2IDgEsoxTM0Wior4MK+fl/DCaqF4N+/YuqlU2pXtkDCgdSoV
         5wJ5dseJ59ftKAzYzAX2A0EQH04MC9EbZM6ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ATRowXd7ipMmgvB8lyB4O5HcMo+A1bzkWKXt9bScEU4=;
        b=F5unwL4sBKyaT8b5X6XjiFI26VyMi8cwI+9zpkMUS4VZ6qU0/dkDzSKvsoRci6ficw
         hHA05bTpW5p7rq1GjDYwn+Ma45+d3EJkBbWZVD4FeZvzNuz1tOmnr6Kt1B54W9nyl4/9
         Od9Jd89rJEspUc9jFBGCFrclsT1RPO1Jj9i4dTSwasygc4c7r+Yc/OFgWJTHXpn40asT
         mf0mm2YIPam8GWsnXMJ39qLLOZSYa0ZdGcBs6gAsq4ku1iHkBWCBry3UN7Pl0xKX4xSi
         /xRiaGz3adxcrCT/VxgdQANRH96u50PrjpZWpgSJ7mNmh7YljVw1rMx90DRMALlmiwJa
         2cXw==
X-Gm-Message-State: APjAAAUmkMKcD2o1b71Y4m5ltUaiZytKSro8IMtLa9WcQE0b24x/h7OI
        OOvfrQ+7PPKP7lLox2vRpdUfXA==
X-Google-Smtp-Source: APXvYqyoA9CuAHGlEl/FI0l/Yo0SsimibyLXrO4rejpsbwjre4iS0UmqRqHT6l+p8utmMlWuJ9jnNQ==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr35926946pfk.239.1557785178277;
        Mon, 13 May 2019 15:06:18 -0700 (PDT)
Received: from ravisadineni0.mtv.corp.google.com ([2620:15c:202:1:98d2:1663:78dd:3593])
        by smtp.gmail.com with ESMTPSA id q20sm24559977pgq.66.2019.05.13.15.06.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 13 May 2019 15:06:17 -0700 (PDT)
From:   Ravi Chandra Sadineni <ravisadineni@chromium.org>
To:     dmitry.torokhov@gmail.com, ravisadineni@chromium.org,
        kt.liao@emc.com.tw, benjamin.tissoires@redhat.com,
        abhishekbh@google.com, tbroch@google.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH V1] elan_i2c: Increment wakeup count if wake source.
Date:   Mon, 13 May 2019 15:06:10 -0700
Message-Id: <20190513220610.177489-1-ravisadineni@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Notify the PM core that this dev is the wake source. This helps
userspace daemon tracking the wake source to identify the origin of the
wake.

Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
---
 drivers/input/mouse/elan_i2c_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f9525d6f0bfe..2c0561e20b7f 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -981,6 +981,8 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 	if (error)
 		goto out;
 
+	pm_wakeup_event(dev, 0);
+
 	switch (report[ETP_REPORT_ID_OFFSET]) {
 	case ETP_REPORT_ID:
 		elan_report_absolute(data, report);
-- 
2.20.1

