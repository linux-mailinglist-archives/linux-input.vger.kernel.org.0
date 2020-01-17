Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 365C6140208
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 03:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733207AbgAQCgY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jan 2020 21:36:24 -0500
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:12224
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729108AbgAQCgY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jan 2020 21:36:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n63/CeLNYRa8+g4dGhBQZrdZeMO52OUSRaomPxakvhfxpgW2ck80SarPuQehv8m6qf1+mqudohNjM0Wy//ygFmhXjI+PmHE2l1X+a5RPLfB93j/Ed7PnqnHkYhmxgnRrSE3ZgPJhmIJujJvmcqR1Bfm1u3dPW1+/X6AuD4IubPqy8mfuhXhMKw7XeqCEJzcCkprlgJvZr167DVcDU/pvxp7jC3NieOXCA/iDsM2CfpCvAa69zk2GmH+U1zs6bRVUq2CUf2b4VBuvmXYd520Q5l3CKEmWxAhVuFQzmraFgnI6gGVRYyyb838QSLOV0d9nZhUJGc8HPTVIpVygJSWYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vu2VeGmy88dFacxjGHsPRaJrWTbQ/ynUyNjBvCuWK0=;
 b=FIa0YYTlzgqTcWRYbEOyh6ZPWBSbvgNAoJoA+C279Q+hYg8XhMhSPyzVOD1w3mbspurtwADKDdWNKZ/bmZ8wD5prn/GNLwXk3hPgmQU16gjz+ZbFuf5uQsI6gupfScwUPkS+jlXphXCg2UhGqHC2gWzg0nAk0W8fdBevih2SFJm79jVqE71+RGGZWtfIeCVvqrMK5KYnGPvrHmS+z9hpzw5C4AzkiGACoGtph24/N+0DgTNbiv6SHLUaR3mxAeTN3mxGkBkfL8biGJinrbmXKGjgFBhXYh19wvVJ9bCrcN3dMiTkSvtcIfEXp9xKnACVsfc13Dyotk0/0W1DAI/bUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vu2VeGmy88dFacxjGHsPRaJrWTbQ/ynUyNjBvCuWK0=;
 b=tz3idkIeaMAnJRTLNWaJxH1i/JcQAxBcJiijQk/4j9iIbFsT7hWwqB6smL9Hvph5HvaFPmcd7AMtGn413Ta+OMl7briQW246R0D9RJvlVGz9RsafoiskfMJwQMnTrBDWCA0Wtc/OW0kaG+ObtyitXakRiJBSEPwuT9u+ggpK2dc=
Received: from SN6PR08MB5053.namprd08.prod.outlook.com (52.135.107.153) by
 SN6PR08MB4671.namprd08.prod.outlook.com (52.135.117.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Fri, 17 Jan 2020 02:36:19 +0000
Received: from SN6PR08MB5053.namprd08.prod.outlook.com
 ([fe80::7c80:2b62:5d9a:2139]) by SN6PR08MB5053.namprd08.prod.outlook.com
 ([fe80::7c80:2b62:5d9a:2139%4]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 02:36:19 +0000
Received: from localhost.localdomain (136.49.227.119) by SN6PR05CA0010.namprd05.prod.outlook.com (2603:10b6:805:de::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.6 via Frontend Transport; Fri, 17 Jan 2020 02:36:08 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "knaack.h@gmx.de" <knaack.h@gmx.de>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v4 6/7] iio: light: Add support for Azoteq IQS621/622 ambient
 light sensors
Thread-Topic: [PATCH v4 6/7] iio: light: Add support for Azoteq IQS621/622
 ambient light sensors
Thread-Index: AQHVzN7mVig07aiMckK/cM4rYiBJ5Q==
Date:   Fri, 17 Jan 2020 02:36:19 +0000
Message-ID: <1579228475-6681-7-git-send-email-jeff@labundy.com>
References: <1579228475-6681-1-git-send-email-jeff@labundy.com>
In-Reply-To: <1579228475-6681-1-git-send-email-jeff@labundy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:805:de::23) To SN6PR08MB5053.namprd08.prod.outlook.com
 (2603:10b6:805:78::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jeff@labundy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [136.49.227.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10ed8b89-a684-498d-2c8b-08d79af60867
x-ms-traffictypediagnostic: SN6PR08MB4671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR08MB4671485341CD27B52589DC22D3310@SN6PR08MB4671.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(34096005)(396003)(136003)(376002)(346002)(366004)(39830400003)(189003)(199004)(64756008)(66946007)(66556008)(66476007)(107886003)(4326008)(69590400006)(2616005)(186003)(956004)(52116002)(66446008)(6506007)(71200400001)(5660300002)(30864003)(6666004)(16526019)(36756003)(6512007)(7416002)(54906003)(316002)(26005)(508600001)(81166006)(8676002)(6486002)(110136005)(86362001)(2906002)(8936002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR08MB4671;H:SN6PR08MB5053.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: labundy.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dqznqJJ7BteSoMgzt7Ck2wa956LklWHQeW1anbGflF/zEH4WfYIafWeGbonHmxIBjuP2RnYBUsvsQM/UjniVEhGHIMJkzV6+wUOXajGIyGOMlyItoAiXndZXTUGPmvQ99LmUWCnQ45mmdb+ATa4sqvSnhuOD0i31I07CWA6Bv4l6sedovLj6b++0YBUp0fFNVEjZdkXGsUr/w+6XoHDluD2OtWOgciyk/cZy0p3cBXOdiHiGjDeuWn1CgHTFFCSHuu8WtPrhZ5HbkT6L7e/szIPGzW3DFhK+RyWZYY1RwG64coGYOS62Qx9W7pcXKRtsLao4ziOQrrC27dgIs00wD3MkyZoLiBzPfFC2OxXfRapWEcPNQE3M9V4WG9bqk5p0ME7vtImJh8eBoqhXsxLb3a678zX/RIQr//XuCuxkh+L0mTjiQAq1k+ObhniEcJj4Wp+W0isiQEUFTT7mMuTjmIfsqVDBeLYJ9vStR4UvtgHNBa9toYhmWPT+Cl8Ynnx8
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ed8b89-a684-498d-2c8b-08d79af60867
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 02:36:19.7401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szihPnqdkOQT9oplbH7cJpk2wbFMdoTrr9lpAOcIcAeANJRKgY0bt26VOZMmlminTJY63b3TFNssrv88SZmL8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4671
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Azoteq IQS621 and IQS622 ambient light
sensors, both of which can report a four-bit representation of ambient
light intensity.

The IQS621 can additionally report illuminace directly in units of lux,
while the IQS622 can report a four-bit representation of infrared light
intensity. Furthermore, the IQS622 can report a unitless measurement of
a target's proximity to the device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes in v4:
  - None

Changes in v3:
  - Added Reviewed-by trailer

Changes in v2:
  - Merged 'Copyright' and 'Author' lines into one in introductory comments
  - Replaced 'error' with 'ret' throughout
  - Merged support for the closely related IQS622 (formerly represented by
    a separate iio/proximity driver)
  - Added support for unitless ambient light intensity (IQS621 and IQS622)
    and infrared light intensity (IQS622 only)
  - Moved the read of IQS621_ALS_FLAGS to iqs621_als_write_event_config to
    account for the fact that IQS621_ALS_FLAGS may have changed in between
    having first been read in iqs621_als_init and the time at which events
    are enabled, thereby eliminating the need to call iqs621_als_init from
    iqs621_als_probe
  - Refactored the logic in iqs621_als_notifier and added a lock to safely
    evaluate variables that may change in response to user action
  - Added locks to iqs621_als_read_event_config/value to account for cases =
in
    which the corresponding hardware state is in the process of being updat=
ed
  - Refactored the logic in iqs621_als_read/write_event_value and removed a=
ll
    #defines that could instead be represented by simple math
  - Based the decision whether to select the IQS622 IR touch vs. proximity
    threshold on the single proximity threshold written by user space, and
    added a comment to describe the difference between either threshold
  - Replaced IIO_CHAN_INFO_RAW with IIO_CHAN_INFO_PROCESSED for the IIO_LIG=
HT
    channel (IQS621 only)
  - Removed devm_add_action_or_reset failure message
  - Eliminated tabbed alignment of platform_driver struct members
  - Changed Kconfig "depends on" logic to MFD_IQS62X || COMPILE_TEST

 drivers/iio/light/Kconfig      |  10 +
 drivers/iio/light/Makefile     |   1 +
 drivers/iio/light/iqs621-als.c | 614 +++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 625 insertions(+)
 create mode 100644 drivers/iio/light/iqs621-als.c

diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 9968f98..baf7958b 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -173,6 +173,16 @@ config GP2AP020A00F
 	  To compile this driver as a module, choose M here: the
 	  module will be called gp2ap020a00f.

+config IQS621_ALS
+	tristate "Azoteq IQS621/622 ambient light sensors"
+	depends on MFD_IQS62X || COMPILE_TEST
+	help
+	  Say Y here if you want to build support for the Azoteq IQS621
+	  and IQS622 ambient light sensors.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called iqs621-als.
+
 config SENSORS_ISL29018
 	tristate "Intersil 29018 light and proximity sensor"
 	depends on I2C
diff --git a/drivers/iio/light/Makefile b/drivers/iio/light/Makefile
index c98d1ce..988e8f4 100644
--- a/drivers/iio/light/Makefile
+++ b/drivers/iio/light/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_IIO_CROS_EC_LIGHT_PROX) +=3D cros_ec_light_p=
rox.o
 obj-$(CONFIG_GP2AP020A00F)	+=3D gp2ap020a00f.o
 obj-$(CONFIG_HID_SENSOR_ALS)	+=3D hid-sensor-als.o
 obj-$(CONFIG_HID_SENSOR_PROX)	+=3D hid-sensor-prox.o
+obj-$(CONFIG_IQS621_ALS)	+=3D iqs621-als.o
 obj-$(CONFIG_SENSORS_ISL29018)	+=3D isl29018.o
 obj-$(CONFIG_SENSORS_ISL29028)	+=3D isl29028.o
 obj-$(CONFIG_ISL29125)		+=3D isl29125.o
diff --git a/drivers/iio/light/iqs621-als.c b/drivers/iio/light/iqs621-als.=
c
new file mode 100644
index 0000000..a4dd718
--- /dev/null
+++ b/drivers/iio/light/iqs621-als.c
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Azoteq IQS621/622 Ambient Light Sensors
+ *
+ * Copyright (C) 2019 Jeff LaBundy <jeff@labundy.com>
+ */
+
+#include <linux/device.h>
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/kernel.h>
+#include <linux/mfd/iqs62x.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define IQS621_ALS_FLAGS_LIGHT			BIT(7)
+#define IQS621_ALS_FLAGS_RANGE			GENMASK(3, 0)
+
+#define IQS621_ALS_UI_OUT			0x17
+
+#define IQS621_ALS_THRESH_DARK			0x80
+#define IQS621_ALS_THRESH_LIGHT			0x81
+
+#define IQS622_IR_RANGE				0x15
+#define IQS622_IR_FLAGS				0x16
+#define IQS622_IR_FLAGS_TOUCH			BIT(1)
+#define IQS622_IR_FLAGS_PROX			BIT(0)
+
+#define IQS622_IR_UI_OUT			0x17
+
+#define IQS622_IR_THRESH_PROX			0x91
+#define IQS622_IR_THRESH_TOUCH			0x92
+
+struct iqs621_als_private {
+	struct iqs62x_core *iqs62x;
+	struct notifier_block notifier;
+	struct mutex lock;
+	bool light_en;
+	bool range_en;
+	bool prox_en;
+	u8 als_flags;
+	u8 ir_flags_mask;
+	u8 ir_flags;
+	u8 thresh_light;
+	u8 thresh_dark;
+	u8 thresh_prox;
+};
+
+static int iqs621_als_init(struct iqs621_als_private *iqs621_als)
+{
+	struct iqs62x_core *iqs62x =3D iqs621_als->iqs62x;
+	unsigned int event_mask =3D 0;
+	int ret;
+
+	switch (iqs621_als->ir_flags_mask) {
+	case IQS622_IR_FLAGS_TOUCH:
+		ret =3D regmap_write(iqs62x->map, IQS622_IR_THRESH_TOUCH,
+				   iqs621_als->thresh_prox);
+		break;
+
+	case IQS622_IR_FLAGS_PROX:
+		ret =3D regmap_write(iqs62x->map, IQS622_IR_THRESH_PROX,
+				   iqs621_als->thresh_prox);
+		break;
+
+	default:
+		ret =3D regmap_write(iqs62x->map, IQS621_ALS_THRESH_LIGHT,
+				   iqs621_als->thresh_light);
+		if (ret)
+			return ret;
+
+		ret =3D regmap_write(iqs62x->map, IQS621_ALS_THRESH_DARK,
+				   iqs621_als->thresh_dark);
+	}
+
+	if (ret)
+		return ret;
+
+	if (iqs621_als->light_en || iqs621_als->range_en)
+		event_mask |=3D iqs62x->dev_desc->als_mask;
+
+	if (iqs621_als->prox_en)
+		event_mask |=3D iqs62x->dev_desc->ir_mask;
+
+	return regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
+				  event_mask, 0);
+}
+
+static int iqs621_als_notifier(struct notifier_block *notifier,
+			       unsigned long event_flags, void *context)
+{
+	struct iqs62x_event_data *event_data =3D context;
+	struct iqs621_als_private *iqs621_als;
+	struct iio_dev *indio_dev;
+	bool light_new, light_old;
+	bool prox_new, prox_old;
+	u8 range_new, range_old;
+	s64 timestamp;
+	int ret;
+
+	iqs621_als =3D container_of(notifier, struct iqs621_als_private,
+				  notifier);
+	indio_dev =3D iio_priv_to_dev(iqs621_als);
+	timestamp =3D iio_get_time_ns(indio_dev);
+
+	mutex_lock(&iqs621_als->lock);
+
+	if (event_flags & BIT(IQS62X_EVENT_SYS_RESET)) {
+		ret =3D iqs621_als_init(iqs621_als);
+		if (ret) {
+			dev_err(indio_dev->dev.parent,
+				"Failed to re-initialize device: %d\n", ret);
+			ret =3D NOTIFY_BAD;
+		} else {
+			ret =3D NOTIFY_OK;
+		}
+
+		goto err_mutex;
+	}
+
+	if (!iqs621_als->light_en && !iqs621_als->range_en &&
+	    !iqs621_als->prox_en) {
+		ret =3D NOTIFY_DONE;
+		goto err_mutex;
+	}
+
+	/* IQS621 only */
+	light_new =3D event_data->als_flags & IQS621_ALS_FLAGS_LIGHT;
+	light_old =3D iqs621_als->als_flags & IQS621_ALS_FLAGS_LIGHT;
+
+	if (iqs621_als->light_en && light_new && !light_old)
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_LIGHT, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_RISING),
+			       timestamp);
+	else if (iqs621_als->light_en && !light_new && light_old)
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_LIGHT, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_FALLING),
+			       timestamp);
+
+	/* IQS621 and IQS622 */
+	range_new =3D event_data->als_flags & IQS621_ALS_FLAGS_RANGE;
+	range_old =3D iqs621_als->als_flags & IQS621_ALS_FLAGS_RANGE;
+
+	if (iqs621_als->range_en && (range_new > range_old))
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_INTENSITY, 0,
+						    IIO_EV_TYPE_CHANGE,
+						    IIO_EV_DIR_RISING),
+			       timestamp);
+	else if (iqs621_als->range_en && (range_new < range_old))
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_INTENSITY, 0,
+						    IIO_EV_TYPE_CHANGE,
+						    IIO_EV_DIR_FALLING),
+			       timestamp);
+
+	/* IQS622 only */
+	prox_new =3D event_data->ir_flags & iqs621_als->ir_flags_mask;
+	prox_old =3D iqs621_als->ir_flags & iqs621_als->ir_flags_mask;
+
+	if (iqs621_als->prox_en && prox_new && !prox_old)
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_RISING),
+			       timestamp);
+	else if (iqs621_als->prox_en && !prox_new && prox_old)
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_FALLING),
+			       timestamp);
+
+	iqs621_als->als_flags =3D event_data->als_flags;
+	iqs621_als->ir_flags =3D event_data->ir_flags;
+	ret =3D NOTIFY_OK;
+
+err_mutex:
+	mutex_unlock(&iqs621_als->lock);
+
+	return ret;
+}
+
+static void iqs621_als_notifier_unregister(void *context)
+{
+	struct iqs621_als_private *iqs621_als =3D context;
+	struct iio_dev *indio_dev =3D iio_priv_to_dev(iqs621_als);
+	int ret;
+
+	ret =3D blocking_notifier_chain_unregister(&iqs621_als->iqs62x->nh,
+						 &iqs621_als->notifier);
+	if (ret)
+		dev_err(indio_dev->dev.parent,
+			"Failed to unregister notifier: %d\n", ret);
+}
+
+static int iqs621_als_read_raw(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       int *val, int *val2, long mask)
+{
+	struct iqs621_als_private *iqs621_als =3D iio_priv(indio_dev);
+	struct iqs62x_core *iqs62x =3D iqs621_als->iqs62x;
+	int ret;
+	__le16 val_buf;
+
+	switch (chan->type) {
+	case IIO_INTENSITY:
+		ret =3D regmap_read(iqs62x->map, chan->address, val);
+		if (ret)
+			return ret;
+
+		*val &=3D IQS621_ALS_FLAGS_RANGE;
+		return IIO_VAL_INT;
+
+	case IIO_PROXIMITY:
+	case IIO_LIGHT:
+		ret =3D regmap_raw_read(iqs62x->map, chan->address, &val_buf,
+				      sizeof(val_buf));
+		if (ret)
+			return ret;
+
+		*val =3D le16_to_cpu(val_buf);
+		return IIO_VAL_INT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int iqs621_als_read_event_config(struct iio_dev *indio_dev,
+					const struct iio_chan_spec *chan,
+					enum iio_event_type type,
+					enum iio_event_direction dir)
+{
+	struct iqs621_als_private *iqs621_als =3D iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&iqs621_als->lock);
+
+	switch (chan->type) {
+	case IIO_LIGHT:
+		ret =3D iqs621_als->light_en;
+		break;
+
+	case IIO_INTENSITY:
+		ret =3D iqs621_als->range_en;
+		break;
+
+	case IIO_PROXIMITY:
+		ret =3D iqs621_als->prox_en;
+		break;
+
+	default:
+		ret =3D -EINVAL;
+	}
+
+	mutex_unlock(&iqs621_als->lock);
+
+	return ret;
+}
+
+static int iqs621_als_write_event_config(struct iio_dev *indio_dev,
+					 const struct iio_chan_spec *chan,
+					 enum iio_event_type type,
+					 enum iio_event_direction dir,
+					 int state)
+{
+	struct iqs621_als_private *iqs621_als =3D iio_priv(indio_dev);
+	struct iqs62x_core *iqs62x =3D iqs621_als->iqs62x;
+	unsigned int val;
+	int ret;
+
+	mutex_lock(&iqs621_als->lock);
+
+	ret =3D regmap_read(iqs62x->map, iqs62x->dev_desc->als_flags, &val);
+	if (ret)
+		goto err_mutex;
+	iqs621_als->als_flags =3D val;
+
+	switch (chan->type) {
+	case IIO_LIGHT:
+		ret =3D regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
+					 iqs62x->dev_desc->als_mask,
+					 iqs621_als->range_en | state ? 0 :
+									0xFF);
+		if (!ret)
+			iqs621_als->light_en =3D state;
+		break;
+
+	case IIO_INTENSITY:
+		ret =3D regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
+					 iqs62x->dev_desc->als_mask,
+					 iqs621_als->light_en | state ? 0 :
+									0xFF);
+		if (!ret)
+			iqs621_als->range_en =3D state;
+		break;
+
+	case IIO_PROXIMITY:
+		ret =3D regmap_read(iqs62x->map, IQS622_IR_FLAGS, &val);
+		if (ret)
+			goto err_mutex;
+		iqs621_als->ir_flags =3D val;
+
+		ret =3D regmap_update_bits(iqs62x->map, IQS620_GLBL_EVENT_MASK,
+					 iqs62x->dev_desc->ir_mask,
+					 state ? 0 : 0xFF);
+		if (!ret)
+			iqs621_als->prox_en =3D state;
+		break;
+
+	default:
+		ret =3D -EINVAL;
+	}
+
+err_mutex:
+	mutex_unlock(&iqs621_als->lock);
+
+	return ret;
+}
+
+static int iqs621_als_read_event_value(struct iio_dev *indio_dev,
+				       const struct iio_chan_spec *chan,
+				       enum iio_event_type type,
+				       enum iio_event_direction dir,
+				       enum iio_event_info info,
+				       int *val, int *val2)
+{
+	struct iqs621_als_private *iqs621_als =3D iio_priv(indio_dev);
+	int ret =3D IIO_VAL_INT;
+
+	mutex_lock(&iqs621_als->lock);
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		*val =3D iqs621_als->thresh_light * 16;
+		break;
+
+	case IIO_EV_DIR_FALLING:
+		*val =3D iqs621_als->thresh_dark * 4;
+		break;
+
+	case IIO_EV_DIR_EITHER:
+		if (iqs621_als->ir_flags_mask =3D=3D IQS622_IR_FLAGS_TOUCH)
+			*val =3D iqs621_als->thresh_prox * 4;
+		else
+			*val =3D iqs621_als->thresh_prox;
+		break;
+
+	default:
+		ret =3D -EINVAL;
+	}
+
+	mutex_unlock(&iqs621_als->lock);
+
+	return ret;
+}
+
+static int iqs621_als_write_event_value(struct iio_dev *indio_dev,
+					const struct iio_chan_spec *chan,
+					enum iio_event_type type,
+					enum iio_event_direction dir,
+					enum iio_event_info info,
+					int val, int val2)
+{
+	struct iqs621_als_private *iqs621_als =3D iio_priv(indio_dev);
+	struct iqs62x_core *iqs62x =3D iqs621_als->iqs62x;
+	unsigned int thresh_reg, thresh_val;
+	u8 ir_flags_mask, *thresh_cache;
+	int ret =3D -EINVAL;
+
+	mutex_lock(&iqs621_als->lock);
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		thresh_reg =3D IQS621_ALS_THRESH_LIGHT;
+		thresh_val =3D val / 16;
+
+		thresh_cache =3D &iqs621_als->thresh_light;
+		ir_flags_mask =3D 0;
+		break;
+
+	case IIO_EV_DIR_FALLING:
+		thresh_reg =3D IQS621_ALS_THRESH_DARK;
+		thresh_val =3D val / 4;
+
+		thresh_cache =3D &iqs621_als->thresh_dark;
+		ir_flags_mask =3D 0;
+		break;
+
+	case IIO_EV_DIR_EITHER:
+		/*
+		 * The IQS622 supports two detection thresholds, both measured
+		 * in the same arbitrary units reported by read_raw: proximity
+		 * (0 through 255 in steps of 1), and touch (0 through 1020 in
+		 * steps of 4).
+		 *
+		 * Based on the single detection threshold chosen by the user,
+		 * select the hardware threshold that gives the best trade-off
+		 * between range and resolution.
+		 *
+		 * By default, the close-range (but coarse) touch threshold is
+		 * chosen during probe.
+		 */
+		switch (val) {
+		case 0 ... 255:
+			thresh_reg =3D IQS622_IR_THRESH_PROX;
+			thresh_val =3D val;
+
+			ir_flags_mask =3D IQS622_IR_FLAGS_PROX;
+			break;
+
+		case 256 ... 1020:
+			thresh_reg =3D IQS622_IR_THRESH_TOUCH;
+			thresh_val =3D val / 4;
+
+			ir_flags_mask =3D IQS622_IR_FLAGS_TOUCH;
+			break;
+
+		default:
+			goto err_mutex;
+		}
+
+		thresh_cache =3D &iqs621_als->thresh_prox;
+		break;
+
+	default:
+		goto err_mutex;
+	}
+
+	if (thresh_val > 0xFF)
+		goto err_mutex;
+
+	ret =3D regmap_write(iqs62x->map, thresh_reg, thresh_val);
+	if (ret)
+		goto err_mutex;
+
+	*thresh_cache =3D thresh_val;
+	iqs621_als->ir_flags_mask =3D ir_flags_mask;
+
+err_mutex:
+	mutex_unlock(&iqs621_als->lock);
+
+	return ret;
+}
+
+static const struct iio_info iqs621_als_info =3D {
+	.read_raw =3D &iqs621_als_read_raw,
+	.read_event_config =3D iqs621_als_read_event_config,
+	.write_event_config =3D iqs621_als_write_event_config,
+	.read_event_value =3D iqs621_als_read_event_value,
+	.write_event_value =3D iqs621_als_write_event_value,
+};
+
+static const struct iio_event_spec iqs621_als_range_events[] =3D {
+	{
+		.type =3D IIO_EV_TYPE_CHANGE,
+		.dir =3D IIO_EV_DIR_EITHER,
+		.mask_separate =3D BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+static const struct iio_event_spec iqs621_als_light_events[] =3D {
+	{
+		.type =3D IIO_EV_TYPE_THRESH,
+		.dir =3D IIO_EV_DIR_EITHER,
+		.mask_separate =3D BIT(IIO_EV_INFO_ENABLE),
+	},
+	{
+		.type =3D IIO_EV_TYPE_THRESH,
+		.dir =3D IIO_EV_DIR_RISING,
+		.mask_separate =3D BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type =3D IIO_EV_TYPE_THRESH,
+		.dir =3D IIO_EV_DIR_FALLING,
+		.mask_separate =3D BIT(IIO_EV_INFO_VALUE),
+	},
+};
+
+static const struct iio_chan_spec iqs621_als_channels[] =3D {
+	{
+		.type =3D IIO_INTENSITY,
+		.address =3D IQS621_ALS_FLAGS,
+		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+		.event_spec =3D iqs621_als_range_events,
+		.num_event_specs =3D ARRAY_SIZE(iqs621_als_range_events),
+	},
+	{
+		.type =3D IIO_LIGHT,
+		.address =3D IQS621_ALS_UI_OUT,
+		.info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),
+		.event_spec =3D iqs621_als_light_events,
+		.num_event_specs =3D ARRAY_SIZE(iqs621_als_light_events),
+	},
+};
+
+static const struct iio_event_spec iqs622_als_prox_events[] =3D {
+	{
+		.type =3D IIO_EV_TYPE_THRESH,
+		.dir =3D IIO_EV_DIR_EITHER,
+		.mask_separate =3D BIT(IIO_EV_INFO_ENABLE) |
+				 BIT(IIO_EV_INFO_VALUE),
+	},
+};
+
+static const struct iio_chan_spec iqs622_als_channels[] =3D {
+	{
+		.type =3D IIO_INTENSITY,
+		.channel2 =3D IIO_MOD_LIGHT_BOTH,
+		.address =3D IQS622_ALS_FLAGS,
+		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+		.event_spec =3D iqs621_als_range_events,
+		.num_event_specs =3D ARRAY_SIZE(iqs621_als_range_events),
+		.modified =3D true,
+	},
+	{
+		.type =3D IIO_INTENSITY,
+		.channel2 =3D IIO_MOD_LIGHT_IR,
+		.address =3D IQS622_IR_RANGE,
+		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+		.modified =3D true,
+	},
+	{
+		.type =3D IIO_PROXIMITY,
+		.address =3D IQS622_IR_UI_OUT,
+		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+		.event_spec =3D iqs622_als_prox_events,
+		.num_event_specs =3D ARRAY_SIZE(iqs622_als_prox_events),
+	},
+};
+
+static int iqs621_als_probe(struct platform_device *pdev)
+{
+	struct iqs62x_core *iqs62x =3D dev_get_drvdata(pdev->dev.parent);
+	struct iqs621_als_private *iqs621_als;
+	struct iio_dev *indio_dev;
+	unsigned int val;
+	int ret;
+
+	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*iqs621_als));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	iqs621_als =3D iio_priv(indio_dev);
+	iqs621_als->iqs62x =3D iqs62x;
+
+	if (iqs62x->dev_desc->prod_num =3D=3D IQS622_PROD_NUM) {
+		ret =3D regmap_read(iqs62x->map, IQS622_IR_THRESH_TOUCH, &val);
+		if (ret)
+			return ret;
+		iqs621_als->thresh_prox =3D val;
+		iqs621_als->ir_flags_mask =3D IQS622_IR_FLAGS_TOUCH;
+
+		indio_dev->channels =3D iqs622_als_channels;
+		indio_dev->num_channels =3D ARRAY_SIZE(iqs622_als_channels);
+	} else {
+		ret =3D regmap_read(iqs62x->map, IQS621_ALS_THRESH_LIGHT, &val);
+		if (ret)
+			return ret;
+		iqs621_als->thresh_light =3D val;
+
+		ret =3D regmap_read(iqs62x->map, IQS621_ALS_THRESH_DARK, &val);
+		if (ret)
+			return ret;
+		iqs621_als->thresh_dark =3D val;
+
+		indio_dev->channels =3D iqs621_als_channels;
+		indio_dev->num_channels =3D ARRAY_SIZE(iqs621_als_channels);
+	}
+
+	indio_dev->modes =3D INDIO_DIRECT_MODE;
+	indio_dev->dev.parent =3D &pdev->dev;
+	indio_dev->name =3D iqs62x->dev_desc->dev_name;
+	indio_dev->info =3D &iqs621_als_info;
+
+	mutex_init(&iqs621_als->lock);
+
+	iqs621_als->notifier.notifier_call =3D iqs621_als_notifier;
+	ret =3D blocking_notifier_chain_register(&iqs621_als->iqs62x->nh,
+					       &iqs621_als->notifier);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D devm_add_action_or_reset(&pdev->dev,
+				       iqs621_als_notifier_unregister,
+				       iqs621_als);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(&pdev->dev, indio_dev);
+}
+
+static struct platform_driver iqs621_als_platform_driver =3D {
+	.driver =3D {
+		.name =3D IQS621_DRV_NAME_ALS,
+	},
+	.probe =3D iqs621_als_probe,
+};
+module_platform_driver(iqs621_als_platform_driver);
+
+MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
+MODULE_DESCRIPTION("Azoteq IQS621/622 Ambient Light Sensors");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" IQS621_DRV_NAME_ALS);
--
2.7.4

