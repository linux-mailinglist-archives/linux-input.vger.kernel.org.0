Return-Path: <linux-input+bounces-498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD18805A0B
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 17:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B635B2121C
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 16:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B736B65EDD;
	Tue,  5 Dec 2023 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="E6rvuaVI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4F41A5;
	Tue,  5 Dec 2023 08:36:11 -0800 (PST)
Received: from wse.fritz.box (p5de457e6.dip0.t-ipconnect.de [93.228.87.230])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 183982FC01FB;
	Tue,  5 Dec 2023 17:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1701794170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=duNfayjenqLNWkN6bIec4wGX4k/FLSXlUkb3cvrjFeA=;
	b=E6rvuaVI0DNIKRMQtVOC0nVwH1xFarkk4OqquXfSVKiRF1SJu4RJsajZJkkQmSThZoDQDL
	4SAmpmwEFXy7lrcO53w9EM6XIoPYFi3zLMpt+NbaZoT/CxqZCJtPUQnTeEy6UNSJk142a3
	R31+8D+OCI0+gfXy281IGriyPR7St1o=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Fix strange behavior of touchpad on Clevo NS70PU
Date: Tue,  5 Dec 2023 17:36:01 +0100
Message-Id: <20231205163602.16106-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When closing the laptop lid with an external screen connected, the mouse
pointer has a constant movement to the lower right corner. Opening the
lid again stops this movement, but after that the touchpad does no longer
register clicks.

The touchpad is connected both via i2c-hid and PS/2, the predecessor of
this device (NS70MU) has the same layout in this regard and also strange
behaviour caused by the psmouse and the i2c-hid driver fighting over
touchpad control. This fix is reusing the same workaround by just
disabling the PS/2 aux port, that is only used by the touchpad, to give the
i2c-hid driver the lone control over the touchpad.

v2: Rebased on current master

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 drivers/input/serio/i8042-acpipnpio.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 9c39553d30fa2..b31d3285bea69 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1200,6 +1200,12 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
 					SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "NS5x_7xPU"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOAUX)
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
-- 
2.34.1


