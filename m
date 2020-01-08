Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65670133BB8
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 07:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgAHGaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 01:30:35 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:51730 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725838AbgAHGaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 01:30:35 -0500
X-UUID: df591dbc279b464287ded0fbe859fb19-20200108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C5uYcatcL7O3L8hFISr3vserMmDxuM/EyNyUSLNixHg=;
        b=V1s0lAH50uITb/mMbf6zoKRKObLO8ODB3swlXB0MEvOnsPvXHCrJ314kUBwK8CM54OjzmEmUbfBRUPHXTTGNb528AnUwGYMYjxsBvAqswqZCNVYAGVsurNGNKaPEl9t8n3LyhM2Yclom4gGIwuGE4mTmcoUsl4xFC/iZ3F0Q+zk=;
X-UUID: df591dbc279b464287ded0fbe859fb19-20200108
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 622843385; Wed, 08 Jan 2020 14:30:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 14:31:03 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 Jan 2020 14:30:03 +0800
From:   fengping yu <fengping.yu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <wsd_upstream@mediatek.com>
Subject: Resend [PATCH V2] dt-bindings:input:keyboard:add MediaTek keypad controller binding 
Date:   Wed, 8 Jan 2020 14:29:21 +0800
Message-ID: <20200108062923.14684-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpmZW5ncGluZy55dSAoMik6DQogIERvY3VtZW50YXRpb246IGRldmljZXRyZWU6IGJpbmRpbmdz
OiBpbnB1dA0KICBkcml2ZXJzOiBpbnB1dDoga2V5Ym9hcmQNCg0KIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L210ay1rcGQudHh0ICAgICB8ICA1MiArKysNCiBhcmNoL2FybTY0L2NvbmZp
Z3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5
Ym9hcmQvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAgOCArDQogZHJpdmVycy9pbnB1dC9rZXli
b2FyZC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lucHV0L2tleWJv
YXJkL210ay1rcGQuYyAgICAgICAgICAgICAgfCAzNTcgKysrKysrKysrKysrKysrKysrDQogNSBm
aWxlcyBjaGFuZ2VkLCA0MTkgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC50eHQNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9tdGsta3BkLmMNCg==

