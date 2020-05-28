Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58A41E5B6F
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 11:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgE1JIF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 05:08:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:23326 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728028AbgE1JIE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 05:08:04 -0400
X-UUID: 37aa35ef07da48c19fe4c70a74161139-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e3fxIIj58bRpUFvDB85psWO2i4+DCFFpHdpTJRE6p4k=;
        b=dLzEB+WGhac726H+9eCpH3U/J0aBBfilqkMSZyYbwlYw3mU+PfRay5zekcb+ahhaBID9qG5/x9oLAtuS5eUMhJvT3KiirRINcGXix6yAq+rG1NA4qTyUOjpL7VgQweWqi9iATU/IDGr+aY/Rasm9QTE5NNVQFrFB/vsMj4noyIM=;
X-UUID: 37aa35ef07da48c19fe4c70a74161139-20200528
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 117926648; Thu, 28 May 2020 17:08:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 17:08:01 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 17:08:00 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [RESEND PATCH v11] Add matrix keypad driver support for Mediatek SoCs 
Date:   Thu, 28 May 2020 17:07:54 +0800
Message-ID: <20200528090757.54355-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A2B28C3C59F4912E39A544B073903EAB9AB3C6FD0DAF84ACB756925C08D07D6B2000:8
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
dmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMNCg0KLS0gDQoyLjE4LjANCg0KDQo=

