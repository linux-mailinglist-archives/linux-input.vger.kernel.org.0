Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FAD8A6AA
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 20:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfHLS4Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 14:56:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43508 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfHLS4X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 14:56:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so2358818pfn.10
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OSlqfFQIlKyT7S0hKpmYM4MUQuad0HXB8iPxKH0BAmE=;
        b=gde2TgmHgrgVZriEWT850zfYiBmTLYp4aDMFtbBLfS8Hknwd9Mlhm8kkrKf9/DIxkL
         6brqYcbKyC1U1S6CORIoQbw8Xb4WnxP9TT4V9xoKf/H2a+7ECPE6YpI20aTGU6r8iMLr
         S1oMGa9IXsY3uL7pWbr9KCONpD8Sc9NcqPuouBiWaEZAksagWeWAb0rnEUcsB011h6vI
         MhxYeKDI70kcIPR9u/wFRrXdCWzdi49JQnW0F9s6SGuI6A3F3PBjVWxRXo0gBdgkDZ2a
         xOaLl0FYGGeqovv0+XuXbtA050STBN0HdEOcl/m4K/dHgl1t2uAAaxkijdwpVHO4befv
         HXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OSlqfFQIlKyT7S0hKpmYM4MUQuad0HXB8iPxKH0BAmE=;
        b=cE2ujFBYA7YyarGg8POXfl+s99Qe7GjFcLye26ptTAGOovbr5eTHKxc0RjWYT7ouLA
         uA+tVBrL2wUsCipIKeivb9S909rL3SXDQFQiX6d/MUq5nXBdhxsWiB2VjYDqzk+Kagc3
         bormlyxRcWDuSqN5UEKa/qKuskyJTXsonXQKPwHcXGHAr0gpEPw4fpB3sv5vyZI5OYQo
         JNlFPaPEm+6WLNN6bS1NakoJCWVLdccLmbY4IuiIlzyZl9GQgCR+ZPg4f4Axz7PxXDKE
         BdLOyeqxxdf11P3kEktPfYJSUP/eZWPx2FzfXiaXgjt/nmFgyunoq9idoRCv1WvEEn6e
         9QVA==
X-Gm-Message-State: APjAAAU2iCB75JK4mRbD5wN2sCuS2+N4tkw+kjm9w/fYNOktUOFkOs9p
        m/kWqWw8hLRV+YQjvj4/a+P1UYKP
X-Google-Smtp-Source: APXvYqz4HPXYqs5KYc2t7ZWT5Pv+pDLg2j2cccgHNgueJHOrdHTn5hfrUk8s2OF5t9dNjROCMQIPcw==
X-Received: by 2002:a17:90a:206a:: with SMTP id n97mr705993pjc.10.1565636182594;
        Mon, 12 Aug 2019 11:56:22 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id p68sm124593413pfb.80.2019.08.12.11.56.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 12 Aug 2019 11:56:21 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, ping.cheng@wacom.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH] HID: wacom: add back changes dropped in merge commit
Date:   Mon, 12 Aug 2019 11:55:52 -0700
Message-Id: <1565636152-21942-1-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Merge commit 74acee309fb2 ("Merge branches 'for-5.2/fixes', 'for-5.3/doc',
'for-5.3/ish', 'for-5.3/logitech' and 'for-5.3/wacom' into for-linus")
inadvertently dropped this change from commit 912c6aa67ad4
("HID: wacom: Add 2nd gen Intuos Pro Small support").

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_wac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 7a8ddc999a8e..50074485b88b 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1290,7 +1290,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 		}
 		if (wacom->tool[0]) {
 			input_report_abs(pen_input, ABS_PRESSURE, get_unaligned_le16(&frame[5]));
-			if (wacom->features.type == INTUOSP2_BT) {
+			if (wacom->features.type == INTUOSP2_BT ||
+			    wacom->features.type == INTUOSP2S_BT) {
 				input_report_abs(pen_input, ABS_DISTANCE,
 						 range ? frame[13] : wacom->features.distance_max);
 			} else {
-- 
2.17.1

