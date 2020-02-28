Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13F4172DD5
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 02:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730522AbgB1BCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 20:02:43 -0500
Received: from hermes.aosc.io ([199.195.250.187]:45240 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730148AbgB1BCm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 20:02:42 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 6B34D4B417;
        Fri, 28 Feb 2020 01:02:37 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 3/3] Input: goodix - Add support for Goodix GT917S
Date:   Fri, 28 Feb 2020 09:01:46 +0800
Message-Id: <20200228010146.12215-4-icenowy@aosc.io>
In-Reply-To: <20200228010146.12215-1-icenowy@aosc.io>
References: <20200228010146.12215-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1582851761;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=ldQqQtKyIrexoj+n+YnOQ+C/FaixY7VIgOa75mkq0dk=;
        b=O+Zz1a9dFVeaaY2SPF8Yql7i9gp07yYlTf28RsUUfqqUvLS2IZlSSU5HYcb6JbVUvDhhiD
        rc65Z/9HVdQIOgwaLbJ4KuHCVyK7zqk756c/mLTYX3yv1gHATHUFE2Hc9sbnpyf5/fW0Jz
        1DGrxfb2WDIoDr7mbokl6HEGkCc5mC0=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix GT917S is a touchscreen chip from Goodix that is in the GT1x
family.

Add its support by assigning the gt1x config to it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes in v3.
Changes in v2:
- Change according to v2 of PATCH 2.

 drivers/input/touchscreen/goodix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 9aec1356b45e..810cb467650a 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -126,6 +126,7 @@ static const struct goodix_chip_id goodix_chip_ids[] = {
 	{ .id = "1151", .data = &gt1x_chip_data },
 	{ .id = "5663", .data = &gt1x_chip_data },
 	{ .id = "5688", .data = &gt1x_chip_data },
+	{ .id = "917S", .data = &gt1x_chip_data },
 
 	{ .id = "911", .data = &gt911_chip_data },
 	{ .id = "9271", .data = &gt911_chip_data },
@@ -1061,6 +1062,7 @@ static const struct of_device_id goodix_of_match[] = {
 	{ .compatible = "goodix,gt911" },
 	{ .compatible = "goodix,gt9110" },
 	{ .compatible = "goodix,gt912" },
+	{ .compatible = "goodix,gt917s" },
 	{ .compatible = "goodix,gt927" },
 	{ .compatible = "goodix,gt9271" },
 	{ .compatible = "goodix,gt928" },
-- 
2.24.1

