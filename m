Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA538B452
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 11:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbfHMJi3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 05:38:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39733 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfHMJi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 05:38:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id f17so47287390pfn.6
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 02:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RaD6A+K4/8jdvOIsXluiNkAgL7M1+kFjGExIzAUXUW8=;
        b=P9qJfWwQxPZfidskchVBFJ6nzdSG06wa9bYO4Ka8Z3FpbaIb/pOM0nWavs1Rp0cmwE
         avzBz1VE8gXB7z8yFrZriS82QzSv0+jDDzi0wloLQEWVaq4cFhu7k0W3SFCupnzo7Awb
         ok5s05HaN62VYRuFe331qpIqNLxTOiLF3gKl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RaD6A+K4/8jdvOIsXluiNkAgL7M1+kFjGExIzAUXUW8=;
        b=IdK7gMi3JWnqsMmebs5iDnuw6CnuBP3hHiJr4jux2zAfKUmXQ/qvlu+7FuQGms8S3l
         8w0SzjVmw9W+0lpizAqeQaG9y9ellxfM3h4hHO8XN30Eqp7qSN1mm+e8L5dFuQhpRaxn
         tBwvLNmjXuInKC0kDLglxQP+lNsndDzbPrOJQ4TF12r+mvUeWMOLJ5vZhuuuKSsnDL48
         HRF9M3yQ1BG5eLYis5xAZ+2woVbYi6dpN2UPNDvs1g6BYta6f5653JWdjuFCI3skMX7w
         8tuNBIsqauC5e5XpP/BA8aL2cmCbdLW/85fn0Y6NzGI1r5LRxVC166PexnzWE559aYlo
         U5Ow==
X-Gm-Message-State: APjAAAUjumCItKFd2ABZKY/ZUtAXBRjjTxj6TVpLw6cf1oJWbBrAmNhC
        BYupABernnT+9QjL4uYClaURgg==
X-Google-Smtp-Source: APXvYqy+sJLrmolDFV0o4Mz+fxfscm7CXTjw8yiXTupKIB8qVuUNk3Kz27oocXNCPBU7aDi5xwq5dA==
X-Received: by 2002:a17:90a:be06:: with SMTP id a6mr1383491pjs.92.1565689108872;
        Tue, 13 Aug 2019 02:38:28 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:c4f0:9345:d0e8:a355])
        by smtp.gmail.com with ESMTPSA id d2sm993283pjs.21.2019.08.13.02.38.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:38:28 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Ting Shen <phoenixshen@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Fei Shao <fshao@chromium.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cros_ec_keyb: Add back missing mask for event_type
Date:   Tue, 13 Aug 2019 17:38:21 +0800
Message-Id: <20190813093821.74158-1-fshao@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the previous patch we didn't mask out event_type in case statement,
so switches are always picked instead of buttons, which results in
ChromeOS devices misbehaving when power button is pressed.
This patch adds back the missing mask.

Fixes: d096aa3eb604 ("Input: cros_ec_keyb: mask out extra flags in event_type")
Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 38cb6d82d8fe..bef7bee6f05e 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -226,6 +226,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 {
 	struct cros_ec_keyb *ckdev = container_of(nb, struct cros_ec_keyb,
 						  notifier);
+	uint8_t mkbp_event_type = ckdev->ec->event_data.event_type &
+				  EC_MKBP_EVENT_TYPE_MASK;
 	u32 val;
 	unsigned int ev_type;

@@ -237,7 +239,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 	if (queued_during_suspend && !device_may_wakeup(ckdev->dev))
 		return NOTIFY_OK;

-	switch (ckdev->ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK) {
+	switch (mkbp_event_type) {
 	case EC_MKBP_EVENT_KEY_MATRIX:
 		pm_wakeup_event(ckdev->dev, 0);

@@ -264,7 +266,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 	case EC_MKBP_EVENT_SWITCH:
 		pm_wakeup_event(ckdev->dev, 0);

-		if (ckdev->ec->event_data.event_type == EC_MKBP_EVENT_BUTTON) {
+		if (mkbp_event_type == EC_MKBP_EVENT_BUTTON) {
 			val = get_unaligned_le32(
 					&ckdev->ec->event_data.data.buttons);
 			ev_type = EV_KEY;
--
2.23.0.rc1.153.gdeed80330f-goog
