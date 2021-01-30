Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48E73097D5
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 20:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhA3TLW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 14:11:22 -0500
Received: from mail.archlinux.org ([95.216.189.61]:44394 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhA3TLW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 14:11:22 -0500
Received: from localhost.localdomain (unknown [188.251.63.183])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 396F63AEDBB;
        Sat, 30 Jan 2021 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1612033840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=b826KHVfAP92XNLPbv2NhgYvU4eRpKPywAcsISgN4KI=;
        b=ZT+XiBp4cqJMVZwDnavGIVWYBLEVnn39p1BvvfEOnMJOPriADhzaOPGOuW0NVNcynexX8a
        mosuNyjPaWBfYZVzlTDKWSUI6LULL9qs1GKT4e61UKcDXvqr8q4ZxuaM0OO4DmvhaIa6Tp
        curE5v3bKMkfINr61MZld6LdTeOrM7cJN2F9sx+rUxokNrRzV4f0Y1ZkeR3sCqSwLMTKpM
        vYrLsHcQMKdJ12gdr8NZCuRF0QkIuHOIq6bqizljjhbcG9i19KbAJdCvGx4l21aNrt9rTi
        Wi7iAMz6DTyO28cgTtWyDv1tUgMZfOM0fMJu12F/rR561Mygs9xIJ2ja4ECU5qAQ6YBmNo
        PgpZ3s7TXGqY4GKcCp35VP8TwK14WH5gXXXr7IYaYdhhLKDQ//B7CgPGwj4cqHsOijozoY
        4HCyFFMNtCEMk7AIPWLKjfHZEjgQAEZTL5TQyu34kRgwWTLoo5GiJ/6tmWsK+gsb4qIWmv
        ep3P7aYmS8gqrBDz3q/MabzVV2CV/k8ulk8dbGOlMVk0b/zGFaNZYLtb04uDlDHgTqdQPR
        TPsNNBaF3H7VFFa8bD8Hriy//smvy3dtNeJZ2t3hRdPIDb5+h1U60ZecPhk0E2efNpC4/F
        ab9ons3zuLE3X+Mvw7oJNGPrGdI3n8mHflidX5oqp0KRZ7tjyl/Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1612033840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=b826KHVfAP92XNLPbv2NhgYvU4eRpKPywAcsISgN4KI=;
        b=qjyaQNqTKq1nX0XyVPhXG2eHwjdFDs1YL1K149p1TO9jXtVFPJHPKmWVX33P1nj/nFybj3
        L0GcbjV1S9yOh6Dg==
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH] HID: logitech-dj: add support for keyboard events in eQUAD step 4 Gaming
Date:   Sat, 30 Jan 2021 19:10:27 +0000
Message-Id: <20210130191027.1225465-1-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Filipe Laíns <lains@riseup.net>

In e400071a805d6229223a98899e9da8c6233704a1 I added support for the
receiver that comes with the G602 device, but unfortunately I screwed up
during testing and it seems the keyboard events were actually not being
sent to userspace.
This resulted in keyboard events being broken in userspace, please
backport the fix.

The receiver uses the normal 0x01 Logitech keyboard report descriptor,
as expected, so it is just a matter of flagging it as supported.

Reported in
https://github.com/libratbag/libratbag/issues/1124

Signed-off-by: Filipe Laíns <lains@riseup.net>
---
 drivers/hid/hid-logitech-dj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6596c81947a8..2703333edc34 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -981,6 +981,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 	case 0x07:
 		device_type = "eQUAD step 4 Gaming";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
+		workitem.reports_supported |= STD_KEYBOARD;
 		break;
 	case 0x08:
 		device_type = "eQUAD step 4 for gamepads";
-- 
2.30.0

