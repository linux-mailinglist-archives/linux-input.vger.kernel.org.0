Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239AE1E7249
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 03:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390896AbgE2B4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 21:56:40 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:8573 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390018AbgE2B4j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 21:56:39 -0400
X-UUID: 2b067c25a8224be88f8701d2e04d5b14-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/qPJfesccbE8p4/Xig7xSfYSlwk0MldP3sImV7vtVY0=;
        b=eGktl4MJdGiZwrYOoqAE7QTMwwJswsieNIjEIziuJFiczIPLvJI+xoKL5j/EGjSTR6Chy0YV85lnTGRFrzOvf2gsLTXZmAVqw6F00r7dssUUVTnI42Vhz6HfCjwj13mFeVbPcfxpJbQ+vtgj6JaNDpsftr7ETd2yL5g9yFUrAKw=;
X-UUID: 2b067c25a8224be88f8701d2e04d5b14-20200529
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 68267096; Fri, 29 May 2020 09:56:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 09:56:29 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 May 2020 09:56:33 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v12] Add matrix keypad driver support for Mediatek SoCs 
Date:   Fri, 29 May 2020 09:56:16 +0800
Message-ID: <20200529015618.128283-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 7ABF326F49CD9B8FAA5FD72CAEF456DFE587E5E34BB2F408B84BE2582E0802AE2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjExOg0KLSByZW1vdmUgQ09ORklHXyBwcmVmaXggaW4gQ09ORklHX1JF
R01BUF9NTUlPDQotIGtlZXAgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0IGFzIG9uZSBsaW5lDQoN
CmZlbmdwaW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBk
b2N1bWVudGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBrZXlib2FyZDogQWRkIG10ayBrZXlwYWQg
ZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRkIENPTkZJR19LRVlCT0FSRF9NVEtfS1BE
ICAgICAgID1tDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwg
ICAgfCAgOTUgKysrKysrKysNCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICAxMSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL210ay1rcGQuYyAgICAgICAg
ICAgICAgfCAyMDUgKysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2VkLCAzMTMgaW5z
ZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jDQoNCi0tIA0KMi4xOC4wDQoNCg==

