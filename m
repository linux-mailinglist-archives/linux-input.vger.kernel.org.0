Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D741373BE
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 17:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgAJQei (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 11:34:38 -0500
Received: from hermes.aosc.io ([199.195.250.187]:50547 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728422AbgAJQei (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 11:34:38 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 7A75D46F4B;
        Fri, 10 Jan 2020 16:27:45 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 3/3] Input: goodix - Add support for Goodix GT917S
Date:   Sat, 11 Jan 2020 00:26:08 +0800
Message-Id: <20200110162608.1066397-4-icenowy@aosc.io>
In-Reply-To: <20200110162608.1066397-1-icenowy@aosc.io>
References: <20200110162608.1066397-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1578673671;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=fUcO8MBlL3O+0Chjy85nPyBXPKjGbI6Ws5fExVUlrCw=;
        b=pakWsdvwVQBYzjCmWUDAvQ/tCK8Kj+i1YXk5l3VTiewS+zfEHI6dzqgvZP9p6n4lqcPR3u
        jBkX0GaDfFrkQurk10SH7uCa7ruDlEFuficiflxUMb6wiOeNll2VyhgnVR0G1iDrDDgDMw
        Xt3l9y99Fe5x+rCvT0m+/Vpn7RjOsrE=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix GT917S is a touchscreen chip from Goodix that is in the GT1x
family.

Add its support by assigning the gt1x config to it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/input/touchscreen/goodix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index bfd067d7145e..43d8e1b8fb7f 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -239,7 +239,8 @@ static const struct goodix_chip_data *goodix_get_chip_data(const char *id)
 {
 	if (!strcmp(id, "1151") ||
 	    !strcmp(id, "5663") ||
-	    !strcmp(id, "5688"))
+	    !strcmp(id, "5688") ||
+	    !strcmp(id, "917S"))
 		return &gt1x_chip_data;
 
 	if (!strcmp(id, "911") ||
@@ -1047,6 +1048,7 @@ static const struct of_device_id goodix_of_match[] = {
 	{ .compatible = "goodix,gt911" },
 	{ .compatible = "goodix,gt9110" },
 	{ .compatible = "goodix,gt912" },
+	{ .compatible = "goodix,gt917s" },
 	{ .compatible = "goodix,gt927" },
 	{ .compatible = "goodix,gt9271" },
 	{ .compatible = "goodix,gt928" },
-- 
2.23.0

