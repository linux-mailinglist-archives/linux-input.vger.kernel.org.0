Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D06B2023CE
	for <lists+linux-input@lfdr.de>; Sat, 20 Jun 2020 14:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgFTMeV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jun 2020 08:34:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60018 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728064AbgFTMeU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jun 2020 08:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592656459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AhYHZnvQg7PbLmmNFOCtJoqYjCvpWfYH/DarBsevJQM=;
        b=NWK+s2XczGOreX1hFQYh5oEOz7bPFL6AEs9KYciFpeeNq+gAv+MdniXLYdLvmte3LGAr+I
        3rwisbiqAGkQP5h8yXz9PW1d+S+oMJGxX27SngtdFTOmQ2iWJ6MXTBFeBkZxwYShethT2x
        zilk34TaHZjXXowOac/nZ1cnbUmM9VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-St-vA0svM6yjHplPhsf2yQ-1; Sat, 20 Jun 2020 08:34:17 -0400
X-MC-Unique: St-vA0svM6yjHplPhsf2yQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0778619057A1;
        Sat, 20 Jun 2020 12:34:16 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BC997167A;
        Sat, 20 Jun 2020 12:34:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 2/2] Input: soc_button_array - Add support for INT33D3 tablet-mode switch devices
Date:   Sat, 20 Jun 2020 14:34:12 +0200
Message-Id: <20200620123412.40465-3-hdegoede@redhat.com>
In-Reply-To: <20200620123412.40465-1-hdegoede@redhat.com>
References: <20200620123412.40465-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to the Microsoft documentation for Windows 8 convertible
devices, these devices should implement a PNP0C60 "laptop/slate mode state
indicator" ACPI device.

This device can work in 2 ways, if there is a GPIO which directly
indicates the device is in tablet-mode or not then the direct-gpio mode
should be used. If there is no such GPIO, but instead the events are
coming from e.g. the embedded-controller, then there should still be
a PNP0C60 ACPI device and event-injection should be used to send the
events. The drivers/platform/x86/intel-vbtn.c code is an example from
a standardized manner of doing the latter.

On various 2-in-1s with either a detachable keyboard, or with 360°
hinges, the direct GPIO mode is indicated by an ACPI device with a
HID of INT33D3, which contains a single GpioInt in its ACPI resource
table, which directly indicates if the device is in tablet-mode or not.

This commit adds support for this to the soc_button_array code, as
well as for the alternative ID9001 HID which some devices use
instead of the INT33D3 HID.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index e3a22a61f5d9..837c787e9c4b 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -397,6 +397,15 @@ static const struct soc_device_data soc_device_PNP0C40 = {
 	.button_info = soc_button_PNP0C40,
 };
 
+static const struct soc_button_info soc_button_INT33D3[] = {
+	{ "tablet_mode", 0, EV_SW, SW_TABLET_MODE, false, false, false },
+	{ }
+};
+
+static const struct soc_device_data soc_device_INT33D3 = {
+	.button_info = soc_button_INT33D3,
+};
+
 /*
  * Special device check for Surface Book 2 and Surface Pro (2017).
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
@@ -459,6 +468,8 @@ static const struct soc_device_data soc_device_MSHW0040 = {
 
 static const struct acpi_device_id soc_button_acpi_match[] = {
 	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
+	{ "INT33D3", (unsigned long)&soc_device_INT33D3 },
+	{ "ID9001", (unsigned long)&soc_device_INT33D3 },
 	{ "ACPI0011", 0 },
 
 	/* Microsoft Surface Devices (5th and 6th generation) */
-- 
2.26.2

