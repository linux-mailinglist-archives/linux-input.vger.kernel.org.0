Return-Path: <linux-input+bounces-16620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0081CCA5BC
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 06:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92D263025587
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 05:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83663261B6D;
	Thu, 18 Dec 2025 05:49:44 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B248F1C5486;
	Thu, 18 Dec 2025 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766036984; cv=none; b=EnA5Fo04Rtuzfd7VA36C3wz3gbWPuAUq3Kr+RTLfFkE5efzcPEp78Xxd8zn4QciBwKQ2ELsyAbfCa7wivLNWewEOcbhQK/tGjfPgwHMcQJe16EJqvjMH0fVnVcPS60u3oJ8F8Sz1WpUGv3IJX0rhUK1PPn69A7nMs76bOmyW+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766036984; c=relaxed/simple;
	bh=CCGEg5VH6H4OGBekq5PfCAXvZMeSYd6PBKfItY9YL/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=YEoTiMMbF5/oygi0p0Gaq9ZLZGshJFFFy/2YSzu53UwFH7Hkjoz7hfWFFehKJaJZNdwPxq/tli0/vZzjKgjLK+Zt4xPZRK0hIQIAzk339scXvBgngqSK8fHBOsyiw43m1t/AvnAAN1lmJ/Tlp7Gb9SZE2yCVkKMLjJFb61iuv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.19.88])
	by mtasvr (Coremail) with SMTP id _____wA3IVfRlUNpFekSAQ--.51S3;
	Thu, 18 Dec 2025 13:49:06 +0800 (CST)
Received: from duoming$zju.edu.cn ( [218.12.19.88] ) by
 ajax-webmail-mail-app4 (Coremail) ; Thu, 18 Dec 2025 13:49:03 +0800
 (GMT+08:00)
Date: Thu, 18 Dec 2025 13:49:03 +0800 (GMT+08:00)
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
In-Reply-To: <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
 <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zi_KCgCXToXQlUNpX1bwAw--.64065W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcEAWlDB4MJLQAAsL
X-CM-DELIVERINFO: =?B?pZiv0gXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR12DAnflxTzZjYgmmtmNoeZNOAAffGGYLcHiSg5HBEFDuYVuSEGf+RKMZXRN/ftz7CtRi
	rcMWktajRSXidcVLjEbtI5YUA1lw36SgJ6oQxyr4RhuYl5V4z/smDAfYIxPXtg==
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW7KFWUZrWkCr1fKFW8Zrc_yoW8AryDpr
	ZxuryUK3ykXa1Ut39IqF4jvFyfG3ZFqryjkr1vgry5Jrn8JFs8ZF48tFyFgFn8Kr95Cw17
	Za1DZa95uFn2yagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

T24gV2VkLCAxNyBEZWMgMjAyNSAxMDoxMzoxNiAtMDgwMCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
Cj4gPiBUaGUgb3JpZ2luYWwgY29kZSB1c2VzIGZsdXNoX3dvcmtxdWV1ZSgpIGluIHBzbW91c2Vf
ZGlzY29ubmVjdCgpIHRvCj4gPiBlbnN1cmUgdGhlIGNvbXBsZXRpb24gb2YgYm90aCByZXN5bmNf
d29yayBhbmQgZGV2M19yZWdpc3Rlcl93b3JrLgo+ID4gR2l2ZW4gdGhhdCBhbHBzX2Rpc2Nvbm5l
Y3QoKSBhbHJlYWR5IHVzZXMgZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygpCj4gPiB0byBjYW5j
ZWwgZGV2M19yZWdpc3Rlcl93b3JrLCByZXBsYWNpbmcgZmx1c2hfd29ya3F1ZXVlKCkgd2l0aAo+
ID4gZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygmcHNtb3VzZS0+cmVzeW5jX3dvcmspIGlzIG1v
cmUgcm9idXN0Cj4gPiBhbmQgZWZmaWNpZW50Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEdW9t
aW5nIFpob3UgPGR1b21pbmdAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoK
PiA+ICAgLSBmb2N1cyBvbiB0aGUgcm9idXN0bmVzcyBhbmQgZWZmaWNpZW5jeSBpbXByb3ZlbWVu
dHMgb2YgZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygpLCBub3Qgb24gdGhlIFVBRiBhc3BlY3Qu
Cj4gPiAKPiA+ICBkcml2ZXJzL2lucHV0L21vdXNlL3BzbW91c2UtYmFzZS5jIHwgMiArLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9tb3VzZS9wc21vdXNlLWJhc2UuYyBiL2RyaXZlcnMv
aW5wdXQvbW91c2UvcHNtb3VzZS1iYXNlLmMKPiA+IGluZGV4IDc3ZWE3ZGEzYjFjLi5lYjQxYzU1
M2U4MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQvbW91c2UvcHNtb3VzZS1iYXNlLmMK
PiA+ICsrKyBiL2RyaXZlcnMvaW5wdXQvbW91c2UvcHNtb3VzZS1iYXNlLmMKPiA+IEBAIC0xNDg0
LDcgKzE0ODQsNyBAQCBzdGF0aWMgdm9pZCBwc21vdXNlX2Rpc2Nvbm5lY3Qoc3RydWN0IHNlcmlv
ICpzZXJpbykKPiA+ICAKPiA+ICAJLyogbWFrZSBzdXJlIHdlIGRvbid0IGhhdmUgYSByZXN5bmMg
aW4gcHJvZ3Jlc3MgKi8KPiA+ICAJbXV0ZXhfdW5sb2NrKCZwc21vdXNlX211dGV4KTsKPiA+IC0J
Zmx1c2hfd29ya3F1ZXVlKGtwc21vdXNlZF93cSk7Cj4gPiArCWRpc2FibGVfZGVsYXllZF93b3Jr
X3N5bmMoJnBzbW91c2UtPnJlc3luY193b3JrKTsKPiAKPiBCZWZvcmUgd2UgcmVwbGFjZSBmbHVz
aF93b3JrcXVldWUoKSB3aXRoIGRpc2FibGVfZGVsYXllZF93b3JrX3N5bmMoKSB3ZQo+IG5lZWQg
dG8gYWxzbyBhZGQgZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygpIHRvCj4gZHJpdmVycy9pbnB1
dC9tb3VzZS9oZ3BrLmMgdGhhdCBhbHNvIHF1ZXVlcyB3b3JrIHRvIHBzbW91c2Ugd29ya3F1ZXVl
Cj4gYW5kIHJlbGllcyBvbiBmbHVzaGluZyBpdCB3aGVuIGRpc2Nvbm5lY3RpbmcuCgpUaGUgZGVs
YXllZCB3b3JrIGl0ZW0gcmVjYWxpYl93cSBjb3VsZCBuZXZlciBiZSBzY2hlZHVsZWQgZHVlIHRv
IHRoZSAKdG91Y2hwYWQgZHJpdmVyIG9ubHkgc3VwcG9ydHMgbW91c2UgbW9kZSBhbmQgdGhlIGhn
cGtfaW5pdCgpIGZ1bmN0aW9uCnJlbWFpbnMgZGlzYWJsZWQuCgpCZXN0IHJlZ2FyZHMsCkR1b21p
bmcgWmhvdQoK


