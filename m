Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D114B00C6
	for <lists+linux-input@lfdr.de>; Wed,  9 Feb 2022 23:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236601AbiBIW4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Feb 2022 17:56:12 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbiBIW4B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Feb 2022 17:56:01 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D685E04BEAF
        for <linux-input@vger.kernel.org>; Wed,  9 Feb 2022 14:56:04 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso3751005pjh.5
        for <linux-input@vger.kernel.org>; Wed, 09 Feb 2022 14:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZuOJxErdx75B/XhX4U4+Jmre2nmp1Aql4lPGNRbh74=;
        b=BZCYaLZJ72Lr18F9LbSoJpXl8uFXbNwwSa++F3WdUBrC4dx6FmGhX503X68xqi/L8L
         Iih/akndZicOcnZ5Hn2RpZxC9jEHc5snh7MUeHtg4CRTfsHADPjaF0Lo5N8klocTz5Wo
         FP90MYvC89pOuv3vNHGs+tV2Cj0gu8vnxN4Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZuOJxErdx75B/XhX4U4+Jmre2nmp1Aql4lPGNRbh74=;
        b=kDhqnxjRd/pC0tqYwO/o+FCn8PUQUczmQu5INCF3hz9iXQPDab4URj/S4XCxKuW4Tz
         vUIrbu1vwsxCu89zh4rCmbvBDmtgl9ELOOam81Q7CyCMYO5w5i1J+AGezvcS35oVTSFg
         6mGDM491DjqxXmwiR8lw8/1H0jyrtuetgwiyE7dlPkS+ZRBdKfscbhu2ws3Nwz6iK4yq
         zMQwUFXQlI6dSRIfGC20n2lH5DzMlYtarY29mi4ddlwevpQawPcSsX815Z3kI8I0iK7h
         /XrVaJE616/AmVYMMNDc91/2SPRJX9/3wEjjU/PlJaPsJ64w4ZGMzyxtzZkRGgmeHM0j
         PDpw==
X-Gm-Message-State: AOAM532WttJ4Pn8fAVFEyb+UvVHEnufEFYhQG9KUp7lh9WkPzMFlvlMt
        j6JQUjdB8TXdcslK7YK1RYH64g==
X-Google-Smtp-Source: ABdhPJzft2yBweLZEkRQW0naWztlGqli0RbJWdb6uQMBO2ybSilpILtlONJZp8fjSTCMMa3zkYrsCA==
X-Received: by 2002:a17:90b:188a:: with SMTP id mn10mr5884867pjb.186.1644447363867;
        Wed, 09 Feb 2022 14:56:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:5193:6865:e38e:3a5b])
        by smtp.gmail.com with ESMTPSA id b1sm5982015pgb.66.2022.02.09.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 14:56:03 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 5/5] HID: google: modify HID device groups of eel
Date:   Wed,  9 Feb 2022 14:55:56 -0800
Message-Id: <20220209225556.3992827-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220209225556.3992827-1-swboyd@chromium.org>
References: <20220209225556.3992827-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>

If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet Mode
Switch of eel hammer will not be detected by system because the
hid-vivaldi driver probes the device. When it is set to
HID_GROUP_VIVALDI, system will detect Whiskers Tablet Mode Switch
successfully and also support the vivaldi keyboard layout.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Sean O'Brien" <seobrien@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
[swboyd@chromium.org: Expand on commit text]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index e3dd26ddbd43..8ed75bb0878f 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -636,7 +636,7 @@ static void hammer_remove(struct hid_device *hdev)
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
-	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+	{ HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
-- 
https://chromeos.dev

