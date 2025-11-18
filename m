Return-Path: <linux-input+bounces-16201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5727C6C0C1
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 608444EB192
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7779D3191BD;
	Tue, 18 Nov 2025 23:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="XsOqcAlR"
X-Original-To: linux-input@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster6-host1-snip4-1.eps.apple.com [57.103.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A514314D0B
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509609; cv=none; b=PjvTPcW/PJKkTfSTKncjTpyY6ZseV3sMkY9cU5DtPJ4g4BtPFwKHqsIVcEdLXD4I8BuWHFX7RlxcL46j9zjZEgnYi0wCNyEz/ZNBuKYMUmdmVZwcMVV3ojMj29AilS3YmKLoZVtHbgqqB1UANlNmAmX5RmIi9RCQmUj27/o0Urk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509609; c=relaxed/simple;
	bh=PEcue7ha/wJDYSPWXm1LZNjpz6muL+BEHbW4vmIUM4Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rTZwBQmA8SOC19N+g4R5q9KYxw0rKA2CRxsAqVvzLwWJ06T6hEAuSJlndEXauz2LzXwYRzSaxudP/SOyxEVGx2u/Nj6Wwu//eSosrYdBpc+ZCMQp9h30zwKKdidRSzPEErsLhNaRYJI7kRsQVWpymAsEJJURf4OcXwC/tdOUNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=XsOqcAlR; arc=none smtp.client-ip=57.103.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPS id AEA481800507;
	Tue, 18 Nov 2025 23:46:45 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=JwW2L12jlCKbonxm6qVBwGG5kJb8vdMhNjDygH7KWTA=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=XsOqcAlRNWHqVwJV/F92IGcxw499Jvt9/Mb4ReFTSWNRMpkeTJQpu2YfLF3Jy/hdm8MX+8H40jhuKapMMxU073zFF8USrqPOO+Nn8BgmLC19CIRnaXRIemeejFdCyWKsplDmnc2TBbZj/vVcITmRi1HBrkkflVMrTQ7r5FFlNhrZdpr6LdzlHzbQT6JAK5O7Rkm6EIQlKzRE5RI4e+VizTW5zo7vTq7hoVa0UgGqrXPXCOVNOU6yU7NBQ8cvW0JRdqO+zjpepLIPcaOSJMDdeZDIE624Ih6xJkOLMdO+euE1i6TSrrlX66H0AXJZHBttM3EwazIgG1OQaX5k8zHvlw==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPSA id 6B03D180013F;
	Tue, 18 Nov 2025 23:46:43 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.4\))
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
From: luke@ljones.dev
In-Reply-To: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
Date: Wed, 19 Nov 2025 12:46:30 +1300
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F5019F3-2654-4C03-B7EF-5B7B83AF7B32@ljones.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
 <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
To: Denis Benato <benato.denis96@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.4)
X-Authority-Info: v=2.4 cv=LItrgZW9 c=1 sm=1 tr=0 ts=691d0566 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=Fcdhv35IdzEKBjHJFVoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MflEKdHsbf3xc-2E2-sHtlfJpqsN1mhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE5MyBTYWx0ZWRfX8okEl4l/T/5e
 x83l19XeGQR/I11WuX+HVwGBW5YutdNvvMdZnEnp12QNCvBSIH0c5QrIMwP3uhsSlzS75xHNv39
 v6Tdt3SvwbWcen1vQh2RP5qHLnS5ZR8xOh3mf/rbGIIzQM6CRuA/tHuC/vnZeegCI8yBZaDYi7r
 qWHIv400EM1hb+VhHgYTB00VGKBGKqIsVNw6N8ug4/+zbz38zcx2s3iV1L+GNZ9c6gvUNwkWahE
 02lbUJgbbRGbhO4oCL8C+fT10zXgmYjbT4D2gFb8XgXT45930wilBI9ZTFeS1I9kQxFycbFIL9y
 ZBdPAuZNWdERi4ITw9P
X-Proofpoint-GUID: MflEKdHsbf3xc-2E2-sHtlfJpqsN1mhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180193
X-JNJ: AAAAAAABjmYqkW1HLnLz6DqsQBwmRgObJLXY0moerZREtJaLqmgoXIUJOxcz5MLaZLpMOOWVcAokJWw9U0z1V0564RO644E96ae7+iKSn2Zp2LQgRyvttgwOTi69O2l6DmTHmosWcQ4/+s8KnHcn2R5+s+/U3lF4zXMqwc2VlcXAGsHB2QSFRPMWTD93cVCGEQVMWfuIkOwbrpPhUuv5pL26znPB59JnFRaZmCwP6kSSxY9o8wMg4Ca7dvQZOGLeboXzGMtqaV3Ec8H0hwd22fIfBVWW46VbJr8tHC6P+PFKEGv6x2YQlLqAT3uVsNO2V/cRwF90exChBvzpVjw6b2bZHWMga6yU+ApDaXhGMNKAAYrcfKJXq6z78xtHNFk1EJJHBr04AosyrLFXY+y1TBaHGBbtNZTwQSA52tQKG3g2F9Pp+ShsG62ydbboBgeiJQFkwpeQNXZhyOG5MyWxMWQ4cJdBdV85XHvDxJEtKKk3scKCQC4kzKkGetweG84fNIsKoXxYUrna770jCN0hK7ndDBvSPHy2vWGWJw+h3Wbz5NyoSlZbrXuFSA9InX799nqUutbdqGnCSJmg+WAvr25CoDPj8nvAr2p9RpGtFKit3JikR/Ba4G2a0BrTnH+ijb3EoSx3OmyD44hIEpFFWZ9CPej9C5S6Qt+6WIs6WKuv8gsl5VoMOS5RE52u77rLo3ywRRWeN7ofeBo=



> On 19 Nov 2025, at 12:43, Denis Benato <benato.denis96@gmail.com> =
wrote:
>=20
>=20
> On 11/1/25 11:47, Antheas Kapenekakis wrote:
>> Handshaking with an Asus device involves sending it a feature report
>> with the string "ASUS Tech.Inc." and then reading it back to verify =
the
>> handshake was successful, under the feature ID the interaction will
>> take place.
>>=20
>> Currently, the driver only does the first part. Add the readback to
>> verify the handshake was successful. As this could cause breakages,
>> allow the verification to fail with a dmesg error until we verify
>> all devices work with it (they seem to).
>>=20
>> Since the response is more than 16 bytes, increase the buffer size
>> to 64 as well to avoid overflow errors.
>>=20
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> ---
>> drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
>> 1 file changed, 29 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index 4676b7f20caf..03f0d86936fc 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and =
TouchPad");
>> #define FEATURE_REPORT_ID 0x0d
>> #define INPUT_REPORT_ID 0x5d
>> #define FEATURE_KBD_REPORT_ID 0x5a
>> -#define FEATURE_KBD_REPORT_SIZE 16
>> +#define FEATURE_KBD_REPORT_SIZE 64
>> #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>> #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>>=20
>> @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct =
hid_device *hdev, const u8 *buf, size_t bu
>>=20
>> static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>> {
>> +	/*
>> +	 * The handshake is first sent as a set_report, then retrieved
>> +	 * from a get_report. They should be equal.
>> +	 */
>> 	const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, =
0x54,
>> 		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, =
0x00 };
>> +	u8 *readbuf;
>=20
> __free(kfree) =3D NULL here? Would simplify the code.
>=20
>> 	int ret;
>>=20
>> 	ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
>> -	if (ret < 0)
>> -		hid_err(hdev, "Asus failed to send init command: %d\n", =
ret);
>> +	if (ret < 0) {
>> +		hid_err(hdev, "Asus failed to send handshake: %d\n", =
ret);
>> +		return ret;
>> +	}
>> +
>> +	readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
>> +	if (!readbuf)
>> +		return -ENOMEM;
>> +
>> +	ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
>> +				 FEATURE_KBD_REPORT_SIZE, =
HID_FEATURE_REPORT,
>> +				 HID_REQ_GET_REPORT);
> See comments on patch 1 (also reported below): not sure if others
> report_id are going to answer, my guess is that we will have to try
> if you choose to go that route.
>> +	if (ret < 0) {
>> +		hid_err(hdev, "Asus failed to receive handshake ack: =
%d\n", ret);
>> +	} else if (memcmp(readbuf, buf, sizeof(buf)) !=3D 0) {
>> +		hid_warn(hdev, "Asus handshake returned invalid =
response: %*ph\n",
>> +			FEATURE_KBD_REPORT_SIZE, readbuf);
>> +		/*
>> +		 * Do not return error if handshake is wrong until this =
is
>> +		 * verified to work for all devices.
>> +		 */
> In review of patch 1 I requested this function to be called with more =
report_id
> than just 0x5a so this will have to be checked against those values =
too.
>=20
> In alternative you can fork based on the report_id, but having =
confirmation that
> this is valid with those ids too would be of great help. Perhaps I can =
help you
> with this asking to asus-linux users.

The handshake works for 0x5D and 0x5E also.

>> +	}
>>=20
>> +	kfree(readbuf);
>> 	return ret;
>> }
>>=20


