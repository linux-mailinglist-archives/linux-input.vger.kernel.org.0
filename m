Return-Path: <linux-input+bounces-16625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B54CCC4FF
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 15:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1076630CE885
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 14:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6355428751D;
	Thu, 18 Dec 2025 14:26:15 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD762D7392;
	Thu, 18 Dec 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067975; cv=none; b=rT2yjF0mQA9ksDs168uYPgc06bYMD1V6sESksbl2w4OfyNzXiq1b/N2HbH4nVMlXaN1Nc9EIOompu1kRNxOJwBBeE3beSi6ycSyI8r1WD/nbk8dtMRWNTJAHnvOqHN49v4nFwwiewEneD2a1DUiUbpKKiRdHu0XctfhA0Cs/fvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067975; c=relaxed/simple;
	bh=/BCO2q0g9QvNwmWYn9dLfqm0uOs0yHgsLADfzM8GH0Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=XY4bwRS4WjRodgnPd/p36JOYaBYJyXQ+6j8jGGUty+8WPENtQ8Ft3nvo7JIh0bHDM9Hgx+SmnA1TfuBQvY2TXpP0qXh/aS/+oQ9yD7JBw2CM5S74qX40mclZKGmtIlu5SOjVEDeHBZSxrjexcXRpkIxniMeNo8q2pFDWr98Nc2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.88])
	by mtasvr (Coremail) with SMTP id _____wAHe1fZDkRp7WkXAQ--.643S3;
	Thu, 18 Dec 2025 22:25:30 +0800 (CST)
Received: from duoming$zju.edu.cn ( [218.12.19.88] ) by
 ajax-webmail-mail-app4 (Coremail) ; Thu, 18 Dec 2025 22:25:27 +0800
 (GMT+08:00)
Date: Thu, 18 Dec 2025 22:25:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com,
	akpm@linux-foundation.org, johannes.berg@intel.com,
	pkshih@realtek.com, hverkuil+cisco@kernel.org,
	andriy.shevchenko@linux.intel.com, tglx@linutronix.de,
	mingo@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: psmouse - Replace
 flush_workqueue() with disable_delayed_work_sync()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250620(94335109) Copyright (c) 2002-2025 www.mailtech.cn zju.edu.cn
In-Reply-To: <ho33u6epmzsojiw5zvqksskpzo3f6z2lykvhgektf65stqj6sr@5hq6qd76ezxg>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
 <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
 <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>
 <ho33u6epmzsojiw5zvqksskpzo3f6z2lykvhgektf65stqj6sr@5hq6qd76ezxg>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <67e94e29.46daa.19b31d9f861.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zi_KCgA3zYLYDkRpyCvyAw--.4035W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwEEAWlDB4MRpwADsc
X-CM-DELIVERINFO: =?B?c6QDgwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR1yAm9q9XC503Dp6di6LyzaE6kRH47hHkA6hYzBUo2vMLLdQkANoT7hfPyvMlexsjmWVh
	nPF5uwDJ+MES1dcOIR+FWy2JBxaHlN4wygRaglpAuXy30QWtg+GzZ2gX5US4MA==
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyxWF13tFWkCFy8ury8WFX_yoW8tr1Upr
	W3WFyjk3ykJrWUt3sIqF40vF1FkwnFqryjqr1vgryrJwn8JFn8XF48tFyF9Fn8JrWrCr12
	va1DZ3yfuF1vy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUQEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4xvF2IEb7IF0Fy264kE64k0F24lFcxC0VAYjxAxZF0Ex2IqxwAC
	I402YVCY1x02628vn2kIc2xKxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwCE64xvF2IEb7IF0Fy7YxBIdaVFxhVjvjDU0xZFpf9x07j8GYJUUUUU=

T24gV2VkLCAxNyBEZWMgMjAyNSAyMjo1ODozMyAtMDgwMCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
Cj4gPiA+ID4gVGhlIG9yaWdpbmFsIGNvZGUgdXNlcyBmbHVzaF93b3JrcXVldWUoKSBpbiBwc21v
dXNlX2Rpc2Nvbm5lY3QoKSB0bwo+ID4gPiA+IGVuc3VyZSB0aGUgY29tcGxldGlvbiBvZiBib3Ro
IHJlc3luY193b3JrIGFuZCBkZXYzX3JlZ2lzdGVyX3dvcmsuCj4gPiA+ID4gR2l2ZW4gdGhhdCBh
bHBzX2Rpc2Nvbm5lY3QoKSBhbHJlYWR5IHVzZXMgZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygp
Cj4gPiA+ID4gdG8gY2FuY2VsIGRldjNfcmVnaXN0ZXJfd29yaywgcmVwbGFjaW5nIGZsdXNoX3dv
cmtxdWV1ZSgpIHdpdGgKPiA+ID4gPiBkaXNhYmxlX2RlbGF5ZWRfd29ya19zeW5jKCZwc21vdXNl
LT5yZXN5bmNfd29yaykgaXMgbW9yZSByb2J1c3QKPiA+ID4gPiBhbmQgZWZmaWNpZW50Lgo+ID4g
PiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IER1b21pbmcgWmhvdSA8ZHVvbWluZ0B6anUuZWR1
LmNuPgo+ID4gPiA+IC0tLQo+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gICAtIGZvY3Vz
IG9uIHRoZSByb2J1c3RuZXNzIGFuZCBlZmZpY2llbmN5IGltcHJvdmVtZW50cyBvZiBkaXNhYmxl
X2RlbGF5ZWRfd29ya19zeW5jKCksIG5vdCBvbiB0aGUgVUFGIGFzcGVjdC4KPiA+ID4gPiAKPiA+
ID4gPiAgZHJpdmVycy9pbnB1dC9tb3VzZS9wc21vdXNlLWJhc2UuYyB8IDIgKy0KPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbW91c2UvcHNtb3VzZS1iYXNlLmMgYi9k
cml2ZXJzL2lucHV0L21vdXNlL3BzbW91c2UtYmFzZS5jCj4gPiA+ID4gaW5kZXggNzdlYTdkYTNi
MWMuLmViNDFjNTUzZTgwIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQvbW91c2Uv
cHNtb3VzZS1iYXNlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2lucHV0L21vdXNlL3BzbW91c2Ut
YmFzZS5jCj4gPiA+ID4gQEAgLTE0ODQsNyArMTQ4NCw3IEBAIHN0YXRpYyB2b2lkIHBzbW91c2Vf
ZGlzY29ubmVjdChzdHJ1Y3Qgc2VyaW8gKnNlcmlvKQo+ID4gPiA+ICAKPiA+ID4gPiAgCS8qIG1h
a2Ugc3VyZSB3ZSBkb24ndCBoYXZlIGEgcmVzeW5jIGluIHByb2dyZXNzICovCj4gPiA+ID4gIAlt
dXRleF91bmxvY2soJnBzbW91c2VfbXV0ZXgpOwo+ID4gPiA+IC0JZmx1c2hfd29ya3F1ZXVlKGtw
c21vdXNlZF93cSk7Cj4gPiA+ID4gKwlkaXNhYmxlX2RlbGF5ZWRfd29ya19zeW5jKCZwc21vdXNl
LT5yZXN5bmNfd29yayk7Cj4gPiA+IAo+ID4gPiBCZWZvcmUgd2UgcmVwbGFjZSBmbHVzaF93b3Jr
cXVldWUoKSB3aXRoIGRpc2FibGVfZGVsYXllZF93b3JrX3N5bmMoKSB3ZQo+ID4gPiBuZWVkIHRv
IGFsc28gYWRkIGRpc2FibGVfZGVsYXllZF93b3JrX3N5bmMoKSB0bwo+ID4gPiBkcml2ZXJzL2lu
cHV0L21vdXNlL2hncGsuYyB0aGF0IGFsc28gcXVldWVzIHdvcmsgdG8gcHNtb3VzZSB3b3JrcXVl
dWUKPiA+ID4gYW5kIHJlbGllcyBvbiBmbHVzaGluZyBpdCB3aGVuIGRpc2Nvbm5lY3RpbmcuCj4g
PiAKPiA+IFRoZSBkZWxheWVkIHdvcmsgaXRlbSByZWNhbGliX3dxIGNvdWxkIG5ldmVyIGJlIHNj
aGVkdWxlZCBkdWUgdG8gdGhlIAo+ID4gdG91Y2hwYWQgZHJpdmVyIG9ubHkgc3VwcG9ydHMgbW91
c2UgbW9kZSBhbmQgdGhlIGhncGtfaW5pdCgpIGZ1bmN0aW9uCj4gPiByZW1haW5zIGRpc2FibGVk
Lgo+IAo+IFdoYXQgZG8geW91IG1lYW4/IElmIHlvdSBlbmFibGUgT0xQQyBzdXBwb3J0IHRoZSBv
cHRpb24gdG8gZW5hYmxlIGhncGsKPiBwcm90b2NvbCBkcml2ZXIgc2hvdWxkIGJlY29tZSBhdmFp
bGFibGUsIHJpZ2h0PwoKVGhlwqBoZ3BrX2luaXQoKcKgZnVuY3Rpb24gaXMgbmV2ZXIgY2FsbGVk
IGJ5IGFueSBvdGhlciBmdW5jdGlvbiBpbiB0aGUKa2VybmVsIGFuZCBpcyB0aGVyZWZvcmUgZGVh
ZCBjb2RlLiBTaW5jZSB0aGUgZGVsYXllZCB3b3JrIGl0ZW3CoHJlY2FsaWJfd3EKaXMgaW5pdGlh
bGl6ZWQgd2l0aGluIHRoaXMgZnVuY3Rpb24sIGl0IGlzIGNvbnNlcXVlbnRseSBuZXZlciBzY2hl
ZHVsZWQKZHVyaW5nIHJ1bnRpbWUuCgpCZXN0IHJlZ2FyZHMsCkR1b21pbmcgWmhvdQo=


