Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BA834095D
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 16:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCRPzc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 11:55:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230260AbhCRPza (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 11:55:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9E3664DFF;
        Thu, 18 Mar 2021 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616082930;
        bh=ny4+E+N8QghqQwj3fjQuSxCnyOXITWxlwlBjnNkyV8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=i7WikpQ9hqs57dlD+FCDTV2bLa3aNnel5wJl5ThSq8FJbh699OSaxLkJSYWDSUO9R
         lyQlXtHtDN17zaezAn6x8wGplxVuZlHYgkiKOc/4+SGgR81GuWt/i1yShepZsXU7pg
         7E64g1F10Kwaa7E9t+YS9HoV85mYAddVAMMwKtLjHs/mZZniPud3V1lUGzG8fLeFZn
         sJesplB9gDp+bYSzqE5s0uXVAmxe9rSMQ+uK/A3ggxaPtdlWN1z7pwNqsZ3pe7IN4Q
         Ir5M4lufHOiMVicTfzUuG59cDOMJJKnoQkBx/vEt0GykgTfjcrIFW61F69zx2gh5hv
         VDX1Gixar/LzQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lMv00-0005ri-Ec; Thu, 18 Mar 2021 16:55:48 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] Input: ims-pcu - drop redundant driver-data assignment
Date:   Thu, 18 Mar 2021 16:55:25 +0100
Message-Id: <20210318155525.22496-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver data for the data interface has already been set by
usb_driver_claim_interface() so drop the subsequent redundant
assignment.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/input/misc/ims-pcu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 08b9b5cdb943..81de8c4e37d0 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -2018,7 +2018,6 @@ static int ims_pcu_probe(struct usb_interface *intf,
 	}
 
 	usb_set_intfdata(pcu->ctrl_intf, pcu);
-	usb_set_intfdata(pcu->data_intf, pcu);
 
 	error = ims_pcu_buffers_alloc(pcu);
 	if (error)
-- 
2.26.2

