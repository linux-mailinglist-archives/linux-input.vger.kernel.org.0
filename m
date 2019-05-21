Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8763925038
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbfEUN1s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34898 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728334AbfEUN1s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D1F868831E;
        Tue, 21 May 2019 13:27:47 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CD9CC60F8D;
        Tue, 21 May 2019 13:27:45 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 05/10] Input: elan_i2c - do not query the info if they are provided
Date:   Tue, 21 May 2019 15:27:07 +0200
Message-Id: <20190521132712.2818-6-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 21 May 2019 13:27:47 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

See the previous patch for a long explanation.

TL;DR: the P52 and the t480s from Lenovo can't rely on I2C to fetch
the information, so we need it from PS/2.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

changes in v2:
- updated accroding to previous patch
---
 drivers/input/mouse/elan_i2c_core.c | 56 ++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f9525d6f0bfe..53cac610ba33 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -366,27 +366,59 @@ static unsigned int elan_convert_resolution(u8 val)
 
 static int elan_query_device_parameters(struct elan_tp_data *data)
 {
+	struct i2c_client *client = data->client;
 	unsigned int x_traces, y_traces;
+	u32 x_mm, y_mm;
 	u8 hw_x_res, hw_y_res;
 	int error;
 
-	error = data->ops->get_max(data->client, &data->max_x, &data->max_y);
-	if (error)
-		return error;
-
-	error = data->ops->get_num_traces(data->client, &x_traces, &y_traces);
-	if (error)
-		return error;
+	if (device_property_read_u32(&client->dev,
+				     "touchscreen-size-x", &data->max_x) ||
+	    device_property_read_u32(&client->dev,
+				     "touchscreen-size-y", &data->max_y)) {
+		error = data->ops->get_max(data->client,
+					   &data->max_x,
+					   &data->max_y);
+		if (error)
+			return error;
+	} else {
+		/* size is the maximum + 1 */
+		--data->max_x;
+		--data->max_y;
+	}
 
+	if (device_property_read_u32(&client->dev,
+				     "elan,x_traces",
+				     &x_traces) ||
+	    device_property_read_u32(&client->dev,
+				     "elan,y_traces",
+				     &y_traces)) {
+		error = data->ops->get_num_traces(data->client,
+						  &x_traces, &y_traces);
+		if (error)
+			return error;
+	}
 	data->width_x = data->max_x / x_traces;
 	data->width_y = data->max_y / y_traces;
 
-	error = data->ops->get_resolution(data->client, &hw_x_res, &hw_y_res);
-	if (error)
-		return error;
+	if (device_property_read_u32(&client->dev,
+				     "touchscreen-x-mm", &x_mm) ||
+	    device_property_read_u32(&client->dev,
+				     "touchscreen-y-mm", &y_mm)) {
+		error = data->ops->get_resolution(data->client,
+						  &hw_x_res, &hw_y_res);
+		if (error)
+			return error;
+
+		data->x_res = elan_convert_resolution(hw_x_res);
+		data->y_res = elan_convert_resolution(hw_y_res);
+	} else {
+		data->x_res = (data->max_x + 1) / x_mm;
+		data->y_res = (data->max_y + 1) / y_mm;
+	}
 
-	data->x_res = elan_convert_resolution(hw_x_res);
-	data->y_res = elan_convert_resolution(hw_y_res);
+	if (device_property_read_bool(&client->dev, "elan,clickpad"))
+		data->clickpad = 1;
 
 	return 0;
 }
-- 
2.21.0

