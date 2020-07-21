Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB8E22758C
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 04:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgGUCZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 22:25:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:50592 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725862AbgGUCZf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 22:25:35 -0400
X-UUID: b82cacbb97414d5596c3337b478f1a9f-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s/3wonDz1KdEZ8pSKDFcXqt6/o4RelDaDAIyV791UxU=;
        b=bsiAFEmu0UVLwBjX86OHEYBnYX/qx3/03L1N3xQ/zdXjfoWXXiv5Pf3RsbaVJx5HD0LSuUJpaY9LgJdMzKMA3YpDsXXpAXgba3GXRyUas9GJcJAgMljUf5pgkx0oy1aHIc2Cl9LR1CIpK04+mwUqhGN6CnFdz2tNFcqV+GvmnRw=;
X-UUID: b82cacbb97414d5596c3337b478f1a9f-20200721
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 706762059; Tue, 21 Jul 2020 10:25:31 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 10:25:29 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 10:25:28 +0800
From:   Fengping yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v15] Add matrix keypad driver support Mediatek SoCs 
Date:   Tue, 21 Jul 2020 10:23:21 +0800
Message-ID: <20200721022324.21898-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 791BD00D05F3F631098B4F917B8A164A3A32B05A5D575B4CFDFE6764A7BD256E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjE0Og0KLSBhZGQgUFRSX0VSUiB0byByZXNvbHZlIGNvbXBpbGVyIHdh
cm5pbmcNCi0gYWRkIElSUUZfT05FU0hPVCBmbGFnICB0byByZXF1ZXN0X2lycQ0KDQoNCmZlbmdw
aW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVu
dGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OmtleWJvYXJkOiBBZGQgbXRrIGtleXBhZCBkcml2ZXIN
CiAgY29uZmlnczogZGVmY29uZmlnOiBBZGQgQ09ORklHX0tFWUJPQVJEX01US19LUEQ9bQ0KDQog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sICAgIHwgIDk2ICsrKysr
KysrDQogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAx
ICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTEg
Kw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMSAr
DQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMgICAgICAgICAgICAgIHwgMjA5ICsr
KysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgMzE4IGluc2VydGlvbnMoKykNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0
L210ay1rcGQueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lucHV0L2tleWJvYXJk
L210ay1rcGQuYw0KDQotLQ0KMi4xOC4wDQoNCg==

