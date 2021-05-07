Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA541376A9A
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 21:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhEGTT2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 15:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29541 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229798AbhEGTT2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 May 2021 15:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620415107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9vQNFc66jLn6fvNyaqUrjOtN4OqZQ0DSAM4WhQKPK0U=;
        b=O2gvXlRcY8w/G41myR7kkRH1oyGy6wBBWNCI7w/+ZSNaeKz1SeJDSGm/IbDbJlrkJ6WZbL
        MRCcmfN2T2pqsFe+8Gy67H4V35WKWoREIYUHRzJ3GYOiG6EjlVcBNPHR5WFvcEfmRaeBIu
        luiDy7FPvCL0nDA1uqctrcMpmJFc1Jw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-23BcFDvTO6OCFr-G3krhmg-1; Fri, 07 May 2021 15:18:24 -0400
X-MC-Unique: 23BcFDvTO6OCFr-G3krhmg-1
Received: by mail-qt1-f199.google.com with SMTP id s4-20020ac85cc40000b02901b59d9c0986so6383130qta.19
        for <linux-input@vger.kernel.org>; Fri, 07 May 2021 12:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9vQNFc66jLn6fvNyaqUrjOtN4OqZQ0DSAM4WhQKPK0U=;
        b=Aux8MBA5nCuz9M83CybuTudrYwdMlrbPA++Afq20XQqc8U4uMzLoBACZuscDeAGie6
         R59kTaAj1mts+GT0m3qVB52VQ3A0WApX4AFleaDa9TYX1F+mK47kp4XcYndi7ku/i4+F
         otqUfmC4lHKh72mEcao3O7pxfl4jfQflnRqApK58qk6QAentdZ2D/I1Ski+AxW6kTl2j
         gAUZMlDymlriV4EjCxFiQTzmESx56MyCwuVXsbJQuihV//DZyhJzFLMabj5aPRN4VJLw
         gQr2ggoPVRKeQpw1SFmLs1km7UVPsqUOTIPTxsI3sHx1y4Nw0s/WRcKhciBTBbBsOpHR
         ljHw==
X-Gm-Message-State: AOAM5301oPJ8musblYNCTJS7cEg4MN1FttxKC1npYo9cYICbnJM0qAMb
        kQPgUPZxIe7y2ZsuFQ27L+N9rMyxTgml7hf6CtHQjYRIofCETmdIWkHV7hkG+RQYYCBYYEY/xot
        CwJc4hygRRO0Yw0lKjg2HlV4=
X-Received: by 2002:a37:8703:: with SMTP id j3mr10953669qkd.308.1620415104159;
        Fri, 07 May 2021 12:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzlFaDqzXRgPx/CFlc+XrDDafUs8RHVrsY6l98ExmRWzvIi43IlMJnIhHGAtVTeeSq/45BNg==
X-Received: by 2002:a37:8703:: with SMTP id j3mr10953659qkd.308.1620415103985;
        Fri, 07 May 2021 12:18:23 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id e12sm5578773qtj.81.2021.05.07.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 12:18:23 -0700 (PDT)
From:   trix@redhat.com
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        pedro@pedrovanzella.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] HID: logitech-hidpp: initialize level variable
Date:   Fri,  7 May 2021 12:18:19 -0700
Message-Id: <20210507191819.71092-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Static analysis reports this representative problem

hid-logitech-hidpp.c:1356:23: warning: Assigned value is
  garbage or undefined
        hidpp->battery.level = level;
                             ^ ~~~~~

In some cases, 'level' is never set in hidpp20_battery_map_status_voltage()
Since level is not available on all hw, initialize level to unknown.

Fixes: be281368f297 ("hid-logitech-hidpp: read battery voltage from newer devices")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 69670ca7e1e1..61635e629469 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1265,6 +1265,7 @@ static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage,
 	int status;
 
 	long flags = (long) data[2];
+	*level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
 
 	if (flags & 0x80)
 		switch (flags & 0x07) {
-- 
2.26.3

