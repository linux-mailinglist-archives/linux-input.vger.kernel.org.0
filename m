Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC50C3F0806
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239608AbhHRP3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 11:29:08 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:18180 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239494AbhHRP3I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 11:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629300506;
    s=strato-dkim-0002; d=inhub.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=IK99A/GynHBsNekMV/T4efD0GVoEvLYRB6wYA/qAU0k=;
    b=AvJtHJWRHaTfTnbwda80QOtZddUK19id620jzB3p+bdTYFuSTd2Qf3QpM1Pa7ZMSps
    YgDXXFx1oo2UXPOdPsK/NQ/Yizk+I5jVJagv/vyLywDe3YP4wuqDL04Q1/5lcLcFYni2
    VPZ6stANe6kjgfPDDLS8QwPQ9QVjJuwRNZSBGNxXnPF+REX504DCM0k4MjHD43/K8aVe
    rySpMLwfgEI9EG3g4YyXBHCSgeiaTV/VyHZ87xD4RaghwhYc1Swm1QQtjpPpK8WPmNXd
    NIFNgXQhxSrCleOH0VHVKLTMH2/ln64m9SvK9td1mdXKXgpgvEuG7uPtMakEylWqBdiS
    WAIA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgfKKxghMZpWooHBd6LckRo6Cg2ToZyvlfQhM6"
X-RZG-CLASS-ID: mo00
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 47.31.0 AUTH)
    with ESMTPSA id k00d02x7IFSQq0C
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 18 Aug 2021 17:28:26 +0200 (CEST)
From:   Tobias Junghans <tobias.junghans@inhub.de>
To:     linux-input@vger.kernel.org, Rishi Gupta <gupt21@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH 1/2] HID: mcp2221: enable HID I/O during probe
Date:   Wed, 18 Aug 2021 17:27:42 +0200
Message-Id: <20210818152743.163929-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_gpiochip_add_data() calls the gpio_chip->get_direction handler
for each line, resulting in device I/O in mcp_gpio_get_direction().
However unless hid_device_io_start() is called, mcp2221_raw_event()
is not called during probe, causing mcp_gpio_get_direction() to time
out. This fixes that probing takes 12 seconds to complete.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/hid/hid-mcp2221.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 4211b9839209..8e54173b195c 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -895,7 +895,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
 
+	hid_device_io_start(hdev);
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
+	hid_device_io_stop(hdev);
+
 	if (ret)
 		goto err_gc;
 
-- 
2.25.1

