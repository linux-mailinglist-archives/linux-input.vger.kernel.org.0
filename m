Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB52B442335
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 23:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhKAWOl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 18:14:41 -0400
Received: from mail.valdk.tel ([185.177.150.13]:49956 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231320AbhKAWOk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 18:14:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71593297B41
        for <linux-input@vger.kernel.org>; Tue,  2 Nov 2021 01:12:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1635804725; h=from:subject:date:message-id:to:mime-version:
         content-transfer-encoding:in-reply-to:references;
        bh=ipQkZN4ySIT3yahMuQv8hAhmzd2PPtC/l6V2uZF70LQ=;
        b=DqwsQWwNcUe4f3JFvOTRONO2ES0G4uLUL8T9mVIuHtNUQRonyAVZBQnd4encJYF9x+K8ZS
        gD4/CMJr2XtQq0M0ZIEAvfTmqklQkGlWV0unjVXZtwvvqZYKZUnHfbs4gKlub7eDgRMnsc
        oItAAb46A7tAf0g5rZlafFsQJb6wCNqHEcRZw1vJAg2XjFToE9YZp+mtrkCegX9ScRSt1+
        ZamQ9DBDQwKHb2QgDVBaMvpddo22kJHLm7hFA5+cvIhyRZ/70BcOrnnrkXb3rG6PojkCct
        w0VchGidrPq+JAKie75CXcEnpSEj9ggbIKJeErIxU3Qh3lE3AHSwnbYnWSxrew==
From:   ValdikSS <iam@valdikss.org.ru>
To:     linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] HID: lenovo: Add note about different report numbers
Date:   Tue,  2 Nov 2021 01:11:32 +0300
Message-Id: <20211101221132.1564649-4-iam@valdikss.org.ru>
In-Reply-To: <20211101221132.1564649-1-iam@valdikss.org.ru>
References: <20211101221132.1564649-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

---
 drivers/hid/hid-lenovo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e9466ae8a..7076407a6 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -487,6 +487,11 @@ static int lenovo_send_cmd_cptkbd(struct hid_device *hdev,
 	if (!buf)
 		return -ENOMEM;
 
+	/*
+	* Feature report 0x13 is used for USB,
+	* output report 0x18 is used for Bluetooth.
+	* buf[0] is ignored by hid_hw_raw_request.
+	*/
 	buf[0] = 0x18;
 	buf[1] = byte2;
 	buf[2] = byte3;
-- 
2.31.1

