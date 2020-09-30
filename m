Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0329D27E56D
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 11:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgI3JnD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 05:43:03 -0400
Received: from mail-dm6nam12on2059.outbound.protection.outlook.com ([40.107.243.59]:49152
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728169AbgI3JnC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 05:43:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQb01l22NFdCsifN6+UV+9reIdo67c5PanJ3a/IiFYcT/Vut+siA0AhAqwCOZH8d6PT+lV5fe6nkjR3nZBZvFq8hL89edSTVcj53GR8IbSG7ksnNtCiCtF9gqDgLJ/2hDBedPZdvNuzaEmg6Nr1BlpZrLNyce9ugQt7HQmCeDD0vY53IHIVk3zFqsMzrcZLxZ5Nf+RrtuwjsgYk7Q3W56hSqpC6MhJuMY9Q5tz+1x4Qy94YhS2ie5FvZeEUfHzloE7i9veMDmlCdrnuPq7ywZG/QyzgD8wBknahZ2UB99UbRGADkTRvX90vgn6hWYzaiwdRbgnOGZww2PYM6K6V7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePER55FLiZrnulF7fhq59+TXiHkv7QXaXJs7peuIQdU=;
 b=U62ctH7gL2Uza8ejElWQYCT1o6a/fkJXgw6Bn1lqG3pD+tcoBFnirJsXRV6IOYBuoAEd2aOxcFBOXiD/TkshFkL7WqEzs4SsFt4KT37nIt6r3lZOd+4E1NmzheIVtnlh6Ots/YqzELNDHsO87w6uF8FMMfR/0CCoBBN9T0aUOEortj4km1zxvmuJ6g5Ixu7KHIjySqDvpquTWtqNE/3DkWrn518cviI2/4qqGeBe6GF8Eewmg5Ar8W/2jmrLcymereqPBq3ZzTVHjB5BA/Z9XL3GLAp8gCz/txWNkJdmbQgQuMZvOFOGKGKRaJc9gcZ0WujzXULABgsM22vwh2isyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePER55FLiZrnulF7fhq59+TXiHkv7QXaXJs7peuIQdU=;
 b=Ps8gwt8ryjNhrPJU8i5M1Hma+aqScrA7BVVMOORolpQfKvvnLnmUrEY3tQOyXHlLJKfEny+vou5e2v/KDnVx1IhJ76TbJMSkBcOmdSdxVDYwIa2SeSADMBkGjGmpqp3wYdttAcvwVt3T18YVL8bzEE5VXh8+mQw8SJGYZ9TDA/k=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB3821.namprd03.prod.outlook.com (2603:10b6:805:6a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Wed, 30 Sep
 2020 09:42:58 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3433.035; Wed, 30 Sep 2020
 09:42:58 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: [PATCH v3 1/2] Input: synaptics-rmi4 - rename f30_data to gpio_data
Date:   Wed, 30 Sep 2020 17:41:46 +0800
Message-Id: <20200930094147.635556-2-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR06CA0020.apcprd06.prod.outlook.com (2603:1096:202:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 09:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa9c832-03a1-459b-5aa1-08d865253702
X-MS-TrafficTypeDiagnostic: SN6PR03MB3821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3821A52C93E7093151E62F96D6330@SN6PR03MB3821.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHxkaHB97eOSklKpWyb/GiDk3gYnpzST4wKkCYEBUk9DGfRi1o+326DBAdH/cljGtEMTSi/ATjCwiInrQODQDuLOYni682cHv8NRdBO6BxRqE8hdLbB+vHNZGtmDhGUMrXJd9kn9QE4692cFDS+rpOvhL41bunv3iJ12H1AohXW6yRipn9OZIYu+loogD8XO/Szaul9n+nVMgODj+SB1OMmouZhhA6IXrrIq+JJ4jzlLurWdL4FcFIG1kT5T9oYzioUekpUKTfuh7rnRNkqFyomL8seBaKmW7C9XZpGRe//bTTgBQDktKy0YiIEQfX6cSPYKwbrpUHc+u8fOKEH9SXvvJpyAcqn3Gz09NJQSUcdpkb9EtEVo74VOAxSaL08oGmWEbyEEUEN3UwShObBGrY8W+Mw/GnHxFoMMwNHLp7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(6486002)(66946007)(478600001)(6666004)(5660300002)(107886003)(83380400001)(66476007)(956004)(2616005)(66556008)(8936002)(186003)(16526019)(52116002)(26005)(4326008)(8676002)(316002)(44832011)(86362001)(6512007)(54906003)(1076003)(6506007)(2906002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: DT/RxU2jFCu+hadiUdDQwIpG7NUETRjQALCIPLQA0YMrDNPh6GFy0vPaoYA5O4JpLjP8ONTuV/QybT0dvvuH6+ojVEeLyhRNug+L1sdj+l9OL525V0NFL6OgRzIa5GliL8u6TIQrpnzj0PYbW9OyZzE8LThuzmf4hgOWFd4LgCqZMdvHSAHMxfx/qPuNqAoDlLBIsCwnI/V/YaSKEonhT+lmcWIx/rnZTBwQHyb0BV2H/rPbCAxL4lk0wX5NBU1pqos41ZMKZ2U4TzamOsVDVL6hqmZ2pZI9pWNmdG2wwccQdF9bQTEdV3UvvpADVuDZlvdRZkuVT2SGcG7kBbReIa+dv70eICP0kY17ndWhak8M0o0uDnLA4TcIGp7DVyaDGbzzdPv5Ll8j4OInrPJgGvdyrrq7Dzrtm3yP7yFlgTWPITWvoK16v0uJzPVfH0UCaKsOd0XE+asjkw+PM31FeT4h8LB/kheTICrSU2MoLaFzmMtMDBJdMwpVzOULtDwXo2JewtpXbsSuxuwW3XbLr/dZGfcjXog/Ax7CCQOR3nw+Buqj5VjfaU5frDuE8YsRT2qck69qqO+22Dl+cf2Eqwp0pq/qE3u+OIZZCyKeraudRno4Vp3yvlvNnABO2eGPYNjA16bMwoTwPcnl95RX9g==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa9c832-03a1-459b-5aa1-08d865253702
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 09:42:58.6070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX5oblFG80/ssSzT+tHk2t4RUYrHFGAlQFP36Kx5eax+WFEx2MzNsY4SCnZJcPB33W2RuVJTZs58s5x+9cSGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3821
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

f30_data in rmi_device_platform_data could be also referenced by RMI
function 3A, so rename it and the structure name to avoid confusion.

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-rmi.c           |  2 +-
 drivers/input/mouse/synaptics.c |  2 +-
 drivers/input/rmi4/rmi_f30.c    | 14 +++++++-------
 include/linux/rmi.h             | 11 ++++++-----
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 9ce22acdfaca..62315e31d520 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -722,7 +722,7 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS)
-		rmi_hid_pdata.f30_data.disable = true;
+		rmi_hid_pdata.gpio_data.disable = true;
 
 	data->xport.dev = hdev->dev.parent;
 	data->xport.pdata = rmi_hid_pdata;
diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 4b81b2d0fe06..8a54efd6eb95 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1752,7 +1752,7 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 			.kernel_tracking = false,
 			.topbuttonpad = topbuttonpad,
 		},
-		.f30_data = {
+		.gpio_data = {
 			.buttonpad = SYN_CAP_CLICKPAD(info->ext_cap_0c),
 			.trackstick_buttons =
 				!!SYN_CAP_EXT_BUTTONS_STICK(info->ext_cap_10),
diff --git a/drivers/input/rmi4/rmi_f30.c b/drivers/input/rmi4/rmi_f30.c
index a90dad1d9ac7..35045f161dc2 100644
--- a/drivers/input/rmi4/rmi_f30.c
+++ b/drivers/input/rmi4/rmi_f30.c
@@ -168,17 +168,17 @@ static int rmi_f30_config(struct rmi_function *fn)
 				rmi_get_platform_data(fn->rmi_dev);
 	int error;
 
-	/* can happen if f30_data.disable is set */
+	/* can happen if gpio_data.disable is set */
 	if (!f30)
 		return 0;
 
-	if (pdata->f30_data.trackstick_buttons) {
+	if (pdata->gpio_data.trackstick_buttons) {
 		/* Try [re-]establish link to F03. */
 		f30->f03 = rmi_find_function(fn->rmi_dev, 0x03);
 		f30->trackstick_buttons = f30->f03 != NULL;
 	}
 
-	if (pdata->f30_data.disable) {
+	if (pdata->gpio_data.disable) {
 		drv->clear_irq_bits(fn->rmi_dev, fn->irq_mask);
 	} else {
 		/* Write Control Register values back to device */
@@ -245,10 +245,10 @@ static int rmi_f30_map_gpios(struct rmi_function *fn,
 		if (!rmi_f30_is_valid_button(i, f30->ctrl))
 			continue;
 
-		if (pdata->f30_data.trackstick_buttons &&
+		if (pdata->gpio_data.trackstick_buttons &&
 		    i >= TRACKSTICK_RANGE_START && i < TRACKSTICK_RANGE_END) {
 			f30->gpioled_key_map[i] = trackstick_button++;
-		} else if (!pdata->f30_data.buttonpad || !button_mapped) {
+		} else if (!pdata->gpio_data.buttonpad || !button_mapped) {
 			f30->gpioled_key_map[i] = button;
 			input_set_capability(input, EV_KEY, button++);
 			button_mapped = true;
@@ -264,7 +264,7 @@ static int rmi_f30_map_gpios(struct rmi_function *fn,
 	 * but I am not sure, so use only the pdata info and the number of
 	 * mapped buttons.
 	 */
-	if (pdata->f30_data.buttonpad || (button - BTN_LEFT == 1))
+	if (pdata->gpio_data.buttonpad || (button - BTN_LEFT == 1))
 		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
 
 	return 0;
@@ -372,7 +372,7 @@ static int rmi_f30_probe(struct rmi_function *fn)
 	struct f30_data *f30;
 	int error;
 
-	if (pdata->f30_data.disable)
+	if (pdata->gpio_data.disable)
 		return 0;
 
 	if (!drv_data->input) {
diff --git a/include/linux/rmi.h b/include/linux/rmi.h
index 7b22366d0065..00dda5381bf8 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -102,15 +102,16 @@ struct rmi_2d_sensor_platform_data {
 };
 
 /**
- * struct rmi_f30_data - overrides defaults for a single F30 GPIOs/LED chip.
+ * struct rmi_gpio_data - overrides defaults for a single F30/F3A GPIOs/LED
+ * chip.
  * @buttonpad - the touchpad is a buttonpad, so enable only the first actual
  * button that is found.
- * @trackstick_buttons - Set when the function 30 is handling the physical
+ * @trackstick_buttons - Set when the function 30 or 3a is handling the physical
  * buttons of the trackstick (as a PS/2 passthrough device).
- * @disable - the touchpad incorrectly reports F30 and it should be ignored.
+ * @disable - the touchpad incorrectly reports F30/F3A and it should be ignored.
  * This is a special case which is due to misconfigured firmware.
  */
-struct rmi_f30_data {
+struct rmi_gpio_data {
 	bool buttonpad;
 	bool trackstick_buttons;
 	bool disable;
@@ -218,7 +219,7 @@ struct rmi_device_platform_data {
 	/* function handler pdata */
 	struct rmi_2d_sensor_platform_data sensor_pdata;
 	struct rmi_f01_power_management power_management;
-	struct rmi_f30_data f30_data;
+	struct rmi_gpio_data gpio_data;
 };
 
 /**
-- 
2.25.1

