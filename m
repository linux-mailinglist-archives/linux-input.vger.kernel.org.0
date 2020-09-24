Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2562276DCA
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 11:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgIXJsT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 05:48:19 -0400
Received: from mail-eopbgr680065.outbound.protection.outlook.com ([40.107.68.65]:33540
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgIXJsP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 05:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1sGyvrnZczHDCuSz/RvKDXWw1phRgpiFQwayLvHQGPY8YVcdC/o09ka6bEDVeKIo6Nrogz6fYO3OV/jetjTK3ewuS5b/SXKYDSoHDOCS6J7MBWJZc+ebY/0fGUN1o5RDAo0FRMHKajXb/ar4acBxpX90rpXB1PRszLMu3Uk48D52+BiZ/73FwYouDF6uvzoGYKhbIsE8mnfaGqTV+Dkodfw0XmXQ0UmGk51QfT0vXb2hbcO89aKyUZcQc1SNyrBTfedYKK+ybrCKs9/+cL5KSnfNycmtU4Q6wsTgOH3AlyinD8crW4bqnzu8UPRNJ6DZku2JQOH4m38wHHPuU4j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIYWG2skThI0rJljXg9vSZYlxWt3Yu+wuuihKvudKl8=;
 b=LdMLTc8i9VPkxFwhUO0A+VUL4T7HYNRunkgcJXrl+nGq5o1h/OlO+LaG2LhkzOuPrajkU0xORr3dmZzvcG+4tx0BsaC+8NHj3UfYLcJT3kwM4Qj4buNiW3b3OHFA5Rp3OeHKNnznHJNZZDX9EeH6OD6BpEeELzMjRdFDnvq3sE0UNgB8KqFIKTYs6opmrbRLff6p5W5/qBwRWcREdeWgy79QUITx0BrwnifPWVkwlTs/JG8ZrEU+UKZudODgzrGeaMMytTwSlcZ89m8DOKhKZ1dghIssMevq7L5Rw8jFGXza/ZdoCQvd2CDGl5xtHsGir900CGrX6uT5J4J3PIDc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIYWG2skThI0rJljXg9vSZYlxWt3Yu+wuuihKvudKl8=;
 b=TcvEQFMtTR8BK+GzTvlQNqs4WR/o7qekqZOKH98KnoWm3lK3ltMknx9MVhWu37Z5zNBWBUohi1whzeEqJ9JhOrwUJlWOELtK/Gd99VSETFqlsLlpbyWYlYK1n0KDPZKcR9YiE3g5bkCm76xNVx+CgKLGsEjNIRoYi9LZc2UicLk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB4496.namprd03.prod.outlook.com (2603:10b6:805:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 09:48:13 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 09:48:13 +0000
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
Subject: [PATCH 1/3] Input: synaptics-rmi4 - rename f30_data to gpio_data
Date:   Thu, 24 Sep 2020 17:46:26 +0800
Message-Id: <20200924094628.1085000-2-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
References: <20200924094628.1085000-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 09:48:10 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 752889c2-ceba-411e-171a-08d8606ef3f6
X-MS-TrafficTypeDiagnostic: SN6PR03MB4496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4496C2E65BDA56AB3098E75ED6390@SN6PR03MB4496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1kQU1324TrhUNcyV2lZwxuXpWolhgUDjzukqvjQzDXvYTe251PM3KBTJ6C2/7IEVfWRlRJuzC5FN+7x7kF7mEl5qqqTUG2+AnLksfIgh3Hq0xSXcsfOTNvyPBeGCWXBCXmqNNVH1CHPg8eLRo9OoBz8DKbowtqrikNuNggTWnDir98+EfxY4GqNx0wMmifQ+jUkfq1uTmFzJVhHRGnyxBt/jGY8oflAd57H94hYF48hj+L9a0VYqtknNQymvGIKr8X8PHZUrQTHTy1yTlvdZsuqMmROOTFraetVgJ0tZZErsklJ+Ve+esGeGjoYd2zwu3sEwAyw42SNTcdK73l0aj+Av6V19Srf0lYcdZBWOs40Q5MnHyemLnpSMpKF81vDBTipo9l8iJv7Wv4Fm+DsvnH8LTmpKBrsRFSFbizMoUng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(346002)(136003)(376002)(2616005)(956004)(66556008)(44832011)(26005)(6512007)(83380400001)(16526019)(186003)(8676002)(8936002)(6506007)(52116002)(1076003)(478600001)(66476007)(54906003)(86362001)(5660300002)(66946007)(2906002)(6486002)(316002)(107886003)(6666004)(4326008)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PRHo93gtSdzSb2iPY96H37PNTyQ/+5C6n5Cl/k3Wa2iTaN4vfXHNy4PLxd8BXSL5Iit6jbbP2yVRVY20MWdWkjIAhCY6HOrCCJTGq8d+RZMCpXfnpDqoRVxfP7ph2DA9zLeSe1bhibF42sAT/meD7zo/OHxdNGX15xu8t8RccRgGKCu4cjrgjnfmes/8tFEJx6vChZgNnokQ46Po9mFjP7+s91tztWtTA9LDbV26jINzbwLNQdFJhr08OoMO1iTPkAwDEarStqOT8JoCrlFhU68TddSoJUVJY7hGtzFdjET3EaNOteyY12vGjECgiSYbVqKvOkPg0SHCCjRIofhQk5r+eukH2HzdLBe2EpiCXk4kVbL5kV/wTuNkU/WdsO5NK0loBZal3BkQ/exy3VCs8gzpEflTRWyudtD7gldPUIlS8w1HqylomCJiFvX8AJdQbfRDsZewzjvTFdKwRtW5j3ngX3on9njUHdFwzV8y9Kr87qR95JR+D2pSoBSut6/SLT8504i4puOnMDyqBZhCd1Xl6ZL3IyYbWp/8frrRJR030HsJHjoaxIsS5dV1uDp/FUSWdGEppz2DX5KYcY/aek0KeIC128LLN2TlngcWUeLl5hABDscTZJ4YFi1g8uGaDlI9fcHCaSQ39d1BILz9hA==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752889c2-ceba-411e-171a-08d8606ef3f6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 09:48:13.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2XKmGvwo5CCafqElpDrh5dSLSO+FD94K2zbaRqieOm3JI2xDF/VME0VXN9DKLL/VQ2mO2NPThEaBxzdglpRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4496
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

f30_data in rmi_device_platform_data could be also referenced by RMI
function 3A, so rename it and the structure name to avoid confusion.

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
---
 drivers/input/mouse/synaptics.c |  2 +-
 drivers/input/rmi4/rmi_f30.c    | 14 +++++++-------
 include/linux/rmi.h             | 11 ++++++-----
 3 files changed, 14 insertions(+), 13 deletions(-)

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

