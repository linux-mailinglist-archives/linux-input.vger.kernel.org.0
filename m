Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BB122EB70
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 13:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgG0Lrh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 07:47:37 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48328 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727770AbgG0Lrg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 07:47:36 -0400
X-UUID: 499e236331c842dabcc22b3ee8a2bd46-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b3By9T3GQYDCgOA6dniEjcfbP4km3HT3VtwE/lnbgzY=;
        b=T8VTSUU6J604Uv1hpMXXoaJuRU1BV/pgZcdiFWwsmJ7xOWdbFwZbjdDyiEIt3AupKh+9HkHn7TaeVi8+TZjhQnHXi/N+zFloLJM47bLAEfTzTnw7jJaixxOz9s9NL7G08mEw0GZpA1qLNRFkY8bG6KjS/FlJo0h8fevoFfBsAl0=;
X-UUID: 499e236331c842dabcc22b3ee8a2bd46-20200727
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 798339912; Mon, 27 Jul 2020 19:47:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 19:47:26 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 19:47:25 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
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
Subject: [PATCH v16] Add matrix keypad driver support for Mediatek SoCs 
Date:   Mon, 27 Jul 2020 19:45:01 +0800
Message-ID: <20200727114504.28536-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: FE8F0DE6355989A622C88EB60EFD84C13347A735279417E4D9EFD82E64A156EB2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjE1Og0KLSBtb2RpZnkgcmVnbWFwX3Jhd19yZWFkIHRvIHJlZ21hcF9i
dWxrX3JlYWQNCi0gbW9kaWZ5IHJlZ21hcCBvdXRwdXQgc3BlY2lmaWVyIHRvICVwZQ0KDQpmZW5n
cGluZy55dSAoMyk6DQogIGR0LWJpbmRpbmdzOiBBZGQga2V5cGFkIGRldmljZXRyZWUgZG9jdW1l
bnRhdGlvbg0KICBkcml2ZXJzOiBpbnB1dDoga2V5Ym9hcmQ6IEFkZCBtdGsga2V5cGFkIGRyaXZl
cg0KICBjb25maWdzOiBkZWZjb25maWc6IEFkZCBDT05GSUdfS0VZQk9BUkRfTVRLX0tQRD1tDQoN
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwgICAgfCAgOTYgKysr
KysrKysNCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAg
IDEgKw0KIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAx
MSArDQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAx
ICsNCiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL210ay1rcGQuYyAgICAgICAgICAgICAgfCAyMDkg
KysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2VkLCAzMTggaW5zZXJ0aW9ucygrKQ0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5w
dXQvbXRrLWtwZC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW5wdXQva2V5Ym9h
cmQvbXRrLWtwZC5jDQoNCi0tDQoyLjE4LjANCg0K

