Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293B521ECAC
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgGNJWs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 05:22:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5370 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726414AbgGNJWs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 05:22:48 -0400
X-UUID: f9f359f98fc04684b29fdb42377438af-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xsOBFtDX2zzdwsWEy4DmEh6sQCZBGIkRn1wJVvBBCdQ=;
        b=EgojdO0tJXTR+4FQZgXlI0lO/zZOCGlzUHXeXalmaxoEG0f5SrUxBX3IpjItlnZigOSMqW4zvZOKy4PwAfPLNy79k5f8diDeWVpkoKvIZf1QrNe+oHNFhf1jC99eruUBT2Ihh/pj5Ld4HUw7KIvXwvmJpPgk56eYKU14XVmUzro=;
X-UUID: f9f359f98fc04684b29fdb42377438af-20200714
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2138757407; Tue, 14 Jul 2020 17:22:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:22:38 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:22:38 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v14] Add matrix keypad driver support Mediatek SoCs 
Date:   Tue, 14 Jul 2020 17:20:50 +0800
Message-ID: <20200714092053.16067-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 79AE5D1AD6DEE60D16E09EE0A5304D7B54A6050E17675433065CC2E6E59410502000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjEzOg0KLSByZW1vdmUgZGVmY29uZmlnIGFuZCBtdGsta3BkLnlhbWwg
ZmlsZXMgcmV2aWV3ZWQtYnkgdGFnDQoNCmZlbmdwaW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6
IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVudGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBr
ZXlib2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRk
IENPTkZJR19LRVlCT0FSRF9NVEtfS1BEPW0NCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lu
cHV0L210ay1rcGQueWFtbCAgICB8ICA5NiArKysrKysrKw0KIGFyY2gvYXJtNjQvY29uZmlncy9k
ZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDExICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJk
L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQv
bXRrLWtwZC5jICAgICAgICAgICAgICB8IDIwOSArKysrKysrKysrKysrKysrKysNCiA1IGZpbGVz
IGNoYW5nZWQsIDMxOCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMNCg0KLS0NCjIuMTguMA0K
DQo=

