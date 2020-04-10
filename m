Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402721A3D55
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 02:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgDJA2h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 20:28:37 -0400
Received: from mail-eopbgr1410044.outbound.protection.outlook.com ([40.107.141.44]:37421
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726867AbgDJA2g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 20:28:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCt7eXxgEbbui/naYaxGKf3+X1ZJu+C6BaFGN29sHTh2lFys7VBTeey6Um66tqETog+oA3KVbLF0kNtPtH8V12JxywZxCOBeXF2ll3Ppa1g1KkH6XwpVfxR5Fs4Zf8Tt8kLDMtvquySpH3BnFScrhYxUmXgkILgQNsf/rbHo4OWNyXn7+TjlGw7ZUiHHRnyPLzHrNWixPcInHNdXQXmSJDRtG23pGpDW71fsBM5ejtudF6hOJCcjDnPaPKcKsrdxSnS5TK0uQPv3g0gM3AViAAfsnofAciEHrRn/jfWZVlnmcg5INTjz3AJ0zan2Pk/wnVbWGlZAQDZ5Rj0XYv10pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9H49XI+IwJumcWWYXHU4bEqcboE8MU9Bt97tVRYmQ8=;
 b=BqjNz7wQICaDE8l4OK1QSSn9mzjNHXwUSRFdtP4D9sylX6TS+Ts+HMFrQN7ODnw/5dULYZ4JcOUIXLHaxzuZBWUWCaoK8cPKuQJpzbwn5Mu1inyAZOzduaPwpvSv+Z7lZSape/CTkKDc1fO8O3GlQIZ5j8KrHy0LOSEOjLofT6qF+zDOdrj0FsIRDpaWJNoMnhYqjDD9ihskg2Tff3hj6h4aKCT2LVJik3XWa+YaWnV077ix6hse41+w2cb9TSwVR83Yyc1jQ5y4E2/tcc2mORKgeif/wtqL967mX7UTwiwa91uKBLcacQC4uL/fB0zdnKr6wk7Lgm3igWwV2aG/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alpsalpine.com; dmarc=pass action=none
 header.from=alpsalpine.com; dkim=pass header.d=alpsalpine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9H49XI+IwJumcWWYXHU4bEqcboE8MU9Bt97tVRYmQ8=;
 b=nVkI5J8vmNOJIZhkC3eh32NLsun82kKP0DTlqshSyEiS5GPane374dbrMy28H6tiqg+IdKIQAnW5RcY9ES7GuRRlrfDubZgCrVeujVVhqWR2HWun/fbSYyg5I/+GGZ4jUeavYQHiQJyx3MbF2XhI5gAiK93tMxQfmAsb0tXCIE0=
Received: from TYAPR01MB3871.jpnprd01.prod.outlook.com (20.178.136.214) by
 TYAPR01MB3344.jpnprd01.prod.outlook.com (20.178.140.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.20; Fri, 10 Apr 2020 00:28:33 +0000
Received: from TYAPR01MB3871.jpnprd01.prod.outlook.com
 ([fe80::1dd1:dda9:f760:4bdd]) by TYAPR01MB3871.jpnprd01.prod.outlook.com
 ([fe80::1dd1:dda9:f760:4bdd%6]) with mapi id 15.20.2878.022; Fri, 10 Apr 2020
 00:28:33 +0000
From:   Masaki Ota <masaki.ota@alpsalpine.com>
To:     Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        Artem Borisov <dedsa2002@gmail.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Topic: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Index: AQHWDr0x2NbbGmh+BEarMrC/TfssrKhxZ8AAgAAQo0A=
Date:   Fri, 10 Apr 2020 00:28:32 +0000
Message-ID: <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com>
In-Reply-To: <20200409230009.22551-1-dedsa2002@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=masaki.ota@alpsalpine.com; 
x-originating-ip: [106.184.109.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0afb6f13-b7ed-4ff2-169d-08d7dce619d2
x-ms-traffictypediagnostic: TYAPR01MB3344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3344A862D0C4D90ADEFC278FECDE0@TYAPR01MB3344.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB3871.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(6506007)(52536014)(5660300002)(85182001)(4326008)(33656002)(478600001)(2906002)(316002)(110136005)(54906003)(66476007)(81166007)(66946007)(186003)(9686003)(7696005)(66556008)(8676002)(86362001)(26005)(66446008)(71200400001)(55016002)(76116006)(64756008)(81156014)(8936002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: alpsalpine.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUx6z/qDawGBjvdx/KF+rBIryO+J+kfqe25D0KXrxdBNleGI6VyRB9WHLSPb+xlmjeH2GNUr1os25ScR2TJjnrpkhxCyrv37N8fOSUwdqPzrv9PdNxbFqs5n7ip7T9odd7NO9BBtz8fOExhDHKcvA5HQxGigHjX841XGbdrhlzRReODvV6KX2jsrz0kZQ7dl5Rhx7JY4hR0vZK+LfHM+SUCbh6led4J3KkXVDxnlasvJRjYA9vN3jNxo8RpBfGYsfnF/ygpriQdiRICw9PxCqXEpCbua0IiAiOSE5oDgiKy92h83wWyzG5mgWiofZl2k6PmPvaHO3owETOtp93SkmPFhQoo+c2pSKC4KpCVrYbNvnIAWyAzKigOKN9gI2F48QHFfKYEh/eBDKIhHe32pFiHSTuYvjOmz02xT7EgI6VoR3+MVy1y5XE0T05SN4BY0
x-ms-exchange-antispam-messagedata: 3RdihPrND1GL0/EPe38vMJ/5yK+0Q8XK8r/rdwIABKIdXRA2Ks3enfVo7J9HWB4Pqbb3T9KamxPB4csrzTCvoeykNf3yhOom5StoMGDuM6yNaFLdsscv9ISpfCm5o6mlVa11B2afnjKqAc5yIrdSMA==
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: alpsalpine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afb6f13-b7ed-4ff2-169d-08d7dce619d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 00:28:32.8882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGOibNxgCr+vsihLHG0XDvi3BC0LcBdX97xwgFiIOuLDisXHTl2KmwxgfcEiXWLQ+XYS1buVm0wO8hvHbJAJEGfSE+AggkdnD0busBlDm3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3344
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Cao-san,

Do you know AUI1657 device? This device looks U1.
I think recent all U1 devices work as PTP.
Linux also supports PTP, so I think we should add something ID to Linux sou=
rce code. (I remember a something flag is already exist.)

Best Regards,
Masaki Ota
-----Original Message-----
From: Artem Borisov <dedsa2002@gmail.com>=20
Sent: Friday, April 10, 2020 8:00 AM
Cc: jikos@kernel.org; =1B$BB@ED=1B(B =1B$B??4n=1B(B Masaki Ota <masaki.ota@=
alpsalpine.com>; Artem Borisov <dedsa2002@gmail.com>; Benjamin Tissoires <b=
enjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.org>; linux-=
input@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: alps: Refactor axis resolution logic

AUI1657 doesn't follow the same logic for resolution calculation, since the=
 resulting values are incorrect. Instead, it reports the actual resolution =
values in place of the pitch ones.
While we're at it, also refactor the whole resolution logic to make it more=
 generic and sensible for multiple device support.

There are two main logical problems with the current code:
1. active_len_mm values are only used for resolution calculation on U1, yet=
 are exposed globally as part of alps_dev structure.
2. The resolution calculation process happens in alps_input_configured, whi=
le everything else is calculated in u1_init function.

These problems become more apparent when we try to support a device that do=
esn't follow the same resolution calculation logic as U1.
Since alps_input_configured is a device-agnostic function, we should avoid =
doing any measurements there and handle them in device-specific init functi=
ons like u1/T4_init instead.

To eliminate these problems we add global x_res and y_res values and popula=
te them on a device-specific basis in the according init functions.

Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
---
 drivers/hid/hid-alps.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c index c2a2bd52=
8890..494c08cca645 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -83,8 +83,8 @@ enum dev_num {
  * @max_fingers: total number of fingers
  * @has_sp: boolean of sp existense
  * @sp_btn_info: button information
- * @x_active_len_mm: active area length of X (mm)
- * @y_active_len_mm: active area length of Y (mm)
+ * @x_res: resolution of X
+ * @y_res: resolution of Y
  * @x_max: maximum x coordinate value
  * @y_max: maximum y coordinate value
  * @x_min: minimum x coordinate value
@@ -100,9 +100,10 @@ struct alps_dev {
 	enum dev_num dev_type;
 	u8  max_fingers;
 	u8  has_sp;
+	u8  no_pitch;
 	u8	sp_btn_info;
-	u32	x_active_len_mm;
-	u32	y_active_len_mm;
+	u32	x_res;
+	u32	y_res;
 	u32	x_max;
 	u32	y_max;
 	u32	x_min;
@@ -550,10 +551,6 @@ static int u1_init(struct hid_device *hdev, struct alp=
s_dev *pri_data)
 		dev_err(&hdev->dev, "failed U1_RESO_DWN_ABS (%d)\n", ret);
 		goto exit;
 	}
-	pri_data->x_active_len_mm =3D
-		(pitch_x * (sen_line_num_x - 1)) / 10;
-	pri_data->y_active_len_mm =3D
-		(pitch_y * (sen_line_num_y - 1)) / 10;
=20
 	pri_data->x_max =3D
 		(resolution << 2) * (sen_line_num_x - 1); @@ -562,6 +559,18 @@ static in=
t u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
 		(resolution << 2) * (sen_line_num_y - 1);
 	pri_data->y_min =3D 1;
=20
+	if (pri_data->no_pitch) {
+		pri_data->x_res =3D pitch_x;
+		pri_data->y_res =3D pitch_y;
+	} else {
+		pri_data->x_res =3D
+			(pri_data->x_max - 1) /
+			((pitch_x * (sen_line_num_x - 1)) / 10);
+		pri_data->y_res =3D
+			(pri_data->y_max - 1) /
+			((pitch_y * (sen_line_num_y - 1)) / 10);
+	}
+
 	ret =3D u1_read_write_register(hdev, ADDRESS_U1_PAD_BTN,
 			&tmp, 0, true);
 	if (ret < 0) {
@@ -622,7 +631,7 @@ static int T4_init(struct hid_device *hdev, struct alps=
_dev *pri_data)
 	pri_data->x_min =3D T4_COUNT_PER_ELECTRODE;
 	pri_data->y_max =3D sen_line_num_y * T4_COUNT_PER_ELECTRODE;
 	pri_data->y_min =3D T4_COUNT_PER_ELECTRODE;
-	pri_data->x_active_len_mm =3D pri_data->y_active_len_mm =3D 0;
+	pri_data->x_res =3D pri_data->y_res =3D 0;
 	pri_data->btn_cnt =3D 1;
=20
 	ret =3D t4_read_write_register(hdev, PRM_SYS_CONFIG_1, &tmp, 0, true); @@=
 -675,7 +684,7 @@ static int alps_input_configured(struct hid_device *hdev,=
 struct hid_input *hi)
 	struct alps_dev *data =3D hid_get_drvdata(hdev);
 	struct input_dev *input =3D hi->input, *input2;
 	int ret;
-	int res_x, res_y, i;
+	int i;
=20
 	data->input =3D input;
=20
@@ -706,12 +715,9 @@ static int alps_input_configured(struct hid_device *hd=
ev, struct hid_input *hi)
 	input_set_abs_params(input, ABS_MT_POSITION_Y,
 						data->y_min, data->y_max, 0, 0);
=20
-	if (data->x_active_len_mm && data->y_active_len_mm) {
-		res_x =3D (data->x_max - 1) / data->x_active_len_mm;
-		res_y =3D (data->y_max - 1) / data->y_active_len_mm;
-
-		input_abs_set_res(input, ABS_MT_POSITION_X, res_x);
-		input_abs_set_res(input, ABS_MT_POSITION_Y, res_y);
+	if (data->x_res && data->y_res) {
+		input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
+		input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
 	}
=20
 	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 64, 0, 0); @@ -802,8 +808=
,11 @@ static int alps_probe(struct hid_device *hdev, const struct hid_devi=
ce_id *id)
 		break;
 	case HID_DEVICE_ID_ALPS_U1_DUAL:
 	case HID_DEVICE_ID_ALPS_U1:
+		data->dev_type =3D U1;
+		break;
 	case HID_DEVICE_ID_ALPS_1657:
 		data->dev_type =3D U1;
+		data->no_pitch =3D 1;
 		break;
 	default:
 		data->dev_type =3D UNKNOWN;
--
2.26.0

