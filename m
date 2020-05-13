Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FEF1D1F81
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 21:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390743AbgEMTle (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 15:41:34 -0400
Received: from mail-bn8nam12on2134.outbound.protection.outlook.com ([40.107.237.134]:35585
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390256AbgEMTle (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 15:41:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbB6P7Bz2bgJxokbbpqR239ZI6u8XkKFd5VkV5LO6FQJ/6wi1WszYj60mAJB3LiAeXXfVgdVho2taoKdsrMKzaVONPo9MpAsQOPTSOdskOpSL9NZCloH4rTij7MtgJqk9ZkyLT4A7Y71Hgee+catZpKUXiOLueTGHl9sZP0L6LumZCagAEpblvLuHifsQ1OrE9atgnPvSKCxls4DFF3R3ppoXY1y/xtvJjHGUIVBxUWcnBjzIwl4B586ofpTAhIIJLp9BaG7SHL6Kk/p+wVdB66mi9NaGM5fEB2sCF1pbfIg3JtXvyV6CQH3tPS3qNTwc3xNxuv7ZjYiIfo75yqs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vujSmCAHPQLMPv8YyrDqB+M+3Dw9nS9AsxTt9G0loFs=;
 b=mjlGPk6QNpnayuEinKMwLZn5Xy5jqI90Vxk6uz5lapSOPWHW6wbQui9eQ6DUukbOYVT03UeCoUMx6dXbTYjwsQ6mJ3vbBqGifLXB/3l/eQ1QS5xeUvk6OmkT7m4WYcNc0sAPS1PfWDnVnojk9riofdbnRHkRn2LXXBVWz2f0cWjyLFNU20Cqcjb7Z6xvzhBhQz6Vohiom7fI4Z7VExy6S+CHVenVHNQ2fryPLfbGaTy4cJvTW7HFCSbtLNN7QdOBswwliFiEUsYRYf+GACRiPSQA5bztiNl3QxjSkkJMcQ74ZyfFxulRc+yug+1J/+X0r8ajr8JynAHYXfQ3pO1aGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vujSmCAHPQLMPv8YyrDqB+M+3Dw9nS9AsxTt9G0loFs=;
 b=ChrdgzJjOhK5ceP+TpGCd4XIo+qHLywc9gbLE7cXfvnhnohnRRLcHoX7Y/67SJmH2nLXn5Vw7v4WlIZkgPY5w5GM4Ud4ZpvRD9YIfc2GqUaf/wcB1XLarwH7GXX/p0sc8k7753O3QVXi2/0NyqDuYFFEntXOQCZbe3BlRtTskzg=
Received: from BY5PR13MB3826.namprd13.prod.outlook.com (2603:10b6:a03:22d::24)
 by BY5PR13MB3361.namprd13.prod.outlook.com (2603:10b6:a03:1ae::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.10; Wed, 13 May
 2020 19:41:30 +0000
Received: from BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::f5e3:3e83:9f8b:af36]) by BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::f5e3:3e83:9f8b:af36%5]) with mapi id 15.20.3000.016; Wed, 13 May 2020
 19:41:30 +0000
From:   "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>
To:     Scott Shumate <scott.shumate@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
Thread-Topic: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
Thread-Index: AQHWKUjQRNbJ1Yftr02hA8/4SfeCYaimZ941
Date:   Wed, 13 May 2020 19:41:29 +0000
Message-ID: <BY5PR13MB38264B60014D43193C53B38798BF0@BY5PR13MB3826.namprd13.prod.outlook.com>
References: <46c1ab66-62d7-5dae-2f4d-7e722f1aff3a@gmail.com>
In-Reply-To: <46c1ab66-62d7-5dae-2f4d-7e722f1aff3a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [76.87.64.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b8c1bc0-f439-41e0-4751-08d7f775a233
x-ms-traffictypediagnostic: BY5PR13MB3361:
x-microsoft-antispam-prvs: <BY5PR13MB3361517D3B4200A9D820059798BF0@BY5PR13MB3361.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0402872DA1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB3826.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(33430700001)(55016002)(86362001)(66556008)(478600001)(186003)(33440700001)(110136005)(71200400001)(316002)(6506007)(53546011)(7696005)(66476007)(64756008)(66446008)(8936002)(26005)(76116006)(9686003)(33656002)(5660300002)(8676002)(2906002)(52536014)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hiVPxKWspEuxJIGo1LBKZjiv9vKX3VsENX8e8qc4kPHABYdxOYlW9gdwZl72zud1wzgz6GrJ5caWteNn2E4WB+g8Hugfge4rGzwfCXvv7uk9Uq5oFALMb0sDWtbhw5tHIjxerE5X084vc/dEnbKmh+WVf/ixZ4clip+qdMexXviQ/ms1w5b2NyXg6kkqUsFooN1faA3Rhon6ACNEceor+Dd5pforgYMX6W29JhsoQo5j359sGXHrxWK+dfGnlK23ID+0lW3mkc0YbWXEkqnXVWL66Pxpoys6s0UtKkjHol4YdN7W5i59UIEUtoIABVMi8wgKICiY8c04/BhkzVkKCX9MwR6Pgach7CrACKhZ8rn1VwSFcl52oq+HDHIBY6MdXctWKljEhKyRWYgBBDaoBfJFjl/sKawqkUKA47LJoRb0yhagBVYkykanNRmM0GWgvZwOjiu/AI0nussi/W/xEWS3mVPz5izk2qewX9TVgzc0zwqqMCotniC2nX9+MnSqlVNQapNu4ruIc2abom//A==
x-ms-exchange-antispam-messagedata: k3IDqquK12DoAC2rJJ/ryUISkGnVkQT9qA8cX4YnS5bvXQ1SpYcMvIHEzq3VoiOXjaxOy1QSriimfWOcQ1tXDQCPPIhT3o1252p6t29UxZuyGAIBKNCbEROQyiTJLAWLrkdXLahq61EU8OhoFtA79BenV6LqCj29Ne6KVcZ83vPeyrRZYMTTVTRk6EoCDWSSFPaCk3COS3cfACo0RaJDwYzowb6lRYCIMxNmOWoh7nrd5aktkyNLwLZbCJxOjcXq91xez3zuEw2asBJU/Mchksb4uMHROYX4enN+xAeLwCOzvrvKeeUauY8ZizmRFFNyY/AYpdW5Zj2rmxJ9xUHExOsmMugT+RpUm3kl4CwExg2/576dN+xIFdl8qFE/8CUrwWqcQYK667oFMuzxY0p/EORn7AkrAoJEL2N+xORdpuwv8rw1hemFznpkx438Gw4MalxIHGm9Jew4y+nYeo0QX48IqdLCjDDHoS4pEFFfkT8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8c1bc0-f439-41e0-4751-08d7f775a233
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 19:41:29.9254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmmciGdF+MLm31B4NNxWICqxjzdbMym66+kQlUMrwYwf6DHUto+tFYHrJNro13ZnxKgqbc4RPrXLItoJSQrr3dCw5tFMfWMMGFsktBJakh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3361
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Scott,=0A=
=0A=
Thanks for sharing this patch. Do you know if for these controllers the dat=
a is at the same byte offsets in the reports as an official DS3?=0A=
=0A=
The reason I'm asking is that I have been considering for a while to redo s=
ome of the button / stick handling code and the issue you just pointed out =
could be another argument towards doing that. Basically we learned that als=
o for the official Navigation controller there are apparently a few differe=
nt revisions with different report descriptors (yah!).=0A=
=0A=
I have been tempted for some time to get rid of this fixup / mapping logic =
altogether and e.g. have a "sony_register_gamepad" and do it all ourselves =
and put more logic into the sixaxis_parse_report call. With many buggy devi=
ces of which we don't have most it feels fragile to have the HID parser do =
the work.=0A=
=0A=
Thanks,=0A=
Roderick=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
From: Scott Shumate <scott.shumate@gmail.com>=0A=
=0A=
Sent: Wednesday, May 13, 2020 10:05 AM=0A=
=0A=
To: Jiri Kosina <jikos@kernel.org>; Benjamin Tissoires <benjamin.tissoires@=
redhat.com>; Colenbrander, Roderick <Roderick.Colenbrander@sony.com>; linux=
-input@vger.kernel.org <linux-input@vger.kernel.org>; linux-kernel@vger.ker=
nel.org <linux-kernel@vger.kernel.org>=0A=
=0A=
Subject: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles=0A=
=0A=
=A0=0A=
=0A=
=0A=
Fix for non-working buttons on knock-off USB dongles for Sony=0A=
controllers. These USB dongles are used to connect older Sony DA/DS1/DS2=0A=
controllers via USB and are common on Amazon, AliExpress, etc.=A0 Without=
=0A=
the patch, the square, X, and circle buttons do not function.=A0 These=0A=
dongles used to work prior to kernel 4.10 but removing the global DS3=0A=
report fixup in this commit exposed the problem:=0A=
=0A=
commit e19a267b9987 Author: Roderick Colenbrander=0A=
=A0<roderick.colenbrander@sony.com>=0A=
Date:=A0=A0 Tue Mar 7 15:45:08 2017 -0800=0A=
=0A=
=A0=A0=A0 HID: sony: DS3 comply to Linux gamepad spec=0A=
=0A=
Many people reported the problem on the Ubuntu forums and are working=0A=
around the problem by falling back to the 4.9 hid-sony driver.=0A=
=0A=
The problem stems from these dongles incorrectly reporting their button=0A=
count as 13 instead of 16.=A0 This patch fixes up the report descriptor by=
=0A=
changing the button report count to 16 and removing 3 padding bits.=0A=
=0A=
Signed-off-by: Scott Shumate <scott.shumate@gmail.com>=0A=
---=0A=
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c=0A=
index 4c6ed6ef31f1..2f073f536070 100644=0A=
--- a/drivers/hid/hid-sony.c=0A=
+++ b/drivers/hid/hid-sony.c=0A=
@@ -867,6 +867,23 @@ static u8 *sony_report_fixup(struct hid_device *hdev, =
u8 *rdesc,=0A=
 	if (sc->quirks & PS3REMOTE)=0A=
 		return ps3remote_fixup(hdev, rdesc, rsize);=0A=
 =0A=
+	/*=0A=
+	 * Some knock-off USB dongles incorrectly report their button count=0A=
+	 * as 13 instead of 16 causing three non-functional buttons.=0A=
+	 */=0A=
+	if ((sc->quirks & SIXAXIS_CONTROLLER_USB) && *rsize >=3D 45 &&=0A=
+		/* Report Count (13) */=0A=
+		rdesc[23] =3D=3D 0x95 && rdesc[24] =3D=3D 0x0D &&=0A=
+		/* Usage Maximum (13) */=0A=
+		rdesc[37] =3D=3D 0x29 && rdesc[38] =3D=3D 0x0D &&=0A=
+		/* Report Count (3) */=0A=
+		rdesc[43] =3D=3D 0x95 && rdesc[44] =3D=3D 0x03) {=0A=
+		hid_info(hdev, "Fixing up USB dongle report descriptor\n");=0A=
+		rdesc[24] =3D 0x10;=0A=
+		rdesc[38] =3D 0x10;=0A=
+		rdesc[44] =3D 0x00;=0A=
+	}=0A=
+=0A=
 	return rdesc;=0A=
 }=0A=
 =0A=
=0A=
=0A=
=0A=
