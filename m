Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9337A1E5687
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 07:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgE1Fdt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 01:33:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:65046 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727114AbgE1Fdt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 01:33:49 -0400
X-UUID: f572413853374507ac60cad49667df84-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k7l/1KKuS0PneqLC5ScPqQVqzmBSRYn81UVCXQrZrRU=;
        b=di6cUFjdgiFD6josK149H5BbvLXaxiCIi1CCbEjMH2BTqaHNDMRT6Vb8/sfKS8q6hViLYeGnZhIUvpKbSrUL/YJyblNomxD7+AUexvOkTtQl5SvjPmJO7oqSFErJ60FP/FNYDDWA5/hMlPDqXAqZgPqgh8G5YQY432ild8InoHY=;
X-UUID: f572413853374507ac60cad49667df84-20200528
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 904238622; Thu, 28 May 2020 13:33:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 13:33:46 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 13:33:45 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v10] Add matrix keypad driver support for Mediatek SoCs 
Date:   Thu, 28 May 2020 13:33:41 +0800
Message-ID: <20200528053344.25936-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2Ugdjk6DQotIG1vZGlmeSBLRVlCT0FSRF9NVEtfS1BEIGNvbmZpZyBkZXBl
bmRlbnQgaXRlbQ0KLSByZW1vdmUgd2FrZXVwIG1lbWJlciBvZiBtdGtfa2V5cGFkIHN0cnVjdA0K
LSByZW1vdmUgZGVmYXVsdCBwaW5jdHJsIHN0YXRlIHNldA0KLSBtb2RpZnkgcmVxdWVzdCBpcnEg
ZmFpbGVkIHJldHVybiB2YWx1ZQ0KLSBhZGQgc3BhY2Ugb2Yga2VwYWQgbWF0Y2hpbmcgdGFibGUN
Ci0gbW9kaWZ5IGFsaWduIGlzc3VlDQoNCmZlbmdwaW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6
IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVudGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBr
ZXlib2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRk
IENPTkZJR19LRVlCT0FSRF9NVEtfS1BEPW0NCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lu
cHV0L210ay1rcGQueWFtbCAgICB8ICA5NSArKysrKysrKysNCiBhcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9h
cmQvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAxMSArDQogZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJk
L210ay1rcGQuYyAgICAgICAgICAgICAgfCAyMDEgKysrKysrKysrKysrKysrKysrDQogNSBmaWxl
cyBjaGFuZ2VkLCAzMDkgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jDQoNCi0tIA0KMi4xOC4w
DQoNCg==

