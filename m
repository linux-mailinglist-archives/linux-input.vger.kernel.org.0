Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF75A3B6FF
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 16:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390751AbfFJOMi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 10:12:38 -0400
Received: from mail-eopbgr710084.outbound.protection.outlook.com ([40.107.71.84]:19575
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390690AbfFJOMi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 10:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swpdajLbiD3AUJSRF//G9qU53QLeN1gkU+L9SUfL3X0=;
 b=A5I6aKBUZQNNTPky5lbYrWIkTOzIzjUYcFcTgH7DCMRvrz+b8J7kXpSMStIp+J0VnnJYD/t1lvGWU6g/Lc50tLxkzXLnhWAHmkPGz2zo9EaVNSZjdsnk2lJ/6aNbkO527S0vCOzLYM5tclfno6j6bltMPnCnOaeMzDyYubtKorY=
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (52.132.197.151) by
 SN1PR12MB2576.namprd12.prod.outlook.com (52.132.197.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Mon, 10 Jun 2019 14:12:34 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::a1af:860b:29c2:4aaf]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::a1af:860b:29c2:4aaf%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 14:12:34 +0000
From:   "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: Query Regarding HID input Report Descriptor
Thread-Topic: Query Regarding HID input Report Descriptor
Thread-Index: AdS+GnxHZeKHJCTvQRmpJ2NYwbOvqAAJLnIABmaFlIAM2HlzgABnEQoAAABAqwAAAlZJgAKC4eRw
Date:   Mon, 10 Jun 2019 14:12:34 +0000
Message-ID: <SN1PR12MB2575335B0E7BD18CC917704EA0180@SN1PR12MB2575.namprd12.prod.outlook.com>
References: <SN1PR12MB25755449BDADB0BD0DBB9CF7A06F0@SN1PR12MB2575.namprd12.prod.outlook.com>
         <02e0cd088dfec0635aab950af413794215531481.camel@linux.intel.com>
         <ad21ea67-771f-d1e9-96f5-64aa9f1b4603@amd.com>
         <110b8fce-5539-ac1f-1b95-39e46ccbac8c@amd.com>
         <1d179626354a74376ae09cb859e36fbb04bddc46.camel@linux.intel.com>
         <e4dde41f-f8ef-8d55-e63d-578372fd1210@amd.com>
 <adf6272861f2e0455392a2a455f0c797aff5ecc1.camel@linux.intel.com>
In-Reply-To: <adf6272861f2e0455392a2a455f0c797aff5ecc1.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
x-originating-ip: [2401:4900:331e:7d53:c727:1e53:1b70:85d3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4b77e39-e6b7-45bf-9b7f-08d6edadaf88
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:SN1PR12MB2576;
x-ms-traffictypediagnostic: SN1PR12MB2576:
x-microsoft-antispam-prvs: <SN1PR12MB25766DCEA01B89063C456A42A0130@SN1PR12MB2576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(39860400002)(136003)(396003)(53754006)(13464003)(189003)(199004)(81156014)(8676002)(81166006)(8936002)(71200400001)(14454004)(72206003)(55016002)(71190400001)(478600001)(66476007)(66556008)(64756008)(2906002)(76116006)(66946007)(6436002)(91956017)(86362001)(9686003)(6116002)(7736002)(305945005)(53936002)(73956011)(52536014)(4326008)(46003)(5660300002)(66446008)(6246003)(25786009)(186003)(99286004)(476003)(11346002)(446003)(316002)(7696005)(110136005)(256004)(14444005)(5024004)(229853002)(486006)(68736007)(33656002)(74316002)(2201001)(76176011)(102836004)(6506007)(53546011)(2501003);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2576;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PkWGDM/BXNWlaTg6FNe29lNRNRHIuLbZw6AcGH4ngNO1GN2iwf73z76XId1QX3Nv1Rwk87HTc60GsW9Yvuj80VPrhdMcyZi2gh0qAlopgyERm3ptIrZLil80bdFoO1VhDb9lj6FXapU7zwivcpvOxWdmCbxLE8VtChnuX+7zFZk7bCcv0Yme3UWHlmO9Bjb3eXbt4S5O0NZIZHeQRBM2j5o11i+dmo+WWFnhq2cG9aAP1oivXWJV8XGZBaFG2mY4/9H9HQJKfr+weTdAvpvW4twFF8r5yjxrgJIu8Ff/50h8dbuCckubfUv4S6RtuNkxW0gvOmaV/cozMAmZNh4L7wXEhAwz4Jbren+tHY/Mw6BVd8Szdc/MaemUFvRBbTL23lWpa2H37euv2PntlAliVxuj95yUMs7B60gMBQ1/ZkU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b77e39-e6b7-45bf-9b7f-08d6edadaf88
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 14:12:34.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbshah@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2576
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi=20

-----Original Message-----
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>=20
Sent: Saturday, May 18, 2019 12:24 AM
To: Shah, Nehal-bakulchandra <Nehal-bakulchandra.Shah@amd.com>; jikos@kerne=
l.org; jic23@kernel.org
Cc: linux-input@vger.kernel.org
Subject: Re: Query Regarding HID input Report Descriptor

[CAUTION: External Email]

Hi Nehal,

On Fri, 2019-05-17 at 17:46 +0000, Shah, Nehal-bakulchandra wrote:
> Hi Srinivas,
>
> On 5/17/2019 11:09 PM, Srinivas Pandruvada wrote:
> > [CAUTION: External Email]
> >
> > On Wed, 2019-05-15 at 16:28 +0000, Shah, Nehal-bakulchandra wrote:
> > > Hi All,
> > >
> > >
> > > I am working on sensor driver for AMD platform and in our=20
> > > platform, firmware doesn't give data in HID format. So i am=20
> > > writing interface driver which makes firmware data into HID Report=20
> > > format.Now i have taken reference from HID Usage document and i=20
> > > have created sample descriptor like this for accel 3d.
> > >
> > > static const u8 HID_Sensor_ReportDesc_acc[]=3D {
> > >       HID_USAGE_PAGE_SENSOR,
> > >       HID_USAGE_SENSOR_TYPE_MOTION_ACCELEROMETER_3D,
> > >       HID_COLLECTION(Physical),
> > >
> > >       //feature reports (xmit/receive)
> > >       HID_REPORT_ID(1),
> > >       HID_USAGE_PAGE_SENSOR,
> > >       HID_USAGE_SENSOR_PROPERTY_SENSOR_CONNECTION_TYPE,  // NAry
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(2),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_SEL
> > > ,
> > >       HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_ATTACHED_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_EXTERNAL_SEL,
> > >       HID_FEATURE(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(5),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_NO_EVENTS_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_ALL_EVENTS_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_THRESHOLD_EVENTS_
> > > SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_NO_EVENTS_WAKE_SE
> > > L,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_ALL_EVENTS_WAKE_S
> > > EL,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_THRESHOLD_EVENTS_
> > > WAKE
> > > _SEL,
> > >       HID_FEATURE(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(5),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_UNDEFINED_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D0_FULL_POWER_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D1_LOW_POWER_SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D2_STANDBY_WITH_WAKE_
> > > SEL,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D3_SLEEP_WITH_WAKE_SE
> > > L,
> > >       HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D4_POWER_OFF_SEL,
> > >       HID_FEATURE(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_STATE,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(6),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_STATE_UNKNOWN_SEL,
> > >       HID_USAGE_SENSOR_STATE_READY_SEL,
> > >       HID_USAGE_SENSOR_STATE_NOT_AVAILABLE_SEL,
> > >       HID_USAGE_SENSOR_STATE_NO_DATA_SEL,
> > >       HID_USAGE_SENSOR_STATE_INITIALIZING_SEL,
> > >       HID_USAGE_SENSOR_STATE_ACCESS_DENIED_SEL,
> > >       HID_USAGE_SENSOR_STATE_ERROR_SEL,
> > >       HID_FEATURE(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_PROPERTY_REPORT_INTERVAL,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_32(0xFF,0xFF,0xFF,0xFF),
> > >       HID_REPORT_SIZE(32),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0),
> > >       HID_FEATURE(Data_Var_Abs),
> > >       HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERA
> > > TION
> > > ,HID_USAGE_SENSOR_DATA_MOD_CHANGE_SENSITIVITY_ABS),
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_16(0xFF,0xFF),
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_FEATURE(Data_Var_Abs),
> > >       HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERA
> > > TION
> > > ,HID_USAGE_SENSOR_DATA_MOD_MAX),
> > >       HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-
> > > 32767)
> > >       HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM
> > > (32767)
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_FEATURE(Data_Var_Abs),
> > >       HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERA
> > > TION
> > > ,HID_USAGE_SENSOR_DATA_MOD_MIN),
> > >       HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-
> > > 32767)
> > >       HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM
> > > (32767)
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_FEATURE(Data_Var_Abs),
> > >
> > >       //input reports (transmit)
> > >       HID_USAGE_PAGE_SENSOR,
> > >       HID_USAGE_SENSOR_STATE,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(6),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_STATE_UNKNOWN_SEL,
> > >       HID_USAGE_SENSOR_STATE_READY_SEL,
> > >       HID_USAGE_SENSOR_STATE_NOT_AVAILABLE_SEL,
> > >       HID_USAGE_SENSOR_STATE_NO_DATA_SEL,
> > >       HID_USAGE_SENSOR_STATE_INITIALIZING_SEL,
> > >       HID_USAGE_SENSOR_STATE_ACCESS_DENIED_SEL,
> > >       HID_USAGE_SENSOR_STATE_ERROR_SEL,
> > >       HID_INPUT(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_EVENT,
> > >       HID_LOGICAL_MIN_8(0),
> > >       HID_LOGICAL_MAX_8(5),
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_COLLECTION(Logical),
> > >       HID_USAGE_SENSOR_EVENT_UNKNOWN_SEL,
> > >       HID_USAGE_SENSOR_EVENT_STATE_CHANGED_SEL,
> > >       HID_USAGE_SENSOR_EVENT_PROPERTY_CHANGED_SEL,
> > >       HID_USAGE_SENSOR_EVENT_DATA_UPDATED_SEL,
> > >       HID_USAGE_SENSOR_EVENT_POLL_RESPONSE_SEL,
> > >       HID_USAGE_SENSOR_EVENT_CHANGE_SENSITIVITY_SEL,
> > >       HID_INPUT(Data_Arr_Abs),
> > >       HID_END_COLLECTION,
> > >       HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_X_AXIS,
> > >       HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-
> > > 32767)
> > >       HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM
> > > (32767)
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_INPUT(Data_Var_Abs),
> > >       HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_Y_AXIS,
> > >       HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-
> > > 32767)
> > >       HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM
> > > (32767)
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_INPUT(Data_Var_Abs),
> > >       HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_Z_AXIS,
> > >       HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-
> > > 32767)
> > >       HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM
> > > (32767)
> > >       HID_REPORT_SIZE(16),
> > >       HID_REPORT_COUNT(1),
> > >       HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to=20
> > > provide
> > > 2 digits past the decimal point
> > >       HID_INPUT(Data_Var_Abs),
> > >
> > >       //include the following datafield if required to support the=20
> > > shake event
> > >       HID_USAGE_SENSOR_DATA_MOTION_STATE,
> > >       HID_LOGICAL_MIN_8(0), // False =3D Still
> > >       HID_LOGICAL_MAX_8(1), // True =3D In Motion
> > >       HID_REPORT_SIZE(8),
> > >       HID_REPORT_COUNT(1),
> > >       HID_INPUT(Data_Var_Abs),
> > >
> > >       HID_END_COLLECTION
> > > };
> > >
> > > for Feature report i have created following structure
> > >
> > > struct accel3_feature_report
> > > {
> > >       //common properties
> > >       u8          reportid;
> > >
> > >       u8          connectiontype;
> > >       u8          reportstate;
> > >       u8          powerstate;
> > >       u8          sensorstate;
> > >       u32         reportinterval;
> > >
> > >       //properties specific to this sensor
> > >       u16         accelsensitiity;
> > >       u16        accelmax;
> > >       u16         accelmin;
> > >
> > > } ;
> > >
> > > Can some one help me is this the correct way of going forward?
> > > With
> > > this i am getting request for feature report and i can see device=20
> > > in iio bus also but i am not getting call for input report. Please=20
> > > help me in this regards.
> >
> > You will get call for input report when you try to read.
> >
> > For example:
> > #cat in_accel_*_raw
> >
> > Thanks,
> > Srinivas
> >
> >
>
> Yes today i could get the input report after running above command.
> So i have question, like in some external sensor hub i have observed=20
> that sensor is pushing data to HID Framework and iio-proxy keeps=20
> getting updated. But here we need to run the above command and after=20
> that iio-proxy is getting updated. Is it the same case in ISH and=20
> other design?
There are two modes in IIO:
- The raw mode: which is by user doing "cat"
- The other is read via buffers. In this mode, you enable some channels fro=
m iio. Here the ISH or usb/i2c-sensor-hub will push the data via hid, so th=
at user mode can read data via iio buffers. In this case your hub should be=
 able to process the report_interval, report/power state, sensitivity etc. =
Basically when hub notice change in the data it can push the data to hid. H=
ere hid core will cause notify function to be called with data.

Thanks,
Srinivas


> > >
> > > Thanks
> > > Nehal Shah
> > >
> > >
>
> Regards
> Nehal Shah

