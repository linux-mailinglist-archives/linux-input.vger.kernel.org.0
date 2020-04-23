Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E408E1B51C7
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 03:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgDWBYT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 21:24:19 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:31930 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725846AbgDWBYT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 21:24:19 -0400
X-UUID: 933b61af9163417fa800debf136076a2-20200423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=n69err7fZ+dUEdayQQ/ds4lOY0vJ/aaYZuP0ALEneYI=;
        b=sODo5jYW1KGP42KOk/BcU5+1EADLT/hogKmhIwSI4FCuzLtVEy33o+xsJy8dI42hnYpPl5gP8+pnvbHB6UUhaiSLvILJBMii1ByJh3QFXwPqMynC2F7dviDxKfMX84nd6vfqoiF2DkUFHPRyEtKQ8j5vDYPLksEogftU2laF2lw=;
X-UUID: 933b61af9163417fa800debf136076a2-20200423
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 397310574; Thu, 23 Apr 2020 09:24:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Apr 2020 09:24:05 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Apr 2020 09:24:09 +0800
From:   Fengping yu <fengping.yu@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
        <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5] add mtk matrix keypad driver for keypad on MTK SoC 
Date:   Thu, 23 Apr 2020 09:19:56 +0800
Message-ID: <20200423011958.30521-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C4F198DFD9281E00ED4062512287613C53AF1CF5D317FAAF98071E88C786B0462000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjQ6DQotIHJlbW92ZSBleHRyYSBzcGFjZSBhbmQgcmVkdW5kYW50IGxp
bmVzDQotIHJlbW92ZSBkaXNhYmxlX2lycV9ub3N5bmMgYW5kIGVuYWJsZV9pcnEgaW4gaXJxIGhh
bmRsZXINCi0gcHV0IGRlZmNvbmZpZyBhcyBhIHNpbmdsZSBwYXRjaA0KLSB1bmlmaWVkIGRldmlj
ZSBwcm9wZXJ0aWVzIGludGVyZmFjZSBmb3IgQUNQSSBhbmQgZGV2aWNlIHRyZWVzDQotIGZpeGVk
IG90aGVyIGlzc3VlIGFjY29yZGluZyByZXZpZXdlciBjb21tZW50cw0KDQpmZW5ncGluZy55dSAo
Myk6DQogIGR0LWJpbmRpbmdzOiBhZGQgbWF0cml4IGtleXBhZCBkb2N1bWVudGF0aW9uDQogIGFy
bTY0OiBjb25maWdzOiBkZWZjb25maWc6IGVuYWJsZSBtdGsga2V5cGFkIGNvbmZpZw0KICBkcml2
ZXJzOiBpbnB1dDoga2V5Ym9hcmQ6IGFkZCBtdGsga2V5cGFkIGRyaXZlcg0KDQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC50eHQgICAgIHwgIDYxICsrKysrDQogYXJjaC9h
cm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJz
L2lucHV0L2tleWJvYXJkL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDkgKw0KIGRyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9p
bnB1dC9rZXlib2FyZC9tdGsta3BkLmMgICAgICAgICAgICAgIHwgMjQyICsrKysrKysrKysrKysr
KysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgMzE0IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQudHh0
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jDQoN
Ci0tDQoyLjE4LjANCg0K

