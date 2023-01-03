Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3262265BC6B
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 09:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjACIp2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 03:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbjACIpV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 03:45:21 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46605F68
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 00:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1672735517; x=1704271517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KIHLx2aEfvqAnajUDo9z74z7gZSt8OpYuscqJ33xd1M=;
  b=F2r5ynDxBcpEzZha2lEWX0FryvoAer5O3JFubimQNMsi8DWVTMYvYUFl
   A3hbQPa+Jf780RUrsIbZEXIyFhh/SWG9CPsLD9d7Lu6pqkOm1bPOwFbgG
   8yZzavqf699HTXum8GkGWMh4W4bHEF9Sq2bBMWI3/00339elnyJuUbGfp
   /HrE1BjcyWQ/U7FGoLttTvdg6m+x/bfFNwo8xUOxusfcO6x7lK3et5nB2
   4q/MC4EUCBtSwOrzO8nM/j6UbiZiXc+McwYRoxYWONi9D7EeZkiOuF8vm
   dFFNWN6ouxkfPky4oVOEcpfcZtXXw1GXUzw+Vk+d9wcJkK7aqAVhk1mzG
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="130537681"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2023 01:45:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 01:45:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 01:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl/bvnVzS4gNjUlINconyLbhV2Kl4U+G9ohwUVBN0BbHi9kQqhlW0veklBDeljfFqFLhZ6rgPtk41icZnRHnqiFlj1Vu+xXU6xQzTLXN6P6h3iNkkK3URoXMmiwIrmyzyVoo7FeK2KvkXI4yKq0sQT4K6zGcEtt8lpgxHZqUEAJoTsCCCYTRvzd5skDlm3W9kW1Rcy0ozcJlFpfeznS6UPYU45LTRhgWnIs7q0uJOvfJ3qIY+M4yernAQQwk4n5fASfVQeFADzDYJ8lZ0GOmJAcJXvFf/q+VJFn9r+ZWCoGIiEh/9mdUVKdmvXvWJJ7va6/4yzeoM9Z2MKXZ/peb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIHLx2aEfvqAnajUDo9z74z7gZSt8OpYuscqJ33xd1M=;
 b=mTp+OfpYg7dFKlNtGzy+5tq7CjxTGo4qdQSjF+g4vK7Dn8KtUkpLpQEo3DmtVejdvdtsCIHT+K7yyBgbkEu/IgCMDBDSkSyVRvbwYF1Eze/UMBe9XkV4EoUutU2Ty1YKXyb21mgWX/wjSJ3/LcGEvOkFmZ8fd4RsnlzbqDwKZ7NK+qt4KJ107EE6YCcRlqwtIowoev/z8sU+8i9XW/8G/g9RtyGTp859zP7aUmxeBgigrYzRXVLb0LID6dT1/YblHC0hP+BauPwIPEkqiuh3WlZgm0HCOcZdKxMKG1Xdc4BDj024rZ4sdWr//7gT9WkUNQEa4+kfC30WfCqPW9Speg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIHLx2aEfvqAnajUDo9z74z7gZSt8OpYuscqJ33xd1M=;
 b=L7NhrM8vlKrXvgvmX84rY99wJQmytSgoWX0kyL9KYdqEM+VwEpHNXFaShL8pzlWB9KHjZVvlXbXOJrekCn0+QIMlN7rBSspMKKD+b5JzAzy69vl24eumNOzJc8I4i9Y9RDfaq6YiHi0wul2KQd7Nx1nWMYzpzNCyGjP7rSumuGU=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 08:45:14 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::108f:e428:de3e:8baf]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::108f:e428:de3e:8baf%3]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 08:45:14 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <jic23@kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>
CC:     <Jonathan.Cameron@huawei.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 33/69] Input: atmel_mxt_ts - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Thread-Topic: [PATCH 33/69] Input: atmel_mxt_ts - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Thread-Index: AQHZH0+yQPHZO+MM702kpEH+0e1Etg==
Date:   Tue, 3 Jan 2023 08:45:14 +0000
Message-ID: <6c867016-4d59-e593-bab3-6fbd5ce69f76@microchip.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-34-jic23@kernel.org>
In-Reply-To: <20230102181842.718010-34-jic23@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB5210:EE_
x-ms-office365-filtering-correlation-id: 6f76a3a1-7041-4c4f-c90d-08daed66d4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oerz+Z2ECN/Bgj3Jwkk98kfdVzKEYEvyQqyE6sd/guHu9q2mqp5XivTxWp9PjFyWNfoS9Cd3ZBzJie/8ODlEe5AdE+13Oe/gJwyWgDMEUmZHTaUqerbdPgZa/5M2PZ0hCzoVszdrtJSSmj4fHTs7E5zrrO9p3+PZPGmDnPb+GyWh/TcfIsdUr9x1+DWhhQivHKpeJSPW8nZO88ucIwS4/y66RB33mSfrkgO+iGFSXt8095t8fkewihCaWM8hXKV3Jt7Iuwh0+yzO/6pTvXEYpamGFBu6urlMLf+j8HLLXc2APV0qKgtid91/h7GlKxkZL5GzX5JiC1lDVhF96+T1xF4oNMlVKgmptobNVkLBbcapRqPe+d/Xql8wZqnJfPwh1OK2vLwYXLD9YXKuPCzT5urzE0Br5rg1WOBqQUot8cKkGIBfrtNH8bXIyfNm4E3cxjqL/jqmtp70iM8kmVksfjcNRlo4aifuQYVfikmCVGAowKDzny524yF2ID2cm5OxPRop4oveUPqV5pP+9SxysHAnymi7xu9d21CK0OAFFXdrD8ne2GNTndOnX9vmM7lCuTxd9d8RNWlIeGr7C/9kOMyVEVm2v9zYMzWCqaMYnKq60skbUrBBIWHAjrZCxKOtB4Hkvr4sgpVwG1XAXVmJM4YKDrjVtpyoAW93m0Hum5YlFKU+9i27N3T51JbgYdNn0XhWbbaGtg4QPZRRbydXCthpDNXadX6zqeza9I5k/lAUfqgo27qlAv4oXNw+WHyd37lriqLW7B0HgKnzvXQA3BARHw1L1X5o37XL2bgf7PM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(53546011)(6506007)(478600001)(122000001)(31686004)(38100700002)(6512007)(36756003)(71200400001)(6486002)(26005)(186003)(2906002)(110136005)(2616005)(54906003)(38070700005)(316002)(66556008)(66446008)(8676002)(66476007)(76116006)(8936002)(66946007)(83380400001)(5660300002)(91956017)(31696002)(41300700001)(86362001)(64756008)(4326008)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE5CdHkwbStPb2FDOTlpZVBUS09kVXNJdjQyM0tIMXF0YU9ONkZYTjRyQ29O?=
 =?utf-8?B?ZmlCTXdWMlVMRG54TlpLNU43VFZhR2taY3V3VWZYMm5velo3dHVjR1VZSXow?=
 =?utf-8?B?WVROOUJKWGQxTVlLYlgxWm5HVzBDWVoybGV6U2EwWjFDWE4weGRNbE5icnRu?=
 =?utf-8?B?TjZMMjdsb1dhRDZmTnpXeWY4QndTV1BUSG9jSEt6ZWtScUNONEFiY2N0Q3cx?=
 =?utf-8?B?emlBSE5UQVBKZWx0YVhVaDRqQ1dQV0tLTEVNSmhjWXhzeWxPaHk4M0tBNWVZ?=
 =?utf-8?B?VENPMklPRUhlM3ZWbE04bWpUWHI4UXVYc3A0bXZpNkE0R01PMVUxaGZaK2U4?=
 =?utf-8?B?dHl3UjA0ZG51aXRkZ1lKei9YRW0rM0ZPUWcwcGJld0JwU1dGOUlpWm1yR1VG?=
 =?utf-8?B?Vi96QVljWlJRWUI2OHRxQ2R1dXVGR0VsZTZIT0JvcE5ZdkhReTVmS3FuU3hK?=
 =?utf-8?B?Vm5YaXBWUm9DcWhHcitJUUxybHNyWm9nZ3duNGtEY1Q2ejhhc1V5TVZ2a0ta?=
 =?utf-8?B?UGxyelZrNTV5eEsrY1dwTDFKU1VqeC9BYjkza3ozWjVGMTE1eVhaUEt1eEJa?=
 =?utf-8?B?RXhYdkxFKzREYXpTV3VlWG96dUs4Zkl4WXczaWxhRWpyMk5GaVRDQmhXOHVR?=
 =?utf-8?B?MEcrQTU1TmhLc1FlbUhtSVNhODI4RFZiTXhVOEJYcnFWam1YYllONTVKK2k3?=
 =?utf-8?B?SnlDRUJibSt6cGR4WXJCQzN4N3pLUjlPZy9zY0xqWFVHSFVRZ0xtdVdIWnZk?=
 =?utf-8?B?b0txckNjOHFDQVVkVFFCTy9DSGY4bDFaUmFqQTRTNUZ4aGlCa2ZSR20wWWZR?=
 =?utf-8?B?dDJqQWVJMWxXd0hYY2dETmV6QWFRZTJzRVA5UXdmYlZ3eWIvSGM3d1Blcnhn?=
 =?utf-8?B?WWIzdTZvSG9aK3JuRmNvZk5ZTXowcC9ycTBEcEY2ckNYYUM2SUg5cXAvck8x?=
 =?utf-8?B?Q2xHZmwxQW5HTWUvcjNZemI0Vk92dU1ROVkvWUM0RzY0eUFyYlgvVXNueitm?=
 =?utf-8?B?QXlaQ3BwTEwwbWVxRERJMExheXZ5enZGOU5DbWFaeXhtRmRiZVI1dXIrUTJY?=
 =?utf-8?B?YW91TTFEdC9xUERkWkd1d0t4dHhpTXE0YXk5ZU94ai9MMnRvNDhDV3dqVEFW?=
 =?utf-8?B?WG5vRXBBU25ubEUra2ZNRk5pUE83ZVJkaWk0M1J6L3AvNkx2V3BNUkM5YUNQ?=
 =?utf-8?B?TmwzQ1RMYnh5bThPK0txVEZQS1RGNEY0aEFSWEg2OHZoYnJPaElPQmoyWWpq?=
 =?utf-8?B?T1BOZS9yWFcyUW1CZ3NSMVlPcHlJRnpKMnNlUWpybmZ3WUFrV1QrNDl1MzFG?=
 =?utf-8?B?ZVFuMFczWFhwdWl4ajBDd3V0djNlNnpsQmNydWhKdEJWNm5iNDdWM0NxeEVF?=
 =?utf-8?B?MUZ6OFB4aTJSS0xKRHVYV0dRZisxbjgyblJGUWl5dXEydzRTc0pXWGIrejA3?=
 =?utf-8?B?aDkyaGhkcUg2THVsRE1XQzNUSWZPSmF3ODVvd241MWFvQWYyS3NPbWJiRjBy?=
 =?utf-8?B?SWNFSy9WY0ZOak5SUU5uWC9SWVJhT2pjV1hmYzViOEt1UDRXMGdLZ3NpSThW?=
 =?utf-8?B?Z01uTCthckVXVWYrS21FN3ZtaXFkZHJzVmVSQnJqcTBBU0Z3VU5SUncrVEZV?=
 =?utf-8?B?dHVhdXN2RWxUNERMdUJJak5zVVFQVGpONk5TVk01c3ZsUUtXTDVnNDZybHgy?=
 =?utf-8?B?eDNXZVRhYzRSK2RjL0xad3VESVJMdUdLbXRGRmQ1V3hEOTFuNHhWdDlVQTZG?=
 =?utf-8?B?N2JOdnBwSDBaYXlOTzRKSnVrV0hmTjBFb01NTlNlNWZ4em9nMkFZN1ovNE9s?=
 =?utf-8?B?STFocm1IZGcvNXIxQkt2T0xIRjNabHFZSERVMUhTZHRNZHh6bmVZSFdvT0JP?=
 =?utf-8?B?ditPQWNyRWE4V1ByMC8wUDJwaVlQZU9KSWpFcDk3MmhtYlRFZFdJcWR2WDAv?=
 =?utf-8?B?YUpEVWN5ZUNyR0wxRnp6TXp5RGZ2TUJES3BmNTVWZS9tWWI0eGtCRzRjU1JG?=
 =?utf-8?B?Vy9jK2pRTzhDdDE5YS81SHhLSGRBOXdSYjU0VHlOaUVUTDRhZnIrKzRlQ1Rw?=
 =?utf-8?B?cHN5MUxuTEFnNlM5QTE2b0k1YXJQUnNLNEVaY1V1b25aMytLekJGakZyUm5p?=
 =?utf-8?Q?/gvCdEpE/6IzcXM2RdF9ZDoiT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B44E94BC197E24EA7E84F27FD627AA0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f76a3a1-7041-4c4f-c90d-08daed66d4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 08:45:14.1046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qKa87079aChTaEg1qTBGatbaKRkxAEERpoFJl9Dl6hhz5HP72CnfkygPaRpBkJmFqBX97t7bHjZtpp4iqM5YgQNE3UP0ueo/GMu2swzZWmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMDIuMDEuMjAyMyAyMDoxOCwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBGcm9tOiBKb25hdGhhbiBDYW1lcm9uIDxK
b25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+DQo+IA0KPiBTSU1QTEVfREVWX1BNX09QUygpIGlz
IGRlcHJlY2F0ZWQgYXMgaXQgcmVxdWlyZXMgZXhwbGljaXQgcHJvdGVjdGlvbg0KPiBhZ2FpbnN0
IHVudXNlZCBmdW5jdGlvbiB3YXJuaW5ncy4gIFRoZSBuZXcgY29tYmluYXRpb24gb2YgcG1fc2xl
ZXBfcHRyKCkNCj4gYW5kIERFRklORV9TSU1QTEVfREVWX1BNX09QUygpIGFsbG93cyB0aGUgY29t
cGlsZXIgdG8gc2VlIHRoZSBmdW5jdGlvbnMsDQo+IHRodXMgc3VwcHJlc3NpbmcgdGhlIHdhcm5p
bmcsIGJ1dCBzdGlsbCBhbGxvd2luZyB0aGUgdW51c2VkIGNvZGUgdG8gYmUNCj4gcmVtb3ZlZC4g
VGh1cyBhbHNvIGRyb3AgdGhlIF9fbWF5YmVfdW51c2VkIG1hcmtpbmdzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPg0K
PiBDYzogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPg0KPiBDYzog
QWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiBDYzog
Q2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNClJldmlld2Vk
LWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KDQo+
IC0tLQ0KPiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9hdG1lbF9teHRfdHMuYyB8IDggKysr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9hdG1lbF9teHRf
dHMuYyBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vYXRtZWxfbXh0X3RzLmMNCj4gaW5kZXgg
MzllZjI2NjRiODUyLi45OTZiZjQzNGUxY2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaW5wdXQv
dG91Y2hzY3JlZW4vYXRtZWxfbXh0X3RzLmMNCj4gKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNj
cmVlbi9hdG1lbF9teHRfdHMuYw0KPiBAQCAtMzI5Niw3ICszMjk2LDcgQEAgc3RhdGljIHZvaWQg
bXh0X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGF0YS0+cmVndWxhdG9ycyk7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBteHRfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICtzdGF0
aWMgaW50IG14dF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4gICAgICAgICBz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOw0KPiAgICAgICAg
IHN0cnVjdCBteHRfZGF0YSAqZGF0YSA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KPiBA
QCAtMzMxNyw3ICszMzE3LDcgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBteHRfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAt
c3RhdGljIGludCBfX21heWJlX3VudXNlZCBteHRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3N0YXRpYyBpbnQgbXh0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAg
ICAgICAgc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsNCj4g
ICAgICAgICBzdHJ1Y3QgbXh0X2RhdGEgKmRhdGEgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50
KTsNCj4gQEAgLTMzMzgsNyArMzMzOCw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgbXh0
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+
IA0KPiAtc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG14dF9wbV9vcHMsIG14dF9zdXNwZW5kLCBt
eHRfcmVzdW1lKTsNCj4gK3N0YXRpYyBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMobXh0X3BtX29w
cywgbXh0X3N1c3BlbmQsIG14dF9yZXN1bWUpOw0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG14dF9vZl9tYXRjaFtdID0gew0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAiYXRtZWwsbWF4dG91Y2giLCB9LA0KPiBAQCAtMzM3NSw3ICszMzc1LDcgQEAgc3RhdGljIHN0
cnVjdCBpMmNfZHJpdmVyIG14dF9kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAubmFtZSAg
ID0gImF0bWVsX214dF90cyIsDQo+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBt
eHRfb2ZfbWF0Y2gsDQo+ICAgICAgICAgICAgICAgICAuYWNwaV9tYXRjaF90YWJsZSA9IEFDUElf
UFRSKG14dF9hY3BpX2lkKSwNCj4gLSAgICAgICAgICAgICAgIC5wbSAgICAgPSAmbXh0X3BtX29w
cywNCj4gKyAgICAgICAgICAgICAgIC5wbSAgICAgPSBwbV9zbGVlcF9wdHIoJm14dF9wbV9vcHMp
LA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgLnByb2JlX25ldyAgICAgID0gbXh0X3Byb2JlLA0K
PiAgICAgICAgIC5yZW1vdmUgICAgICAgICA9IG14dF9yZW1vdmUsDQo+IC0tDQo+IDIuMzkuMA0K
PiANCg0K
