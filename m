Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5231CBC51
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 04:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgEICJ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 22:09:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:58238 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727828AbgEICJ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 22:09:26 -0400
X-UUID: c2515d0332a7409a8cc84976834fb513-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1B+choKMEWf5xgsDH1Xvz4r98si4Toef2xxzNstIEMc=;
        b=WVPofjpp0VLBguQpJu5sO7PG4xp585zhHL5kaY5GN4ax6yZyup7ckNf1CfzJCQp/XLQthBFtWydoIccdvERs23acVXpSpUglCYB8UH7mrTzk761XMMrKpPJbKs76zGETv/kNtGgEyB5KaCYcKNJXhpsh9zjT5mi3gzPS7/aqn4o=;
X-UUID: c2515d0332a7409a8cc84976834fb513-20200509
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1759369874; Sat, 09 May 2020 10:09:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 10:09:23 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 10:09:17 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6] Add mtk matrix keypad driver for keypad on MTK SoC
Date:   Sat, 9 May 2020 10:04:56 +0800
Message-ID: <20200509020458.8359-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Q2hhbmdlIHNpbmNlIHY1Og0KLSByZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBmaWxlcw0KLSBy
ZW1vdmUgcmVkdW5kYW50IGNvbW1lbnRzIGFuZCBuZXdsaW5lcw0KLSB1c2UgbG9jYWwgaXJxbnIg
dmFyaWFibGUgaW5zdGVhZCBvZiBtZW1iZXIgdmFyaWFibGUgb2YgbXRrX2tleXBhZCBzdHJ1Y3QN
Ci0gdXNlIHJlZ21hcCB0byByZWFkIGFuZCB3cml0ZSByZWdpc3RlcnMNCi0gZHJvcCBrcGRfZ2V0
X2R0c19pbmZvIGRpcmVjdGx5IGludG8gcHJvYmUgZnVuY3Rpb24NCi0gdXNlIGRldm1fYWRkX2Fj
dGlvbl9vcl9yZXNldCB0byBhdm9pZCBnb3RvIGVycm9yIGhhbmRsaW5nIHdoZW4gZG8gY2xrIHNl
dHRpbmcNCi0gdXNlIGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEgYXBpIHRvIHJlcXVlc3QgaXJx
DQotIHJlbW92ZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YQ0KDQpmZW5ncGluZy55dSAoMyk6DQogIGR0
LWJpbmRpbmdzOiBDaGFuZ2Uga2V5cGFkIGRvY3VtZW50YXRpb24gc2NoZW1hDQogIGRyaXZlcnM6
IGlucHV0OiBrZXlib2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNv
bmZpZzogQWRkIENPTkZJR19LRVlCT0FSRF9NVEtfS1BEPXkNCg0KIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L210ay1rcGQudHh0ICAgICB8ICA2MSAtLS0tLS0tDQogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sICAgIHwgIDkzICsrKysrKysrKysrDQogYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2
ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDUgKy0NCiBkcml2
ZXJzL2lucHV0L2tleWJvYXJkL210ay1rcGQuYyAgICAgICAgICAgICAgfCAxNTEgKysrKysrKyst
LS0tLS0tLS0tDQogNSBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgMTQ4IGRlbGV0
aW9ucygtKQ0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW5wdXQvbXRrLWtwZC50eHQNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbA0KDQotLQ0KMi4xOC4wDQoN
Cg0K

