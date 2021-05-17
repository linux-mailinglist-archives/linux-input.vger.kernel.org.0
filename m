Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742A6382864
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 11:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbhEQJfp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 05:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbhEQJfo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 05:35:44 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94942C061573
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 02:34:28 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id q6so3348008pjj.2
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxM54HyqHqiY/YoPUjHSIQ4Np3NFE5HEGLzd+ZrNKbk=;
        b=e4pYJS7BmQr27s+S3EFe8uAp3O9husVhmv3AjQWU+7oPfVzCFTN4cGRLwXmpL7dspF
         eO/LSeMXiffzc1yOepqTXFP4FeXlr1gCDl8iSDKZyyEAtu9HSnMHXwnb0oESyRQGTXFi
         BGdAb2EAmSZnWEkiN63lKVlIb6G6Xbr6Rto+8OPER26rQiIPtd/UzTAaZPiy1GdMi+Ai
         +10fiaROGS5bY/3skR4PXWX+YLD42SD7a4DycOoZk7UMU/W937SGkPFIIaBExv0wvHRL
         1Jw0CI2N7DF34jx/NO/yOpxWzNfto4cAZ3gQKAR4lIpAjytAEZhZfX0GVD1/jMuykHKI
         3NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxM54HyqHqiY/YoPUjHSIQ4Np3NFE5HEGLzd+ZrNKbk=;
        b=KG6uL3MVSOpB+Flz+drNXgNmc5og5MdbXsxgYZwCyO+AUk6y61ZR+/cMbp+A+d5eF/
         orwXOYZDZMbH1vImP8BdMKeIfKgCNIN+yrs16d+Gcg3ofGSbTUQh4JMq88vdGj1z3rP/
         rYxO+o05IR3Kdxt/rJMtgKM/m2UMAWhe8pkQOJjZPXOYJc2iJj8nw+M7glHEYoH9WpQZ
         qjtvLZd60DWYhCZMU1tZN/a0WRrElsvXc28qMvAZGUsZlkFUeVEBrS2rdzI/vmsbLp83
         M7Y/AA0Gbf0JKD2YRRn64c4qBEU8Xd28OInoY7lqtTsymhq9cyfRqjz0pDCzupchYnoB
         reKw==
X-Gm-Message-State: AOAM533GqOV50+ID+0AcAD4Bt/RJlKyDUzfm5qdhWI567DMZzNZhH6nQ
        D/AeeTzBAI3K+AZCcwUByGA=
X-Google-Smtp-Source: ABdhPJx1RWPuzk244AHSY6cuYicJXDCq8OvdKA58ColtxBhXCVcKVk+OdTEvGMaZIBbBDT3h6nTrIQ==
X-Received: by 2002:a17:902:a40e:b029:e9:7253:8198 with SMTP id p14-20020a170902a40eb02900e972538198mr60260571plq.82.1621244068205;
        Mon, 17 May 2021 02:34:28 -0700 (PDT)
Received: from yguoaz-VirtualBox.hz.ali.com ([106.11.30.46])
        by smtp.googlemail.com with ESMTPSA id b12sm6882972pjd.22.2021.05.17.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:34:27 -0700 (PDT)
From:   Yiyuan GUO <yguoaz@gmail.com>
X-Google-Original-From: Yiyuan GUO <yguoaz@cse.ust.hk>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, yguoaz@gmail.com,
        Yiyuan GUO <yguoaz@cse.ust.hk>
Subject: [PATCH] HID: wacom: check input_dev->absinfo in wacom_bpt3_touch_msg
Date:   Mon, 17 May 2021 17:34:03 +0800
Message-Id: <20210517093403.74276-1-yguoaz@cse.ust.hk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The function wacom_bpt3_touch_msg calls input_abs_get_res(input,
ABS_MT_POSITION_X) to obtain x_res, which may equal to 0 if
input->absinfo is NULL. Since x_res is used as a divisor, this
may lead to divide by zero problem.

Signed-off-by: Yiyuan GUO <yguoaz@cse.ust.hk>
---
 drivers/hid/wacom_wac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 81d7d12bc..a5a6fb8bc 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2892,7 +2892,7 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
 	bool touch = data[1] & 0x80;
 	int slot = input_mt_get_slot_by_key(input, data[0]);
 
-	if (slot < 0)
+	if (slot < 0 || !input->absinfo)
 		return;
 
 	touch = touch && report_touch_events(wacom);
-- 
2.25.1

