Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1F1DE5F1E
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2019 21:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfJZTAB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Oct 2019 15:00:01 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40998 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfJZTAB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Oct 2019 15:00:01 -0400
Received: by mail-qt1-f195.google.com with SMTP id o3so8458543qtj.8
        for <linux-input@vger.kernel.org>; Sat, 26 Oct 2019 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ikLfpcWKBFDDg8pZBNrlq852BgE0MtsAwZ/+zNj3OQ0=;
        b=Jk5Q8550LkNM9uvMSjxBLzzjAFVEUOd/Q9xijPfkGwfgzz4HWXtybblE8ZyD16ZWE7
         u6VFd3iG/SxcBb+0BARPc5A7CcF6mthAjKTPo+L+oG/rNiDsV0umUy0aywtg2GqEwwUy
         vv1+tCJ+gJUG2kQ8l671aOHeeXeXKTAc2t+0Y5/GVHEC3HgHFM2X2BNil/ZZix9a1pZp
         YiMPx5bgnWzhS4rvBIoKRCZZQ/0+bn/ueTHqKPbjrOt7K/tZO7z+/YofFpzDOFdqkRKC
         +hxHob8lKyzpXThetvexI6T3m9cFkLSfqBxHQnfjyEmYvOpWIyKAEwxKduXWUfHfUEdi
         cXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ikLfpcWKBFDDg8pZBNrlq852BgE0MtsAwZ/+zNj3OQ0=;
        b=skcJJw4suCq4YzX0GZX0Bb00VqmWqIpfxz8vuEA3O+2/j8Aexau3hegf9QEToLxUFX
         8RC8VoQYbiuPxj4GEn3r8Freh2OEF1tyAk6FJZm+0ciQj9CJCBTAm18NWbpZtFPKxMjP
         k4AlCgczgbg7OUMW2Kh0FJ9/ZXSekc7IoDTw6N90c+Og5BFa2BqjjLL6edMhFfsc60ZJ
         YipsFwW8czMW3xZ1Kws4uu57kZWDpvAhM3lpsaC6kpiIrcZQ0Wp37sR+LM9yrM7DE0k3
         9bD+xQpshKOX96wD3dGmMpEKn03N3/nrbHT10s054ZwET5b3VjPpNrrVPpVEKkO+Hs96
         jw0w==
X-Gm-Message-State: APjAAAVLUswCM0suYjqbV+YZ0qCCK8I3Ov00044rLYyc7bUn7PsbVCSE
        RC1yGPn7trPasyoKI4xqJnFlK0Xch7w=
X-Google-Smtp-Source: APXvYqwF5R20bHf24Olz8/z3ogg/l3ywiRLK1TnwuxUTDc+XeakwDMPeZdocoD0+ON+EfJCcRlqK/Q==
X-Received: by 2002:ac8:488b:: with SMTP id i11mr9245767qtq.95.1572116400129;
        Sat, 26 Oct 2019 12:00:00 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:99:1a50:482f:3e7:284a])
        by smtp.gmail.com with ESMTPSA id y29sm3991798qtc.8.2019.10.26.11.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 11:59:59 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] Input: wacom_i2c - remove unneeded gpio.h header file
Date:   Sat, 26 Oct 2019 15:59:58 -0300
Message-Id: <20191026185958.24158-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026185958.24158-1-festevam@gmail.com>
References: <20191026185958.24158-1-festevam@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no gpio functions used in the driver that is exported
by the gpio.h header, so remove this unneeded header.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/wacom_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index f017af8c2aa3..1afc6bde2891 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,7 +12,6 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
-- 
2.17.1

