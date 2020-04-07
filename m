Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2EF1A069E
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 07:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgDGFjk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 01:39:40 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53383 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725802AbgDGFjk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 01:39:40 -0400
X-UUID: d87fd0e9cee9446698661ea4fa27869b-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=O2o43k14xlejaS3ceaxlrwDivs/SbOA913cIeBStoZE=;
        b=YXRX/s27LQjlY0SBhoQESXz6OnA1AelVMp/90tn8ITuFjnc+lxSW/FiN9+9LPBbhSxQYtXKB3ZVYF6BD8QaOHxAwwi+W522elAyF8bRa4doY4iDWmiN6fyZR1Nq1YbIshh1990tlTv78VztogwN/AgyvqKnPHvKBqOZFPUAqpTs=;
X-UUID: d87fd0e9cee9446698661ea4fa27869b-20200407
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 744196807; Tue, 07 Apr 2020 13:39:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 13:39:28 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 13:39:30 +0800
From:   Fengping yu <fengping.yu@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <linux-input@vger.kernel.org>
Subject: [PATCH v3] drivers:input:keyboard: add mtk keypad driver 
Date:   Tue, 7 Apr 2020 13:36:09 +0800
Message-ID: <20200407053610.20996-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 9C2F0DBEA935612CFC96B21F5282E409AABF91147DF33EF885EB4B82EDEFAFE82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpUaGlzIHBhdGNoc2V0IGFkZCBzdXBwb3J0IHRvIE1lZGlhVGVrIG1hdHJpeCBrZXlwYWQuDQoN
CkNoYW5nZSBzaW5jZSB2MjoNCi0gcmVtb3ZlIGV4dHJhIHNwYWNlIGFuZCByZWR1bmRhbnQgbGlu
ZXMNCi0gcmVtb3ZlIHVzZWxlc3MgY29kZQ0KLSB1cGRhdGUga2V5cGFkIGRldmljZXRyZWUgZG9j
dW1lbnQgZGVib3VuY2UgdGltZSB1bml0DQotIGNoYW5nZSB0byB1c2UgZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKCkgdG8gc2ltcGxpZnkgcmVzb3VyY2UgbWFuYWdlbWVudA0KLSB1c2Ug
Yml0bWFwIHRvIHN0b3JlIGFuZCBjaGVjayBrZXlwYWQgc3RhdGUNCg0KZmVuZ3BpbmcueXUgKDIp
Og0KICBhZGQgZHQtYmluZGluZyBkb2N1bWVudCBmb3IgTWVkaWFUZWsgS2V5cGFkDQogIGFkZCBN
ZWRpYVRlayBrZXlwYWQgZHJpdmVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9t
dGsta3BkLnR4dCAgICAgfCAgNjEgKysrKysNCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
ICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2NvbmZp
ZyAgICAgICAgICAgICAgICB8ICAgNyArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmls
ZSAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL210ay1rcGQu
YyAgICAgICAgICAgICAgfCAyNTggKysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2Vk
LCAzMjggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC50eHQNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMNCg0KLS0NCjIuMTguMA0KDQo=

