Return-Path: <linux-input+bounces-6726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD9986ACB
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 03:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508DA1C21255
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 01:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237671714CB;
	Thu, 26 Sep 2024 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="aCF2HqAL"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9B9170A29
	for <linux-input@vger.kernel.org>; Thu, 26 Sep 2024 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727315898; cv=none; b=aA/CpRChluRFKD79/YXfR3NDN7V2GNhiqxAP/ybtguARRwYTTOhs+RccN6d6Z6tzdqPtRoj8nVLyevjqtuHru7qpQojlHwXHIJ3VcbBnf5dmTC8fXJUt+i/DM6D9jFv6AeXnSxf8u2og9uEvK1m2C0y6djYqCKAhLX3UT9FtnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727315898; c=relaxed/simple;
	bh=kJ6qI6xLbbu3ItSrKU6pnkexiUUVk8aWy6MvwmCGZjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=YzS8zZMQ8LVD76nUtDYKkDV60f3Cl2DNj9264MsO0ihFC1h3XruMK7SVSkC8166lvHvhEjhLCuvc5m7e8SOY9y56iqo5puxKKq4pVFJAHaPoDWvN1qwmupkraYcQEFb2q5qRmCvP4J/jG9tZMvbz1xBQ0PC7+3YQNDN2S14ThDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=aCF2HqAL; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1727315894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ6qI6xLbbu3ItSrKU6pnkexiUUVk8aWy6MvwmCGZjQ=;
	b=aCF2HqALRE8sqb8/oNa9zCXVizFTmiY1/jdV9d55I39wDpmbTwPizwdCPtJE8CD2Z+aOnd
	fF/LTrU4glYdNl8bEzV++IsG2Cor9XB7BpryMiV2GNAb6E4aqqAzK+RTEkZll7/elmI2WC
	G3qmqoS/Mqm3myfe0FoTjVOinGcfbhE=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-Ntll1154MhSZJUzkc31ENw-1; Wed, 25 Sep 2024 21:58:13 -0400
X-MC-Unique: Ntll1154MhSZJUzkc31ENw-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 26 Sep
 2024 01:58:09 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 01:58:09 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Topic: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Index: AQHbDvyAJRxpPdoqekCWSH3hIjpGNLJpS/pw
Date: Thu, 26 Sep 2024 01:58:09 +0000
Message-ID: <EA2PR84MB37807C9F2191AFE41F9372328B6A2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
In-Reply-To: <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|PH0PR84MB1953:EE_
x-ms-office365-filtering-correlation-id: 1fcecab8-70fd-4bae-7bcf-08dcddceabef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?c0NKMlBSL3JabW9zM2hTcUpqejBxb2FzWk9oNUVFa0dieUlEQ1NOSHoyN21r?=
 =?utf-8?B?NDJQcEw4cEtwdklMemNiT0wvVlI2a0lXWmFhT2ZsV3dBVzJ2ZWFTaDNVS2dl?=
 =?utf-8?B?akR6RjFUZHFzUzRUKzhzNS8rZDI0VHAyVUJjRjVzRElhSzlQaDlNWWpUd1lU?=
 =?utf-8?B?RTdObjFTVlFpVGVuQmp2Ykdrc2RrMytJZDQyOHJxcGRIYUNjMHZ3aEphY1Za?=
 =?utf-8?B?L3FUQllneSs5dk12K05ERlhqUldUeEd5YmxuWnVDUE16bFhEZm8vQUpQRGlw?=
 =?utf-8?B?VTkrakM3bjREL1IveE1ZbGZkSTFlTEQyNUZMcnpCV0wzWktSLyszN2NnNk1o?=
 =?utf-8?B?T1gyaE80UzZkbXVzQy9nZjY0cUEzMEpoNU1iY0ErZmN6UStJRVJQejgxbHBl?=
 =?utf-8?B?d2FVY1ZqM1RJdmRYQzg2NWdkSWI5djBKZFNhUmpwQXVTUHRXdThQcVVWSkhy?=
 =?utf-8?B?YUc4a3F1c3p0K0pOcklISjhuU0NiUXJIbGVTRmdvRUVnNGRLcUF3c1Uya083?=
 =?utf-8?B?czZNVk4yNmFjNWVteldDQUYzMklyTXNTMlhvbjR0QUtMMk53L2d4NXFBaUVV?=
 =?utf-8?B?WUNQUWRRejJackdUQWVhbGxVSVZRWEd4QkhnTmVveWtMWFc3d3UyS2V3MGho?=
 =?utf-8?B?N3hWa3dlRmZmaGZ6TFlsa21yU3VwcFQvNS9yaG9icWlROUE4ZEFXajVUT1p3?=
 =?utf-8?B?bG9TaE1IUmxOQmFaNGFPWVhXMHBDUzVDNHkxRUZ6cEk3SFlRNkNQVWc3UTEx?=
 =?utf-8?B?QnlHa0xVTTlFc09pQkRRVmJ2STNZVFk1bGJvQmd4MHFyVnJRVkdEMmdhQ0tH?=
 =?utf-8?B?Nkc2UTlHdkZLVktqTzQvZWhhaSs5eHlYSytYeDB2YlFqc0RCdXBSSzhGSUpG?=
 =?utf-8?B?Q0Z6bnE1QklHTUpNRnVpRFNWK0dyT0ttS2xRc2V0MDkvNnowc1lOdnl1TmVO?=
 =?utf-8?B?c2txWTE0OTZxeEtDUysxeGdaLzZTcEttV29VVzg5TzU4ZG95TDFMSUh2Q0Ft?=
 =?utf-8?B?dGRLVUs2VVdZVnI3MURwZHRaM2ZrVjZsVHU3eGtmQWJmbEI1aDZ6SGJmeWt1?=
 =?utf-8?B?NzBGVUN0dlhhOXI1SDlMU3diZ3l1OG1lVXlyS282a1Fic1krc2QrQ29Mbm12?=
 =?utf-8?B?TStOQ1o5WjZlOEpISUEvbVBwUWgzb0RXWnh6ZEdaYXhLOXk3SHBFQjZOMTA3?=
 =?utf-8?B?bTRJVThvRkFjUXVQQnhjeDE5VDFRTkJ4OUpXRkIxYjdSZTUwbnB2RGFNZDV1?=
 =?utf-8?B?R3hjaHlqS1YwQVRJMmR3dDdleUduZmdtUUxuVEsxcmtGb3J4bVFpTkpKNml0?=
 =?utf-8?B?d1FqaUF5V2tMQzdWa09UVStaUmxwMGxNbU5IQlVnY2ZjL2w3Q2xsVDZJK1ZE?=
 =?utf-8?B?RUFmTVExcTk2S2pwS2VsOTNEV1RYanVKUm8yUzBuU2xrWlk3SHR0eW02ci9B?=
 =?utf-8?B?VzhqTmpURkNXRTNiNnRRS0NvK1diaDJmZ2NKVGZTMnBaSTBwVzFLZ3F0RXJm?=
 =?utf-8?B?Skc4cnBBUXkxT3d5R0MzVGVJeEw1T29ncllLZnRqaVdRNUxOcHVoODJ6TzBo?=
 =?utf-8?B?dk9oQkFYa2RDMkIyMFdBbGlWOWNIeFdKTFJnZ2hyOW4xczk0U2VXWHJCZ2FC?=
 =?utf-8?B?M0QxbUpKS1VlM3NrQ1MrVEh4ZUdhWDR1L0Jlc1dwN2kwQXc3SUhmdTN0Wnd3?=
 =?utf-8?B?eXJKK2Q5U2dKL3RqNEc3L3ZBNDJVOTNoQjl4RTVsbTkwZS9XdEJuY3VLUUha?=
 =?utf-8?B?REM4bjB4L0R4RXNvNnVzMU5YMWVYL0hRSERSNDBBaG1nUUpMZ1F3ek92cEVE?=
 =?utf-8?B?aU0vVFFJSldKMFZSaDkxZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVE5d3NUeWVUWWxtNWpSK0JaQ1pLMUgybmppVTMzQVJib0xBdE9mNTFrUkdS?=
 =?utf-8?B?cHFjTWdSYnJTSGJsYW40QnhJNmNHOFU3Zkp2VWgwYlFKcEk2ZERwWm9GSW5F?=
 =?utf-8?B?S2pneXFXY1VoaXQ5YThiVUdBbmVWNWhHUlIxWW5rY1lPM1o5VmFiVjZaditC?=
 =?utf-8?B?eUk0RHVhWE1SNFp5OE52OWpVQzVBeGVadGE1QVNWeFFETjNHV2IzVnhBdGty?=
 =?utf-8?B?aG04UVRYRGZaR1NIMFhlbU9ySzB2N2Z2SGtaeXFrNzdpSlJKSW5mS0hYV3Zm?=
 =?utf-8?B?YTlTbDlEK1J6THllOTFYYk5BTVF1SkJkemV2K1lldEZPTlZUUHJMUkN0Y3cy?=
 =?utf-8?B?SXo0WUxBbUZ1TXNhRTAraEliMzNQU0thVG1jSnMybXl1Zjk0SHRZRzNtRCth?=
 =?utf-8?B?SmYwS1FZcU4zVmw1M0RnaHU3cjIwWTAycGRKeHNoZHo2RXI1TkpRL1hKZVRy?=
 =?utf-8?B?UkYydzFiVzI3MHM3Y095V0UzUG5BbjBtc2VqOXJucDMzbEZlU2xhZWYrb1Fv?=
 =?utf-8?B?eFZuOHZzelhXQitKUHhsK2N2ZlEzOTVYWDRrTGFmTHlsRzZIOFNNdzFsK28x?=
 =?utf-8?B?NTloMXV5UFFOcy9GakdYazBIUUQ2VCtGU05oSGhTSTQ5T1ZoMkt3SlF2YktJ?=
 =?utf-8?B?ZFhqNlFaR2k0bjBqbS9Pb0FjdmhkVnNLdklzV0t6SC9tK3VNQ2VrOHFWV0NB?=
 =?utf-8?B?ZEh4OGRpZEtUWiszOGozTUZlenJ6TkF3ZE9BZlJXb3hKdUJnOGl4WEplSTZD?=
 =?utf-8?B?SE42bjVqaDV2eURZeFU1VExMR01VYUk4RlViSFhkUmNkQXdvSW4wNGdBbGlI?=
 =?utf-8?B?OG0yVU9UVHowUEtkYXcwOWl4Q1JzUjllUU9TNExFRzJ1cmI2NHVMWVVudkli?=
 =?utf-8?B?WjZtS3VLOFlPUkNsUXErdDhoaTZLUXdnOEpUWTV1KzVNWDZWM25ZcHAwTGcx?=
 =?utf-8?B?aEU0MUlrb1RxR3V3V0pKK0I2L05OMGJyWDVvMEFwR1MxSlhzeityVmgwVmd3?=
 =?utf-8?B?Y1RaQXdMZEdXS0ZicFZqZm9PLzZSdytrSlA3dG1tMlJCYmN5dlRySmNjeFNv?=
 =?utf-8?B?cnlPenBnN0doUjNVZXhuRFZOUTJwMGUvbEVHZzhxWFBLRERvWWtIRi9zTFVu?=
 =?utf-8?B?UWp0T0Q2enZPZlZROEFZWWROTWJsVzhDNFlVVHRSTU1hS1hNZ0NWcmYxWkpy?=
 =?utf-8?B?YmwyU2FId29sNU82NjlrYzRyQ0VBb1hnSzlNdm43M3VYOUpLSHorMkRTOEF3?=
 =?utf-8?B?eWlCcXAyTDFoUmdOZDlGTk5GTnE3Z0FBbGI0Zkcycm1RTU4zWm1Jc1ZUVDRK?=
 =?utf-8?B?dVovbzkrbkRHREtYMGVMd09lV2pNckVGS044STNOQVZ3RVZnTFBXallFOUlm?=
 =?utf-8?B?ME0rL3dTVkdCS3MxU0RMQjFsZG9scDNDWk5qKzFKQkhiTHgzR1dYV3RKZGhE?=
 =?utf-8?B?U3lpRGFNRUtXMi9Ca0RmdWRzZDNZRy9TODJRZWoxUSt5dnFhWm5RWWVhV0pZ?=
 =?utf-8?B?Ty9lc0orQlR5WDZ6ZThpc2cvRnROMENDc2ZxRDM4c1ZOU1lCNXNMTU02MThr?=
 =?utf-8?B?azgwV0dVR3UycUhXV0tUMXc2ZXlnL3BZbk5mQmQ2Y3JoSDU0WnUyd1d5bWxR?=
 =?utf-8?B?dGUvZFVMcTFiSlZRdVRjb0Q3TUZSWDZ1QWJyRWFwNjhQVzlGOTc5cXVROU95?=
 =?utf-8?B?akxvYTJBcDBCNkJKQTFCZ1MwS1VFd2NyK2RtalRkS0Z0SmRJNXNnYXExYkhW?=
 =?utf-8?B?RjY2TE0rMzBQQVVEcWdzaXk1VmVCSVhoa2RZQU4vNmdmSU0rdU9aTmUrRGZr?=
 =?utf-8?B?SDF6NFJ4b2QwSDRYSVg4ckkxd0JMV3FXWkNad3Y0VGhBVDJ2dWFzbS9NWC9o?=
 =?utf-8?B?UHVHTWxiaHZuOFJJb0JDL3RvWWZxZEYweERBNmdMekVjUXlRbWFqelhrS2tY?=
 =?utf-8?B?SWpQdURWQ1RvMHdZaHNSZ2o0TzJGOW9Gb1hIa1dDR0J4M1FQZE9aSEpQL3Np?=
 =?utf-8?B?OFJpWkhqTUNyUXU5NVorM0g3YzdreEE4UnpwRG5kMmt2TDJmOFk0S0pkSjlE?=
 =?utf-8?B?WHRRTng4b2ErczNKdlBMY2ZTRVgxajN2R0ZGcS9pZGh3bjUyOGRKcWpnY3I2?=
 =?utf-8?Q?IylU=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcecab8-70fd-4bae-7bcf-08dcddceabef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 01:58:09.6920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7PWdu4hfwCzToorAZSsf/32vSATiHCGX5G9yDGqk9UfvxtX6e9NzsThNKBDTKHmS0Mg+oD+/AoKPkPI5NeoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1953
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgVGVycnksDQoNCjEuIFBlciBvdXIgdGVzdGluZywgUG9seSBoZWFkc2V0IHdpbGwgbWFpbnRh
aW4gTXV0ZSBzdGF0dXMgYXQgaGVhZHNldCBzaWRlLCB3aGF0ZXZlciBob3N0IHNlbmQgZmVlZGJh
Y2sgb3Igbm90Lg0KMi4gTXV0ZSBsZWQgaXMgb2ZmIHdoZW4gUG9seSBVU0IgaGVhZHNldCBjb25u
ZWN0IHRvIGhvc3QsIHNvIGhvc3Qgd2lsbCBrZWVwIHNhbWUgTXV0ZSBzdGF0dXMgd2l0aCBoZWFk
c2V0IGJlY2F1c2Ugb2YgdG9nZ2xlIE11dGUga2V5IGV2ZW50Lg0KMy4gRXZlbiBVYnVudHUgYW5k
IENocm9tZWJvb2tzIGhhdmUgdG8gZmVlZGJhY2sgUG9seSBoZWFkc2V0IG11dGUgc3RhdGUsIGl0
IHNob3VsZCBiZSBkb25lIGF0IHVzZXIgc3BhY2UgaW5zdGVhZCBvZiBrZXJuZWwuIFRoZSBwcmVj
b25kaXRpb24gaXMga2VybmVsIHNob3VsZCByZXBvcnQgTXV0ZSBrZXkgZXZlbnQgZmlyc3QsIHRo
ZW4gdXNlciBzcGFjZSBoYXMgY2hhbmNlIHRvIGRvIHRoaXMga2luZCBvZiBpbXByb3ZlbWVudCBp
biBmdXR1cmUNCg0KU28gZm9sbG93aW5nIHN0YW5kYXJkIEhJRCBydWxlIGlzIG5lY2Vzc2FyeS4N
Cg0KQlRXLCBvbiBNU0ZUIFdpbmRvd3MsIEFmdGVyIHJlY2VpdmUgbXV0ZSBrZXksIHRoZSBob3N0
IHN3aXRjaCB0aGUgbXV0ZSBjb250cm9sIHN0YXR1cyBvZiB0aGUgYXVkaW8gY29udHJvbCBpbnRl
cmZhY2UsIHdoYXRldmVyIG11dGUgc3RhdHVzIGluIGhlYWRzZXQgRlcgaXMgY29ycmVjdCBvciBu
b3QuIEkgdGhpbmsgaXQgbWFrZSBzZW5zZSB0aGFuIExFRCBwYWdlIG11dGUgTEVELg0KDQpUaGFu
a3MsDQpXYWRlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUZXJyeSBKdW5n
ZSA8bGludXhoaWRAY29zbWljZ2l6bW9zeXN0ZW1zLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIFNl
cHRlbWJlciAyNSwgMjAyNCAxMTozMiBBTQ0KVG86IFdhbmcsIFdhZGUgPHdhZGUud2FuZ0BocC5j
b20+OyBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCkNjOiBqaWtvc0Br
ZXJuZWwub3JnOyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hd
IEhJRDogcGxhbnRyb25pY3M6IFVwZGF0ZSB0byBtYXAgbWljbXV0ZSBjb250cm9scw0KDQpDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbA0KDQpIaSBXYWRlLA0KDQpJIHJldGlyZWQgZnJvbSBQbGFudHJv
bmljcyBpbiAyMDIwLiBUaGUgb3JpZ2luYWwgZHJpdmVyIGRpZCBub3QgYWxsb3cgbXV0ZSBidXR0
b24gdG8gYmUgbWFwcGVkIGFzIHRoZXJlIHdlcmUgbXV0ZSBzeW5jaHJvbml6YXRpb24gaXNzdWVz
Lg0KDQpUaGUgaGVhZHNldCBuZWVkcyB0byByZWNlaXZlIHNvbWUgdHlwZSBvZiBmZWVkYmFjayBm
cm9tIHRoZSBob3N0IHdoZW4gaXQgc2VuZHMgdGhlIG11dGUgZXZlbnQgaW4gb3JkZXIgdG8gc3lu
Y2hyb25pemUgd2l0aCB0aGUgaG9zdCwgaWRlYWxseSB0aGUgaG9zdCBzZXR0aW5nIG9yIGNsZWFy
aW5nIHRoZSBtdXRlIGNvbnRyb2wgaW4gdGhlIGF1ZGlvIGNvbnRyb2wgaW50ZXJmYWNlIGJ1dCBz
ZXR0aW5nL2NsZWFyaW5nIHRoZSBtdXRlIExFRCB3b3VsZCBhbHNvIHdvcmsuDQoNCkF0IHRoZSB0
aW1lIFVidW50dSBhbmQgQ2hyb21lYm9va3MgZGlkIG5vdCBmZWVkYmFjayBtdXRlIHN0YXRlIGFu
ZCBpdCB3YXMgcG9zc2libGUgdG8gbXV0ZSBmcm9tIHRoZSBoZWFkc2V0IGFuZCB0aGVuIHVubXV0
ZSBmcm9tIHRoZSBtaXhlciBvciBrZXlib2FyZCBhbmQgdGhlIGhlYWRzZXQgd291bGQgc3RheSBt
dXRlZC4gVGhlIG9ubHkgd2F5IHRvIHVubXV0ZSB3YXMgd2l0aCB0aGUgaGVhZHNldCBidXR0b24u
IFRoaXMgd2FzIGFuIHVuYWNjZXB0YWJsZSB1c2VyIGV4cGVyaWVuY2Ugc28gd2UgYmxvY2tlZCBt
YXBwaW5nLg0KDQpJZiB5b3Ugd2FudCB0byB0cnkgbWFwcGluZyBtdXRlIGV2ZW50IHRoZW4geW91
IGFsc28gbmVlZCB0byBhbGxvdyBtYXBwaW5nIHRoZSBtdXRlIExFRCBmb3IgcG9zc2libGUgaG9z
dCBmZWVkYmFjay4NCg0KKEhJRF9VUF9URUxFUEhPTlkgfCAweDJmKSBpcyB0ZWxlcGhvbnkgcGFn
ZSBtdXRlIGJ1dHRvbiAoSElEX1VQX0xFRCB8IDB4MDkpIGlzIExFRCBwYWdlIG11dGUgTEVEDQoN
ClRoZW4geW91IG5lZWQgdG8gdGVzdCBtb3JlIHRoYW4ganVzdCB0aGUgZXZlbnQgZ2V0dGluZyB0
byB1c2VyIHNwYWNlLg0KWW91IG5lZWQgdG8gY2hlY2sgbXV0ZSBzeW5jaHJvbml6YXRpb24gd2l0
aCB0aGUgaG9zdCBtaXhlciB1bmRlciBhbGwgbXV0ZS91bm11dGUgdXNlIGNhc2VzLg0KDQpSZWdh
cmRzLA0KVGVycnkgSnVuZ2UNCg0KDQpPbiA5LzI0LzI0IDI6MDAgQU0sIFdhbmcsIFdhZGUgd3Jv
dGU6DQo+IEhpIEJlbmphbWluIGFuZCBHcmVnLA0KPg0KPiBNYXkgSSBrbm93IHRoZSByZXZpZXcg
cHJvZ3Jlc3MgYW5kIGFueXRoaW5nIEkgbmVlZCB0byBjaGFuZ2U/IFRoYW5rcw0KPg0KPiBSZWdh
cmRzDQo+IFdhZGUNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2Fu
ZywgV2FkZQ0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNiwgMjAyNCA0OjEzIFBNDQo+IFRv
OiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCj4gQ2M6IGppa29zQGtl
cm5lbC5vcmc7IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUkU6IFtQ
QVRDSF0gSElEOiBwbGFudHJvbmljczogVXBkYXRlIHRvIG1hcCBtaWNtdXRlIGNvbnRyb2xzDQo+
DQo+IEhpIEJlbmphbWluLA0KPg0KPiBUaGlzIHBhdGNoIGlzIGZvciBhbGwgUG9seSBIUyBkZXZp
Y2VzLCBhbmQgaXQgZG9lcyBub3QgZGVwZW5kcyBvbiBvdGhlciBwYXRjaGVzLCBpdCBjYW4gYXBw
bHkgZGlyZWN0bHkgYnkgIiBnaXQgYW0gLTMiLg0KPg0KPiBXaXRoIHRoaXMgcGF0Y2gsIE1pY011
dGUgYnV0dG9uIGtleSBldmVudCB3aWxsIGJlIHNlbmQgdG8gdXNlciBzcGFjZSwgSSBoYXZlIHRl
c3RlZCBvbiB0aGUgYmVsb3cgUG9seSBkZXZpY2VzOg0KPiAgICAgICAgICBQbGFudHJvbmljcyBF
bmNvcmVQcm8gNTAwIFNlcmllcw0KPiAgICAgICAgICBQbGFudHJvbmljcyBCbGFja3dpcmVfMzMy
NSBTZXJpZXMNCj4gICAgICAgICAgUG9seSBWb3lhZ2VyIDQzMjAgSFMgKyBCVDcwMCBEb25nbGUN
Cj4NCj4gUmVnYXJkcw0KPiBXYWRlDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPg0KPiBTZW50OiBG
cmlkYXksIFNlcHRlbWJlciAxMywgMjAyNCAxMDowNCBQTQ0KPiBUbzogV2FuZywgV2FkZSA8d2Fk
ZS53YW5nQGhwLmNvbT4NCj4gQ2M6IGppa29zQGtlcm5lbC5vcmc7IGxpbnV4LWlucHV0QHZnZXIu
a2VybmVsLm9yZzsgDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gSElEOiBwbGFudHJvbmljczogVXBk
YXRlIHRvIG1hcCBtaWNtdXRlIGNvbnRyb2xzDQo+DQo+IENBVVRJT046IEV4dGVybmFsIEVtYWls
DQo+DQo+IE9uIFNlcCAxMyAyMDI0LCBXYWRlIFdhbmcgd3JvdGU6DQo+PiB0ZWxlcGhvbnkgcGFn
ZSBvZiBQbGFudHJvbmljcyBoZWFkc2V0IGlzIGlnbm9yZWQgY3VycmVudGx5LCBpdCBjYXVzZWQg
DQo+PiBtaWNtdXRlIGJ1dHRvbiBubyBmdW5jdGlvbiwgTm93IGZvbGxvdyBuYXRpdmUgSElEIGtl
eSBtYXBwaW5nIGZvciANCj4+IHRlbGVwaG9ueSBwYWdlIG1hcCwgdGVsZXBob255IG1pY211dGUg
a2V5IGlzIGVuYWJsZWQgYnkgZGVmYXVsdA0KPg0KPiBGb3Igd2hpY2ggZGV2aWNlcyB0aGlzIHBh
dGNoIGlzIHJlcXVpcmVkPyBJcyBpdCByZWxhdGVkIHRvIHRoZSBvdGhlciBwYXRjaCB5b3Ugc2Vu
dCB0b2RheT8gSWYgc28gcGxlYXNlIG1ha2UgYSBtZW50aW9uIG9mIHRoZSBjb25jZXJuZWQgZGV2
aWNlcyBhbmQgbWFrZSBzdXJlIGJvdGggcGF0Y2hlcyBhcmUgc2VudCBpbiBhIHNpbmdsZSB2MyBz
ZXJpZXMuDQo+DQo+IEFsc28sIGhhdmUgeW91IHRlc3RlZCB0aGlzIGNoYW5nZSB3aXRoIG90aGVy
IFBsYW50cm9uaWNzIGhlYWRzZXRzPyBXaGVyZSB0aGVyZSBhbnkgY2hhbmdlcyBpbiBiZWhhdmlv
ciBmcm9tIHRoZW0/DQo+DQo+IENoZWVycywNCj4gQmVuamFtaW4NCj4NCj4+DQo+PiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPj4gU2lnbmVkLW9mZi1ieTogV2FkZSBXYW5nIDx3YWRlLndh
bmdAaHAuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvaGlkL2hpZC1wbGFudHJvbmljcy5jIHwg
NCArKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1wbGFudHJvbmljcy5jIA0K
Pj4gYi9kcml2ZXJzL2hpZC9oaWQtcGxhbnRyb25pY3MuYyBpbmRleCAyYTE5ZjM2NDZlY2IuLjJk
MTc1MzRmY2U2MQ0KPj4gMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2hpZC9oaWQtcGxhbnRyb25p
Y3MuYw0KPj4gKysrIGIvZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMNCj4+IEBAIC03Nywx
MCArNzcsMTAgQEAgc3RhdGljIGludCBwbGFudHJvbmljc19pbnB1dF9tYXBwaW5nKHN0cnVjdCBo
aWRfZGV2aWNlICpoZGV2LA0KPj4gICAgICAgICAgICAgICAgfQ0KPj4gICAgICAgIH0NCj4+ICAg
ICAgICAvKiBoYW5kbGUgc3RhbmRhcmQgdHlwZXMgLSBwbHRfdHlwZSBpcyAweGZmYTB1dXV1IG9y
IDB4ZmZhMnV1dXUgKi8NCj4+IC0gICAgIC8qICdiYXNpYyB0ZWxlcGhvbnkgY29tcGxpYW50JyAt
IGFsbG93IGRlZmF1bHQgY29uc3VtZXIgcGFnZSBtYXAgKi8NCj4+ICsgICAgIC8qICdiYXNpYyB0
ZWxlcGhvbnkgY29tcGxpYW50JyAtIGFsbG93IGRlZmF1bHQgY29uc3VtZXIgJiANCj4+ICsgdGVs
ZXBob255IHBhZ2UgbWFwICovDQo+PiAgICAgICAgZWxzZSBpZiAoKHBsdF90eXBlICYgSElEX1VT
QUdFKSA+PSBQTFRfQkFTSUNfVEVMRVBIT05ZICYmDQo+PiAgICAgICAgICAgICAgICAgKHBsdF90
eXBlICYgSElEX1VTQUdFKSAhPSBQTFRfQkFTSUNfRVhDRVBUSU9OKSB7DQo+PiAtICAgICAgICAg
ICAgIGlmIChQTFRfQUxMT1dfQ09OU1VNRVIpDQo+PiArICAgICAgICAgICAgIGlmIChQTFRfQUxM
T1dfQ09OU1VNRVIgfHwgKHVzYWdlLT5oaWQgJiBISURfVVNBR0VfUEFHRSkgDQo+PiArID09IEhJ
RF9VUF9URUxFUEhPTlkpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZGVmYXVsdGVk
Ow0KPj4gICAgICAgIH0NCj4+ICAgICAgICAvKiBub3QgJ2Jhc2ljIHRlbGVwaG9ueScgLSBhcHBs
eSBsZWdhY3kgbWFwcGluZyAqLw0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4NCj4NCg0K


