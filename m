Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3706E14C7
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 21:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjDMTD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 15:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDMTD5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 15:03:57 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC1119BB
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 12:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKW998CYv8PTrRtoji4QThBVHL9bnpSIcoZt72A9R1vZFOo8tWtdlzRXL8XY0tgfd1Cm50W6lageM2JH64RkSTXLd7ULFWF5nm5qNzf3wENzFDXtCWEyxCuoyX2fKc0DMG9TmNfNCMdFM//2W0sYT9oNM3sguNN75g029H+R9H+VBMMcIoQCOis7hdp23ls1rEjBt5D9aW+BVzghrJr9ie4X2lPGXGZlKuvfSwDwKhtNmMhc8G7UPM6EfcOA5/Kb69e1h42TQljF7FbAVvZds+RW7crBPij+rIBQxxcSZm3byTytvWzjEZkCVzgrdxtaDT1fOV4JKekaB426+NL6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvqCBv75JW/ImvvZD0sGi7la9tz8oJaQmq3WgZ6BmZs=;
 b=oexyUG8o89QKdf4E5c5Jz2gao8fHuwyQ8NXD8LpylUHeOQRyxIjiPpEu02gsXW6+V3kcJoZooUPvoKq+xFNSGdWPR6vu/EwIRMfzfGpALLLas2EDrfKUCkbtYJo6Po7rABfcwfpUsReacBU3b9Ip6Nc7nwYxWCjLK6EiKsoJUi/Kb3e5tr2Qyse50O+0JL7i42g18aAZfl2D8L8uHNQfjTgV8ZfMtFYrmp1lcK/pkkNzyCtasY0xNSpagjMQ8eYCozfkzM288+oXnohL+ZGBfuU+YSEUioWosJernVvBTCuLL/hIUIN92oTe0eQQ5wirz/sanNxJOuglH/3ld9xF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvqCBv75JW/ImvvZD0sGi7la9tz8oJaQmq3WgZ6BmZs=;
 b=DbH9pZxPlhfKQrzXzSkk8yZdL9Q9LOh67ocZF00S/YN34ydCPDgxnJ7rc4eolP+vN6hnIAMeRt4drztCLSVUB2gZfPdGvOvrX2qVz7HFYBkoMwEuz66uabtCnT1m2dvJsvmuq2N+5u47nnyvBTWn55sgaZ42rbNQPjsq203PMLo=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.26; Thu, 13 Apr
 2023 19:03:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 19:03:51 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jason Gerecke <killertofu@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
CC:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: RE: [PATCH 1/2] HID: wacom: Lazy-init batteries
Thread-Topic: [PATCH 1/2] HID: wacom: Lazy-init batteries
Thread-Index: AQHZbjRC+RGURlT1JEeUV/1Hs3D2Pa8pmLBA
Date:   Thu, 13 Apr 2023 19:03:51 +0000
Message-ID: <MN0PR12MB61013E79DEF1586288AE345AE2989@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230413181743.7849-1-jason.gerecke@wacom.com>
In-Reply-To: <20230413181743.7849-1-jason.gerecke@wacom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-13T19:03:49Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4664f393-7e7c-4c03-b8b7-b16a7030589d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-13T19:03:49Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 514af1d1-641e-44d0-946d-7c44da221bd7
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB6486:EE_
x-ms-office365-filtering-correlation-id: 119922f5-dd3c-4a59-e94f-08db3c51d1d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(38070700005)(86362001)(9686003)(186003)(66476007)(66446008)(66556008)(64756008)(66946007)(8676002)(76116006)(41300700001)(38100700002)(122000001)(4326008)(2906002)(6506007)(83380400001)(5660300002)(966005)(71200400001)(52536014)(7696005)(8936002)(55016003)(33656002)(316002)(110136005)(54906003)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119922f5-dd3c-4a59-e94f-08db3c51d1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 19:03:51.3205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Up8t+5bJRelmJ+4jNuEjqDWdvUZxSwmmbLc+DMC+WJrIrm75ajpyFGRlM2bWnIMwSuj4ukH7QEL2AS4LTo4y8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6486
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Public]

> From: Jason Gerecke <killertofu@gmail.com>
>=20
> Rather than creating batteries as part of the initial device probe, let's
> make the process lazy. This gives us the opportunity to prevent batteries
> from being created in situations where they are unnecessary.
>=20
> There are two cases in particular where batteries are being unnecessarily
> created at initialization. These are AES sensors (for which we don't know
> any battery status information until a battery-powered pen actually comes
> into prox) peripheral tablets which share HID descriptors between the
> wired-only and wireless-capable SKUs of a family of devices.
>=20
> This patch will delay battery initialization of the former until a pen
> actually comes into prox. It will delay battery initialization of the
> latter until either a pen comes into prox or a "heartbeat" packet is
> processed.
>=20
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>

Some other tags to add:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217062
Link: https://gitlab.gnome.org/GNOME/gnome-control-center/-/issues/2354

> ---
>  drivers/hid/wacom_sys.c | 10 ----------
>  drivers/hid/wacom_wac.c | 13 ++++++-------
>  2 files changed, 6 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index fb538a6c4add8..8214896adadad 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2372,13 +2372,6 @@ static int wacom_parse_and_register(struct
> wacom *wacom, bool wireless)
>  	if (error)
>  		goto fail;
>=20
> -	if (!(features->device_type & WACOM_DEVICETYPE_WL_MONITOR)
> &&
> -	     (features->quirks & WACOM_QUIRK_BATTERY)) {
> -		error =3D wacom_initialize_battery(wacom);
> -		if (error)
> -			goto fail;
> -	}
> -
>  	error =3D wacom_register_inputs(wacom);
>  	if (error)
>  		goto fail;
> @@ -2509,9 +2502,6 @@ static void wacom_wireless_work(struct
> work_struct *work)
>=20
>  		strscpy(wacom_wac->name, wacom_wac1->name,
>  			sizeof(wacom_wac->name));
> -		error =3D wacom_initialize_battery(wacom);
> -		if (error)
> -			goto fail;
>  	}
>=20
>  	return;
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 4cfa51416dbcb..391fde5bf6024 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -113,6 +113,11 @@ static void wacom_notify_battery(struct
> wacom_wac *wacom_wac,
>  	bool bat_connected, bool ps_connected)
>  {
>  	struct wacom *wacom =3D container_of(wacom_wac, struct wacom,
> wacom_wac);
> +	bool bat_initialized =3D wacom->battery.battery;
> +	bool has_quirk =3D wacom_wac->features.quirks &
> WACOM_QUIRK_BATTERY;
> +
> +	if (bat_initialized !=3D has_quirk)
> +		wacom_schedule_work(wacom_wac,
> WACOM_WORKER_BATTERY);
>=20
>  	__wacom_notify_battery(&wacom->battery, bat_status,
> bat_capacity,
>  			       bat_charging, bat_connected, ps_connected);
> @@ -3391,19 +3396,13 @@ static int wacom_status_irq(struct wacom_wac
> *wacom_wac, size_t len)
>  		int battery =3D (data[8] & 0x3f) * 100 / 31;
>  		bool charging =3D !!(data[8] & 0x80);
>=20
> +		features->quirks |=3D WACOM_QUIRK_BATTERY;
>  		wacom_notify_battery(wacom_wac,
> WACOM_POWER_SUPPLY_STATUS_AUTO,
>  				     battery, charging, battery || charging, 1);
> -
> -		if (!wacom->battery.battery &&
> -		    !(features->quirks & WACOM_QUIRK_BATTERY)) {
> -			features->quirks |=3D WACOM_QUIRK_BATTERY;
> -			wacom_schedule_work(wacom_wac,
> WACOM_WORKER_BATTERY);
> -		}
>  	}
>  	else if ((features->quirks & WACOM_QUIRK_BATTERY) &&
>  		 wacom->battery.battery) {
>  		features->quirks &=3D ~WACOM_QUIRK_BATTERY;
> -		wacom_schedule_work(wacom_wac,
> WACOM_WORKER_BATTERY);
>  		wacom_notify_battery(wacom_wac,
> POWER_SUPPLY_STATUS_UNKNOWN, 0, 0, 0, 0);
>  	}
>  	return 0;
> --
> 2.40.0
