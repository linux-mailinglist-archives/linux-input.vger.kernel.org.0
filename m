Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F5C1E5B0F
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 10:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgE1Ilw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 04:41:52 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35267 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727073AbgE1Ilv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 04:41:51 -0400
X-UUID: a2bf381092624a10bba64c0969378483-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CEyczhGcIBHIfsym2XRqySGH4dvwQoU66NsgzcC4tto=;
        b=Pm7OFuBS5S+jqjDL0I6aWD37c7VOa2+wZiGmpJIlFQrD3kNkMIyfQ0RQhYLWqffk4y0kKHYJr7OQgOR/LBwUSvjDKoJ4JQLxRuja2t8qXVHGtYHhJXZxbKKYauvi4C+NdnLiiTJsWrGjxUno3LXqmMhE0yM7n4UptRitSMT3edA=;
X-UUID: a2bf381092624a10bba64c0969378483-20200528
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1406345995; Thu, 28 May 2020 16:41:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 16:41:45 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 16:41:45 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v11] Add matrix keypad driver support for Mediatek SoCs 
Date:   Thu, 28 May 2020 16:41:40 +0800
Message-ID: <20200528084143.36482-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 7CEFF58E1AB85467423EA8FB9CD4DF6FFE1A24EC76DE4356FD727CE6A58BA6C12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjEwOg0KLSBhZGQgd2FrZXVwIHNvdXJjZSBzZXR0aW5nIGluIHByb2Jl
IGZ1bmN0aW9uDQoNCmZlbmdwaW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBrZXlwYWQg
ZGV2aWNldHJlZSBkb2N1bWVudGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBrZXlib2FyZDogQWRk
IG10ayBrZXlwYWQgZHJpdmVyDQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRkIENPTkZJR19LRVlC
T0FSRF9NVEtfS1BEPW0NCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQu
eWFtbCAgICB8ICA5NSArKysrKysrKw0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnICAg
ICAgICAgICAgICAgIHwgIDExICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlICAg
ICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jICAg
ICAgICAgICAgICB8IDIwNiArKysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDMx
NCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMNCg0KLS0gDQoyLjE4LjANCg0K

