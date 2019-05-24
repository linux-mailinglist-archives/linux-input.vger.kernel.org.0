Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645B928F90
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 05:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731736AbfEXDXD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 23:23:03 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:40852 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729972AbfEXDXD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 23:23:03 -0400
X-Greylist: delayed 587 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 May 2019 23:23:03 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="30739612"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 24 May 2019 11:13:14 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(174508:0:AUTH_RELAY)
        (envelope-from <kt.liao@emc.com.tw>); Fri, 24 May 2019 11:13:13 +0800 (CST)
Received: from 192.168.81.85
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(119328:0:AUTH_LOGIN)
        (envelope-from <kt.liao@emc.com.tw>); Fri, 24 May 2019 11:13:10 +0800 (CST)
From:   =?big5?B?ufmxUrph?= <kt.liao@emc.com.tw>
To:     "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Aaron Ma'" <aaron.ma@canonical.com>,
        "'Hans de Goede'" <hdegoede@redhat.com>
Cc:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com> <20190521132712.2818-10-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-10-benjamin.tissoires@redhat.com>
Subject: RE: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value
Date:   Fri, 24 May 2019 11:13:10 +0800
Message-ID: <003d01d511de$9da229c0$d8e67d40$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQMBv+jJqV7WAwqWtnh8gdestIYR9QG8pxropBJQxXA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcOTIwNzNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1kYWY4ZjI2OC03ZGQxLTExZTktYjdjYy01YzUxNGY0NmFhNDVcYW1lLXRlc3RcZGFmOGYyNmEtN2RkMS0xMWU5LWI3Y2MtNWM1MTRmNDZhYTQ1Ym9keS50eHQiIHN6PSIxODA1IiB0PSIxMzIwMzE0MTE4OTgyOTk3MjkiIGg9Imhma2hVUXdmZjdmRWhRVTZWeE1pbEI0Ry9Tcz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Thanks so much for all you do for Elan touchpad.

For the width_*, I have a question for it.
Our antenna sensors fully occupied the whole touchpad PCB.

The Gap between 2 sensors are 7.5 mil (0.19mm).
That's why we did not minus one trace.


Thanks
KT
-----Original Message-----
From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com] 
Sent: Tuesday, May 21, 2019 9:27 PM
To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org;
devicetree@vger.kernel.org; Benjamin Tissoires
Subject: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base
value

*_traces are the number of antennas. width_* is thus the space between 2
antennas. Which means, we should subtract 1 to the number of antennas to
divide the touchpad by the number of holes between each antenna.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

new in v2
---
 drivers/input/mouse/elan_i2c_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c
b/drivers/input/mouse/elan_i2c_core.c
index 6f4feedb7765..3375eaa9a72e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -398,8 +398,8 @@ static int elan_query_device_parameters(struct
elan_tp_data *data)
 		if (error)
 			return error;
 	}
-	data->width_x = data->max_x / x_traces;
-	data->width_y = data->max_y / y_traces;
+	data->width_x = data->max_x / (x_traces - 1);
+	data->width_y = data->max_y / (y_traces - 1);
 
 	if (device_property_read_u32(&client->dev,
 				     "touchscreen-x-mm", &x_mm) ||
--
2.21.0

