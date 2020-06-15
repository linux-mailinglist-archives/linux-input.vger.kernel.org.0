Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B381F9571
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 13:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgFOLmX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 07:42:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:23840 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729699AbgFOLmW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 07:42:22 -0400
X-UUID: 924e2e6e071744c593b0b689252864e0-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Mb9ECmQLe0cOF3EpJy9V6PKEB18+T/abvWwavIKQcog=;
        b=dQd0dZIIFeiuSj8dsdMHp926/s8w8F3qpCZIKEaQa0CjbMypVh+9emcC7EUgDR7t8roScLObQGXE/KKFsuEM5X8NwXhAMXKO/QwK/2W+uR1r/fhXZb8wZD8WAdiJp2lmvEmV2TpQUB8nFcKagmu3JJgkNnlX2puVL9POD8UsDl4=;
X-UUID: 924e2e6e071744c593b0b689252864e0-20200615
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <fengping.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 924739329; Mon, 15 Jun 2020 19:42:19 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 19:42:08 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 19:42:09 +0800
From:   Fengping Yu <fengping.yu@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1] Add vibrator driver support for Mediatek SoCs 
Date:   Mon, 15 Jun 2020 19:42:00 +0800
Message-ID: <20200615114203.116656-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F5D2DB50CACE471C1E30A4653E561A353A9A15052C4081FBD7B7B57F381E53742000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpUaGlzIHNlcmlhbHMgYWRkcyByZWd1bGF0b3IgdmlicmF0b3IgZHJpdmVyIGZvciBNZWRpYXRl
ayBTb0NzLg0KDQpmZW5ncGluZy55dSAoMyk6DQogIGR0LWJpbmRpbmdzOkFkZCB2aWJyYXRvciBk
ZXZpY2V0cmVlIGRvY3VtZW50YXRpb24NCiAgZHJpdmVyczogaW5wdXQ6IG1pc2M6IEFkZCBtdGsg
dmlicmF0b3IgZHJpdmVyDQogIGRlZmNvbmZpZzogQWRkIENPTkZJR19JTlBVVF9SRUdVTEFUT1Jf
VklCUkFUT1I9bQ0KDQogLi4uL2JpbmRpbmdzL2lucHV0L3JlZ3VsYXRvci12aWJyYXRvci55YW1s
ICAgIHwgIDY1ICsrKw0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9pbnB1dC9taXNjL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgIHwgIDEwICsNCiBkcml2ZXJzL2lucHV0L21pc2MvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KIGRyaXZlcnMvaW5wdXQvbWlzYy9yZWd1bGF0b3ItdmlicmF0b3IuYyAgICAg
ICB8IDQyMiArKysrKysrKysrKysrKysrKysNCiA1IGZpbGVzIGNoYW5nZWQsIDQ5OSBpbnNlcnRp
b25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnB1dC9yZWd1bGF0b3ItdmlicmF0b3IueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2lucHV0L21pc2MvcmVndWxhdG9yLXZpYnJhdG9yLmMNCg0KLS0gDQoyLjE4LjANCg0K

