Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863701E3BFC
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 10:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbgE0Ibr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 04:31:47 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:29490 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725949AbgE0Ibr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 04:31:47 -0400
X-UUID: 63f8de9cb39f4903b82d30d75d21555d-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mGfMvXBS/Umbxn/FMqRjFLRpEx4665AZUVd2koqihCk=;
        b=Z4vZeq4sfmcKXBvlS3r+mfdkvJ9ljwqhlj91Z/f4K/TOJ5CAt4exEAsk4ZWol4s8XKYs82OcciR4vcnh3lbcRVC/0BcqfH6o+m0YCoBJyYdMZkjmkbxosD8uNxQzlujtpBCer1O9OfrVPyffsksJQ6xmp6BUirICok0eJUT1FBs=;
X-UUID: 63f8de9cb39f4903b82d30d75d21555d-20200527
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 288257554; Wed, 27 May 2020 16:31:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 16:31:37 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 16:31:37 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9] Add matrix keypad driver support for Mediatek SoCs 
Date:   Wed, 27 May 2020 16:31:34 +0800
Message-ID: <20200527083137.56566-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 4E664246734A8A7914944D9C47FD5B5E6A115F861A65D17AFB572507FD2B628A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2Ugdjg6DQotIHVwZGF0ZSBrZXlwYWQgY29uZmlnIGRlcGVuZGVudCBpdGVt
cw0KLSByZW1vdmUgdXNlbGVzcyBjb21tZW50IGFib3V0IGRlYm91bmNlIHRpbWUNCi0gdXNlIGlu
dGVybmFsIGZ1bmN0aW9uIGFzIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCBjYWxsYmFjaw0KLSBy
ZW1vdmUgaW5wdXRfc2V0X2RydmRhdGENCi0gcmVtb3ZlIHJlZHVuZGFudCBsb2cNCi0gYWRkIG1p
c3Npbmcgd2hpdGVzcGFjZSB3aXRoIGNvbXBhdGlibGUgc2VudGluZWwgc3RyaW5nDQoNCmZlbmdw
aW5nLnl1ICgzKToNCiAgZHQtYmluZGluZ3M6IEFkZCBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVu
dGF0aW9uDQogIGRyaXZlcnM6IGlucHV0OiBrZXlib2FyZDogQWRkIG10ayBrZXlwYWQgZHJpdmVy
DQogIGNvbmZpZ3M6IGRlZmNvbmZpZzogQWRkIENPTkZJR19LRVlCT0FSRF9NVEtfS1BEPW0NCg0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbCAgICB8ICA5NCArKysr
KysrKw0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAg
MSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEx
ICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEg
Kw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvbXRrLWtwZC5jICAgICAgICAgICAgICB8IDIxOSAr
KysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDMyNiBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1
dC9tdGsta3BkLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9tdGsta3BkLmMNCg0KLS0gDQoyLjE4LjANCg0K

