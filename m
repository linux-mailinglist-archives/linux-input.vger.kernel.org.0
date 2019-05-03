Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF79312DC6
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 14:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfECMi2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 08:38:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54126 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726897AbfECMi2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 May 2019 08:38:28 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x43CVS2i019686;
        Fri, 3 May 2019 14:38:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=t5B/k6DcvEiPCvE4nzBubHjNwGreSV6jE6kdibWLQUo=;
 b=uiafQAY1KcThaMm27J4dDuyLkuUsVLptk6S6tMQ6hFqFGDMjDXFJzLMB2eY25MtOQjOt
 AJY4SGIk36CXejwafcW2uJD7eSMdqxiuMxrVprFunZIZTE7FL8CDvCcPq8me04jZEcwB
 WW8yj8wXuaYX6TEKr6/0MjUm97JFQyJgfQjVGcLCwjz8PHbkAUeDXTSFQdugHG6Q4YtW
 05vqr7XUDvZCBzAMX4VZXunUFXO8IT1ewu6bl0eGz/j7efKideweDyE+TyG6/V7eLPhH
 KDCPYgLs3onIr2Lx6MWrBtM+QMOuiED3qYT4xKOMS18m07PeHy7l/hOZH0TSF0czHLmG Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xgcxagj-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 03 May 2019 14:38:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AD9231;
        Fri,  3 May 2019 12:38:19 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D6FB2694;
        Fri,  3 May 2019 12:38:19 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 May
 2019 14:38:19 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Fri, 3 May 2019 14:38:19 +0200
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: rmi: fix devm_add_action_or_reset() parameter
Thread-Topic: [PATCH] HID: rmi: fix devm_add_action_or_reset() parameter
Thread-Index: AQHU8S7fRB6FaRWwPkiJMQUZLJpqJqZZUPiAgAAFTYA=
Date:   Fri, 3 May 2019 12:38:18 +0000
Message-ID: <9628edde-5270-d5a5-7db6-c9ec3f47c742@st.com>
References: <1555073657-24386-1-git-send-email-fabien.dessenne@st.com>
 <nycvar.YFH.7.76.1905031418510.10635@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1905031418510.10635@cbobk.fhfr.pm>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C93354F4F1B5C4394EE04057F7F1250@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-03_06:,,
 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpPbiAwMy8wNS8yMDE5IDI6MTkgUE0sIEppcmkgS29zaW5hIHdyb3RlOg0KPiBPbiBGcmksIDEy
IEFwciAyMDE5LCBGYWJpZW4gRGVzc2VubmUgd3JvdGU6DQo+DQo+PiBUaGUgc2Vjb25kIHBhcmFt
ZXRlciBvZiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBzaGFsbCBiZSBhIGZ1bmN0aW9uLA0K
Pj4gbm90IGEgZnVuY3Rpb24gYWRkcmVzcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4g
RGVzc2VubmUgPGZhYmllbi5kZXNzZW5uZUBzdC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9o
aWQvaGlkLXJtaS5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLXJtaS5j
IGIvZHJpdmVycy9oaWQvaGlkLXJtaS5jDQo+PiBpbmRleCA5ZTMzMTY1Li44NzQ4ZDRkIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9oaWQvaGlkLXJtaS5jDQo+PiArKysgYi9kcml2ZXJzL2hpZC9o
aWQtcm1pLmMNCj4+IEBAIC02MjMsNyArNjIzLDcgQEAgc3RhdGljIGludCBybWlfc2V0dXBfaXJx
X2RvbWFpbihzdHJ1Y3QgaGlkX2RldmljZSAqaGRldikNCj4+ICAgCWlmICghaGRhdGEtPmRvbWFp
bikNCj4+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4+ICAgDQo+PiAtCXJldCA9IGRldm1fYWRkX2Fj
dGlvbl9vcl9yZXNldCgmaGRldi0+ZGV2LCAmcm1pX2lycV90ZWFyZG93biwgaGRhdGEpOw0KPj4g
KwlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJmhkZXYtPmRldiwgcm1pX2lycV90ZWFy
ZG93biwgaGRhdGEpOw0KPiBXaHkgZG8geW91IHRoaW5rIHRoaXMgaXMgd3JvbmcgQz8NCg0KDQpC
ZWNhdXNlIEkgd2FzIG5vdCBhd2FyZSB0aGF0IGJvdGggZnVuYyBhbmQgJmZ1bmMgcmVmZXIgdG8g
dGhlIHNhbWUgDQpmdW5jdGlvbiBwb2ludGVyLg0KDQpOb3cgSSBrbm93IDopDQoNCg0KPg==
