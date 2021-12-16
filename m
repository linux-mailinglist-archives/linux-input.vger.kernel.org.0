Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D033D478022
	for <lists+linux-input@lfdr.de>; Thu, 16 Dec 2021 23:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhLPWqo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 17:46:44 -0500
Received: from mail.valdk.tel ([185.177.150.13]:41632 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235418AbhLPWqn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 17:46:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A47A42C17D7;
        Fri, 17 Dec 2021 01:46:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1639694801; h=from:subject:date:message-id:to:cc:mime-version:
         content-transfer-encoding:in-reply-to:references;
        bh=ipQkZN4ySIT3yahMuQv8hAhmzd2PPtC/l6V2uZF70LQ=;
        b=oAXAsoApl6XbGWGCgcu5C+YwD+XYfnO7MkxQsbE9LMAqqhNPLvB7McGQtgs8rAVlrC5S6t
        qmGxmUkgCNshAiNwCbK36+D6z3E+HRTvSF0/XuOQAEdo/Y0MyG/AMbqR5pwdC1rvQCvg5f
        Lpu2Id7dvs9Nc7VsMfdpTuJ18lHaupwhHayLtvIPn92Tvh+onkicz/zJWS2Ss6adaX8YOv
        Cp4Zx96ExDsvgNRRK3bBf6BGrmGL3eaUdRajAdYg566qifvmjxIk1Nntnw2Yt8Q+v+IEyX
        44YJ10J6OJmfMd0B0c0g75Qd0gHrvI8SkgaigGXhKeXqDcDag/BmX7PWlklcPQ==
From:   ValdikSS <iam@valdikss.org.ru>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] HID: lenovo: Add note about different report numbers
Date:   Fri, 17 Dec 2021 01:46:11 +0300
Message-Id: <20211216224611.440397-4-iam@valdikss.org.ru>
In-Reply-To: <20211216224611.440397-1-iam@valdikss.org.ru>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
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

