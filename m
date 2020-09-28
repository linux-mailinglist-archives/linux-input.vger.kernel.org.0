Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A4827A6E9
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 07:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgI1FWb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 01:22:31 -0400
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com ([40.107.223.86]:8416
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbgI1FWb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 01:22:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAte4WigDqSLgqEgMuF1MPIRnZ2pbyUXQT4tYyJt4nIf709KWZt69yJcDp7+uLaIAAIQ3eW36KMpz6TMoXc8jzTIm5N2SHYdlLOSODDi5/yP3slWwEHQkq0QA2oxl0jOIOSr6yj02ekPyGxLS6fQaNdHlpGfnUOxO4Ra/Ah13TPcwhHdpF5J0V0EsFoUvWfO9pmqWeqcxDQEU5zFS6OOCpQ+BRJ4EZ4lSXAMfCAJ9mH5zKobGw+ifqqYBnCfZOnijjyCHuebFhkymJ3nj9jVh4itrsDdkBD32WGRV7X+3UXr80SW8EVVfI+OxoIo5mWX+5wUKvz/2+ZFL2CvZJmF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePER55FLiZrnulF7fhq59+TXiHkv7QXaXJs7peuIQdU=;
 b=gwKzREPOz4VCuP4Qu+tnJdRS3pEsZH6nka+QC2QjugAAk4uH2oQM7puW/nZnkYkoywsRYjLH+mk5c57M230xjnnpUv20BN8b4uoytjncs8xX+vZjnzXlaOoXldzKB7y7FUfLG9nEu4/3B/zlIwlsgiEmUhZIDdpqPYS3lHpwhXLL+O2ninm/hxoPrD5Yy4G34OLVxGzwneA2tZa7nv1LIr3o+P8zowW2whLMj35i9YsEFo4+VGrsXlLn/4QH9RqGS3ueFCS4LFTK1Feloz46dHlXUUJ/oK85U7VDiAbcMX80OzH4hfcVo51Cp0RwegJDQMpKnLU/U5Oe8DzVkysT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePER55FLiZrnulF7fhq59+TXiHkv7QXaXJs7peuIQdU=;
 b=TghkwbpQTJzcJeAjnj1utPGY7fAnMnHjeYaPZ9ZlWckNYgvyTEbe6QnaZeSMldskDqErswdDJZnYSaEx45n4T9eVy6DhY1iNjClx6KNP1oheI92ezinCJCuTHoFPaHarnd0JZOvMwSOdbgJMGosRwFFBgjcRprkhKNja4lm146Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB3757.namprd03.prod.outlook.com (2603:10b6:805:6c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 05:22:28 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 05:22:28 +0000
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
Subject: [PATCH v2 1/2] Input: synaptics-rmi4 - rename f30_data to gpio_data
Date:   Mon, 28 Sep 2020 13:20:07 +0800
Message-Id: <20200928052008.279274-2-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
References: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0218.apcprd02.prod.outlook.com (2603:1096:201:20::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 05:22:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c3e0b6-b7d1-4fd3-9015-08d8636e7dd4
X-MS-TrafficTypeDiagnostic: SN6PR03MB3757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3757079918D04EDB5317B115D6350@SN6PR03MB3757.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMrd14zhobwRDrTR2fUJ2z5V5jm7QypxVrMRBcM3J09Aq64K271Ovg99aZpxqjFWfafxhkC+LOtEBYEN6VPXPKbOQGZRScUkwqeB3M/tZPAifZyq6et2sRXgTdL3eLjOPjG0Kb9DCWIARz8NfHM1yy+KgfWgCMgFjjDFvulRy4FsAh83yyIaKZ6nFmu7AcfHUok5ezs0NP09Zh5MdGgblF6uUPHBOueNHayxxD8AMLN0yWz62fyyRW68UUTrsJlusOJtZBmrC2W6cOXnIYNZrzR1TurnUHMLakWZBtbLhwhnIkAhrlNMQwL4v19MKWS2ELfO1FELMH43tMxn5B7mAsZLi8E0aYFRCzlijy3j7yOn2gMM+gpqhNuI6uAxzR75hRueceEKY1ibZENuXbYoZdvJDOp8kzU//vlnFXMnp24=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16526019)(54906003)(186003)(2616005)(956004)(6666004)(8936002)(6506007)(52116002)(498600001)(66946007)(6486002)(1076003)(5660300002)(26005)(4326008)(107886003)(6512007)(8676002)(2906002)(86362001)(83380400001)(44832011)(66476007)(66556008)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /IPyybESYae8FVpFAAAwWI7iPMcnlrWuxmERZnzF2nWovb/P+Az4EVJYVdJsXp/+41xksngbB09Hec9/jgc2ek9/Ay4HSru429N1T1mtpfSxlahIVDHEIIPsPcRvZECEajPMKbJkFViQnMjeiWoYTRnqUBbHdKUVwB0uG9t97Y3jUzLGRqqJ9Pipp9RliYiV2uX2wP8ShaowLjZ5SA2STWx11z8s34eYqiEGTxpvfRGU5zwZUHi7zOEI16sNx5GI7Kb8Wg/WW+ALsnWXYuLwwvwesB/ab1GN8FQa9toSCsSTVKdDfbA/awi/l9d6DrtYi70lmmr0zLQP0+zf6RNajN2PA2QjH6ArWofOw7OofBPURaZQ5sm8FAtuFE6BHTM2PwChi92mvTf13K9RI8Ax8gTPYlm34QsWnVQXFoR9GwuOX0P5dzAw2DcGxBdSY1Rk7FF7SobfPz7xIt1MsxbxYxMHBZv0owNw8aW89o8xYc9Gdk/0gOpN3RJrJlJqMamalLEkYOXLuQH30zv6tlHOy29njNq4VrTI4f/7/C2r698xJRc/ZY7ZWHynROSzzvXYXPVzx2BwA7cMGZvvns+ZEnqFoLi3p7+dHzkcqhf3RYLZMyBfSpi0k9ZlaESU5MuQSYRQ4xO/yzqL0GD4A35IOQ==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c3e0b6-b7d1-4fd3-9015-08d8636e7dd4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 05:22:28.4538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJ01LJ7ls9Sbu9j+k1ivxiT7b0DwlS30fWicnCUf1yVuBLI1HIf/9ps38x6co3iG4d/xf/8f0uS2HxyX54z//g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3757
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

