Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D5F22ED1A
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 15:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgG0NWU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 09:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0NWT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 09:22:19 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6707C061794;
        Mon, 27 Jul 2020 06:22:17 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h8so8976844lfp.9;
        Mon, 27 Jul 2020 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ljLdj26yKLrLx4szyKa0cR6shoLmCqxqDX8FcCvKM+M=;
        b=bTf8843thVrOSYIaQYNRWsmHmn9AntiSMGGMQw65q1bvSXCVJ4m3rKEmTzqvm3dcLo
         GaR3rvfFjFbuyxla0IsxV7GkobOiygTpKFVInwozLREmCMHnJbjO0yQj+p3OcPCFrbqI
         rZCESbJBPHErjrd0XJu8eA1eOXBbMP5p5nqL8RezRPy9ryWwjHKyxYzDcN0vW+sQvYSz
         vqPNUa4Qn2YoPIUshfjKvzbfORTwFHxTn+t6F0+cT36v5zrrzd7Ayo6ghQqK9LAz/Wbk
         RyQZhqneOSA8cy4spgQhufjEVMF8M//KAojUiKDejW5umoytyW+PboH5yl/tYglaTaX0
         WWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljLdj26yKLrLx4szyKa0cR6shoLmCqxqDX8FcCvKM+M=;
        b=CorP2wqdlvLOMb7/QtIWBKWcbq4rty3DCSDBUC/jupWaZwXNOYJvIsLDZZ3vtWTHHU
         aMR5VBKDDP+ipuTJXOk6be88MI2cVi+nV0jGdevNsG07KT5tgXmyEx8P4yzlv5qPKyis
         z9CRgY+Vbu8h29aABKxfBS85QPzYLDWl7e5C0HvNK/XCSQmAWmxMgy0jkaiDa8q6qfyw
         /3UkvHtkwv1MHUMNbBqkyZw+5HEN8jSB1q80KkqHoEjb1umyl+70zdXotdHI/z4suhMi
         SswItwNjLedBfrxxa4T0BH4tqzIzEv773LKD7FkXk9dRMd4GAUylD2/6gZmPLj+5scEA
         xW0g==
X-Gm-Message-State: AOAM533QROiZFr5jH8BhgGBXmjaFxfoQTTsbCrC3t9JnAe0oFsX7OXM/
        1FZgoRoRAUAWlhzNxMz+c8s=
X-Google-Smtp-Source: ABdhPJxH4OYHiM4t1EmhwM707zyqAUEvJAv2XVwxgC94L5cmSzY/Pqx22ZURDbyNyeq/XuamGPlu4A==
X-Received: by 2002:a19:228a:: with SMTP id i132mr11842851lfi.178.1595856136387;
        Mon, 27 Jul 2020 06:22:16 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id s9sm501813ljh.46.2020.07.27.06.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:22:15 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmlambea@gmail.com, alexhenrie24@gmail.com,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/2] HID: cougar: Constify cougar_id_table
Date:   Mon, 27 Jul 2020 15:21:59 +0200
Message-Id: <20200727132200.32510-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
References: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

cougar_id_table[] is not changed and can be made const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/hid/hid-cougar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cougar.c b/drivers/hid/hid-cougar.c
index 4ff3bc1d25e2..28d671c5e0ca 100644
--- a/drivers/hid/hid-cougar.c
+++ b/drivers/hid/hid-cougar.c
@@ -321,7 +321,7 @@ static const struct kernel_param_ops cougar_g6_is_space_ops = {
 };
 module_param_cb(g6_is_space, &cougar_g6_is_space_ops, &g6_is_space, 0644);
 
-static struct hid_device_id cougar_id_table[] = {
+static const struct hid_device_id cougar_id_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SOLID_YEAR,
 			 USB_DEVICE_ID_COUGAR_500K_GAMING_KEYBOARD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SOLID_YEAR,
-- 
2.27.0

