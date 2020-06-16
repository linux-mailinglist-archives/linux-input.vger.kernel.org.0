Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD761FBC0A
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 18:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgFPQpK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 12:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPQpK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 12:45:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B0FC061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 09:45:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q25so3826582wmj.0
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SI9vJE2rDg56OuojCSDu+U/KawnOkhGpWXvUI9Sv53Q=;
        b=YlMFFHCOduF39EtP3gnjwPsSwDTGNdIJQmgzc5ZPpEzrS5dX/PPx6rWeyHAzByn2tQ
         WqzUll2cOHQG4A+tph7JjMaXd0zA7WucCMbOWprPSOD8BlwRAXVn7ywKc1t9VTNL97EZ
         OcFzRvVjHZq1COnrgeVimozawI6S/wEUqmU26aktfSllA+xGs3M693FNFpwOMde8ME6L
         74stDDSW9kX7GBlz8dRi7vnGmbJq6FNKeJTwUa5LXCvUNfeLWV51+uzRPpvQLQRocXgI
         X9mRd2EGK02TCWZVe8qo+6jtTaRxZKnhekK/S0kHXHb0s1TLA4Pd6bnPsjPFxYF47HOe
         t+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SI9vJE2rDg56OuojCSDu+U/KawnOkhGpWXvUI9Sv53Q=;
        b=j/GIwf93ik22wiFbcM7QYy2wIzR5Vo9/batzLKHSjDyqy2BRFNSmX67uedYeR6aezz
         LltPBpeHjRm7TRnEoEQzpogxZCqUghDlkjUxu1mxR8U76Jctz2D4upANvXhSQ0VwqcPj
         XNVj2rZxTYEFfs1FgLv6IBgQfi3CJln0zZkCWnGIrY8v9zYocnZtQOFhsKUFAyLigTqp
         u9w6Hd8Ip4PKUo/FVU2SJ81BCHcN1PEr2BEsYv0Cvx2/TgMJ2Q6SvZIP+aGc7RayWLWI
         WrjkbZ87D7LNuMpCw+qNqtQRk1V/qHVGkHMpZKUy1/qGa1H9TgaUbMbIXjdtJjWURlxV
         Mr6Q==
X-Gm-Message-State: AOAM531iK7bzvi468GgtrpQ9yN+M5IgsOykA174IeYygCGTDNnB9zgF7
        fNh2UwoszoJe1FaF25cx+50=
X-Google-Smtp-Source: ABdhPJyh0hFtBzijMQzUCHAILHvv7Gk3E5X7548vyLcVjITjVGldPvsY6aoByNtDtE0GRSbj+ThXfg==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr3854534wmj.143.1592325908509;
        Tue, 16 Jun 2020 09:45:08 -0700 (PDT)
Received: from localhost.localdomain ([92.176.4.241])
        by smtp.gmail.com with ESMTPSA id c6sm5016875wma.15.2020.06.16.09.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:45:07 -0700 (PDT)
From:   Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>,
        Siarhei Vishniakou <svv@google.com>
Subject: [PATCH] HID: steam: fixes race in handling device list.
Date:   Tue, 16 Jun 2020 18:44:18 +0200
Message-Id: <20200616164418.14426-1-rodrigorivascosta@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <nycvar.YFH.7.76.2006161108150.13242@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2006161108150.13242@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using uhid and KASAN this driver crashed because it was getting
several connection events where it only expected one. Then the
device was added several times to the static device list and it got
corrupted.

This patch checks if the device is already in the list before adding
it.

Signed-off-by: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
Tested-by: Siarhei Vishniakou <svv@google.com>
---
 drivers/hid/hid-steam.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 6286204d4c56..a3b151b29bd7 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -526,7 +526,8 @@ static int steam_register(struct steam_device *steam)
 			steam_battery_register(steam);
 
 		mutex_lock(&steam_devices_lock);
-		list_add(&steam->list, &steam_devices);
+		if (list_empty(&steam->list))
+			list_add(&steam->list, &steam_devices);
 		mutex_unlock(&steam_devices_lock);
 	}
 
@@ -552,7 +553,7 @@ static void steam_unregister(struct steam_device *steam)
 		hid_info(steam->hdev, "Steam Controller '%s' disconnected",
 				steam->serial_no);
 		mutex_lock(&steam_devices_lock);
-		list_del(&steam->list);
+		list_del_init(&steam->list);
 		mutex_unlock(&steam_devices_lock);
 		steam->serial_no[0] = 0;
 	}
@@ -738,6 +739,7 @@ static int steam_probe(struct hid_device *hdev,
 	mutex_init(&steam->mutex);
 	steam->quirks = id->driver_data;
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
+	INIT_LIST_HEAD(&steam->list);
 
 	steam->client_hdev = steam_create_client_hid(hdev);
 	if (IS_ERR(steam->client_hdev)) {
-- 
2.27.0

