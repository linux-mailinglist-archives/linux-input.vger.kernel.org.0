Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EE7261260
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 16:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgIHOJ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 10:09:28 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:9127 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729642AbgIHN6d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 09:58:33 -0400
X-UUID: 7452759587824b3d8d3fe1f5ec98c1d7-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vqJfUyZ61K5wUVep/8CK7J7IXpwgsdenG4ghaUblgmg=;
        b=VCGknq3mUj0O4y7WVhvPLD4IVolpHdv7mo+QkPc9b/3fuxbSN2zC36WrwQX/xCU6bdXmtv+gOfkpxXYGK3s4YyxlZcKVAldQ/JiIvrn/DJZObJMCCGqZ+lT+nHvGJ0GXNBMy+lV3R3MyN4gdj+uEUKJgdWckKCDSysYMIq3ObVA=;
X-UUID: 7452759587824b3d8d3fe1f5ec98c1d7-20200908
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 930332970; Tue, 08 Sep 2020 20:00:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 20:00:50 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 20:00:50 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v18] Add matrix keypad driver support for Mediatek SoCs 
Date:   Tue, 8 Sep 2020 19:56:11 +0800
Message-ID: <20200908115614.29061-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjE3Og0KLSBtb2RpZnkgaG93IHRvIGdldCBrZXljb2RlIGluIGtleXBh
ZCBpc3IgZnVuY3Rpb24NCi0gdXBkYXRlIGtleXBhZCwgbnVtLWNvbHVtbnMgYW5kIGtleXBhZCwg
bnVtLXJvd3MgZGVzY3JpcHRpb25zDQotIHJlcGxhY2UgdmFyaWFibGUgcmV0IGFzIGVycm9yIGlu
IHByb2JlIGZ1bmN0aW9uDQoNCmZlbmdwaW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBi
aW5kaW5ncyBmb3IgTWVkaWF0ZWsgbWF0cml4IGtleXBhZA0KICBkcml2ZXJzOiBpbnB1dDprZXli
b2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRkIENP
TkZJR19LRVlCT0FSRF9NVEtfS1BEPW0NCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0
L210ay1rcGQueWFtbCAgICB8ICA4MyArKysrKysrDQogYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL0tj
b25maWcgICAgICAgICAgICAgICAgfCAgMTEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvTWFr
ZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9tdGst
a3BkLmMgICAgICAgICAgICAgIHwgMjE4ICsrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hh
bmdlZCwgMzE0IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2lucHV0L2tleWJvYXJkL210ay1rcGQuYw0KDQotLQ0KMi4xOC4wDQoNCg==

