Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72237E3417
	for <lists+linux-input@lfdr.de>; Tue,  7 Nov 2023 04:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjKGDQa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 22:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjKGDQ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 22:16:28 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2075.outbound.protection.outlook.com [40.92.18.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4F7EA
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 19:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1wMPl/l+3gOMix17Y5aXUDgAyrhuUP8aImFFreTf3aWOF3u3SDuVJigCqv8EboTFGzIrb6IK+MweHY0r0lIx8hXLYxOmwDzGkIXKU1OtH2oFb4VufSX0P7i8TdCy2qwRBafX8WhnAJBgEgJyvKO750/zi49Iuivc0HUdjC6e+aYsoB/tXaJ0JJhXPRtyypK7KElnr13IJf3+nqLl7qwaODYWotVNq9I3rzQV8fftiahYE0Cya3GVx+An5ayEvnIbp2iRyrM037Nm13xp8oKxo34CAEh3DkBTupYDKRDSWRC0nGPmW1M/gxmDEgCf0PABhXF7UsNqSQ0qf84jZZ2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfC5uY+1MIek7nf5Ht67Fp+pd1fEn9oKz9TsiNzSEe8=;
 b=khI81pLW1o4d+LkAi3JTosSxZe07pSKDaUkpHna/EVRIdhXU6uBpBinWDT1ti5/B0y3u2JoLWNlHslgDFleIiDsM0jgswACSMJKdpIB7PT3LUqaVeyS3iAYENmekRr7TivhxoS/tiWVkdP7URjaM3JSn5NxzARE1pc0Jzm71QcrVylrZ6Miift2q9VNv5Z4JvDk1mfzMNkgpjqZI1XdMKKZ9oySxjtf3cnMqR70i4bOau0tQ6l33a2eZm2/EjJpIVecynTRaDdJ8hmD4IwCYZeWBtASBGSYLPJMOhx0XabcRt0DGV6rlZg1M84kLJsmMzeDVGxCmRwgeNea+t79pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfC5uY+1MIek7nf5Ht67Fp+pd1fEn9oKz9TsiNzSEe8=;
 b=fFgA4vmyOtbtlJBwkKe6x2f1IMTCJVHLsQhXSBhbJuX0SGoK3pbew4UvyOHiGRiPHkMK14buOkpsRgbdja0+m0hTRAYVEUfZHfw3Hc/UHTUyeqjtqxW3LqGHuywupUi+UYaI2cdRbtDAY5a1FuyHI7h99eQdQcXpy4ekXNUE8nobDpHhvYDJEc2T2YT6j18QW/SNG0aIHxpgLLWrfOt97UdruVmvsIlKtnaOaqk2rFHLXZ7X//j6tt6JAbw07zaJwQ/DgeYtAjcRIu1QmE8m6A34O+s4oqd1P86VTJMNZVUoIXkjmDHYByF+amL2QKQI9VHxmMxkT/UijAzhhhYFMA==
Received: from DM6PR04MB4121.namprd04.prod.outlook.com (2603:10b6:5:a0::10) by
 CO6PR04MB7745.namprd04.prod.outlook.com (2603:10b6:5:35a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 03:16:23 +0000
Received: from DM6PR04MB4121.namprd04.prod.outlook.com
 ([fe80::fae:4a33:bcee:9952]) by DM6PR04MB4121.namprd04.prod.outlook.com
 ([fe80::fae:4a33:bcee:9952%5]) with mapi id 15.20.6954.024; Tue, 7 Nov 2023
 03:16:23 +0000
Message-ID: <DM6PR04MB412176BD43A29E1E873FB7E5CEA9A@DM6PR04MB4121.namprd04.prod.outlook.com>
Subject: [PATCH] HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
From:   Aoba K <nexp_0x17@outlook.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@jikos.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Date:   Tue, 07 Nov 2023 11:16:10 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
X-TMN:  [GpdhlpyaR7F4pMahyUaTSYiGyVozM+66]
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DM6PR04MB4121.namprd04.prod.outlook.com
 (2603:10b6:5:a0::10)
X-Microsoft-Original-Message-ID: <dd5e49ae5ec88f0f68bfc99e9bea54f991b02724.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB4121:EE_|CO6PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 791fa70b-c362-4684-7703-08dbdf3feb47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84Uko/BsodijoYemxW6UvtfTqS62mXFAGwKG0QOJ/BpIW+BrcA8VM7BGunxYFjCVgJQXwxfO0l3Aq35DXR1LasF+1gfA02AEW6G5JokUSGOLHmVJlRWTV8Ojy4h6ShpinzmxNdv5mUe/aM69YmPZa+HCFov7lf1kb9lBUnTepu5C1CSBSkPfx0Al4MbxJXh+9BhIZHAOTU2Bo+CnqILfRmuTvHCh9vGjdzYX+ihd2Hh4MJuxlyn47HqCr/1KKamdkxfXSWWa5SJHsmjPdn135Aqdp8LPIua8e/ykwEoRXkTtdOnXMitIad5joeMjStRQOR+B3L1Vz4I8SMVL0rKzMm6Ucscsmtfk4H4PciYwYlrX8ETy97sZAws5F58AIRIjQ4A1Gjd+GkmC0QOTRWzc29VZVYEzXj/NFR1PdurwPjiB2ctyJJPJz68b98MdaNz7bsze3jcNoQBhf1iva1rcmNU4Gg5xDBcaYcDqTQKe0IMdGcAdYkTKvqAgH6ECrFCyqwYB9RclUqA57KLlYQSgUmbYPawB6Tisp0hgwonHqmxQwziueozNWgjZ4A6dASzV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkZVdEdHUHN0RDhsZkhMcTNRcGt5QlFLYi9EbzZiWDJRWGpwL2RnVUpGbkNO?=
 =?utf-8?B?cDduOFpjZGNkZFNEUkVVai9IaVZZT3BvOFY3WWU2dlgrc1AzdUZOV2tUL3J0?=
 =?utf-8?B?QjdPRlJndytTeGQvd1oycktNWXdzNXE3RzRhTEdQejZhTEdBd2JBMVI0aTJ1?=
 =?utf-8?B?RU5hUWRLYzVFcHdjWWgwTkRtY09TOWlNMXVOLzh1OUIxNVFSMjd5WVQvZVBS?=
 =?utf-8?B?WTdLelNYWGI2ZkRSYnRzTmo0Sk4wTFRkQ2lQK29UMDNMYjBkbW9DUXpvNlFu?=
 =?utf-8?B?djVMSmxXQVhvOTh5bFpkZ2diUXNncDVwdGt6Q2MySXI0QUxGNk8xbFZzWWs0?=
 =?utf-8?B?MTVESVB4NGNTZGs0d1diSE1raHVSd3NNZ254Q2dCekg4VXRaRDFOMHdHQ1oy?=
 =?utf-8?B?REdObDRqdlFnSkJCSzNTcWRFRXEvalRJQVQ4U25XL0N3YURJc1NXZTZuVmVW?=
 =?utf-8?B?T1VxQmE3Q295eVBkOEpGWUNEcDcwWGxDUFluUFNlM0t1cndlVlNIbTZOeWV2?=
 =?utf-8?B?d2VsSFdoeVBoTWwyNThMYWNWTUduMkVxbFRSa01xV1cyVS9TU2RHb0F5azVr?=
 =?utf-8?B?N1FDMVEzbUJ3Sjg1THJaV0hsaVNnM1FTRW9XbjlmdVJBL1A1RWFJZ3F0QTlL?=
 =?utf-8?B?SDZFTTkwM1JzNDM5M0JSNkpvNE9kOVFwZEMyMzh5R1kweGE5cGExYjhsYWZK?=
 =?utf-8?B?aWkzUUxUTVdZZDBRL2ZjdlBOaUlBU3RPdU8vUkZ1a1hSK2U4MkhSb3JpOFRl?=
 =?utf-8?B?UHhOZXNJZFNKMFNFdnVPbTJuNnduWmxNYU4rUjlyMUo1SkNDdDNUdVhmcStT?=
 =?utf-8?B?UjNEL3hhMmdCK0c1dllEWDVWWUl4VkY0VHRtazRvRjdiSDd4ZmM3WVZveXN5?=
 =?utf-8?B?Z3NtRng5a0RQTFYrdGdRZmJRZWVJc3BIQUFqSmNORUV2dmo5SlQwcXNVTGox?=
 =?utf-8?B?b2VkMzlGRWxZNjNSa2RCa1lNQTZ3eE5jRGQ2ekVTRGpwRFJMOHF0cmZZNWlV?=
 =?utf-8?B?bk40SWF4NkpxYzBjczcwZzZGT2gzK3NUc3NwS0JLb2dVaElxOThvT2NVWEtp?=
 =?utf-8?B?cVM4T1lyankyWUZlUStpWnhNdWRXOTF1OWliT3p1RWJCZisxb3dkYjRnVFM0?=
 =?utf-8?B?N2VDRHQvV09nWUlCOHdkTVdpMHRrdVllZ0JoYmkyUzNaU09Udm8zVGcrQm92?=
 =?utf-8?B?aWxYVWg3SGdXT3daS3ErNktUZTN0bzR0MzV5b3J0TXdwZWVzU2F4Q0w2S0sr?=
 =?utf-8?B?ZXd5VkUzR1lpVERKRUt6Zk5nTU9aTjlONHR1Rkt6RFh6SGxRZktYSGZISlg5?=
 =?utf-8?B?U0hUcWhlZnBJS1puajlYQlkxYituVkJMVWtCMUN6MDJFdTY4ckIzcHhCVzFY?=
 =?utf-8?B?VDZQVDhjcjNGKzhSMG1wUXF6eDBlMk9GeWNmdnRiZ0JoU1hUMTRGaHNFVWtM?=
 =?utf-8?B?RTFaeUxkdWVnbituTG5kRDk4L25ZeThZV0VieUFFNG9nSFB5V1J6TTA4ZlBE?=
 =?utf-8?B?MjNJY0xpQXJlc3V6YmxsZnAwVSsvUjhNbGl1UHlXSGxsV2lScVpSVFF3WXB3?=
 =?utf-8?B?cCtJR3BybUlUcDhYWHI1OFZQRytBLzVQUld0SWJiOEpIaFF4MWpOOWdKNWV2?=
 =?utf-8?B?aTlwKy8rNkZuYXVaNlV4TmtYSUNmdnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791fa70b-c362-4684-7703-08dbdf3feb47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4121.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 03:16:23.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7745
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Honor MagicBook 13 2023 has a touchpad which do not switch to the
multitouch mode until the input mode feature is written by the host.
The touchpad do report the input mode at touchpad(3), while itself
working under mouse mode. As a workaround, it is possible to call
MT_QUIRE_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
for such device.
The touchpad reports as BLTP7853, which cannot retrive any useful
manufacture information on the internel by this string at present.
As the serial number of the laptop is GLO-G52, while DMI info reports
the laptop serial number as GLO-GXXX, this workaround should applied
to all models which has the GLO-GXXX.

Signed-off-by: Aoba K <nexp_0x17@outlook.com>
---
=C2=A0drivers/hid/hid-multitouch.c | 5 +++++
=C2=A01 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e31be0cb8b..f655a76ff2 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2055,6 +2055,11 @@ static const struct hid_device_id mt_devices[] =3D {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0MT_USB_DEVICE(USB_VENDOR_ID_HANVON_ALT,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0USB_DE=
VICE_ID_HANVON_ALT_MULTITOUCH) },
=C2=A0
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* HONOR GLO-GXXX panel */
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .driver_data =3D MT_CLS_VTL,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x347d, 0=
x7853) },
+
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Ilitek dual touch panel =
*/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{=C2=A0 .driver_data =3D MT=
_CLS_NSMU,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,

base-commit: 28d3fe32354701decc3e76d89712569c269b5e4f

---
2.41.0

