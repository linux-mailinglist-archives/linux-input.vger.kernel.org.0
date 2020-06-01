Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A771E9BAF
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 04:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgFACZ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 May 2020 22:25:57 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:9198 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725953AbgFACZ5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 May 2020 22:25:57 -0400
X-UUID: 7ba6f51fe42447919f782213474fca35-20200601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kC8R+VVCPdbOJzXcyogF17jG0znuHkIHoeT2f7GJl7M=;
        b=X+g5UO/IaOA++muZSvPxL5KfMpkJRfgBlOg1sqfvQcfyjNm0Oe11DOqACUkAMsaWmjz02Yc1qjvdemyXIpiDduU+MXjUtUoBfqvMiwU+X39HelBBpSSZCltgMBThPoRKkLiV/9b2ENF+uTTu6GI2cUoYrC/e7kWlpdDDDhlTpwQ=;
X-UUID: 7ba6f51fe42447919f782213474fca35-20200601
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1593025129; Mon, 01 Jun 2020 10:25:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 10:25:45 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Jun 2020 10:25:45 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v13] Add matrix keypad driver support for Mediatek SoCs 
Date:   Mon, 1 Jun 2020 10:25:45 +0800
Message-ID: <20200601022548.18213-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjEyOg0KLSBtb2RpZnkgZGV2aWNlX2luaXRfd2FrZXVwIGFzIGlmIGZh
aWxlZCwgb25seSBnaXZlIHdhcm5pbmcsIGluc3RlYWQgb2YgcHJvYmUgZmFpbGVkDQoNCmZlbmdw
aW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVu
dGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBrZXlib2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVy
DQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRkIENPTkZJR19LRVlCT0FSRF9NVEtfS1BEPW0NCg0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbCAgICB8ICA5NSArKysr
KysrKw0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAg
MSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEx
ICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEg
Kw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jICAgICAgICAgICAgICB8IDIwOSAr
KysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDMxNyBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1
dC9tdGsta3BkLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9tdGsta3BkLmMNCg0KLS0gDQoyLjE4LjANCg0K

